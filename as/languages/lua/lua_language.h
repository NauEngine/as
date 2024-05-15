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

namespace as
{

class LuaIR;

class LuaLanguage final : public ILanguage
{
public:
  LuaLanguage();
  ~LuaLanguage() override;

  const char* prefix() override { return "lua"; }

  void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context) override;

  std::shared_ptr<ILanguageScript> newScript() override;

  void registerInstance(
    void* instance,
    const std::string& instanceName,
    const std::shared_ptr<ScriptInterface>& interface) override;

private:
  lua_State* m_lua_state = nullptr;
  std::shared_ptr<LuaIR> m_lua_ir;
  std::set<std::string> m_createdMetatables;

  std::shared_ptr<llvm::orc::LLJIT> m_jit;
  llvm::orc::ThreadSafeContext m_ts_context;

  void buildLuaCFunction(
    llvm::LLVMContext& context,
    llvm::Module* module,
    llvm::FunctionType* methodType,
    int methodPosition,
    const std::string& methodName,
    llvm::Value* type_name_var) const;

  void createInterfaceMetatable(const std::shared_ptr<ScriptInterface>& interface);
};

}

#endif //LUA_LANGUAGE_H
