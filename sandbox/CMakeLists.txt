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
target_link_libraries(SandboxScripts LuaIntegration)

add_executable(SandboxSq main_sq.cpp)
target_link_libraries(SandboxSq SquirrelIntegration)
