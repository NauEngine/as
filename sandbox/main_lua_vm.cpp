#include <iostream>

#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/core/cpp_interface_parser.h"

#include "as/languages/lua/lua_language.h"

DEFINE_SCRIPT_INTERFACE(TestScript,
struct TestScript
{
    virtual int foo(int a, int b) = 0;
};
)

int main()
{
    auto script_core = std::make_shared<as::Core>();
    auto lua_language = std::make_shared<as::LuaLanguage>();

    script_core->registerLanguage("lua", std::move(lua_language));

    auto script_modules = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_vm.lua", "lua");
    auto instances = script_modules->newInstance();
    std::cout << instances->foo(10, 20) << std::endl;

    script_core = nullptr;

    return 0;
}
