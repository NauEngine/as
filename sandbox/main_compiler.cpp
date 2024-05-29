#include <cassert>
#include <iostream>

#include "is_language_runtime.h"
#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/core/cpp_interface.h"
#include "as/languages/ivnscript/is_language.h"

DEFINE_SCRIPT_INTERFACE(TestScript,
struct TestScript
{
    virtual int foo(int a, int b) = 0;
    virtual int bar(int a) = 0;
};
)

int main()
{
    auto core = std::make_shared<as::Core>("../../sandbox");

    core->registerLanguage("is", std::make_shared<as::IvnScriptLanguage>());
    core->registerRuntime(std::make_shared<as::IvnScriptLanguageRuntime>("CompileDemo"));

    const auto module = core->newScriptModule<TestScript>("scripts/test_script.is");
    const auto instance(module->newInstance());
    assert(instance->foo(10, 20) == 30);
    assert(instance->bar(10) == 100);

    const auto module2 = core->newScriptModule<TestScript>("scripts/test_2.is");
    const auto instance2(module2->newInstance());
    assert(instance2->foo(10, 20) == 31);
    assert(instance2->bar(10) == 1000);

    return 0;
}
