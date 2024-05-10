macro(add_llvm_bc_library target source)
    set(includes)

    get_property(dirs DIRECTORY PROPERTY INCLUDE_DIRECTORIES)

    foreach(dir ${dirs})
        set(includes ${includes} -I${dir})
    endforeach(dir)

    #TODO make crossplatform temporary solution for macos only
    set(BC_FLAGS ${BC_FLAGS} -isysroot ${CMAKE_OSX_SYSROOT})

    set(BC_FLAGS ${BC_FLAGS} -Wno-unused-parameter)
    set(BC_FLAGS ${BC_FLAGS} -emit-llvm)

    set(bc_target ${CMAKE_CURRENT_BINARY_DIR}/${target}.bc)
    set(bc_target_header ${CMAKE_CURRENT_SOURCE_DIR}/bc/${target}_bc.h)
    set(bc_target_ir ${CMAKE_CURRENT_SOURCE_DIR}/bc/${target}.ll)

    message("Custom flags: ${BC_FLAGS}")

    add_custom_command(OUTPUT ${bc_target}
        COMMAND ${LLVM_CC} ${BC_FLAGS} ${includes} -o ${bc_target} ${source}
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        DEPENDS ${source}
    )

    add_custom_command(OUTPUT ${bc_target_header}
        COMMAND bin2c -z -c ${bc_target} ${bc_target_header}
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        DEPENDS bin2c ${bc_target}
    )

    add_custom_command(OUTPUT ${bc_target_ir}
            COMMAND ${LLVM_DIS} ${bc_target} -o ${bc_target_ir}
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
            DEPENDS ${bc_target}
    )

endmacro(add_llvm_bc_library)