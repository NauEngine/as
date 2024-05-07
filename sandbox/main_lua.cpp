#include <iostream>

#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/core/cpp_interface_parser.h"
#include "as/languages/lua/lua_language.h"

DEFINE_SCRIPT_INTERFACE(TestScript,
struct TestScript
{
  virtual double foo(int a, double b) = 0;
  virtual int bar(int a) = 0;
};
)

int main()
{
  auto script_core = std::make_shared<as::Core>();

  auto lua_language = std::make_shared<as::LuaLanguage>();

  script_core->registerLanguage("lua", std::move(lua_language));

  auto script_module_1 = script_core->newScriptModule("lua", "../../sandbox/scripts/test_1.lua");
  auto script_module_2 = script_core->newScriptModule("lua", "../../sandbox/scripts/test_2.lua");

  auto instance_1 = script_module_1->newInstance<TestScript>("instance_1");
  auto instance_2 = script_module_2->newInstance<TestScript>("instance_2");


  std::cout << "Instance 1:" << std::endl;
  std::cout << instance_1->foo(10, 20) << std::endl; // a + b
  std::cout << instance_1->bar(10) << std::endl; // a * 100
  std::cout << "Instance 2:" << std::endl;
  std::cout << instance_2->foo(10, 20) << std::endl; // a + b + 100
  std::cout << instance_2->bar(10) << std::endl; // a * 200

  script_core = nullptr;

  return 0;
}
