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

void BenchmarkRunnerLuaClassic::run()
{
    lua_getglobal(state, "test");
    lua_call(state, 0, 0);
}

void BenchmarkRunnerLuaClassic::shutdown()
{
    lua_close(state);
    state = nullptr;
}

} // namespace as::benchmark
