//
// Created by Alex Zelenshikov on 06.02.2024.
//

#include <iostream>
#include <filesystem>

#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"

#include "llvm/IR/IRBuilder.h"

#include "core.h"
#include "language.h"
#include "script_module.h"
#include "cpp_interface_parser.h"
#include "ir.h"
#include "language_script.h"

static std::string getLanguageName(const std::string& filename, const std::string& language_name)
{
  if (!language_name.empty())
    return language_name;

  auto result = std::filesystem::path(filename).extension().string();
  if (result.empty() || result.at(0) != '.')
    return result;

  return result.substr(1);
}

namespace
{
  llvm::ExitOnError ExitOnErr;
}

namespace as
{
  Core::Core()
  {
    m_ts_context = std::make_unique<llvm::LLVMContext>();
    m_cpp_parser = std::make_shared<CPPParser>(*m_ts_context.getContext());

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

  std::shared_ptr<ILanguageScript> Core::loadScript(const std::string& filename, const std::string& language_name)
  {
    auto language_script = m_languages[getLanguageName(filename, language_name)]->newScript();
    language_script->load(filename);

    return language_script;
  }

  void Core::registerInstance(
    void* instance,
    const std::string& instance_name,
    const std::string& type_name,
    const std::string& source_code)
  {
    auto scriptInterface = m_cpp_parser->getInterface(type_name, source_code);

    for (auto& [name, language] : m_languages)
    {
      language->registerInstance(instance, instance_name, scriptInterface);
    }
  }
} // as