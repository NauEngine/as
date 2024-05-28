add_library(TypeScriptIntegration STATIC
    ts_language.cpp
    ts_language.h
        ts_language_script.cpp
        ts_language_script.h
)

target_include_directories(TypeScriptIntegration PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")

target_link_libraries(TypeScriptIntegration AScript)
add_subdirectory(tsc)
