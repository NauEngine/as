add_library(LuaIntegration STATIC
    lua_call.cpp
    lua_ir.cpp
    lua_ir.h
    lua_language.cpp
    lua_language.h
    lua_language_script.cpp
    lua_language_script.h
    lua_language_runtime.cpp
    lua_language_runtime.h
    lua_core.cpp
    lua_core.h
    lua_ftree.cpp
    lua_ftree.h
    lua_utils.cpp
    lua_bytecode_printer.cpp
    lua_loader.cpp
    lua_utils.h
    lua_llvm_compiler.cpp
    lua_llvm_compiler.h
    lua_vm_ops_static.c

    bc/lua_vm_ops_bc.h
    bc/lua_vm_ops.ll
    bc/lapi_bc.h
    bc/lapi.ll
    bc/lauxlib_bc.h
    bc/lauxlib.ll
    bc/test_adapter_bc.h
    bc/test_adapter.ll
)

target_compile_definitions(LuaIntegration PUBLIC _XOPEN_SOURCE=600)
target_include_directories(LuaIntegration PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")

target_link_libraries(LuaIntegration AScript)

set(BC_FLAGS -c)

add_llvm_bc_library(lua_vm_ops lua_vm_ops.c)
add_llvm_bc_library(lapi lua_to_ir.cpp)
add_llvm_bc_library(lauxlib lua/lauxlib.c)
add_llvm_bc_library(test_adapter test_adapter.cpp)
