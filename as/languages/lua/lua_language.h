//
// Created by Alex Zelenshikov on 30.04.2024.
//

#ifndef LUA_LANGUAGE_H
#define LUA_LANGUAGE_H

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "as/core/language.h"

struct lua_State;

namespace as
{

class LuaIR;

class LuaLanguage final : public ILanguage
{
public:
  LuaLanguage();
  ~LuaLanguage() override;

  void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context) override;

  std::shared_ptr<ILanguageScript> newScript() override;

  void registerInstance(
    void* instance,
    const std::string& instanceName,
    const std::shared_ptr<CPPInterface>& cppInterface) override;

private:
  lua_State* m_lua_state = nullptr;
  std::shared_ptr<LuaIR> m_lua_ir;
};

}

#endif //LUA_LANGUAGE_H
