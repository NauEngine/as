//
// Created by ivn on 23.05.2024.
//

#pragma once
#include <memory>
#include <llvm/ExecutionEngine/Orc/Shared/ExecutorAddress.h>

namespace llvm::orc
{
    class ThreadSafeContext;
    class LLJIT;
}

namespace as {
struct ILanguageScript;

class ScriptModuleRuntime {
public:
    ScriptModuleRuntime(std::shared_ptr<ILanguageScript> language_script, llvm::orc::ExecutorAddr vtable):
        m_language_script(std::move(language_script)),
        m_vtable(vtable)
    {}

    void* newInstance() const;

private:
    std::shared_ptr<ILanguageScript> m_language_script;
    llvm::orc::ExecutorAddr m_vtable;
};

} // as
