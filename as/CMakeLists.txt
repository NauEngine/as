
add_library(AScript STATIC
        core/Core.cpp
        core/Core.h
        core/LanguageProcessor.h
)

target_include_directories(AScript PUBLIC "${CMAKE_SOURCE_DIR}")

add_subdirectory(languages/lua)
