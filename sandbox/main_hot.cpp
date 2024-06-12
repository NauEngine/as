//
// Created by ivn on 11.06.2024.
//

#include <csignal>
#include <iostream>

#include "cpp_language.h"
#include "is_language.h"
#include "is_language_runtime.h"
#include "lua_language.h"
#include "sq_language.h"
#include "as/core/core.h"
#include "as/core/file_watcher.h"
#include "scripts/test_script.h"

DEFINE_SCRIPT_INTERFACE(Logger,
struct Logger
{
    virtual void warn(int a, int b) = 0;
    virtual int debug(int a, int b) = 0;
};
)

struct LoggerImpl : Logger
{
    void warn(int a, int b) override
    {
        std::cout << "W: a: " << a << "b: "  << b << std::endl;
    }

    int debug(int a, int b) override
    {
        std::cout << "D: a: " << a << "b: "  << b << std::endl;
        return 10;
    }
};

bool ctrl_c_event = false;

void signalHandler(int sig)
{
    ctrl_c_event = true;
}

int main()
{
    auto script_core = std::make_shared<as::Core>("../../sandbox");
    auto file_watcher = std::make_shared<as::FileWatcher>("../../sandbox");

    script_core->registerLanguage("is", std::make_shared<as::IvnScriptLanguage>());
    script_core->registerRuntime(std::make_shared<as::IvnScriptLanguageRuntime>(""));

    script_core->registerLanguage("cpp", std::make_shared<as::CppLanguage>());

    script_core->registerLanguage("nut", std::make_shared<as::SquirrelLanguage>());

    script_core->registerLanguage("lua", std::make_shared<as::LuaLanguage>());

    LoggerImpl logger;
    script_core->registerInstance<Logger>(&logger, "logger");


    signal(SIGINT, signalHandler);
    signal(SIGTERM, signalHandler);

    auto is_module = script_core->newScriptModule<TestScript>("scripts/test_1.is");
    auto cpp_module = script_core->newScriptModule<TestScript>("scripts/test_1.cpp");
    auto sq_module = script_core->newScriptModule<TestScript>("scripts/test_1.nut");
    auto lua_module = script_core->newScriptModule<TestScript>("scripts/test_1.lua");

    file_watcher->watch("scripts/test_1.is");
    file_watcher->watch("scripts/test_1.cpp");
    file_watcher->watch("scripts/test_1.nut");
    file_watcher->watch("scripts/test_1.lua");

    auto is_script = is_module->newInstance();
    auto cpp_script = cpp_module->newInstance();
    auto sq_script = sq_module->newInstance();
    auto lua_script = lua_module->newInstance();

    std::cout << "Hit CTRL+C to exit..." << std::endl;

    std::cout << "is->foo(10, 20) = " << is_script->foo(10, 20) << ", ";
    std::cout << "cpp->foo(10, 20) = " << cpp_script->foo(10, 20) << ", ";
    std::cout << "sq->foo(10, 20) = " << sq_script->foo(10, 20) << ", ";
    std::cout << "lua->foo(10, 20) = " << lua_script->foo(10, 20) << std::endl;

    while (!ctrl_c_event)
    {
        file_watcher->tick();
        if (file_watcher->collect(script_core.get(), &as::Core::reload))
        {
            std::cout << "is->foo(10, 20) = " << is_script->foo(10, 20) << ", ";
            std::cout << "cpp->foo(10, 20) = " << cpp_script->foo(10, 20) << ", ";
            std::cout << "sq->foo(10, 20) = " << sq_script->foo(10, 20) << ", ";
            std::cout << "lua->foo(10, 20) = " << lua_script->foo(10, 20) << std::endl;
        }
    }

    return 0;
}