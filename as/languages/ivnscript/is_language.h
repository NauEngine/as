//
// Created by ivn on 11.05.2024.
//

#pragma once

#include <string>
#include <memory>

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "as/core/language.h"

namespace as
{

class IvnScriptLanguage final : public ILanguage
{
public:
    IvnScriptLanguage() = default;
    ~IvnScriptLanguage() override = default;

    const char* prefix() override { return "ivnscript"; }

    void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context) override;
    std::shared_ptr<ILanguageScript> newScript() override;

    void registerInstance(
      void* instance,
      const std::string& instanceName,
      const std::shared_ptr<ScriptInterface>& scriptInterface) override {}
};

}

