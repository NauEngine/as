add_library(LuaIntegration STATIC
    lua_language_processor.cpp
    lua_language_processor.h
    lua_core.cpp
    lua_core.h
    llvm_compiler.cpp
    llvm_compiler.h
    base_lua_module.cpp
    base_lua_module.h
    lua_vm_ops_static.c
    lua_script_module.cpp
    lua_script_module.h
)

target_compile_definitions(LuaIntegration PUBLIC _XOPEN_SOURCE=600)
target_include_directories(LuaIntegration PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")

target_link_libraries(LuaIntegration AScript)
