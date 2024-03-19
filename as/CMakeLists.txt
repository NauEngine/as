
add_library(AScript STATIC
        core/Core.cpp
        core/Core.h
        core/LanguageProcessor.h
        languages/lua/LuaLanguageProcessor.cpp
        languages/lua/LuaLanguageProcessor.h
)

target_include_directories(AScript PUBLIC "${CMAKE_SOURCE_DIR}")
