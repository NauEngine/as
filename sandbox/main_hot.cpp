//
// Created by ivn on 11.06.2024.
//

#include <csignal>
#include <iostream>

#include "cpp_language.h"
#include "is_language.h"
#include "is_language_runtime.h"
#include "as/core/core.h"
#include "as/core/file_watcher.h"
#include "scripts/test_script.h"

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

    signal(SIGINT, signalHandler);
    signal(SIGTERM, signalHandler);

    auto is_module = script_core->newScriptModule<TestScript>("scripts/test_1.is");
    auto cpp_module = script_core->newScriptModule<TestScript>("scripts/test_1.cpp");
    file_watcher->watch("scripts/test_1.is");
    file_watcher->watch("scripts/test_1.cpp");

    auto is_script = is_module->newInstance();
    auto cpp_script = cpp_module->newInstance();

    std::cout << "Hit CTRL+C to exit..." << std::endl;

    std::cout << "is_script->foo(10, 20) = " << is_script->foo(10, 20) << ", ";
    std::cout << "cpp_script->foo(10, 20) = " << cpp_script->foo(10, 20) << std::endl;

    while (!ctrl_c_event)
    {
        file_watcher->tick();
        if (file_watcher->collect(script_core.get(), &as::Core::reload))
        {
            std::cout << "is_script->foo(10, 20) = " << is_script->foo(10, 20) << ", ";
            std::cout << "cpp_script->foo(10, 20) = " << cpp_script->foo(10, 20) << std::endl;
        }
    }

    return 0;
}