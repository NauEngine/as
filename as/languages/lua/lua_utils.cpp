//
// Created by Alex Zelenshikov on 06.05.2024.
//

#include <cassert>
#include "lua_utils.h"

extern "C"
{
#include "lua/lua.h"
#include "lua/lauxlib.h"
#include "lua/lualib.h"
#include "lua/lstate.h"
}

namespace as
{

LuaLocalState::LuaLocalState()
{
    m_luaState = luaL_newstate();
    luaL_openlibs(m_luaState);
}

LuaLocalState::~LuaLocalState()
{
    if (m_luaState)
    {
        lua_close(m_luaState);
        m_luaState = nullptr;
    }
}

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
