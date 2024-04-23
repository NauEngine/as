macro(add_llvm_bc_library _target)
    set(_llvm_cflags)
    get_property(_idirs DIRECTORY PROPERTY INCLUDE_DIRECTORIES)
    foreach(_idir ${_idirs})
        set(_llvm_cflags ${_llvm_cflags} -I${_idir})
    endforeach(_idir)

    #TODO make crossplatform temporary solution for macos only
    set(_llvm_cflags ${_llvm_cflags} -isysroot ${CMAKE_OSX_SYSROOT})

#    message("LLVM CFLAGS: ${_llvm_cflags}")
#    message("CMAKE_OSX_SYSROOT: ${CMAKE_OSX_SYSROOT}")

    if(${ARGC} GREATER 2)
        message("BC 1")
        set(_bc_files)
        foreach(_file ${ARGN})
            set(_bc_file "${CMAKE_CURRENT_BINARY_DIR}/${_file}.bc")
            set(_bc_files ${_bc_files} ${_bc_file})
            add_custom_command(OUTPUT ${_bc_file}
                    COMMAND ${LLVM_CC} ARGS ${BC_CFLAGS} ${_llvm_cflags} -o ${_bc_file} ${_file}
                    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                    DEPENDS ${_file}
            )
        endforeach(_file)
        add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${_target}.bc
                COMMAND ${LLVM_LD} ARGS -o ${CMAKE_CURRENT_BINARY_DIR}/${_target}.bc ${_bc_files}
                WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                DEPENDS ${_bc_files}
        )
    else(${ARGC} GREATER 2)
        message("BC 2 ${LLVM_CC}")
        add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${_target}.bc
                COMMAND ${LLVM_CC} ARGS ${BC_CFLAGS} ${_llvm_cflags} -o ${CMAKE_CURRENT_BINARY_DIR}/${_target}.bc ${ARGV1}
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                DEPENDS ${ARGV1}
        )
    endif(${ARGC} GREATER 2)
endmacro(add_llvm_bc_library)