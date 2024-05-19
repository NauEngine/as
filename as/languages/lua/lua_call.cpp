//
// Created by Alex Zelenshikov on 19.05.2024.
//

extern "C" {

#include "lua/lapi.h"
#include "lua/ldo.h"

#define adjustresults(L,nres) \
{ if (nres == LUA_MULTRET && L->top >= L->ci->top) L->ci->top = L->top; }

LUA_API void lua_call_compiled(lua_State *L, int nargs, int nresults)
{
    StkId func = L->top - (nargs+1);
    luaD_precall(L, func, nresults);
    adjustresults(L, nresults);
}

}