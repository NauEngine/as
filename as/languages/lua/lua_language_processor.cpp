//
// Created by Alex Zelenshikov on 06.02.2024.
//

#include "llvm/ExecutionEngine/Orc/LLJIT.h"

#include <iostream>
#include "lua_language_processor.h"
#include "lua_script_module.h"

extern "C"
{
#include "lua/lobject.h"
#include "lua/lua.h"
#include "lua/lauxlib.h"
#include "lua/lualib.h"
#include "lua/lstate.h"
}

namespace
{
  llvm::ExitOnError ExitOnErr;
}

namespace as
{
  LuaLanguageProcessor::LuaLanguageProcessor()
  {
    lua_state = luaL_newstate();
    luaL_openlibs(lua_state);

    compiler.SetDumpCompiled(true);

    ts_context = std::make_unique<llvm::LLVMContext>();
    ts_vm_module = base_lua_module.Load(ts_context);
  }

  LuaLanguageProcessor::~LuaLanguageProcessor()
  {
    if (lua_state)
    {
      lua_close(lua_state);
      lua_state = nullptr;
    }
  }

  std::shared_ptr<IScriptModule> LuaLanguageProcessor::newScriptModule()
  {
    auto script_module = std::make_shared<LuaScriptModule>(ts_context, lua_state, compiler, base_lua_module);
    script_modules.push_back(script_module);
    return script_module;
  }

  void LuaLanguageProcessor::insertModulesInto(llvm::orc::LLJIT* jit)
  {
    auto vm_module_tracker = jit->getMainJITDylib().createResourceTracker();
    ExitOnErr(jit->addIRModule(vm_module_tracker, std::move(ts_vm_module)));

    for (auto& script_module : script_modules)
    {
      auto rt = jit->getMainJITDylib().createResourceTracker();
      ExitOnErr(jit->addIRModule(rt, {std::move(script_module->acquireModule()), ts_context}));
      //trackers[file] = rt;
    }

    modules.clear();
  }

  llvm::Expected<std::string> LuaLanguageProcessor::getFunctionName(const std::string& filename, const std::string& name)
  {
    return compiler.getFunctionName(filename, name);
  }
} // as