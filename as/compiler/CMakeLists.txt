add_executable(asc asc.cpp)
target_link_libraries(asc
    LuaIntegration
    SquirrelIntegration
    IvnScriptIntegration
)
