//
// Created by Alex Zelenshikov on 21.03.2024.
//

#ifndef AS_PROTO_LUA_SCRIPT_MODULE_H
#define AS_PROTO_LUA_SCRIPT_MODULE_H

#include "llvm/Support/Error.h"
#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"

#include "as/core/script_module.h"
#include "base_lua_module.h"

namespace llvm::orc
{
  class LLJIT;
}

struct lua_State;

namespace as
{
  class LLVMCompiler;

  class LuaScriptModule : public IScriptModule
  {
  public:
    LuaScriptModule(llvm::orc::ThreadSafeContext& context, lua_State* state, LLVMCompiler& compiler, BaseLuaModule& base_lua_module);

    // IScriptModule
    void setInterface(const std::vector<std::string>& funcs) override;
    void load(const std::string& filename) override;

    void runScript() override;
    void runFunction(const std::string& func) override;
    void runFunctionN1(const std::string& func, int n) override;

    // LuaScriptModule
    std::unique_ptr<llvm::Module> acquireModule();

  private:
    lua_State* lua_state = nullptr;
    std::string filename;
    llvm::orc::ThreadSafeContext& ts_context;
    LLVMCompiler& compiler;
    BaseLuaModule& base_lua_module;
    std::unique_ptr<llvm::Module> module;

    std::vector<std::string> interface;
    std::unordered_map<std::string, int> func_refs;
  };
}

#endif //AS_PROTO_LUA_SCRIPT_MODULE_H
