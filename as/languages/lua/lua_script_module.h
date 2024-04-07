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
    void setInterface(const std::vector<std::string>& func_names) override;
    void load(const std::string& filename) override;

    llvm::Expected<std::string> getEntryPointAlias() override;
    llvm::Expected<std::string> getFunctionAlias(const std::string& func_name) override;

    void RunScript() override;
    void RunFunction() override;

    // LuaScriptModule
    std::unique_ptr<llvm::Module> acquireModule();

  private:
    lua_State* lua_state = nullptr;
    std::string filename;
    llvm::orc::ThreadSafeContext& ts_context;
    LLVMCompiler& compiler;
    BaseLuaModule& base_lua_module;
    std::unique_ptr<llvm::Module> module;
  };
}

#endif //AS_PROTO_LUA_SCRIPT_MODULE_H
