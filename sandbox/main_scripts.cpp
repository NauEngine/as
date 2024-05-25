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

void printVTable(void* obj)
{
  // Получаем указатель на vtable
  void** vtable = *(void***)obj;

  std::cout << "VTable address: " << vtable << std::endl;

  // Итерация по методам в vtable
  for (int i = 0; vtable[i] != nullptr; ++i)
    {
    std::cout << "Method " << i << " address: " << vtable[i] << std::endl;
  }
}

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

  printVTable(&logger);

  script_core->registerInstance<Logger>(&logger, "logger");

  int NUM_SCRIPTS = 4;

  std::shared_ptr<as::ScriptModule<TestScript>> script_modules[NUM_SCRIPTS];

  script_modules[0] = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_1.lua", "lua");
  script_modules[1] = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_2.lua", "lua");
  script_modules[2] = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_1.nut", "sq");
  script_modules[3] = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_2.nut", "sq");
  // script_modules[4] = script_core->newScriptModule("../../sandbox/scripts/test_1.is");
  // script_modules[5] = script_core->newScriptModule("../../sandbox/scripts/test_2.is");

  TestScript* instances[NUM_SCRIPTS];

  for (int i = 0; i < NUM_SCRIPTS; ++i)
  {
    instances[i] = script_modules[i]->newInstance();
  }

  for (int t = 0; t < 5; ++t)
  {
    for (int i = 0; i < NUM_SCRIPTS; ++i)
    {
      std::cout << "Instance " << i << ":" << std::endl;
      std::cout << instances[i]->foo(10, 20) << std::endl;
      std::cout << instances[i]->bar(10) << std::endl;
    }
  }

  for (int i = 0; i < NUM_SCRIPTS; ++i)
  {
    script_modules[i] = nullptr;
  }

  script_core = nullptr;

  return 0;
}
