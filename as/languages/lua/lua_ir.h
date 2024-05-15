//
// Created by Alex Zelenshikov on 02.05.2024.
//

#ifndef LUA_IR_H
#define LUA_IR_H

#include "llvm/ExecutionEngine/Orc/LLJIT.h"

struct lua_State;

namespace llvm
{
  class LLVMContext;
}

namespace as
{

class LuaIR
{
public:
  constexpr static const char* LUA_MAIN_IR_MODULE = "__lua_main_module__";
  constexpr static const char* LUA_STATE_GLOBAL_VAR = "__lua_state__";

  // IR types
  llvm::Type* int8_t = nullptr;
  llvm::Type* int16_t = nullptr;
  llvm::Type* int32_t = nullptr;
  llvm::Type* int64_t = nullptr;
  llvm::Type* void_t = nullptr;
  llvm::Type* double_t = nullptr;

  llvm::Type* lua_State_t = nullptr;
  llvm::Type* lua_State_ptr_t = nullptr;

  llvm::FunctionType* lua_func_t = nullptr;
  llvm::Type* lua_func_ptr_t = nullptr;

  // lapi functions
  llvm::Function* lua_rawgeti_f = nullptr;
  llvm::Function* lua_pushinteger_f = nullptr;
  llvm::Function* lua_pushnumber_f = nullptr;
  llvm::Function* lua_call_f = nullptr;
  llvm::Function* lua_tointeger_f = nullptr;
  llvm::Function* lua_tonumber_f = nullptr;
  llvm::Function* lua_settop_f = nullptr;

  // lauxlib functions
  llvm::Function* luaL_checkudata_f = nullptr;

  void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context, lua_State* lua_state);

  llvm::Value* buildPopValue(llvm::IRBuilder<>& builder, llvm::Value* lua_state_ir, const llvm::Type* type, int stackPos) const;
  void buildPushValue(llvm::IRBuilder<>& builder, llvm::Value* lua_state_ir, const llvm::Type* type, llvm::Value* value) const;

private:
  std::unique_ptr<llvm::Module> m_lapiModule;
  std::unique_ptr<llvm::Module> m_lauxlibModule;
};

} // namespace as


#endif //LUA_IR_H
