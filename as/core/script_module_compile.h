//
// Created by ivn on 21.05.2024.
//

#pragma once

#include <memory>

#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"

namespace as {
struct ILanguageScript;
struct ScriptInterface;

class ScriptModuleCompile {
public:
    explicit ScriptModuleCompile(const std::string& export_name,
        std::shared_ptr<ScriptInterface> interface,
        std::shared_ptr<ILanguageScript> language_script,
        llvm::orc::ThreadSafeContext ts_context);

    [[nodiscard]]
    ILanguageScript* getScript() const
    {
        return m_language_script.get();
    }

    [[nodiscard]]
    std::unique_ptr<llvm::Module> getModule()
    {
        return std::move(m_module);
    }

    void dump(llvm::raw_fd_ostream& stream);

private:
    std::shared_ptr<ILanguageScript> m_language_script;
    llvm::orc::ThreadSafeContext m_ts_context;

    std::unique_ptr<llvm::Module> m_module;

    void compile(const std::string& export_name, std::shared_ptr<ScriptInterface> interface);
};

} // as
