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

void CoreCompile::registerInstance(void* instance, const std::string& instance_name, const ScriptInterface& interface)
{
    // TODO [inv]: Use const ScriptInterface& for ILanguage
    const auto i = m_cpp_parser->getInterface(interface.name, "");
    for (auto& [name, language]: m_languages)
    {
        language->registerInstance(instance, instance_name, i);
    }
}

std::shared_ptr<ScriptModuleCompile> CoreCompile::newScriptModule(
        const std::string& filename,
        const std::string& language_name)
{
    auto language = getLanguage(resolveLanguageName(filename, language_name));
    auto language_script = language->newScript();
    auto header = language_script->findHeader(filename);

    if (header.empty())
        return nullptr;

    std::filesystem::path file_path(std::filesystem::path(filename).parent_path());
    std::filesystem::path header_path = file_path / header;

    std::ifstream ifs(header_path);
    const std::string header_content{ std::istreambuf_iterator<char>(ifs), std::istreambuf_iterator<char>() };

    const auto interface = getInterface("TestScript", header_content);

    language_script->load(m_base_path / filename);
    return std::make_shared<ScriptModuleCompile>(ir::safe_name(filename), *interface, language_script, *m_ts_context.getContext(), m_add_init);
}

std::shared_ptr<ScriptModuleCompile> CoreCompile::newScriptModule(
        const ScriptInterface& interface,
        const std::string& filename,
        const std::string& language_name)
{
    auto language = getLanguage(resolveLanguageName(filename, language_name));

    auto language_script = language->newScript();
    language_script->load(m_base_path / filename);

    return std::make_shared<ScriptModuleCompile>(ir::safe_name(filename), interface, language_script, *m_ts_context.getContext(), m_add_init);
}

const std::shared_ptr<ScriptInterface>& CoreCompile::getInterface(const std::string& name, const std::string& source_code) const
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
} // as