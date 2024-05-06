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

  const char* prefix() override { return "lua"; }

  void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context) override;

  std::shared_ptr<ILanguageScript> newScript() override;

private:
  lua_State* lua_state = nullptr;
  std::shared_ptr<LuaIR> lua_ir;
};

}

#endif //LUA_LANGUAGE_H
