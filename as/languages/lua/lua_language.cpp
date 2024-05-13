//
// Created by Alex Zelenshikov on 30.04.2024.
//

#include "lua_language.h"

#include "lua_ir.h"
#include "lua_language_script.h"
#include "as/core/cpp_interface_parser.h"

extern "C"
{
#include "lua/lauxlib.h"
#include "lua/lualib.h"
#include "lua/lstate.h"
}

namespace as
{

LuaLanguage::LuaLanguage()
{
  m_lua_state = luaL_newstate();
  luaL_openlibs(m_lua_state);
}

LuaLanguage::~LuaLanguage()
{
  if (m_lua_state)
  {
    lua_close(m_lua_state);
    m_lua_state = nullptr;
  }
}

void LuaLanguage::init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context)
{
  m_jit = std::move(jit);
  m_ts_context = std::move(ts_context);
  m_lua_ir = std::make_shared<LuaIR>();
  m_lua_ir->init(m_jit, m_ts_context, m_lua_state);
}

std::shared_ptr<ILanguageScript> LuaLanguage::newScript()
{
  return std::make_shared<LuaLanguageScript>(m_lua_state, m_lua_ir);
}

void LuaLanguage::registerInstance(void* instance, const std::string& instanceName,
  const std::shared_ptr<ScriptInterface>& cppInterface)
{
  llvm::errs() << "Dump registerInstance:\n";
  cppInterface->dump(llvm::errs());

  llvm::LLVMContext& context = *m_ts_context.getContext();

}

}
