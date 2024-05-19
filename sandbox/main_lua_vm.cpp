#include <iostream>

#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/core/cpp_interface_parser.h"

#include "as/languages/lua/lua_language.h"

extern "C"
{
#include "as/languages/lua/lua/lapi.h"
#include "as/languages/lua/lua/lstate.h"
#include "as/languages/lua/lua/lauxlib.h"
}


DEFINE_SCRIPT_INTERFACE(TestScript,
struct TestScript
{
    virtual int foo(int a, int b) = 0;
};
)

int pure_lua_test()
{
    lua_State *l = luaL_newstate();

    std::cout << "S1: " << lua_gettop(l) << std::endl;
    luaL_dofile(l, "../../sandbox/scripts/test_vm.lua");
    std::cout << "S2: " << lua_gettop(l) << std::endl;
    lua_getglobal(l, "foo");
    std::cout << "S3: " << lua_gettop(l) << std::endl;
    lua_pushinteger(l, 10);
    std::cout << "S4: " << lua_gettop(l) << std::endl;
    lua_pushinteger(l, 20);
    std::cout << "S5: " << lua_gettop(l) << std::endl;
    lua_call(l, 2, 1);
    std::cout << "S6: " << lua_gettop(l) << std::endl;
    std::cout << "Result: " << lua_tointeger(l, -1) << std::endl;
    std::cout << "S7: " << lua_gettop(l) << std::endl;

    lua_close(l);
}

int main()
{
    auto script_core = std::make_shared<as::Core>();
    auto lua_language = std::make_shared<as::LuaLanguage>();

    script_core->registerLanguage("lua", std::move(lua_language));

    auto script_modules = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_vm.lua", "lua");
    auto instances = script_modules->newInstance();
    std::cout << instances->foo(10, 20) << std::endl;

    script_core = nullptr;

//    pure_lua_test();

    return 0;
}
