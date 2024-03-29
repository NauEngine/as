//
// Created by Alex Zelenshikov on 21.03.2024.
//

#include "LuaScriptModule.h"

extern "C"
{
#include "lua/lobject.h"
}

namespace as
{
  LuaScriptModule::LuaScriptModule(lua_State* state) : lua_state(state)
  {

  }

  void LuaScriptModule::RunScript()
  {
    lua_call(lua_state, 0, LUA_MULTRET);
  }

  void LuaScriptModule::RunFunction()
  {
    lua_getglobal(lua_state, "update");
    lua_call(lua_state, 0, 0);
  }
}
