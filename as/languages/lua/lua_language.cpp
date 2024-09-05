//
// Created by Alex Zelenshikov on 30.04.2024.
//

#include "llvm/IR/IRBuilder.h"

#include "as/core/cpp_interface_parser.h"
#include "as/core/ir.h"

#include "lua_ir.h"
#include "lua_language.h"
#include "lua_language_script.h"
#include "lua_llvm_compiler.h"
#include "lua_module_entry.h"

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
    __force_link_module_entry();
}

LuaLanguage::~LuaLanguage()
{

}

void LuaLanguage::init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context)
{
    m_jit = std::move(jit);
    m_ts_context = std::move(ts_context);

    m_llvmCompiler = std::make_shared<LuaLLVMCompiler>();

    m_lua_ir = std::make_shared<LuaIR>();
    m_lua_ir->init(m_jit, m_ts_context);
}

std::shared_ptr<ILanguageScript> LuaLanguage::newScript()
{
  return std::make_shared<LuaLanguageScript>(m_lua_ir, m_llvmCompiler);
}

}
