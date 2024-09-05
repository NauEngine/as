//
// Created by Alex Zelenshikov on 30.04.2024.
//

#ifndef LUA_LANGUAGE_H
#define LUA_LANGUAGE_H

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "as/core/language.h"

extern "C"
{
#include "lua/lua.h"
}

struct Proto;

namespace as
{

class LuaIR;
class BaseLuaModule;
class LuaLLVMCompiler;

class LuaLanguage final : public ILanguage
{
public:
  LuaLanguage();
  ~LuaLanguage() override = default;

  const char* prefix() override { return "lua"; }

  void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context) override;

  std::shared_ptr<ILanguageScript> newScript() override;

  void registerInstance(
    void* instance,
    const std::string& instanceName,
    const std::shared_ptr<ScriptInterface>& interface) override {}

private:
  std::shared_ptr<LuaIR> m_lua_ir;
  std::shared_ptr<LuaLLVMCompiler> m_llvmCompiler;
  llvm::orc::ThreadSafeContext m_ts_context;
};

}

#endif //LUA_LANGUAGE_H
