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

  void LuaScriptModule::setInterface(const std::vector<std::string>& funcs)
  {
    interface = funcs;
  }

  void LuaScriptModule::load(const std::string& src)
  {
    filename = src;

    luaL_loadfile(lua_state, filename.c_str());
    Proto* proto = toproto(lua_state, -1);
    module = compiler.Compile(*ts_context.getContext(), base_lua_module, lua_state, proto);

    func_refs[""] = luaL_ref(lua_state, LUA_REGISTRYINDEX);
    runScript();

    for (const auto& signature : interface)
    {
      lua_getglobal(lua_state, signature.c_str());

      auto t = lua_type(lua_state, -1);
      t;

      if (lua_type(lua_state, -1) == LUA_TFUNCTION)
      {
        func_refs[signature] = luaL_ref(lua_state, LUA_REGISTRYINDEX);
      }
      else
      {
        func_refs[signature] = LUA_NOREF;
      }
    }

    // TODO [AZ]
    //auto func_addr = ExitOnErr(jit->lookup(func_name));
    //p->jit_func = func_addr.toPtr<lua_CFunction>();
  }

  std::unique_ptr<llvm::Module> LuaScriptModule::acquireModule()
  {
    return std::move(module);
  }

  void LuaScriptModule::runScript()
  {
    lua_rawgeti(lua_state, LUA_REGISTRYINDEX, func_refs[""]);
    lua_call(lua_state, 0, LUA_MULTRET);
  }

  void LuaScriptModule::runFunction(const std::string& func)
  {
    if (func_refs[func] != LUA_NOREF)
    {
      lua_rawgeti(lua_state, LUA_REGISTRYINDEX, func_refs[func]);
      lua_call(lua_state, 0, LUA_MULTRET);
    }
  }

  void LuaScriptModule::runFunctionN1(const std::string& func, int n)
  {
    if (func_refs[func] != LUA_NOREF)
    {
      lua_rawgeti(lua_state, LUA_REGISTRYINDEX, func_refs[func]);
      lua_pushinteger(lua_state, n);
      lua_call(lua_state, 1, LUA_MULTRET);
    }
  }
}
