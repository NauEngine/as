#include <iostream>
#include <memory>

#include "cpp_language.h"
#include "as/core/core.h"

DEFINE_SCRIPT_INTERFACE(TestScript,
struct TestScript
{
    virtual double foo(int a, double b) = 0;
    virtual int bar(int a) = 0;
};
)

int main() {
    auto script_core = std::make_shared<as::Core>();
    auto cpp_language = std::make_shared<as::CppLanguage>();
    script_core->registerLanguage("cpp", std::move(cpp_language));

    auto test_1_lua = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_1.cpp");
    auto test_1_lua_instance1(test_1_lua->newInstance());

    assert(test_1_lua_instance1->foo(10, 20) == 30);
    assert(test_1_lua_instance1->bar(10) == 100);

    return 0;
}
