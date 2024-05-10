//
// Created by Alex Zelenshikov on 06.02.2024.
//

#include <iostream>

#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"

#include "llvm/IR/IRBuilder.h"

#include "core.h"
#include "language.h"
#include "script_module.h"
#include "cpp_interface_parser.h"

namespace
{
  llvm::ExitOnError ExitOnErr;
}

namespace as
{
  Core::Core():
    m_next_script_id(0)
  {
    m_ts_context = std::make_unique<llvm::LLVMContext>();
    m_cpp_interface_parser = std::make_shared<CPPParser>(*m_ts_context.getContext());

    llvm::InitializeAllTargets();
    llvm::InitializeAllTargetMCs();
    llvm::InitializeAllAsmPrinters();
    llvm::InitializeAllAsmParsers();

    m_jit = ExitOnErr(llvm::orc::LLJITBuilder().create());
  }

  Core::~Core()
  {
    m_languages.clear();
    llvm::llvm_shutdown();
  }

  void Core::registerLanguage(const std::string& language_name, std::shared_ptr<ILanguage> language)
  {
    language->init(m_jit, m_ts_context);
    m_languages[language_name] = std::move(language);
  }

  std::shared_ptr<ScriptModule> Core::newScriptModule(const std::string& language_name, const std::string& filename)
  {
    auto script_id = getScriptId(filename);
    auto script_module = std::make_shared<ScriptModule>(m_languages[language_name], m_jit, m_ts_context, m_cpp_interface_parser);
    script_module->load(filename, script_id);
    return script_module;
  }

  ScriptId Core::getScriptId(const std::string& path)
  {
    if (m_script_ids.contains(path))
    {
      return m_script_ids[path];
    }

    m_next_script_id++;
    m_script_ids[path] = m_next_script_id;

    return m_next_script_id;
  }

} // as