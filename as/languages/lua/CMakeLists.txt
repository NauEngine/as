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
    bc/lua_vm_ops_bc.h
)

target_compile_definitions(LuaIntegration PUBLIC _XOPEN_SOURCE=600)
target_include_directories(LuaIntegration PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")

target_link_libraries(LuaIntegration AScript)

add_executable(bin2c tools/bin2c.c)

set(BC_CFLAGS ${BC_CFLAGS} -Wno-unused-parameter)
set(BC_CFLAGS ${BC_CFLAGS} -c -emit-llvm)

add_llvm_bc_library(lua_vm_ops lua_vm_ops.c)
message("CD: ${CMAKE_CURRENT_SOURCE_DIR}")
add_custom_command(OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/bc/lua_vm_ops_bc.h
    COMMAND bin2c -z -c ${CMAKE_CURRENT_BINARY_DIR}/lua_vm_ops.bc ${CMAKE_CURRENT_SOURCE_DIR}/bc/lua_vm_ops_bc.h
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    DEPENDS bin2c ${CMAKE_CURRENT_BINARY_DIR}/lua_vm_ops.bc
)