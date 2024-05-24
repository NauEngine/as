//
// Created by Alex Zelenshikov on 22.05.2024.
//

#include "benchmark_runner_luajit.h"

#include <lua.hpp>

extern "C"
{
#pragma visibility push(hidden)

#pragma visibility pop
}

static lua_State* state = nullptr;

namespace as::benchmark
{

std::unique_ptr<IBenchmarkRunner> getRunnerLuaJit()
{
    return std::make_unique<BenchmarkRunnerLuaJit>();
}

void BenchmarkRunnerLuaJit::prepare(const std::string& filename)
{
    state = luaL_newstate();
    luaL_dofile(state, filename.c_str());
}

void BenchmarkRunnerLuaJit::run()
{
    lua_getglobal(state, "test");
    lua_call(state, 0, 0);
}

void BenchmarkRunnerLuaJit::shutdown()
{
    lua_close(state);
    state = nullptr;
}

} // namespace as::benchmark
