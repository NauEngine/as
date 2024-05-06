//
// Created by Alex Zelenshikov on 01.05.2024.
//

#include "llvm/IR/IRBuilder.h"

#include "as/core/core_utils.h"
#include "bc/lapi_bc.h"
#include "bc/test_adapter_bc.h"

#include "lua_language_script.h"
#include "lua_ir.h"
#include "lua_utils.h"

extern "C"
{
#include "lua/lobject.h"
#include "lua/lauxlib.h"
}

namespace as
{

LuaLanguageScript::LuaLanguageScript(lua_State* state, const std::shared_ptr<LuaIR>& lua_ir) :
  lua_state(state),
  lua_ir(lua_ir),
  registry_index(LUA_NOREF)
{

}

LuaLanguageScript::~LuaLanguageScript()
{
  if (registry_index != LUA_NOREF)
  {
    luaL_unref(lua_state, LUA_REGISTRYINDEX, registry_index);
  }

  for (const auto& [name, ref] : func_registry_ids)
  {
    luaL_unref(lua_state, LUA_REGISTRYINDEX, ref);
  }
}


void LuaLanguageScript::load(const std::string& filename)
{
  luaL_loadfile(lua_state, filename.c_str());
  registry_index = luaL_ref(lua_state, LUA_REGISTRYINDEX);
}

void LuaLanguageScript::prepareModule(llvm::LLVMContext& context, llvm::Module* module)
{
  lua_state_extern = new llvm::GlobalVariable(*module, lua_ir->lua_State_ptr_t, false, llvm::GlobalValue::ExternalLinkage,
                                                    nullptr,
                                                    LuaIR::LUA_STATE_GLOBAL_VAR);

  // TODO [AZ] check if registry_index exists
  lua_rawgeti(lua_state, LUA_REGISTRYINDEX, registry_index);
  lua_call(lua_state, 0, LUA_MULTRET);
}

llvm::Function* LuaLanguageScript::buildFunction(
  llvm::FunctionType* signature,
  const std::string& interface_name,
  const std::string& function_name,
  llvm::LLVMContext& context,
  llvm::Module* module)
{
  LuaStackGuard stack_guard(lua_state);

  lua_getglobal(lua_state, function_name.c_str());
  int func_ref = LUA_NOREF;
  if (lua_type(lua_state, -1) == LUA_TFUNCTION)
  {
    func_ref = luaL_ref(lua_state, LUA_REGISTRYINDEX);
    func_registry_ids[function_name] = func_ref;
  }
  else
  {
    // TODO [AZ] handle error
    return nullptr;
  }

  llvm::IRBuilder<> builder(context);
  auto func_name = interface_name + "_" + function_name;
  llvm::Function* func = llvm::Function::Create(signature, llvm::Function::ExternalLinkage, func_name, module);
  llvm::BasicBlock* block = llvm::BasicBlock::Create(context, "entry", func);
  builder.SetInsertPoint(block);

  llvm::Value* lua_state_val = builder.CreateLoad(lua_ir->lua_State_ptr_t, lua_state_extern);
  llvm::Value* func_ref_val = builder.getInt32(func_ref);
  llvm::Value* LUA_REGISTRYINDEX_val = builder.getInt32(LUA_REGISTRYINDEX);

  builder.CreateCall(lua_ir->lua_rawgeti_f, {lua_state_val, LUA_REGISTRYINDEX_val, func_ref_val});

  // 0 arg is pointer to structure, skip it
  for (int i = 1; i < signature->getNumParams(); ++i)
  {
    llvm::Value* arg = func->getArg(i);
    const llvm::Type* arg_type = arg->getType();
    if (arg_type == lua_ir->int32_t)
    {
      llvm::Value* arg64 = builder.CreateSExt(arg, lua_ir->int64_t);
      builder.CreateCall(lua_ir->lua_pushinteger_f, {lua_state_val, arg64});
    }
    else if (arg_type == lua_ir->double_t)
    {
      builder.CreateCall(lua_ir->lua_pushnumber_f, {lua_state_val, arg});
    }
  }

  llvm::Constant* num_args = builder.getInt32(signature->getNumParams() - 1);
  llvm::Constant* num_rets = builder.getInt32(1);

  builder.CreateCall(lua_ir->lua_call_f, {lua_state_val, num_args, num_rets});

  llvm::Constant* stack_top = builder.getInt32(-1);

  const llvm::Type* ret_type = func->getReturnType();
  llvm::Value* ret = nullptr;

  if (ret_type == lua_ir->int32_t)
  {
    llvm::Value* result = builder.CreateCall(lua_ir->lua_tointeger_f, {lua_state_val, stack_top});
    ret = builder.CreateTrunc(result, lua_ir->int32_t);
  }
  else if (ret_type == lua_ir->double_t)
  {
    ret = builder.CreateCall(lua_ir->lua_tonumber_f, {lua_state_val, stack_top});
  }

  llvm::Constant* stack_pos = builder.getInt32(-(1)-1);
  builder.CreateCall(lua_ir->lua_settop_f, {lua_state_val, stack_pos});

  builder.CreateRet(ret);

  return func;
}

} // namespace as

