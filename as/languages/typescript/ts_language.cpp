//
// Created by ivn on 28.05.2024.
//

#include "ts_language.h"

#include "ts_language_script.h"

namespace as {

void TsLanguage::registerInstance(void* instance, const std::string& instanceName,
        const std::shared_ptr<ScriptInterface>& cppInterface)
{
}

std::shared_ptr<ILanguageScript> TsLanguage::newScript()
{
    return std::shared_ptr<ILanguageScript>(new TsLanguageScript());
}

} // as