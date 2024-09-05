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
#include "lua_extern_metatables.h"
#include "as/core/ir.h"

extern "C"
{
#include "lua/lauxlib.h"
}

namespace as
{

LuaLanguageScript::LuaLanguageScript(
    const std::shared_ptr<LuaIR>& lua_ir,
    const std::shared_ptr<LuaLLVMCompiler>& llvmCompiler):
    m_lua_ir(lua_ir),
    m_llvmCompiler(llvmCompiler)
{

}

LuaLanguageScript::~LuaLanguageScript()
{

}

void LuaLanguageScript::load(const std::string& filename, llvm::LLVMContext& context)
{
    m_filename = filename;
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

std::unordered_map<std::string, std::shared_ptr<ScriptInterface>>
    LuaLanguageScript::getRequires(const std::string& filename, CPPParser& cpp_paser)
{
    std::unordered_map<std::string, std::shared_ptr<ScriptInterface>> result;

    auto externalRequires = ir::getRequires(m_filename, "--");

    for (auto& [name, interface_filename] : externalRequires)
    {
        auto interface = ir::getInterface(filename, interface_filename, cpp_paser);
        result[name] = std::move(interface);
    }

    return std::move(result);
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

    const auto initFunction_t = llvm::FunctionType::get(m_lua_ir->void_t, {m_lua_ir->void_ptr_t}, false);
    llvm::Function* func = llvm::Function::Create(initFunction_t, llvm::Function::InternalLinkage,
                                  "__custom_init__", module);

    llvm::BasicBlock* block = llvm::BasicBlock::Create(context, "entry", func);
    builder.SetInsertPoint(block);

    llvm::Value* core = func->getArg(0);

    auto luaState = builder.CreateLoad(m_lua_ir->void_ptr_t, m_luaStateGlobalVar);
    builder.CreateCall(m_lua_ir->module_entry_point_f, {core, luaState, m_ftreeRootGlobal, m_metatablesListGlobal});
    builder.CreateRetVoid();

    return func;
}

llvm::Function* LuaLanguageScript::buildModule(const std::string& init_name,
    const std::string& module_name,
    const ScriptInterface& interface,
    const std::unordered_map<std::string, std::shared_ptr<ScriptInterface>>& externalRequires,
    llvm::Module& module)
{
    LuaLocalState localLua;
    auto& context = module.getContext();

    Proto* proto = loadLuaProto(localLua.get(), m_filename, m_dumpCompiled);

    m_functionTree = m_llvmCompiler->compile(context, module, m_lua_ir, localLua.get(), proto);
    m_ftreeRootGlobal = buildFunctionTreeIR(m_functionTree, m_lua_ir, module);
    m_metatablesListGlobal = LuaExternMetatables::buildIR(externalRequires, m_lua_ir, module);

    m_luaStateGlobalVar = new llvm::GlobalVariable(module, m_lua_ir->lua_State_ptr_t, false, llvm::GlobalValue::PrivateLinkage,
                                                      llvm::ConstantPointerNull::get(m_lua_ir->void_ptr_t),
                                                      "__lua_state__");

    const auto customInitFunction = buildCustomInitFunction(module);

    const auto vtable = ir::buildVTable(module_name, interface, module, &LuaLanguageScript::buildFunction, this);
    ir::addMissingDeclarations(module);
    const auto init_func =  ir::createInitFunc(module, init_name, module_name, vtable, m_luaStateGlobalVar, "lua_runtime", customInitFunction);

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

    auto luaState = builder.CreateLoad(m_lua_ir->void_ptr_t, m_luaStateGlobalVar);
    //auto luaState = m_luaStateGlobalVar;

    builder.CreateCall(m_lua_ir->push_global_closure_f, {luaState, m_ftreeRootGlobal, closure_id_val});

    // 0 arg is pointer to structure, skip it
    for (int i = 1; i < signature->getNumParams(); ++i)
    {
        llvm::Value* arg = func->getArg(i);
        m_lua_ir->buildPushValue(builder, luaState, arg->getType(), arg);
    }

    llvm::Constant* num_args = builder.getInt32(signature->getNumParams() - 1);
    llvm::Constant* num_rets = builder.getInt32(1);

//    builder.CreateCall(m_lua_ir->lua_call_f, {m_lua_state_extern, num_args, num_rets});
    builder.CreateCall(m_lua_ir->lua_call_compiled_f, {luaState, num_args, num_rets});

    const llvm::Type* ret_type = func->getReturnType();
    llvm::Value* ret = m_lua_ir->buildPopValue(builder, luaState, ret_type, -1);

    llvm::Constant* stack_pos = builder.getInt32(-(1)-1);
    builder.CreateCall(m_lua_ir->lua_settop_f, {luaState, stack_pos});

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

