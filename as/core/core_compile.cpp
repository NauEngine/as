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

#include <fstream>
#include <llvm/Support/TargetSelect.h>

namespace
{
    llvm::ExitOnError ExitOnErr;
}

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
CoreCompile::CoreCompile(const std::string& base_path, bool add_init):
    m_base_path(base_path),
    m_add_init(add_init)
{
    m_ts_context = std::make_unique<llvm::LLVMContext>();
    m_cpp_parser = std::make_unique<CPPParser>(*m_ts_context.getContext());

    llvm::InitializeAllTargets();
    llvm::InitializeAllTargetMCs();
    llvm::InitializeAllAsmPrinters();
    llvm::InitializeAllAsmParsers();

    m_jit = ExitOnErr(llvm::orc::LLJITBuilder().create());
}

CoreCompile::~CoreCompile()
{
    m_languages.clear();
    llvm::llvm_shutdown();
}

void CoreCompile::registerLanguage(const std::string& language_name, std::shared_ptr<ILanguage> language)
{
    language->init(m_jit, m_ts_context);
    m_languages[language_name] = std::move(language);
}

void CoreCompile::registerInstance(void* instance, const std::string& instance_name, const std::shared_ptr<ScriptInterface>& interface)
{
    for (auto& [name, language]: m_languages)
    {
        language->registerInstance(instance, instance_name, interface);
    }
}

std::shared_ptr<ScriptModuleCompile> CoreCompile::newScriptModule(
        const std::string& filename,
        const std::string& language_name)
{
    auto language = getLanguage(resolveLanguageName(filename, language_name));
    auto language_script = language->newScript();

    language_script->load(m_base_path / filename, *m_ts_context.getContext());

    const auto interface = language_script->getInterface(filename, *m_cpp_parser);
    if (!interface)
    {
        llvm::errs() << "ERROR: Cannot compile file \"" << filename << "\". Cannot acquire implemented interface\n";
        return nullptr;
    }

    return std::make_shared<ScriptModuleCompile>(ir::safe_name(filename), *interface, language_script, *m_ts_context.getContext(), m_add_init);
}

std::shared_ptr<ScriptModuleCompile> CoreCompile::newScriptModule(
        const ScriptInterface& interface,
        const std::string& filename,
        const std::string& language_name)
{
    auto language = getLanguage(resolveLanguageName(filename, language_name));

    auto language_script = language->newScript();
    language_script->load(m_base_path / filename, *m_ts_context.getContext());

    return std::make_shared<ScriptModuleCompile>(ir::safe_name(filename), interface, language_script, *m_ts_context.getContext(), m_add_init);
}

const std::shared_ptr<ScriptInterface>& CoreCompile::getInterface(const std::string& source_code) const
{
    return m_cpp_parser->getInterface(source_code);
}

ILanguage* CoreCompile::getLanguage(const std::string& language_name) const
{
    auto result = m_languages.find(language_name);
    if (result == m_languages.end())
        return nullptr;

    return result->second.get();
}
} // as