add_executable(SandboxInterface main_interface.cpp)
target_link_libraries(SandboxInterface
    AScript
    ${llvm_libs}
)

add_executable(SandboxScripts main_scripts.cpp)
target_link_libraries(SandboxScripts
    LuaIntegration
    SquirrelIntegration
    IvnScriptIntegration
)

add_executable(SandboxSq main_sq.cpp)
target_link_libraries(SandboxSq SquirrelIntegration)

add_executable(SandboxLuaVM main_lua_vm.cpp)
target_link_libraries(SandboxLuaVM LuaIntegration)

add_executable(SandboxMagic main_magic.cpp)

add_executable(SandboxTests main_tests.cpp)
target_link_libraries(SandboxTests
    LuaIntegration
    SquirrelIntegration
    IvnScriptIntegration
    TypeScriptIntegration
)

add_executable(SandboxCompiler
    main_compiler.cpp)

target_link_scripts(SandboxCompiler
    scripts/test_1.is
    scripts/test_1.cpp)
target_link_libraries(SandboxCompiler
    IvnScriptIntegration
)

add_executable(SandboxV main_v.cpp)
target_link_libraries(SandboxV LuaIntegration SquirrelIntegration)
target_compile_options(SandboxV PRIVATE -g)
target_link_options(SandboxV PRIVATE -g)

add_executable(SandboxCpp
    main_cpp.cpp)
target_link_libraries(SandboxCpp
    CppScriptIntegration
)

add_executable(SandboxHotReload
    main_hot.cpp)

target_link_libraries(SandboxHotReload
    LuaIntegration
    SquirrelIntegration
    IvnScriptIntegration
    CppScriptIntegration
)
