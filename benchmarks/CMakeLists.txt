add_subdirectory(lua)

add_executable(Benchmark
    main.cpp
)
target_link_libraries(Benchmark
    BanchmarkLuaAs
    BanchmarkLuaClassic
    BanchmarkLuaJit
)

