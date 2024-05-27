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


bool warn_A(TValue* base, TMS tms)
{
    return base->tt == LUA_TNUMBER;
}