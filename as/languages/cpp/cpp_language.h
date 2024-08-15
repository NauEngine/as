//
// Created by ivn on 04.06.2024.
//

#pragma once

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"

#include "as/core/language.h"

namespace as {

class CppLanguage: public ILanguage
{
public:
    ~CppLanguage() override = default;

    const char* prefix() override
    {
        return "cpp";
    }

    void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext context) override
    {
    }

    void registerInstance(void* instance,
        const std::string& instanceName,
        const std::shared_ptr<ScriptInterface>& cppInterface) override
    {
    }

    std::shared_ptr<ILanguageScript> newScript() override;

private:

};

} // as
