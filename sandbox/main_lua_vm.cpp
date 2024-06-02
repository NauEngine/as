#include <iostream>

#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/core/cpp_interface_parser.h"

#include "as/languages/lua/lua_language.h"

#include "scripts/test_vm.h"

int main()
{
    auto script_core = std::make_shared<as::Core>("../../sandbox");
    auto lua_language = std::make_shared<as::LuaLanguage>();

    script_core->registerLanguage("lua", std::move(lua_language));

    auto script_module = script_core->newScriptModule<TestScript>("scripts/test_vm.lua");
    auto instances = script_module->newInstance();
    std::cout << instances->foo(10, 20) << std::endl;
    std::cout << instances->bar(200) << std::endl;

    delete instances;
    script_module = nullptr;
    script_core = nullptr;

    return 0;
}
