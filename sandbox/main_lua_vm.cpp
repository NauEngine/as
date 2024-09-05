#include <iostream>

#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/core/cpp_interface_parser.h"

#include "as/languages/lua/lua_language.h"
#include "as/languages/lua/lua_language_runtime.h"

#include "scripts/test_vm.h"
#include "scripts/logger.h"


struct LoggerImpl : Logger
{
    void warn(int a, int b) override
    {
        std::cout << "Hello from logger extension!" << std::endl;
        std::cout << "W: a: " << a << " b: "  << b << std::endl;
    }

    void debug(int a, int b) override
    {
        std::cout << "D: a: " << a << " b: "  << b << std::endl;
    }
};

int main()
{
    auto script_core = std::make_shared<as::Core>("../../sandbox");

    script_core->registerLanguage("lua", std::make_shared<as::LuaLanguage>());
    script_core->registerRuntime(std::make_shared<as::LuaLanguageRuntime>());

    LoggerImpl logger;
    script_core->registerInstance("logger", &logger);

    auto script_module = script_core->newScriptModule<TestScript>("scripts/test_vm.lua");
    const auto instance = script_module->newInstance();

    std::cout << instance->foo(10, 20) << std::endl;
    std::cout << instance->bar(200) << std::endl;

    delete instance;
    script_module = nullptr;
    script_core = nullptr;

    return 0;
}
