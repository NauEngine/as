//
// Created by ivn on 21.05.2024.
//
#include <filesystem>

#include "llvm/ExecutionEngine/Orc/LLJIT.h"

#include "cpp_interface_parser.h"
#include "language.h"
#include "language_script.h"
#include "script_module_compile.h"
#include "ir.h"

#include "core_compile.h"

static std::string resolveLanguageName(const std::string& filename, const std::string& language_name)
{
  if (!language_name.empty())
    return language_name;

  auto result = std::filesystem::path(filename).extension().string();
  if (result.empty() || result.at(0) != '.')
    return result;

  return result.substr(1);
}

namespace as
{
CoreCompile::CoreCompile()
{
    m_ts_context = std::make_unique<llvm::LLVMContext>();
    m_cpp_parser = std::make_unique<CPPParser>(*m_ts_context.getContext());
}

CoreCompile::~CoreCompile()
{
    m_languages.clear();
    llvm::llvm_shutdown();
}

void CoreCompile::registerLanguage(const std::string& language_name, std::shared_ptr<ILanguage> language)
{
    m_languages[language_name] = std::move(language);
}

std::shared_ptr<ScriptModuleCompile> CoreCompile::newScriptModule(std::shared_ptr<ScriptInterface> interface,
        const std::string& filename,
        const std::string& language_name)
{
    auto language = getLanguage(resolveLanguageName(filename, language_name));

    auto language_script = language->newScript();
    language_script->load(filename);

    return std::make_shared<ScriptModuleCompile>(ir::safe_name(filename), interface, language_script, m_ts_context);
}

std::shared_ptr<ILanguageScript> CoreCompile::loadScript(const std::string& filename, const std::string& language_name) const
{
    auto language = getLanguage(resolveLanguageName(filename, language_name));

    auto language_script = language->newScript();
    language_script->load(filename);
    return language_script;
}


std::shared_ptr<ScriptInterface> CoreCompile::getInterface(const std::string& name, const std::string& source_code) const
{
    return m_cpp_parser->getInterface(name, source_code);
}

ILanguage* CoreCompile::getLanguage(const std::string& language_name) const
{
    auto result = m_languages.find(language_name);
    if (result == m_languages.end())
        return nullptr;

    return result->second.get();
}

const std::unordered_map<std::string, std::shared_ptr<ILanguage>>& CoreCompile::getLanguages() const
{
    return m_languages;
}

llvm::orc::ThreadSafeContext CoreCompile::getContext() const
{
    return std::move(m_ts_context);
}
} // as