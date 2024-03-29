#include <iostream>

#include "as/core/Core.h"
#include "as/languages/lua/LuaLanguageProcessor.h"
#include "as/languages/lua/LuaScriptModule.h"
#include "as/languages/lua/LLVMCompiler.h"

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
  as::Core script_core;

  auto lua_processor = std::make_unique<as::LuaLanguageProcessor>();

  script_core.RegisterLanguage("lua", std::move(lua_processor));
  auto script_module = script_core.RegisterScriptModule("../../sandbox/scripts/test.lua", "lua");

  script_module->RunScript();
  script_module->RunFunction();
  script_module->RunFunction();
  script_module->RunFunction();
  script_module->RunFunction();

  return 0;
}
