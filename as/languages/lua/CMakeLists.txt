add_library(LuaIntegration STATIC
    LuaLanguageProcessor.cpp
    LuaLanguageProcessor.h
    LuaCore.cpp
        LuaCore.h
)

target_compile_definitions(LuaIntegration PUBLIC _XOPEN_SOURCE=600)
target_include_directories(LuaIntegration PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")

target_link_libraries(LuaIntegration AScript)
