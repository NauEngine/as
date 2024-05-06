//
// Created by Alex Zelenshikov on 06.05.2024.
//

#include <cassert>
#include "lua_utils.h"

extern "C"
{
#include "lua/lua.h"
}

namespace as
{
  LuaStackGuard::LuaStackGuard(lua_State* lua_state):
    lua_state(lua_state),
    top(lua_gettop(lua_state))
  {

  }

  LuaStackGuard::~LuaStackGuard()
  {
    const int current_top = lua_gettop(lua_state);
    assert(top == current_top);
  }

} //namespace as
