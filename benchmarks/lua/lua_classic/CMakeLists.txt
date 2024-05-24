add_library(BanchmarkLuaClassic SHARED
    benchmark_runner_luaclassic.h
    benchmark_runner_luaclassic.cpp
)

#target_compile_options(BanchmarkLuaClassic PRIVATE -fvisibility=hidden)
#target_link_options(BanchmarkLuaClassic PRIVATE -Wl,--exclude-libs,ALL)