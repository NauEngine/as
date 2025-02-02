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
#include <llvm/ExecutionEngine/Orc/TargetProcess/JITLoaderGDB.h>

// Force linking some of the runtimes that helps attaching to a debugger.
LLVM_ATTRIBUTE_USED void linkComponents() {
  llvm::errs() << (void *)&llvm_orc_registerJITLoaderGDBWrapper
               << (void *)&llvm_orc_registerJITLoaderGDBAllocAction;
}

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

    auto builder = llvm::orc::LLJITBuilder();
    builder.EnableDebuggerSupport = true;
    m_jit = ExitOnErr(builder.create());
}

CoreCompile::~CoreCompile()
{
    m_modules.clear();
    m_languages.clear();
    llvm::llvm_shutdown();
}

void CoreCompile::registerLanguage(const std::string& language_name, std::shared_ptr<ILanguage> language)
{
    language->init(m_jit, m_ts_context);
    m_languages[language_name] = std::move(language);
}

std::shared_ptr<ScriptModuleCompile> CoreCompile::newScriptModule(
        const std::string& filename,
        const std::string& language_name)
{
    auto language = getLanguage(resolveLanguageName(filename, language_name));
    auto language_script = language->newScript();
    language_script->load(m_base_path / filename, *m_ts_context.getContext());

    const auto interface = language_script->getInterface(m_base_path / filename, *m_cpp_parser);
    const auto externalRequires = language_script->getRequires(m_base_path / filename, *m_cpp_parser);

    if (!interface)
    {
        llvm::errs() << "ERROR: Cannot compile file \"" << filename << "\". Cannot acquire implemented interface\n";
        return nullptr;
    }

    return createScriptModule(filename, *interface, externalRequires, std::move(language_script));
}

std::shared_ptr<ScriptModuleCompile> CoreCompile::newScriptModule(
        const ScriptInterface& interface,
        const std::string& filename,
        const std::string& language_name)
{
    auto language = getLanguage(resolveLanguageName(filename, language_name));
    auto language_script = language->newScript();
    language_script->load(m_base_path / filename, *m_ts_context.getContext());
    const auto externalRequires = language_script->getRequires(m_base_path / filename, *m_cpp_parser);

    return createScriptModule(filename, interface, externalRequires, std::move(language_script));
}

std::shared_ptr<ScriptModuleCompile> CoreCompile::createScriptModule(
    const std::string& filename,
    const ScriptInterface& interface,
    const std::unordered_map<std::string, std::shared_ptr<ScriptInterface>>& externalRequires,
    std::shared_ptr<ILanguageScript> language_script)
{
    const auto safe_name = ir::safe_name(filename);
    const auto context = m_ts_context.getContext();
    auto result = std::make_shared<ScriptModuleCompile>(safe_name, interface, externalRequires, std::move(language_script), *context, m_add_init);
    m_modules[filename] = result;
    return result;
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