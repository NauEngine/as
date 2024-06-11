
add_library(AScript STATIC
    core/as.h
    core/core.cpp
    core/core.h
    core/ir.cpp
    core/ir.h
    core/llvm_optimizer.cpp
    core/llvm_optimizer.h
    core/script_module.h
    core/language.h
    core/language_script.h
    core/core_utils.cpp
    core/core_utils.h
    core/cpp_interface_parser.cpp
    core/cpp_interface_parser.h
    core/cpp_interface.h
    core/errors.h
    core/core_compile.cpp
    core/core_compile.h
    core/script_module_compile.cpp
    core/script_module_compile.h
    core/script_module_runtime.cpp
    core/script_module_runtime.h
    core/language_runtime.h
    core/script_interface.cpp
    core/script_interface.h
    core/file_watcher.cpp
    core/file_watcher.h
)

target_include_directories(AScript PUBLIC "${CMAKE_SOURCE_DIR}")
target_compile_options(AScript PUBLIC -fno-rtti)
target_link_libraries(AScript
        ${llvm_libs}
        clangBasic
        clangFrontend
        clangCodeGen
        clangAST
)

add_executable(bin2c tools/bin2c.c)

add_subdirectory(languages/lua)
add_subdirectory(languages/squirrel)
add_subdirectory(languages/ivnscript)
add_subdirectory(languages/typescript)
add_subdirectory(languages/cpp)
add_subdirectory(compiler)