#include <cassert>
#include <iostream>
#include <unordered_map>

// #include "as/core/core.h"
// #include "as/core/script_module.h"
// #include "as/core/cpp_interface_parser.h"

// #include "as/languages/lua/lua_language.h"
// #include "as/languages/squirrel/sq_language.h"
// #include "as/languages/ivnscript/is_language.h"

// #include "./scripts/test_script.h"

struct ScriptObject
{
    void* m_vtable;
    explicit ScriptObject(void* vtable): m_vtable(vtable) { }
};

struct TestScript
{
    virtual int foo(int a, int b) = 0;
    virtual int bar(int a) = 0;
};

std::unordered_map<std::string, void*> vtables;

extern "C" void registerInterface(const char* name, void* ptr)
{
    std::cout << "Register: " << name << std::endl;
    vtables[name] = ptr;
}

static newModule

int main()
{
    // auto s = new ScriptObject(&______sandbox_scripts_test_1_is_13297541326829458225);
    // auto t = static_cast<TestScript*>(static_cast<void*>(s));
    // assert(t->foo(10, 20) == 30);
    // assert(t->bar(10) == 100);

    // assert(______sandbox_scripts_test_1_is_13297541326829458225.bar(nullptr, 10) == 100);
    // ScriptObject* s = new ScriptObject(______sandbox_scripts_test_1_is_13297541326829458225);
    // TestScript* t = static_cast<TestScript*>(static_cast<void*>(s));
    // t->foo(10, 20);

  // auto script_core = std::make_shared<as::Core>();
  // auto lua_language = std::make_shared<as::LuaLanguage>();
  // auto squirrel_language = std::make_shared<as::SquirrelLanguage>();
  // auto ivnscript_language = std::make_shared<as::IvnScriptLanguage>();
  //
  // script_core->registerLanguage("lua", std::move(lua_language));
  // script_core->registerLanguage("nut", std::move(squirrel_language));
  // script_core->registerLanguage("is", std::move(ivnscript_language));

  // const auto test_1_lua = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_1.lua");
  // const auto test_1_nut = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_1.nut");
  // const auto test_1_is = script_core->newScriptModule<TestScript>("../../sandbox/scripts/test_1.is");

  // const auto test_1_lua_instance1(test_1_lua->newInstance());
  // const auto test_1_lua_instance2(test_1_lua->newInstance());
  //
  // assert(test_1_lua_instance1->foo(10, 20) == 30);
  // assert(test_1_lua_instance1->foo(10, 20) == 30);
  // assert(test_1_lua_instance1->bar(10) == 1000);
  // assert(test_1_lua_instance1->bar(20) == 2000);
  // assert(test_1_lua_instance2->foo(10, 20) == 30);
  // assert(test_1_lua_instance2->foo(10, 20) == 30);
  // assert(test_1_lua_instance2->bar(10) == 1000);
  // assert(test_1_lua_instance2->bar(20) == 2000);

//********************************************************************************************************************//

  // const auto test_1_nut_instance1(test_1_nut->newInstance());
  // const auto test_1_nut_instance2(test_1_nut->newInstance());
  //
  // assert(test_1_nut_instance1->foo(10, 20) == 100031);
  // assert(test_1_nut_instance1->foo(10, 20) == 100032);
  //
  // assert(test_1_nut_instance1->bar(10) == 1000000);
  // assert(test_1_nut_instance1->bar(20) == 2000000);
  //
  // assert(test_1_nut_instance2->foo(10, 20) == 100033);
  // assert(test_1_nut_instance2->foo(10, 20) == 100034);
  //
  // assert(test_1_nut_instance2->bar(10) == 1000000);
  // assert(test_1_nut_instance2->bar(20) == 2000000);

//********************************************************************************************************************//

  // const auto test_1_is_instance1(test_1_is->newInstance());
  // const auto test_1_is_instance2(test_1_is->newInstance());
  //
  // assert(test_1_is_instance1->foo(10, 20) == 20);
  // assert(test_1_is_instance1->foo(10, 20) == 20);
  //
  // assert(test_1_is_instance1->bar(10) == 100);
  // assert(test_1_is_instance1->bar(20) == 200);
  //
  // assert(test_1_is_instance2->foo(10, 20) == 20);
  // assert(test_1_is_instance2->foo(10, 20) == 20);
  //
  // assert(test_1_is_instance2->bar(10) == 100);
  // assert(test_1_is_instance2->bar(20) == 200);

  return 0;
}
