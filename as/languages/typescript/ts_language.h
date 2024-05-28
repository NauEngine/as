//
// Created by ivn on 28.05.2024.
//

#pragma once

#include <mlir/IR/MLIRContext.h>

#include "llvm/ExecutionEngine/Orc/LLJIT.h"

#include "as/core/language.h"

namespace as {

class TypeScriptLanguage : public ILanguage {
public:
    TypeScriptLanguage();
    ~TypeScriptLanguage() override = default;

    const char* prefix() override
    {
        return "ts";
    }

    void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext context) override;

    void registerInstance(void* instance, const std::string& instanceName,
            const std::shared_ptr<ScriptInterface>& cppInterface) override
    {
    }

    std::shared_ptr<ILanguageScript> newScript() override;

private:
    mlir::MLIRContext m_context;
};

} // as
