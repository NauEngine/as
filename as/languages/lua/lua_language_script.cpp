//
// Created by Alex Zelenshikov on 01.05.2024.
//

#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Transforms/Utils/Cloning.h"

#include "as/core/core_utils.h"
#include "as/core/llvm_optimizer.h"

#include "lua_language_script.h"
#include "lua_llvm_compiler.h"
#include "lua_ir.h"
#include "lua_utils.h"
#include "lua_ftree.h"
#include "as/core/ir.h"

extern "C"
{
#include "lua/lobject.h"
#include "lua/lauxlib.h"
#include "lua/lstate.h"
#include "lua/lparser.h"
#include "lua/lfunc.h"
#include "lua/ldo.h"
}

namespace
{

typedef struct {
    FILE *file;
    char buffer[LUAL_BUFFERSIZE];
} FileReaderData;

const char *file_reader(lua_State *L, void *data, size_t *size)
{
    FileReaderData *reader = (FileReaderData *)data;
    if (feof(reader->file)) return NULL;
    *size = fread(reader->buffer, 1, sizeof(reader->buffer), reader->file);
    return reader->buffer;
}

Proto* load_lua_source(lua_State *L, const char *filename)
{
    FILE *f = fopen(filename, "r");
    if (f == NULL)
    {
        luaL_error(L, "Cannot open file: %s", filename);
        return NULL;
    }

    FileReaderData reader;
    reader.file = f;

    ZIO zio;
    luaZ_init(L, &zio, file_reader, &reader);

    Mbuffer buff;
    luaZ_initbuffer(L, &buff);

    const char *source_name = lua_pushfstring(L, "@%s", filename);
    Proto *proto = luaY_parser(L, &zio, &buff, source_name);

    fclose(f);
    luaZ_freebuffer(L, &buff);
    return proto;
}

}

namespace as
{

LuaLanguageScript::LuaLanguageScript(
    lua_State* state,
    const std::shared_ptr<LuaIR>& lua_ir,
    const std::shared_ptr<LuaLLVMCompiler>& llvmCompiler):
    m_lua_state(state),
    m_lua_ir(lua_ir),
    m_llvmCompiler(llvmCompiler)
{

}

LuaLanguageScript::~LuaLanguageScript()
{

}

void LuaLanguageScript::load(const std::string& filename, llvm::LLVMContext& context)
{
    // const int result = luaL_loadfile(m_lua_state, filename.c_str());
    //
    //
    // const Closure* closure = clvalue(m_lua_state->top - 1);
    // m_proto = closure->l.p;

    m_proto = load_lua_source(m_lua_state, filename.c_str());

    if (!m_proto)
    {
        llvm::errs() << "Failed to load script file: " << lua_tostring(m_lua_state, -1) << "\n";
        exit(1);
    }

    if (m_dumpCompiled)
    {
        llvm::errs() << "OPCODES: \n";
        printLuaFunction(m_proto, true);
    }
}

std::shared_ptr<ScriptInterface> LuaLanguageScript::getInterface(const std::string& filename, CPPParser& cpp_paser)
{
    auto interface_filename = ir::getImplements(filename, "--");
    if (interface_filename.empty())
    {
        llvm::errs() << "Cannot find implementation for script " << filename << "\n";
        return nullptr;
    }

    return ir::getInterface(filename, interface_filename, cpp_paser);
}

std::unique_ptr<llvm::Module> LuaLanguageScript::createModule(
        llvm::LLVMContext& context)
{
    return std::make_unique<llvm::Module>("lua_module", context);
}

llvm::Function* LuaLanguageScript::buildCustomInitFunction(llvm::Module& module)
{
    auto& context = module.getContext();
    llvm::IRBuilder<> builder(context);

    const auto initFunction_t = llvm::FunctionType::get(m_lua_ir->void_t, {}, false);
    llvm::Function* func = llvm::Function::Create(initFunction_t, llvm::Function::InternalLinkage,
                                  "__custom_init__", module);

    llvm::BasicBlock* block = llvm::BasicBlock::Create(context, "entry", func);
    builder.SetInsertPoint(block);

    builder.CreateCall(m_lua_ir->module_entry_point_f, {m_luaStateGlobal, m_ftreeRootGlobal});
    builder.CreateRetVoid();

    return func;
}

llvm::Function* LuaLanguageScript::buildModule(const std::string& init_name,
    const std::string& module_name,
    const ScriptInterface& interface,
    llvm::Module& module)
{
    auto& context = module.getContext();

    m_functionTree = m_llvmCompiler->compile(context, module, m_lua_ir, m_lua_state, m_proto);
    const auto ftree_const = buildFunctionTreeIR(m_functionTree, m_lua_ir, module);
    m_ftreeRootGlobal = new llvm::GlobalVariable(module, m_lua_ir->FunctionTree_t, false,
        llvm::GlobalValue::InternalLinkage, ftree_const, "__func_tree__");

    m_luaStateGlobal = new llvm::GlobalVariable(module, m_lua_ir->lua_State_ptr_t, false, llvm::GlobalValue::ExternalLinkage,
                                                      nullptr,
                                                      LuaIR::LUA_STATE_GLOBAL_VAR);

    const auto customInitFunction = buildCustomInitFunction(module);

    const auto vtable = ir::buildVTable(module_name, interface, module, &LuaLanguageScript::buildFunction, this);
    ir::addMissingDeclarations(module);
    const auto init_func =  ir::createInitFunc(module, init_name, module_name, vtable, nullptr, "", customInitFunction);

    if (m_dumpCompiled)
    {
        llvm::errs() << module;
    }

//    llvm::verifyModule(module, &llvm::errs());

    return init_func;
}

llvm::Function* LuaLanguageScript::buildFunction(
    const std::string& bare_name,
    llvm::FunctionType* signature,
    llvm::Module& module,
    llvm::LLVMContext& context)
{
    LuaStackGuard stack_guard(m_lua_state);
    const LLVMOptimizer optimizer(&module);

    if (!m_functionTree->global_func_map.contains(bare_name))
    {
        fprintf(stderr, "Error: global function for interface not found!\n");
        exit(1);
    }

    const int closure_id = m_functionTree->global_func_map[bare_name];

    llvm::IRBuilder<> builder(context);
    llvm::Function* func = llvm::Function::Create(signature, llvm::Function::InternalLinkage, bare_name, module);
    llvm::BasicBlock* block = llvm::BasicBlock::Create(context, "entry", func);
    builder.SetInsertPoint(block);

    llvm::Value* closure_id_val = builder.getInt32(closure_id);

    builder.CreateCall(m_lua_ir->push_global_closure_f, {m_luaStateGlobal, m_ftreeRootGlobal, closure_id_val});

    // 0 arg is pointer to structure, skip it
    for (int i = 1; i < signature->getNumParams(); ++i)
    {
        llvm::Value* arg = func->getArg(i);
        m_lua_ir->buildPushValue(builder, m_luaStateGlobal, arg->getType(), arg);
    }

    llvm::Constant* num_args = builder.getInt32(signature->getNumParams() - 1);
    llvm::Constant* num_rets = builder.getInt32(1);

//    builder.CreateCall(m_lua_ir->lua_call_f, {m_lua_state_extern, num_args, num_rets});
    builder.CreateCall(m_lua_ir->lua_call_compiled_f, {m_luaStateGlobal, num_args, num_rets});

    const llvm::Type* ret_type = func->getReturnType();
    llvm::Value* ret = m_lua_ir->buildPopValue(builder, m_luaStateGlobal, ret_type, -1);

    llvm::Constant* stack_pos = builder.getInt32(-(1)-1);
    builder.CreateCall(m_lua_ir->lua_settop_f, {m_luaStateGlobal, stack_pos});

    builder.CreateRet(ret);

    optimizer.inlineByName(func, "lua_call_compiled");
    optimizer.inlineByName(func, "lua_call");
    optimizer.inlineByName(func, "luaD_call");
//    optimizer.inlineByName(func, "luaD_precall");
    optimizer.runOptimizationPasses(func);

    return func;
}

void LuaLanguageScript::materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit, llvm::orc::JITDylib& lib,
        llvm::Module& module, llvm::LLVMContext& context)
{
//    m_llvmCompiler->materialize(jit, lib, m_func_names);
}

} // namespace as

