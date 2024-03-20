add_executable(Sandbox main.cpp)
target_link_libraries(Sandbox ${llvm_libs})

add_executable(Sandbox2 main2.cpp)
target_link_libraries(Sandbox2 ${llvm_libs})

add_executable(SandboxLua main_lua.cpp)
target_link_libraries(SandboxLua LuaIntegration)
