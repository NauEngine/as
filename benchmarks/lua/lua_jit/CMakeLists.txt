add_library(BanchmarkLuaJit SHARED
    benchmark_runner_luajit.h
    benchmark_runner_luajit.cpp
)

set(LUA_JIT_INCLUDE "" CACHE STRING "Path to luajit includes")
set(LUA_JIT_LIBS "" CACHE STRING "Path to luajit libs")

target_include_directories(BanchmarkLuaJit PRIVATE "${LUA_JIT_INCLUDE}")
target_link_directories(BanchmarkLuaJit PRIVATE "${LUA_JIT_LIBS}")

target_link_libraries(BanchmarkLuaJit "${LUA_JIT_LIBS}/libluajit-5.1.a")