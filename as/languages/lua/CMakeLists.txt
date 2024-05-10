add_library(LuaIntegration STATIC
    lua_ir.cpp
    lua_ir.h
    lua_language.cpp
    lua_language.h
    lua_language_script.cpp
    lua_language_script.h
    lua_core.cpp
    lua_core.h
    lua_utils.cpp
    lua_utils.h
    llvm_compiler.cpp
    llvm_compiler.h
    base_lua_module.cpp
    base_lua_module.h
    lua_vm_ops_static.c

    bc/lua_vm_ops_bc.h
    bc/lapi_bc.h
    bc/test_adapter_bc.h
    bc/test_adapter.ll
)

target_compile_definitions(LuaIntegration PUBLIC _XOPEN_SOURCE=600)
target_include_directories(LuaIntegration PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")

target_link_libraries(LuaIntegration AScript)

set(BC_FLAGS -c)

add_llvm_bc_library(lua_vm_ops lua_vm_ops.c)
add_llvm_bc_library(lapi lua/lapi.c)
add_llvm_bc_library(test_adapter test_adapter.cpp)
