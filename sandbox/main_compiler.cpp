#include <cassert>
#include <iostream>

#include "is_language_runtime.h"
#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/languages/ivnscript/is_language.h"
#include "scripts/test_script.h"

int main()
{
    auto core = std::make_shared<as::Core>("../../sandbox");

    core->registerLanguage("is", std::make_shared<as::IvnScriptLanguage>());
    core->registerRuntime(std::make_shared<as::IvnScriptLanguageRuntime>("CompileDemo"));

    const auto module = core->newScriptModule<TestScript>("scripts/test_1.is");
    const auto instance(module->newInstance());
    assert(instance->foo(10, 20) == 30);
    assert(instance->bar(10) == 100);

    const auto module2 = core->newScriptModule<TestScript>("scripts/test_script.cpp");
    const auto instance2(module2->newInstance());
    assert(instance2->foo(10, 20) == 31);
    assert(instance2->bar(10) == 101);

    const auto module3 = core->newScriptModule<TestScript>("scripts/test_2.is");
    const auto instance3(module3->newInstance());
    assert(instance3->foo(10, 20) == 31);
    assert(instance3->bar(10) == 1000);

    return 0;
}
