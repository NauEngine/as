#include <iostream>
#include <filesystem>

#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/core/cpp_interface_parser.h"

#include "as/languages/lua/lua_language.h"
#include "as/languages/squirrel/sq_language.h"

DEFINE_SCRIPT_INTERFACE(TestScript,
  virtual const char* a(bool a, const char* b, const char* c) = 0;
  virtual int32_t b(int64_t a) = 0;
  virtual float c(double a) = 0;
  virtual void d() = 0;
)

DEFINE_SCRIPT_INTERFACE(TestInterface,
  virtual void a(const char* a) = 0;
  virtual const char* b(float a) = 0;
)

struct TestInterfaceImpl : TestInterface
{
  void a(const char* a) override
  {
    std::cout << "TestInterface.a: " << a << std::endl;
  }

  const char* b(float a) override
  {
    std::cout << "TestInterface.b: " << a << std::endl;
    static std::string str;
    str = std::to_string(a);
    return str.c_str();
  }
};

void check_lua(const std::shared_ptr<as::Core>& script_core) {
  auto lua_language = std::make_shared<as::LuaLanguage>();
  script_core->registerLanguage("lua", std::move(lua_language));

  TestInterfaceImpl iface;
  script_core->registerInstance<TestInterface>(&iface, "iface");

  std::shared_ptr<as::ScriptModule<TestScript>> script_module;
  script_module = script_core->newScriptModule<TestScript>("./sandbox/scripts/test_v.lua", "lua");

  TestScript* instance;
  instance = script_module->newInstance();
  
  std::cout << "a: " << instance->a(true, "true", "false") << std::endl;
  std::cout << "b: " << instance->b(10) << std::endl;
  std::cout << "b: " << instance->b(-10000000000) << std::endl;
  std::cout << "b: " << instance->b(9223372036854775807) << std::endl;
  std::cout << "c: " << instance->c(10.0) << std::endl;
  std::cout << "c: " << instance->c(-123456789.123456789) << std::endl;
  std::cout << "c: " << instance->c(3.4028235e40) << std::endl;

  instance->d();

  instance = nullptr;
  script_module = nullptr;
  lua_language = nullptr;
}

void check_squirrel(const std::shared_ptr<as::Core>& script_core) {
    auto squirrel_language = std::make_shared<as::SquirrelLanguage>();
    script_core->registerLanguage("sq", std::move(squirrel_language));

    std::shared_ptr<as::ScriptModule<TestScript>> script_module;
    script_module = script_core->newScriptModule<TestScript>("./sandbox/scripts/test_v.nut", "sq");

    squirrel_language = nullptr;
}

int main() {
  std::cout << "PWD: " << std::filesystem::current_path() << std::endl << std::endl;
  
  auto script_core = std::make_shared<as::Core>();
  
  check_lua(script_core);
  //check_squirrel(script_core);
  
  script_core = nullptr;

  std::cout << "Over and out!" << std::endl;

  return 0;
}