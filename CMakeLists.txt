cmake_minimum_required(VERSION 3.26)
project(as_proto)

set(CMAKE_CXX_STANDARD 20)

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

include_directories(${LLVM_INCLUDE_DIRS})
separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})

add_executable(REPL main.cpp
        bindings.cpp
        as/kaleidoscope/ast.cpp
        as/kaleidoscope/ast.h
        as/kaleidoscope/interpreter.cpp
        as/kaleidoscope/interpreter.h
        as/kaleidoscope/errors.h
        as/kaleidoscope/errors.cpp
        as/kaleidoscope/parser_loop.cpp
        as/kaleidoscope/parser_loop.h
        as/compiler/compiler.cpp
        as/compiler/compiler.h
        as/compiler/jit.cpp
)

add_library(AScript STATIC
        as/core/Core.cpp
        as/core/Core.h
        as/core/LanguageProcessor.h
        as/languages/lua/LuaLanguageProcessor.cpp
        as/languages/lua/LuaLanguageProcessor.h
)
target_include_directories(AScript PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")

add_library(Engine STATIC
        engine/Runtime.cpp
        engine/Runtime.h
        engine/Logger.cpp
        engine/Logger.h
)
target_include_directories(Engine PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
target_link_libraries(Engine AScript)

add_executable(Game
        game/main.cpp
)

target_include_directories(Game PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
target_link_libraries(Game Engine)

llvm_map_components_to_libnames(llvm_libs
    passes
    support
    core
    executionengine
    mcjit
    orcjit
)

foreach(target ${LLVM_TARGETS_TO_BUILD})
    if (NOT "${target}" MATCHES "^(NVPTX|XCore)")
        list(APPEND llvm_libs "LLVM${target}AsmParser")
    endif()
    list(APPEND llvm_libs "LLVM${target}CodeGen")
endforeach()

# Link against LLVM libraries
target_link_libraries(REPL ${llvm_libs})
