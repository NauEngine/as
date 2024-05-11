//
// Created by ivn on 11.05.2024.
//
#include "./is_language.h"
#include "./is_language_script.h"

namespace as
{

void IvnScriptLanguage::init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context)
{

}

std::shared_ptr<ILanguageScript> IvnScriptLanguage::newScript()
{
    return std::make_shared<IvnScriptLanguageScript>();
}

}
