//
// Created by Alex Zelenshikov on 30.04.2024.
//

#include "lua_language.h"

#include "lua_ir.h"
#include "lua_language_script.h"

extern "C"
{
#include "lua/lua.h"
#include "lua/lauxlib.h"
#include "lua/lualib.h"
#include "lua/lstate.h"
}

namespace as
{

LuaLanguage::LuaLanguage()
{
  lua_state = luaL_newstate();
  luaL_openlibs(lua_state);
}

LuaLanguage::~LuaLanguage()
{
  if (lua_state)
  {
    lua_close(lua_state);
    lua_state = nullptr;
  }
}

void LuaLanguage::init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context)
{
  lua_ir = std::make_shared<LuaIR>();
  lua_ir->init(jit, ts_context, lua_state);
}

std::shared_ptr<ILanguageScript> LuaLanguage::newScript()
{
  return std::make_shared<LuaLanguageScript>(lua_state, lua_ir);
}

}
