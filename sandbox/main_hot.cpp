//
// Created by ivn on 11.06.2024.
//

#include <csignal>
#include <iostream>

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

    signal(SIGINT, signalHandler);
    signal(SIGTERM, signalHandler);

    auto module1 = script_core->newScriptModule<TestScript>("scripts/test_1.is");
    file_watcher->watch("scripts/test_1.is");

    auto instance1 = module1->newInstance();
    auto instance2 = module1->newInstance();

    std::cout << "Hit CTRL+C to exit..." << std::endl;

    std::time_t nextTimeTick = 0;
    std::time_t nextTimeCalculate = 0;
    while (!ctrl_c_event)
    {
        auto now = std::time(nullptr);
        if (now > nextTimeTick)
        {
            file_watcher->tick();
            file_watcher->collect(script_core.get(), &as::Core::reload);
            nextTimeTick = now + 1;
        }

        if (now > nextTimeCalculate)
        {
            std::cout << "instance1->foo(10, 20) = " << instance1->foo(10, 20) << ", ";
            std::cout << "instance2->foo(10, 20) = " << instance2->foo(10, 20) << std::endl;
            nextTimeCalculate = now + 1;
        }
    }

    return 0;
}