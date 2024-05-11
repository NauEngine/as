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

extern "C" {

lua_State* lua_state = nullptr;

int adapter(int a, double b)
{

  	lua_pushinteger(lua_state, a);
	lua_pushnumber(lua_state, b);
  	lua_call(lua_state, 1, 1);
  	return lua_tointeger(lua_state, -1);
}

}

struct Logger
{
	virtual void warn(const char* msg) = 0;
	virtual void debug(const char* msg) = 0;
};

void call_i(Logger* logger)
{
	logger->warn("test");
}