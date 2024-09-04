//
// Created by Alex Zelenshikov on 04.09.2024.
//

#pragma once

#include "as/core/language_runtime.h"

extern "C"
{
#include "lua/lua.h"
}

namespace as {

class LuaLanguageRuntime: public ILanguageRuntime {
public:
    LuaLanguageRuntime();
    ~LuaLanguageRuntime() override;

    const char* name() override;
    const void* ptr() override;

private:
    lua_State* m_luaState = nullptr;
};

} // as
