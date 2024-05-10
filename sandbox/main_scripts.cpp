#include <iostream>

#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/core/cpp_interface_parser.h"

#include "as/languages/lua/lua_language.h"
#include "as/languages/squirrel/sq_language.h"

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
  auto squirrel_language = std::make_shared<as::SquirrelLanguage>();

  script_core->registerLanguage("lua", std::move(lua_language));
  script_core->registerLanguage("sq", std::move(squirrel_language));

  std::shared_ptr<as::ScriptModule> script_modules[4];
  script_modules[0] = script_core->newScriptModule("lua", "../../sandbox/scripts/test_1.lua");
  script_modules[1] = script_core->newScriptModule("lua", "../../sandbox/scripts/test_2.lua");
  script_modules[2] = script_core->newScriptModule("sq", "../../sandbox/scripts/test_1.nut");
  script_modules[3] = script_core->newScriptModule("sq", "../../sandbox/scripts/test_2.nut");

  TestScript* instances[4];

  for (int i = 0; i < 4; ++i)
  {
    instances[i] = script_modules[i]->newInstance<TestScript>(std::format("instance_{}", i));
  }

  for (int t = 0; t < 5; ++t)
  {
    for (int i = 0; i < 4; ++i)
    {
      std::cout << "Instance " << i << ":" << std::endl;
      std::cout << instances[i]->foo(10, 20) << std::endl; // a + b
      std::cout << instances[i]->bar(10) << std::endl; // a * 100
    }
  }

  script_core = nullptr;

  return 0;
}
