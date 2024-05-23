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

std::unordered_map<std::string, void*>& getVtables()
{
    static std::unordered_map<std::string, void*> vtables;
    return vtables;
}

extern "C" void registerInterface(const char* name, void* ptr)
{
    getVtables()[name] = ptr;
}

namespace as
{

Core::Core():
    m_compile(false)
{
}

Core::~Core()
{
}

std::shared_ptr<ScriptModuleRuntime> Core::getCachedModule(const std::string& filename) const
{
    const auto module = m_modules.find(filename);
    return module != m_modules.end() ? module->second : nullptr;
}

std::shared_ptr<ScriptModuleRuntime> Core::getLinkedModule(const std::string& filename)
{
    const auto vtable = getVtables().find(ir::safe_name(filename));
    if (vtable == getVtables().end())
        return nullptr;

    auto module = std::make_shared<ScriptModuleRuntime>(vtable->second);
    m_modules[filename] = module;
    return module;
}

std::shared_ptr<ScriptModuleRuntime> Core::getCompiledModule(const ScriptInterface& interface,
        const std::string& filename, const std::string& language_name)
{
    auto module_compile = m_compile.newScriptModule(interface, filename, language_name);
    auto module = module_compile->materialize(m_compile.getJit(), m_compile.getContext());
    m_modules[filename] = module;
    return module;
}

} // as
