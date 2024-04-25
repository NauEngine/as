//
// Created by Alex Zelenshikov on 06.02.2024.
//

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/ExecutionEngine/Orc/Shared/ExecutorAddress.h"

#include <iostream>
#include "lua_language_processor.h"
#include "lua_script_module.h"

#include "as/core/cpp_interface_parser.h"

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
  }

  void LuaLanguageProcessor::init(llvm::orc::ThreadSafeContext context, std::shared_ptr<CPPParser> parser)
  {
    cpp_parser = parser;
    ts_context = context;
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

  llvm::Expected<llvm::orc::ExecutorAddr> LuaLanguageProcessor::new_instance(const char* type_name, const char* source_code)
  {
    auto cpp_interface = cpp_parser->get_interface(type_name, source_code);
  }

  std::unique_ptr<llvm::Module> LuaLanguageProcessor::build_cpp_interface_module(std::shared_ptr<CPPInterface> interface)
  {
    return nullptr;
  }

  std::unique_ptr<llvm::Module> LuaLanguageProcessor::build_cpp_interface_instance_module(const std::string& instance_name)
  {
    return nullptr;
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