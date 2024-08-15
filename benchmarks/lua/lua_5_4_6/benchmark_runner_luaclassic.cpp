//
// Created by Alex Zelenshikov on 22.05.2024.
//

#include "benchmark_runner_luaclassic.h"

extern "C"
{
#include "lua/lapi.c"
#include "lua/lauxlib.c"
#include "lua/lctype.c"
#include "lua/lcode.c"
#include "lua/linit.c"
#include "lua/ldo.c"
#include "lua/ldump.c"
#include "lua/lundump.c"
#include "lua/lfunc.c"
#include "lua/ldebug.c"
#include "lua/lgc.c"
#include "lua/llex.c"
#include "lua/lmem.c"
#include "lua/lobject.c"
#include "lua/lopcodes.c"
#include "lua/lparser.c"
#include "lua/lstate.c"
#include "lua/lzio.c"
#include "lua/lstring.c"
#include "lua/ltable.c"
#include "lua/ltm.c"
#include "lua/lvm.c"

#include "lua/lbaselib.c"
#include "lua/ldblib.c"
#include "lua/lcorolib.c"
#include "lua/liolib.c"
#include "lua/lmathlib.c"
#include "lua/loadlib.c"
#include "lua/loslib.c"
#include "lua/lstrlib.c"
#include "lua/ltablib.c"
#include "lua/lutf8lib.c"
}

static lua_State* state = nullptr;

namespace as::benchmark
{

std::unique_ptr<IBenchmarkRunner> getRunnerLuaClassic()
{
    return std::make_unique<BenchmarkRunnerLuaClassic>();
}

void BenchmarkRunnerLuaClassic::prepare(const std::string& filename)
{
    state = luaL_newstate();
    luaL_openlibs(state);
    luaL_dofile(state, filename.c_str());
}

double BenchmarkRunnerLuaClassic::run()
{
    lua_getglobal(state, "test");
    lua_call(state, 0, 1);
    return lua_tonumber(state, -1);
}

void BenchmarkRunnerLuaClassic::shutdown()
{
    lua_close(state);
    state = nullptr;
}

void BenchmarkRunnerLuaClassic::prepare_calls(const std::string& filename)
{
    prepare(filename);
}

double BenchmarkRunnerLuaClassic::run_add(double a, double b)
{
    lua_getglobal(state, "call_add");
    lua_pushnumber(state, a);
    lua_pushnumber(state, b);
    lua_call(state, 2, 1);
    auto result = lua_tonumber(state, -1);
    lua_pop(state, 1);
    return result;
}

bool BenchmarkRunnerLuaClassic::run_not(bool a)
{
    lua_getglobal(state, "call_not");
    lua_pushboolean(state, a);
    lua_call(state, 1, 1);
    auto result = lua_toboolean(state, -1);
    lua_pop(state, 1);
    return result;
}

} // namespace as::benchmark
