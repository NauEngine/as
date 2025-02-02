#include <iostream>

#include "is_language_runtime.h"
#include "lua_language_runtime.h"
#include "ts_language.h"
#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/core/cpp_interface_parser.h"
#include "as/languages/cpp/cpp_language.h"

#include "as/languages/lua/lua_language.h"
#include "as/languages/squirrel/sq_language.h"
#include "as/languages/ivnscript/is_language.h"
#include "script/module.h"

DEFINE_SCRIPT_INTERFACE(TestScript,
    virtual double foo(int a, double b) = 0;
    virtual int bar(int a) = 0;
)

DEFINE_SCRIPT_INTERFACE(Logger,
    virtual void warn(int a, int b) = 0;
    virtual int debug(int a, int b) = 0;
)

struct LoggerImpl : Logger
{
  void warn(int a, int b) override
  {
    std::cout << "W: a: " << a << " b: "  << b << std::endl;
  }

  int debug(int a, int b) override
  {
    std::cout << "D: a: " << a << " b: "  << b << std::endl;
    return 10;
  }
};

int main()
{
  auto script_core = std::make_shared<as::Core>();
  auto ivnscript_runtime = std::make_shared<as::IvnScriptLanguageRuntime>("Tests");
  auto lua_runtime = std::make_shared<as::LuaLanguageRuntime>();
  auto lua_language = std::make_shared<as::LuaLanguage>();
  auto squirrel_language = std::make_shared<as::SquirrelLanguage>();
  auto ivnscript_language = std::make_shared<as::IvnScriptLanguage>();
  auto typescript_language = std::make_shared<as::TypeScriptLanguage>();
  auto cpp_language = std::make_shared<as::CppLanguage>();

  script_core->registerLanguage("lua", std::move(lua_language));
  script_core->registerLanguage("nut", std::move(squirrel_language));
  script_core->registerLanguage("is", std::move(ivnscript_language));
  script_core->registerLanguage("ts", std::move(typescript_language));
  script_core->registerLanguage("cpp", std::move(cpp_language));
  script_core->registerRuntime(std::move(lua_runtime));
  script_core->registerRuntime(std::move(ivnscript_runtime));

  LoggerImpl logger;
  script_core->registerInstance("logger", &logger);

  auto test_1_lua = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_1.lua");
  auto test_2_lua = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_2.lua");

  auto test_1_nut = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_1.nut");
  auto test_2_nut = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_2.nut");

  auto test_1_is = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_1.is");
  auto test_2_is = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_2.is");

  // auto test_1_ts = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_1.ts");
  // auto test_2_ts = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_2.ts");

  auto test_1_cpp = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_1.cpp");
  auto test_2_cpp = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_2.cpp");

// *********************************************************************************************************************

  auto test_1_lua_instance1(test_1_lua->newInstance());
  auto test_2_lua_instance1(test_2_lua->newInstance());
  auto test_1_lua_instance2(test_1_lua->newInstance());
  auto test_2_lua_instance2(test_2_lua->newInstance());

  assert(test_1_lua_instance1->foo(10, 20) == 30);
  assert(test_1_lua_instance1->foo(10, 20) == 30);
  assert(test_2_lua_instance1->foo(10, 20) == 41);
  assert(test_2_lua_instance1->foo(10, 20) == 42);
  assert(test_2_lua_instance1->foo(10, 20) == 43);

  assert(test_1_lua_instance1->bar(10) == 1000);
  assert(test_1_lua_instance1->bar(20) == 2000);
  assert(test_2_lua_instance1->bar(10) == 2014);
  assert(test_2_lua_instance1->bar(10) == 2015);
  assert(test_2_lua_instance1->bar(10) == 2016);
  assert(test_2_lua_instance1->foo(10, 20) == 47);

  assert(test_1_lua_instance2->foo(10, 20) == 30);
  assert(test_1_lua_instance2->foo(10, 20) == 30);
  assert(test_2_lua_instance2->foo(10, 20) == 48);
  assert(test_2_lua_instance2->foo(10, 20) == 49);
  assert(test_2_lua_instance2->foo(10, 20) == 50);

  assert(test_1_lua_instance2->bar(10) == 1000);
  assert(test_1_lua_instance2->bar(20) == 2000);
  assert(test_2_lua_instance2->bar(10) == 2021);
  assert(test_2_lua_instance2->bar(10) == 2022);
  assert(test_2_lua_instance2->bar(10) == 2023);
  assert(test_2_lua_instance2->foo(10, 20) == 54);

// *********************************************************************************************************************

  auto test_1_nut_instance1(test_1_nut->newInstance());
  auto test_2_nut_instance1(test_2_nut->newInstance());
  auto test_1_nut_instance2(test_1_nut->newInstance());
  auto test_2_nut_instance2(test_2_nut->newInstance());

  assert(test_1_nut_instance1->foo(10, 20) == 100031);
  assert(test_1_nut_instance1->foo(10, 20) == 100032);
  assert(test_2_nut_instance1->foo(10, 20) == 200230);
  assert(test_2_nut_instance1->foo(10, 20) == 200330);
  assert(test_2_nut_instance1->foo(10, 20) == 200430);

  assert(test_1_nut_instance1->bar(10) == 1000000);
  assert(test_1_nut_instance1->bar(20) == 2000000);
  assert(test_2_nut_instance1->bar(10) == 2000000);
  assert(test_2_nut_instance1->bar(20) == 4000000);

  assert(test_1_nut_instance2->foo(10, 20) == 100033);
  assert(test_1_nut_instance2->foo(10, 20) == 100034);
  assert(test_2_nut_instance2->foo(10, 20) == 200530);
  assert(test_2_nut_instance2->foo(10, 20) == 200630);
  assert(test_2_nut_instance2->foo(10, 20) == 200730);

  assert(test_1_nut_instance2->bar(10) == 1000000);
  assert(test_1_nut_instance2->bar(20) == 2000000);
  assert(test_2_nut_instance2->bar(10) == 2000000);
  assert(test_2_nut_instance2->bar(20) == 4000000);

// *********************************************************************************************************************

  auto test_1_is_instance1(test_1_is->newInstance());
  auto test_2_is_instance1(test_2_is->newInstance());
  auto test_1_is_instance2(test_1_is->newInstance());
  auto test_2_is_instance2(test_2_is->newInstance());

  assert(test_1_is_instance1->foo(10, 20) == 30);
  assert(test_1_is_instance1->foo(10, 20) == 30);
  assert(test_2_is_instance1->foo(10, 20) == 31);
  assert(test_2_is_instance1->foo(10, 20) == 31);

  assert(test_1_is_instance1->bar(10) == 100);
  assert(test_1_is_instance1->bar(20) == 200);
  assert(test_2_is_instance1->bar(10) == 1000);
  assert(test_2_is_instance1->bar(20) == 2000);

  assert(test_1_is_instance2->foo(10, 20) == 30);
  assert(test_1_is_instance2->foo(10, 20) == 30);
  assert(test_2_is_instance2->foo(10, 20) == 31);
  assert(test_2_is_instance2->foo(10, 20) == 31);

  assert(test_1_is_instance2->bar(10) == 100);
  assert(test_1_is_instance2->bar(20) == 200);
  assert(test_2_is_instance2->bar(10) == 1000);
  assert(test_2_is_instance2->bar(20) == 2000);

// *********************************************************************************************************************

  auto test_1_cpp_instance1(test_1_cpp->newInstance());
  auto test_2_cpp_instance1(test_2_cpp->newInstance());
  auto test_1_cpp_instance2(test_1_cpp->newInstance());
  auto test_2_cpp_instance2(test_2_cpp->newInstance());

  assert(test_1_cpp_instance1->foo(10, 20) == 30);
  assert(test_1_cpp_instance1->foo(10, 20) == 30);
  assert(test_2_cpp_instance1->foo(10, 20) == 31);
  assert(test_2_cpp_instance1->foo(10, 20) == 31);

  assert(test_1_cpp_instance1->bar(10) == 100);
  assert(test_1_cpp_instance1->bar(20) == 200);
  assert(test_2_cpp_instance1->bar(10) == 1000);
  assert(test_2_cpp_instance1->bar(20) == 2000);

  assert(test_1_cpp_instance2->foo(10, 20) == 30);
  assert(test_1_cpp_instance2->foo(10, 20) == 30);
  assert(test_2_cpp_instance2->foo(10, 20) == 31);
  assert(test_2_cpp_instance2->foo(10, 20) == 31);

  assert(test_1_cpp_instance2->bar(10) == 100);
  assert(test_1_cpp_instance2->bar(20) == 200);
  assert(test_2_cpp_instance2->bar(10) == 1000);
  assert(test_2_cpp_instance2->bar(20) == 2000);

  return 0;
}
