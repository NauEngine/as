//
// Created by Alex Zelenshikov on 02.05.2024.
//

#include "llvm/IR/IRBuilder.h"

#include "as/core/core_utils.h"
#include "bc/lapi_bc.h"
#include "bc/lauxlib_bc.h"

#include "lua_ir.h"

extern "C"
{
#include "lua/lua.h"
}

namespace as
{

void LuaIR::init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context, lua_State* lua_state)
{
  llvm::LLVMContext& context = *ts_context.getContext();
  // init lapi bc
  m_lapiModule = utils::loadEmbeddedBitcode(context, "lapi_bc", lapi_bc, sizeof(lapi_bc));
  m_lauxlibModule = utils::loadEmbeddedBitcode(context, "lauxlib_bc", lauxlib_bc, sizeof(lauxlib_bc));

  // parse types & functions
  int8_t = llvm::Type::getInt8Ty(context);
  int16_t = llvm::Type::getInt16Ty(context);
  int32_t = llvm::Type::getInt32Ty(context);
  int64_t = llvm::Type::getInt64Ty(context);
  void_t = llvm::Type::getVoidTy(context);
  double_t = llvm::Type::getDoubleTy(context);

  lua_State_t = llvm::StructType::getTypeByName(context, "struct.lua_State");
  lua_State_ptr_t = llvm::PointerType::getUnqual(lua_State_t);

  lua_func_t = llvm::FunctionType::get(int32_t, {lua_State_ptr_t}, false);
  lua_func_ptr_t = llvm::PointerType::get(lua_func_t, 0);

  lua_rawgeti_f = m_lapiModule->getFunction("lua_rawgeti");
  lua_pushinteger_f = m_lapiModule->getFunction("lua_pushinteger");
  lua_pushnumber_f = m_lapiModule->getFunction("lua_pushnumber");
  lua_call_f = m_lapiModule->getFunction("lua_call");
  lua_tointeger_f = m_lapiModule->getFunction("lua_tointeger");
  lua_tonumber_f = m_lapiModule->getFunction("lua_tonumber");
  lua_settop_f = m_lapiModule->getFunction("lua_settop");

  luaL_checkudata_f = m_lauxlibModule->getFunction("luaL_checkudata");

  // bound lua_State to global var
  // TODO [AZ] handle errors

  auto error = jit->getMainJITDylib().define(llvm::orc::absoluteSymbols({
    {
      jit->mangleAndIntern(LUA_STATE_GLOBAL_VAR),
      { llvm::orc::ExecutorAddr::fromPtr(lua_state), llvm::JITSymbolFlags::Exported }
    }
  }));

  if (error)
  {
    llvm::errs() << error;
  }
}

llvm::Value* LuaIR::buildPopValue(llvm::IRBuilder<>& builder, llvm::Value* lua_state_ir, const llvm::Type* type, int stackPos) const
{
  llvm::Value* ret = nullptr;

  llvm::Value* stackPos_ir = builder.getInt32(stackPos);

  if (type == int32_t)
  {
    llvm::Value* result = builder.CreateCall(lua_tointeger_f, {lua_state_ir, stackPos_ir});
    ret = builder.CreateTrunc(result, int32_t);
  }
  else if (type == double_t)
  {
    ret = builder.CreateCall(lua_tonumber_f, {lua_state_ir, stackPos_ir});
  }

  return ret;
}

void LuaIR::buildPushValue(llvm::IRBuilder<>& builder, llvm::Value* lua_state_ir, const llvm::Type* type, llvm::Value* value) const
{
  if (type == int32_t)
  {
    llvm::Value* arg64 = builder.CreateSExt(value, int64_t);
    builder.CreateCall(lua_pushinteger_f, {lua_state_ir, arg64});
  }
  else if (type == double_t)
  {
    builder.CreateCall(lua_pushnumber_f, {lua_state_ir, value});
  }

}



} // namespace as
