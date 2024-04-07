//
// Created by Alex Zelenshikov on 21.03.2024.
//

#include <iostream>
#include "lua_script_module.h"
#include "llvm_compiler.h"

extern "C"
{
#include "lua/lobject.h"
#include "lua/lauxlib.h"
#include "lua/lstate.h"
}

#define toproto(L,i) (clvalue(L->top+(i))->l.p)

namespace as
{
  LuaScriptModule::LuaScriptModule(llvm::orc::ThreadSafeContext& context, lua_State* state, LLVMCompiler& compiler, BaseLuaModule& base_lua_module) :
    ts_context(context),
    lua_state(state),
    compiler(compiler),
    base_lua_module(base_lua_module)
  {

  }

  void LuaScriptModule::setInterface(const std::vector<std::string>& func_names)
  {

  }

  void LuaScriptModule::load(const std::string& src)
  {
    filename = src;

    luaL_loadfile(lua_state, filename.c_str());
    Proto* proto = toproto(lua_state, -1);
    module = compiler.Compile(*ts_context.getContext(), base_lua_module, lua_state, proto);

    // TODO [AZ]
    //auto func_addr = ExitOnErr(jit->lookup(func_name));
    //p->jit_func = func_addr.toPtr<lua_CFunction>();
  }

  llvm::Expected<std::string> LuaScriptModule::getEntryPointAlias()
  {
    return compiler.getFunctionName(filename, "");
  }

  llvm::Expected<std::string> LuaScriptModule::getFunctionAlias(const std::string& func_name)
  {
    return compiler.getFunctionName(filename, func_name);
  }

  std::unique_ptr<llvm::Module> LuaScriptModule::acquireModule()
  {
    return std::move(module);
  }

  void LuaScriptModule::RunScript()
  {
    lua_call(lua_state, 0, LUA_MULTRET);
  }

  void LuaScriptModule::RunFunction()
  {
    lua_getglobal(lua_state, "update");
    lua_call(lua_state, 0, 0);
  }
}
