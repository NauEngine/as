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
)

target_compile_definitions(LuaIntegration PUBLIC _XOPEN_SOURCE=600)
target_include_directories(LuaIntegration PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")

target_link_libraries(LuaIntegration AScript)

set(BC_CFLAGS ${BC_CFLAGS} -Wno-unused-parameter)
set(BC_CFLAGS ${BC_CFLAGS} -c -emit-llvm)

add_llvm_bc_library(lua_vm_ops lua_vm_ops.c)
add_custom_command(OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/bc/lua_vm_ops_bc.h
    COMMAND bin2c -z -c ${CMAKE_CURRENT_BINARY_DIR}/lua_vm_ops.bc ${CMAKE_CURRENT_SOURCE_DIR}/bc/lua_vm_ops_bc.h
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    DEPENDS bin2c ${CMAKE_CURRENT_BINARY_DIR}/lua_vm_ops.bc
)

add_llvm_bc_library(lapi lua/lapi.c)
add_custom_command(OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/bc/lapi_bc.h
    COMMAND bin2c -z -c ${CMAKE_CURRENT_BINARY_DIR}/lapi.bc ${CMAKE_CURRENT_SOURCE_DIR}/bc/lapi_bc.h
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    DEPENDS bin2c ${CMAKE_CURRENT_BINARY_DIR}/lapi.bc
)

add_llvm_bc_library(test_adapter test_adapter.cpp)
add_custom_command(OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/bc/test_adapter_bc.h
        COMMAND bin2c -z -c ${CMAKE_CURRENT_BINARY_DIR}/test_adapter.bc ${CMAKE_CURRENT_SOURCE_DIR}/bc/test_adapter_bc.h
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        DEPENDS bin2c ${CMAKE_CURRENT_BINARY_DIR}/test_adapter.bc
)