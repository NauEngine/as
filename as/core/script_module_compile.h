//
// Created by ivn on 21.05.2024.
//

#pragma once

#include <memory>

#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"

namespace as {

class ScriptModuleRuntime;
struct ILanguageScript;

struct ScriptInterface;

typedef void (*InitFunction)(void*);

class ScriptModuleCompile {
public:
    explicit ScriptModuleCompile(const std::string& export_name,
        const ScriptInterface& interface,
        std::shared_ptr<ILanguageScript> language_script,
        llvm::LLVMContext& context,
        bool add_init);

    void dump(llvm::raw_fd_ostream& stream) const;

    InitFunction materialize(std::shared_ptr<llvm::orc::LLJIT>& jit, llvm::orc::ThreadSafeContext ts_context);

    // TODO [Ivn] Hack to hold somewhere instance of ILanguageScript. Actually it shoud be runtime part of each module
    std::shared_ptr<ILanguageScript> getLanguageScript()
    {
        return std::move(m_language_script);
    }

private:
    std::string m_export_name;
    std::unique_ptr<llvm::Module> m_module;
    std::shared_ptr<ILanguageScript> m_language_script;

    void compile(const ScriptInterface& interface, llvm::LLVMContext& context, bool add_init);
    // std::vector<llvm::Constant*> compileFunctions(const ScriptInterface& interface, llvm::LLVMContext& context) const;
};

} // as
