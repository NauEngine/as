//
// Created by Alex Zelenshikov on 06.02.2024.
//

#include "llvm/ExecutionEngine/Orc/LLJIT.h"

#include <iostream>
#include "lua_language_processor.h"
#include "lua_script_module.h"
#include "llvm_compiler.h"

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

#define toproto(L,i) (clvalue(L->top+(i))->l.p)

namespace as
{
  LuaLanguageProcessor::LuaLanguageProcessor()
  {
    lua_state = luaL_newstate();
    luaL_openlibs(lua_state);

    compiler = std::make_unique<LLVMCompiler>();
    compiler->SetDumpCompiled(true);

    ts_context = std::make_unique<llvm::LLVMContext>();
    ts_vm_module = vm_module.Load(ts_context);
  }

  LuaLanguageProcessor::~LuaLanguageProcessor()
  {
    if (lua_state)
    {
      lua_close(lua_state);
      lua_state = nullptr;
    }
  }

  std::shared_ptr<IScriptModule> LuaLanguageProcessor::RegisterScriptModule(const std::string& filename)
  {
    luaL_loadfile(lua_state, filename.c_str());
    Proto* proto = toproto(lua_state, -1);
    auto module = compiler->Compile(*ts_context.getContext(), vm_module, lua_state, proto);
    modules[filename] = std::move(module);

    // TODO [AZ]
    //		auto func_addr = ExitOnErr(jit->lookup(func_name));
    //		//p->jit_func = func_addr.toPtr<lua_CFunction>();


    auto script_module = std::make_shared<LuaScriptModule>(lua_state);
    return script_module;
  }

  void LuaLanguageProcessor::InsertModulesInto(llvm::orc::LLJIT* jit)
  {
    vm_module_tracker = jit->getMainJITDylib().createResourceTracker();
    ExitOnErr(jit->addIRModule(vm_module_tracker, std::move(ts_vm_module)));

    for (auto& [file, module] : modules)
    {
      auto rt = jit->getMainJITDylib().createResourceTracker();
      ExitOnErr(jit->addIRModule(rt, {std::move(module), ts_context}));
      trackers[file] = rt;
    }

    modules.clear();
  }
} // as