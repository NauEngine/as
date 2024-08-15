//
// Created by Alex Zelenshikov on 01.05.2024.
//

#include "llvm/IR/IRBuilder.h"
#include "llvm/Transforms/Utils/Cloning.h"

#include "as/core/core_utils.h"
#include "as/core/llvm_optimizer.h"

#include "lua_language_script.h"
#include "lua_llvm_compiler.h"
#include "lua_ir.h"
#include "lua_utils.h"
#include "as/core/ir.h"

extern "C"
{
#include "lua/lobject.h"
#include "lua/lauxlib.h"
#include "lua/lstate.h"
}

namespace as
{

LuaLanguageScript::LuaLanguageScript(
    lua_State* state,
    const std::shared_ptr<LuaIR>& lua_ir,
    const std::shared_ptr<LuaLLVMCompiler>& llvmCompiler,
    const std::shared_ptr<llvm::orc::LLJIT>& jit,
    llvm::orc::ThreadSafeContext ts_context):
    m_lua_state(state),
    m_lua_ir(lua_ir),
    m_llvmCompiler(llvmCompiler),
    m_jit(jit),
    m_registry_index(LUA_NOREF),
    m_ts_context(std::move(ts_context))
{

}

LuaLanguageScript::~LuaLanguageScript()
{
    if (m_registry_index != LUA_NOREF)
    {
        luaL_unref(m_lua_state, LUA_REGISTRYINDEX, m_registry_index);
    }

    for (const auto& [name, ref] : m_func_registry_ids)
    {
        luaL_unref(m_lua_state, LUA_REGISTRYINDEX, ref);
    }
}

void LuaLanguageScript::load(const std::string& filename, llvm::LLVMContext& context)
{
    const int result = luaL_loadfile(m_lua_state, filename.c_str());

    if (result != 0)
    {
        llvm::errs() << "Failed to load script file: " << lua_tostring(m_lua_state, -1) << "\n";
        exit(1);
    }

    Closure* closure = clvalue(m_lua_state->top - 1);

    if (m_llvmCompiler->getDumpCompiled())
    {
        llvm::errs() << "OPCODES: \n";
        printLuaFunction(closure->l.p, true);
    }

    m_llvmCompiler->compile(m_ts_context, m_jit, m_lua_ir, m_lua_state, closure->l.p);
    m_registry_index = luaL_ref(m_lua_state, LUA_REGISTRYINDEX);
}

std::unique_ptr<llvm::Module> LuaLanguageScript::createModule(
        llvm::LLVMContext& context)
{
    auto module = std::make_unique<llvm::Module>("lua_module", context);

    m_lua_state_extern = new llvm::GlobalVariable(*module, m_lua_ir->lua_State_ptr_t, false, llvm::GlobalValue::ExternalLinkage,
                                                      nullptr,
                                                      LuaIR::LUA_STATE_GLOBAL_VAR);
    // TODO [AZ] check if registry_index exists
    lua_rawgeti(m_lua_state, LUA_REGISTRYINDEX, m_registry_index);
    lua_call(m_lua_state, 0, LUA_MULTRET);

    return module;
}

llvm::Function* LuaLanguageScript::buildModule(const std::string& init_name,
    const std::string& module_name,
    const ScriptInterface& interface,
    llvm::Module& module)
{
    const auto vtable = ir::buildVTable(module_name, interface, module, &LuaLanguageScript::buildFunction, this);
    ir::addMissingDeclarations(module);
    return ir::createInitFunc(module, init_name, module_name, vtable, nullptr, "");
}

llvm::Function* LuaLanguageScript::buildFunction(
    const std::string& bare_name,
    llvm::FunctionType* signature,
    llvm::Module& module,
    llvm::LLVMContext& context)
{
    LuaStackGuard stack_guard(m_lua_state);
    const LLVMOptimizer optimizer(&module);

    lua_getglobal(m_lua_state, bare_name.c_str());
    int func_ref = LUA_NOREF;
    if (lua_type(m_lua_state, -1) == LUA_TFUNCTION)
    {
        func_ref = luaL_ref(m_lua_state, LUA_REGISTRYINDEX);
        m_func_registry_ids[bare_name] = func_ref;
    }
    else
    {
        // TODO [AZ] handle error
        assert(false);
        return nullptr;
    }

    llvm::IRBuilder<> builder(context);
    llvm::Function* func = llvm::Function::Create(signature, llvm::Function::InternalLinkage, bare_name, module);
    llvm::BasicBlock* block = llvm::BasicBlock::Create(context, "entry", func);
    builder.SetInsertPoint(block);

    llvm::Value* func_ref_val = builder.getInt32(func_ref);
    llvm::Value* LUA_REGISTRYINDEX_val = builder.getInt32(LUA_REGISTRYINDEX);

    builder.CreateCall(m_lua_ir->lua_rawgeti_f, {m_lua_state_extern, LUA_REGISTRYINDEX_val, func_ref_val});

    // 0 arg is pointer to structure, skip it
    for (int i = 1; i < signature->getNumParams(); ++i)
    {
        llvm::Value* arg = func->getArg(i);
        m_lua_ir->buildPushValue(builder, m_lua_state_extern, arg->getType(), arg);
    }

    llvm::Constant* num_args = builder.getInt32(signature->getNumParams() - 1);
    llvm::Constant* num_rets = builder.getInt32(1);

//    builder.CreateCall(m_lua_ir->lua_call_f, {m_lua_state_extern, num_args, num_rets});
    builder.CreateCall(m_lua_ir->lua_call_compiled_f, {m_lua_state_extern, num_args, num_rets});

    const llvm::Type* ret_type = func->getReturnType();
    llvm::Value* ret = m_lua_ir->buildPopValue(builder, m_lua_state_extern, ret_type, -1);

    llvm::Constant* stack_pos = builder.getInt32(-(1)-1);
    builder.CreateCall(m_lua_ir->lua_settop_f, {m_lua_state_extern, stack_pos});

    builder.CreateRet(ret);

    optimizer.inlineByName(func, "lua_call_compiled");
    optimizer.inlineByName(func, "lua_call");
    optimizer.inlineByName(func, "luaD_call");
//    optimizer.inlineByName(func, "luaD_precall");
    optimizer.runOptimizationPasses(func);

    return func;
}

} // namespace as

