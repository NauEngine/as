//
// Created by Alex Zelenshikov on 26.01.2024.
//
#include <string>
#include "engine/Runtime.h"
#include "as/core/Core.h"
#include "as/languages/lua/LuaLanguageProcessor.h"

//extern "C"
//{
//  double average(double, double);
//}

void InitLanguages(engine::Runtime& runtime)
{
  auto script_core = runtime.GetScriptCore();
  auto lua_processor = std::make_unique<as::LuaLanguageProcessor>();

  script_core->RegisterLanguage("lua", std::move(lua_processor));

  script_core->RegisterScriptFile("../game/scripts/lua/main.lua", "lua");
}

int main()
{
  engine::Runtime runtime;

  InitLanguages(runtime);

  runtime.Init();
  runtime.Run();

  return 0;
}