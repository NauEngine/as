//
// Created by Alex Zelenshikov on 01.05.2024.
//

#ifndef LUA_LANGUAGE_SCRIPT_H
#define LUA_LANGUAGE_SCRIPT_H

#include "as/core/language_script.h"

struct lua_State;

namespace as::orc
{
    class LLJIT;
}

namespace as
{

class LuaIR;

class LuaLanguageScript final : public ILanguageScript
{
public:
  explicit LuaLanguageScript(lua_State* state, const std::shared_ptr<LuaIR>& lua_ir);
  ~LuaLanguageScript() override;

  void load(const std::string& filename) override;

  void prepareModule(llvm::LLVMContext& context, llvm::Module* module) override;

  llvm::Function* buildFunction(
      llvm::FunctionType* signature,
      const std::string& bare_name,
      const std::string& decorated_name,
      const std::shared_ptr<llvm::orc::LLJIT>& jit,
      llvm::LLVMContext& context,
      llvm::Module* module) override;

private:
  lua_State* m_lua_state = nullptr;
  int m_registry_index;
  std::unordered_map<std::string, int> m_func_registry_ids;
  const std::shared_ptr<LuaIR>& m_lua_ir;

  llvm::Value* m_lua_state_extern = nullptr;
};

} //namespace as



#endif //LUA_LANGUAGE_SCRIPT_H
