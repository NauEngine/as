//
// Created by Alex Zelenshikov on 02.05.2024.
//

#include "llvm/IR/IRBuilder.h"

#include "as/core/core_utils.h"
#include "bc/lapi_bc.h"

#include "lua_ir.h"

extern "C"
{
#include "lua/lua.h"
#include "lua/lstate.h"
}

namespace as
{

void LuaIR::init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context, lua_State* lua_state)
{
  llvm::LLVMContext& context = *ts_context.getContext();
  // init lapi bc
  m_module_lapi = utils::loadEmbeddedBitcode(context, "lapi_bc", lapi_bc, sizeof(lapi_bc));
  llvm::errs() << *m_module_lapi;

  // parse types & functions
  int8_t = llvm::Type::getInt8Ty(context);
  int16_t = llvm::Type::getInt16Ty(context);
  int32_t = llvm::Type::getInt32Ty(context);
  int64_t = llvm::Type::getInt64Ty(context);
  void_t = llvm::Type::getVoidTy(context);
  double_t = llvm::Type::getDoubleTy(context);

  lua_State_t = llvm::StructType::getTypeByName(context, "struct.lua_State");
  lua_State_ptr_t = llvm::PointerType::getUnqual(lua_State_t);

  lua_rawgeti_f = m_module_lapi->getFunction("lua_rawgeti");
  lua_pushinteger_f = m_module_lapi->getFunction("lua_pushinteger");
  lua_pushnumber_f = m_module_lapi->getFunction("lua_pushnumber");
  lua_call_f = m_module_lapi->getFunction("lua_call");
  lua_tointeger_f = m_module_lapi->getFunction("lua_tointeger");
  lua_tonumber_f = m_module_lapi->getFunction("lua_tonumber");
  lua_settop_f = m_module_lapi->getFunction("lua_settop");

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

} // namespace as
