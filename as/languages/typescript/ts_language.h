//
// Created by ivn on 28.05.2024.
//

#pragma once

#include "llvm/ExecutionEngine/Orc/LLJIT.h"

#include "as/core/language.h"

namespace as {

class TsLanguage : public ILanguage {
public:
    ~TsLanguage() override = default;

    void registerInstance(void* instance, const std::string& instanceName,
            const std::shared_ptr<ScriptInterface>& cppInterface) override;

    std::shared_ptr<ILanguageScript> newScript() override;

private:
};

} // as
