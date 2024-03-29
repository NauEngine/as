
add_library(AScript STATIC
    core/Core.cpp
    core/Core.h
    core/ScriptModule.h
    core/LanguageProcessor.h
)

target_include_directories(AScript PUBLIC "${CMAKE_SOURCE_DIR}")
target_link_libraries(AScript ${llvm_libs})

add_subdirectory(languages/lua)
