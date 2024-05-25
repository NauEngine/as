add_subdirectory(lua)

add_executable(Benchmark
    native_runner.cpp
    native_runner.h
    main.cpp
)
target_link_libraries(Benchmark
    BanchmarkLuaAs
    BanchmarkLuaClassic
    BanchmarkLuaJit
)

