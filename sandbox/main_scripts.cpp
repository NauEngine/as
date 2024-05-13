#include <iostream>

#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/core/cpp_interface_parser.h"

#include "as/languages/lua/lua_language.h"
#include "as/languages/squirrel/sq_language.h"
#include "as/languages/ivnscript/is_language.h"

DEFINE_SCRIPT_INTERFACE(TestScript,
struct TestScript
{
  virtual double foo(int a, double b) = 0;
  virtual int bar(int a) = 0;
};
)

DEFINE_SCRIPT_INTERFACE(Logger,
struct Logger
{
  virtual void warn(const char* msg) = 0;
  virtual void debug(const char* msg) = 0;
};
)

struct LoggerImpl : Logger
{
  void warn(const char* msg) override
  {
    std::cout << "W: " << msg << std::endl;
  }

  void debug(const char* msg) override
  {
    std::cout << "D: " << msg << std::endl;
  }
};

int main()
{
  auto script_core = std::make_shared<as::Core>();
  auto lua_language = std::make_shared<as::LuaLanguage>();
  auto squirrel_language = std::make_shared<as::SquirrelLanguage>();
  auto ivnscript_language = std::make_shared<as::IvnScriptLanguage>();

  script_core->registerLanguage("lua", std::move(lua_language));
  script_core->registerLanguage("sq", std::move(squirrel_language));
  script_core->registerLanguage("is", std::move(ivnscript_language));

  LoggerImpl logger;

  script_core->registerInstance<Logger>(&logger, "logger");

  std::shared_ptr<as::ScriptModule> script_modules[6];

  script_modules[0] = script_core->newScriptModule("lua", "../../sandbox/scripts/test_1.lua");
  script_modules[1] = script_core->newScriptModule("lua", "../../sandbox/scripts/test_2.lua");
  script_modules[2] = script_core->newScriptModule("sq", "../../sandbox/scripts/test_1.nut");
  script_modules[3] = script_core->newScriptModule("sq", "../../sandbox/scripts/test_2.nut");
  script_modules[4] = script_core->newScriptModule("is", "../../sandbox/scripts/test_1.is");
  script_modules[5] = script_core->newScriptModule("is", "../../sandbox/scripts/test_2.is");

  TestScript* instances[6];

  for (int i = 0; i < 6; ++i)
  {
    instances[i] = script_modules[i]->newInstance<TestScript>(std::format("instance_{}", i));
  }

  for (int t = 0; t < 5; ++t)
  {
    for (int i = 0; i < 6; ++i)
    {
      std::cout << "Instance " << i << ":" << std::endl;
      std::cout << instances[i]->foo(10, 20) << std::endl;
      std::cout << instances[i]->bar(10) << std::endl;
    }
  }

  for (int i = 0; i < 4; ++i)
  {
    script_modules[i] = nullptr;
  }

  script_core = nullptr;

  return 0;
}
