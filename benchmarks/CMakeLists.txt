add_subdirectory(lua)

add_executable(Benchmark
    native_runner.cpp
    native_runner.h
    native/test_array.cpp
    native/test_cycle.cpp
    native/test_nqueen.cpp
    main.cpp
)
target_link_libraries(Benchmark
    BanchmarkLuaAs
    BanchmarkLuaClassic
    BanchmarkLuaJit
)

