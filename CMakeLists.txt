cmake_minimum_required(VERSION 3.26)
project(as_proto)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

include(FindLLVM)

add_subdirectory(as)
add_subdirectory(kscope)
add_subdirectory(engine)
add_subdirectory(game)
add_subdirectory(sandbox)
