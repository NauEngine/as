include(FetchContent)

set(LLVM_ROOT_DIR $ENV{LLVM_ROOT_DIR})
if (NOT LLVM_ROOT_DIR)
    if (APPLE)
        if (CMAKE_HOST_SYSTEM_PROCESSOR STREQUAL "arm64")
            set(LLVM_URL https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/clang+llvm-17.0.6-arm64-apple-darwin22.0.tar.xz)
        endif ()
    elseif (WIN32)
    else ()
    endif ()
endif ()

if (LLVM_URL)
    message(STATUS "Fetching prebuild LLVM binaries...")
    FetchContent_Declare(LLVM
        URL ${LLVM_URL}
    )

    FetchContent_MakeAvailable(LLVM)
    set(LLVM_ROOT_DIR ${llvm_SOURCE_DIR})
endif ()

if (NOT LLVM_ROOT_DIR)
    message(WARNING "LLVM_ROOT_DIR variable not set and there is no prebuild binaries for current platform")
endif()

if (LLVM_ROOT_DIR AND NOT LLVM_DIR)
    set(LLVM_DIR ${LLVM_ROOT_DIR}/lib/cmake/llvm)
endif ()
find_package(LLVM REQUIRED CONFIG)
message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

if (LLVM_ROOT_DIR AND NOT Clang_DIR)
    set(Clang_DIR ${LLVM_ROOT_DIR}/lib/cmake/clang)
endif ()
find_package(Clang REQUIRED CONFIG)
message(STATUS "Using ClangConfig.cmake in: ${Clang_DIR}")

list(APPEND CMAKE_MODULE_PATH "${CLANG_CMAKE_DIR}")

include(AddClang)

include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${CLANG_INCLUDE_DIRS})
separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})

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
