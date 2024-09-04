//
// Created by Alex Zelenshikov on 04.09.2024.
//

extern "C"
{
#include "lua/lua.h"
#include "lua/lauxlib.h"
#include "lua/lualib.h"
#include "lua/lstate.h"
}

#include "lua_language_runtime.h"

namespace as
{

LuaLanguageRuntime::LuaLanguageRuntime()
{
    m_luaState = luaL_newstate();
    luaL_openlibs(m_luaState);
}

LuaLanguageRuntime::~LuaLanguageRuntime()
{
    if (m_luaState)
    {
        lua_close(m_luaState);
        m_luaState = nullptr;
    }
}

const char* LuaLanguageRuntime::name()
{
    return "lua_runtime";
}

const void* LuaLanguageRuntime::ptr()
{
    return  m_luaState;
}

} // namespace as