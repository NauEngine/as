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
#include "language_runtime.h"
#include "language_script.h"
#include "script_module_compile.h"

typedef void (*InitFunction)(as::Core* core);

std::unordered_map<std::string, InitFunction>& getInits()
{
    static std::unordered_map<std::string, InitFunction> inits;
    return inits;
}

extern "C" void __asRegisterInit(const char* name, InitFunction ptr)
{
    std::cout << "__asRegisterInit(" << name << ", ...)" << std::endl;
    getInits()[name] = ptr;
}

extern "C" void __asRegisterVTable(as::Core* core, const char* name, void* vtable, int vtable_size)
{
    core->registerVTable(name, vtable, vtable_size);
}

extern "C" const void* __asRequireRuntime(as::Core* core, const char* name)
{
    return core->requireRuntime(name);
}

namespace as
{

Core::Core(const std::string& base_path):
    m_compile(base_path, false)
{
}

Core::~Core()
{
}

void Core::registerRuntime(std::shared_ptr<ILanguageRuntime> runtime)
{
    m_runtimes[runtime->name()] = std::move(runtime);
}

void Core::registerVTable(const char* name, void* vtable, int vtable_size)
{
    const auto &vtabe_it = m_vtables.find(name);
    if (vtabe_it == m_vtables.end())
    {
        m_vtables[name] = vtable;
    }
    else
    {
        std::cout << "Replace vtable for " << name << std::endl;
        void** vtable_dest = static_cast<void**>(vtabe_it->second);
        void** vtable_src = static_cast<void**>(vtable);
        for (int i = 0; i < vtable_size; ++i)
        {
            *(vtable_dest++) = *(vtable_src++);
        }
    }
}

const void* Core::requireRuntime(const char* name)
{
    const auto runtime = m_runtimes.find(name);
    if (runtime == m_runtimes.end())
    {
        std::cout << "__asRequireRuntime(" << name << ") -> not found" << std::endl;
        return nullptr;
    }

    const auto result = runtime->second->ptr();
    std::cout << "__asRequireRuntime(" << name << ") -> " << result << std::endl;

    return result;
}

std::shared_ptr<ScriptModuleRuntime> Core::getCachedModule(const std::string& filename) const
{
    const auto module = m_modules.find(filename);
    return module != m_modules.end() ? module->second : nullptr;
}

std::shared_ptr<ScriptModuleRuntime> Core::getLinkedModule(const std::string& filename)
{
    const auto init_func_it = getInits().find(ir::safe_name(filename));
    if (init_func_it == getInits().end())
        return nullptr;

    std::cout << "Call init from linked module \"" << filename << "\"..." << std::endl;
    (init_func_it->second)(this);

    const auto vtable = m_vtables.find(ir::safe_name(filename));
    if (vtable == m_vtables.end())
        return nullptr;

    auto module = std::make_shared<ScriptModuleRuntime>(vtable->second);
    m_modules[filename] = module;
    return module;
}

std::shared_ptr<ScriptModuleRuntime> Core::getCompiledModule(const ScriptInterface& interface,
        const std::string& filename, const std::string& language_name)
{
    auto module_compile = m_compile.newScriptModule(interface, filename, language_name);
    auto init_func = module_compile->materialize(m_compile.getJit(), m_compile.getContext());
    init_func(this);

    const auto vtable = m_vtables.find(ir::safe_name(filename));
    if (vtable == m_vtables.end())
        return nullptr;

    auto module = std::make_shared<ScriptModuleRuntime>(vtable->second);
    m_modules[filename] = module;
    return module;
}

void Core::reload(const std::string& filename)
{
    auto module_compile = m_compile.newScriptModule(filename);
    auto init_func = module_compile->materialize(m_compile.getJit(), m_compile.getContext());
    if (!init_func)
    {
        std::cerr << "Cannot reload module \"" << filename << std::endl;
        return;
    }
    init_func(this);
}

} // as
