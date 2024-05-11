cmake_minimum_required(VERSION 3.26)
project(as_proto)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

include(FindLLVM)
include(LLVMMacros)

set(LLVM_CC "clang" CACHE STRING "Command to compile C-code to LLVM bitcode (clang or llvm-gcc)")
set(LLVM_DIS "llvm-dis" CACHE STRING "Command to decompile LLVM bitcode into IR listing)")

add_subdirectory(as)
add_subdirectory(kscope)
add_subdirectory(engine)
add_subdirectory(game)
add_subdirectory(sandbox)
