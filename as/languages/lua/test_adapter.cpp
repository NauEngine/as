//
// Created by Alex Zelenshikov on 02.05.2024.
//
extern "C"
{
#include "lua/lobject.h"
#include "lua/lua.h"
#include "lua/lauxlib.h"
#include "lua/lualib.h"
#include "lua/lstate.h"
}

struct Logger
{
	virtual void warn(int a, int b) = 0;
	virtual int debug(int a, int b) = 0;
};


int warn_A(lua_State* state)
{
	Logger* obj = *(Logger**)luaL_checkudata(state, 1, "Logger");
	int a = luaL_checkinteger(state, 2);
	int b = luaL_checkinteger(state, 3);
	obj->warn(a, b);
	return 0;
}