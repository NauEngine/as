add_executable(Sandbox main.cpp
        main3.cpp)
target_link_libraries(Sandbox ${llvm_libs})

add_executable(Sandbox2 main2.cpp)
target_link_libraries(Sandbox2 ${llvm_libs})

add_executable(SandboxInterface main_interface.cpp)
target_link_libraries(SandboxInterface
    AScript
    ${llvm_libs}
)

add_executable(Sandbox3 main3.cpp)

add_executable(Sandbox4 main4.cpp)

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

target_link_scripts(SandboxCompiler scripts/test_script.is)
target_link_libraries(SandboxCompiler
    IvnScriptIntegration
)

add_executable(SandboxV main_v.cpp)
target_link_libraries(SandboxV LuaIntegration SquirrelIntegration)
target_compile_options(SandboxV PRIVATE -g)
target_link_options(SandboxV PRIVATE -g)