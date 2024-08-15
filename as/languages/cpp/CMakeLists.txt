add_library(CppScriptIntegration STATIC
        cpp_language.h
        cpp_language.cpp
        cpp_language_script.h
        cpp_language_script.cpp
)

target_include_directories(CppScriptIntegration PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")

target_link_libraries(CppScriptIntegration AScript)
