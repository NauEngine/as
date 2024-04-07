
add_library(AScript STATIC
    core/core.cpp
    core/core.h
    core/script_module.h
    core/language_processor.h
    core/core_utils.cpp
    core/core_utils.h
        core/errors.h
)

target_include_directories(AScript PUBLIC "${CMAKE_SOURCE_DIR}")
target_link_libraries(AScript ${llvm_libs})

add_subdirectory(languages/lua)
