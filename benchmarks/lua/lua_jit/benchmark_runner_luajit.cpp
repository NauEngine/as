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
    luaL_dostring(state, "jit.on()"); // Включение JIT
    //luaL_dostring(state, "jit.off()"); // Отключение JIT
    luaL_dofile(state, filename.c_str());
}

double BenchmarkRunnerLuaJit::run()
{
    lua_getglobal(state, "test");
    lua_call(state, 0, 1);
    return lua_tonumber(state, -1);
}

void BenchmarkRunnerLuaJit::shutdown()
{
    lua_close(state);
    state = nullptr;
}

} // namespace as::benchmark
