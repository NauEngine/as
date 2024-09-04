//
// Created by Alex Zelenshikov on 02.05.2024.
//
//extern "C"
//{
//#include "lua/lobject.h"
///#include "lua/lua.h"
//#include "lua/lauxlib.h"
//#include "lua/lualib.h"
#include "lua/lstate.h"
//}

struct Logger
{
    virtual ~Logger() = default;
	virtual int warn(int a) = 0;
};

struct LoggerImpl : Logger
{
    int warn(int a)
    {
        return a + 10;
    };
};

void test()
{
    Logger* logger = new LoggerImpl();
    int b = logger->warn(10);
}

void test3(lua_State** L_)
{
    lua_State* L = *L_;
}