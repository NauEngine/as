//
// Created by Alex Zelenshikov on 23.04.2024.
//

#include <string>
#include "script_module.h"
#include "language_processor.h"
#include "core.h"
#include "language_script.h"

namespace as
{

ScriptModule::ScriptModule(std::shared_ptr<LanguageProcessor> language_processor) :
    m_language_processor(std::move(language_processor))
{
    m_language_script = m_language_processor->newScript();
}

void ScriptModule::load(const std::string& filename)
{
    m_language_script->load(filename);
}

}
