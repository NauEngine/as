find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

include_directories(${LLVM_INCLUDE_DIRS})
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
