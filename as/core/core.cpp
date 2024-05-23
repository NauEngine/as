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
#include "script_module_compile.h"

namespace
{
    llvm::ExitOnError ExitOnErr;
}

namespace as
{
Core::Core():
    m_compile(false)
{
    llvm::InitializeAllTargets();
    llvm::InitializeAllTargetMCs();
    llvm::InitializeAllAsmPrinters();
    llvm::InitializeAllAsmParsers();

    m_jit = ExitOnErr(llvm::orc::LLJITBuilder().create());
}

Core::~Core()
{
}

void Core::registerLanguage(const std::string& language_name, const std::shared_ptr<ILanguage>& language)
{
    language->init(m_jit, m_compile.getContext());
    m_compile.registerLanguage(language_name, language);
}

void Core::registerInstance(void* instance,
        const std::string& instance_name,
        const std::string& type_name,
        const std::string& source_code) const
{
    auto scriptInterface = m_compile.getInterfacePtr(type_name, source_code);

    for (auto& [name, language]: m_compile.getLanguages())
    {
        language->registerInstance(instance, instance_name, scriptInterface);
    }
}

std::shared_ptr<ScriptModuleRuntime> Core::getModuleRuntime(const ScriptInterface& interface,
            const std::string& filename,
            const std::string& language_name)
{
    const auto result = m_modules.find(filename);
    if (result != m_modules.end())
        return result->second;

    auto module_compile = m_compile.newScriptModule(interface, filename, language_name);
    auto module = module_compile->materialize(m_jit, m_compile.getContext());
    m_modules[filename] = module;
    return module;
}


} // as
