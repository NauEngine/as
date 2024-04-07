#include <iostream>

#include "as/core/core.h"
#include "as/languages/lua/lua_language_processor.h"
#include "as/languages/lua/lua_script_module.h"
#include "as/languages/lua/llvm_compiler.h"

extern "C"
{
#include "lua/lobject.h"
#include "lua/lua.h"
#include "lua/lauxlib.h"
#include "lua/lualib.h"
#include "lua/lstate.h"
}

#define toproto(L,i) (clvalue(L->top+(i))->l.p)

int main()
{
  auto script_core = std::make_shared<as::Core>();

  auto lua_processor = std::make_unique<as::LuaLanguageProcessor>();

  script_core->registerLanguage("lua", std::move(lua_processor));
  auto script_module = script_core->registerScriptModule("../../sandbox/scripts/test.lua", "lua");

  script_core->loadModulesIntoJit();

  script_module->RunScript();
  script_module->RunFunction();
  script_module->RunFunction();
  script_module->RunFunction();
  script_module->RunFunction();

  script_core = nullptr;

  return 0;
}
