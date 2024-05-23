#include <cassert>
#include <iostream>
#include <unordered_map>

#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/core/cpp_interface.h"

DEFINE_SCRIPT_INTERFACE(TestScript,
struct TestScript
{
    virtual int foo(int a, int b) = 0;
    virtual int bar(int a) = 0;
};
)

int main()
{
    auto core = std::make_shared<as::Core>();
    const auto module = core->newScriptModule<TestScript>("scripts/test_script.is");
    const auto instance(module->newInstance());
    assert(instance->foo(10, 20) == 30);

    return 0;
}
