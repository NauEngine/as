set(TYPESCRIPT_IGNORE_UNIT_TESTS ON)

add_library(TypeScriptIntegration STATIC
    ts_language.cpp
    ts_language.h
    ts_language_script.cpp
    ts_language_script.h
)

target_include_directories(TypeScriptIntegration PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
target_include_directories(TypeScriptIntegration PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/tsc/include)
target_include_directories(TypeScriptIntegration PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/tsc/include)


target_link_libraries(TypeScriptIntegration AScript)
target_link_libraries(TypeScriptIntegration tsc_lib)
add_subdirectory(tsc)
