
add_library(Engine STATIC
        Runtime.cpp
        Runtime.h
        Logger.cpp
        Logger.h
)

target_include_directories(Engine PUBLIC "${CMAKE_SOURCE_DIR}")
target_link_libraries(Engine AScript LuaIntegration)
