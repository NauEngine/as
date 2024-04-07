//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_LUA_LANGUAGE_PROCESSOR_H
#define AS_PROTO_LUA_LANGUAGE_PROCESSOR_H

#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"
#include "llvm/ExecutionEngine/Orc/Core.h"

#include "as/core/language_processor.h"
#include "base_lua_module.h"
#include "llvm_compiler.h"

struct lua_State;

namespace as
{
  class LLVMCompiler;
  class LuaScriptModule;

  class LuaLanguageProcessor : public ILanguageProcessor
  {
  public:
    LuaLanguageProcessor();
    ~LuaLanguageProcessor() override;

    // TODO shared or unique here?
    std::shared_ptr<IScriptModule> newScriptModule() override;
    void insertModulesInto(llvm::orc::LLJIT* jit) override;

    llvm::Expected<std::string> getFunctionName(const std::string& filename, const std::string& name) override;

  private:
    BaseLuaModule base_lua_module;
    llvm::orc::ThreadSafeContext ts_context;

    llvm::orc::ThreadSafeModule ts_vm_module;
    std::unordered_map<std::string, std::unique_ptr<llvm::Module>> modules;

//    llvm::orc::ResourceTrackerSP vm_module_tracker;
//    std::unordered_map<std::string, llvm::orc::ResourceTrackerSP> trackers;

    LLVMCompiler compiler;

    std::vector<std::shared_ptr<LuaScriptModule>> script_modules;

    lua_State* lua_state = nullptr;
  };

} // as

#endif //AS_PROTO_LUA_LANGUAGE_PROCESSOR_H
