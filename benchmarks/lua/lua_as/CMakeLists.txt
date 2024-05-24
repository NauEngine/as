add_library(BanchmarkLuaAs SHARED
    runner.h
    benchmark_runner_luaas.h
    benchmark_runner_luaas.cpp
)

target_link_libraries(BanchmarkLuaAs
    LuaIntegration
)
