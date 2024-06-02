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

namespace
{
    llvm::ExitOnError ExitOnErr;
}

typedef void (*FunctionPtr)();

std::unordered_map<std::string, FunctionPtr>& getInits()
{
    static std::unordered_map<std::string, FunctionPtr> inits;
    return inits;
}

std::unordered_map<std::string, void*>& getVtables()
{
    static std::unordered_map<std::string, void*> vtables;
    return vtables;
}

std::unordered_map<std::string, std::shared_ptr<as::ILanguageRuntime>>& getRuntimes()
{
    static std::unordered_map<std::string, std::shared_ptr<as::ILanguageRuntime>> runtimes;
    return runtimes;
}

extern "C" void __asRegisterInit(const char* name, FunctionPtr ptr)
{
    std::cout << "__asRegisterInit(" << name << ", ...)" << std::endl;
    getInits()[name] = ptr;
}

extern "C" void __asRegisterModule(const char* name, void* ptr)
{
    //std::cout << "__asRegisterModule(" << name << ", ...)" << std::endl;
    getVtables()[name] = ptr;
}

extern "C" const void* __asRequireRuntime(const char* name)
{
    const auto& runtimes = getRuntimes();
    const auto runtime = runtimes.find(name);
    if (runtime == runtimes.end())
    {
        std::cout << "__asRequireRuntime(" << name << ") -> not found" << std::endl;
        return nullptr;
    }

    const auto result = runtime->second.get()->ptr();
    std::cout << "__asRequireRuntime(" << name << ") -> " << result << std::endl;

    return result;
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
    getRuntimes()[runtime->name()] = std::move(runtime);
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
    (init_func_it->second)();

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
    module_compile->materialize(m_compile.getJit(), m_compile.getContext());
    auto script = module_compile->getLanguageScript();
    m_scripts.emplace_back(script);

    const auto vtable = getVtables().find(ir::safe_name(filename));
    if (vtable == getVtables().end())
        return nullptr;

    auto module = std::make_shared<ScriptModuleRuntime>(vtable->second);
    m_modules[filename] = module;
    return module;
}

} // as
