include(FetchContent)
FetchContent_Declare(googletest
    URL https://github.com/google/googletest/archive/refs/tags/v1.14.0.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

enable_testing()

add_executable(AScriptTest
    language_is_test.cpp
    language_lua_test.cpp

    scripts/simple_script.h
    scripts/integer_script.h
    scripts/double_script.h
)

target_link_libraries(AScriptTest
    GTest::gtest_main

    LuaIntegration
    SquirrelIntegration
    IvnScriptIntegration
    CppScriptIntegration
)

include(GoogleTest)
gtest_discover_tests(AScriptTest)
