#include "cpp_language_script.h"
#include "cpp_language.h"

namespace as {

std::shared_ptr<ILanguageScript> CppLanguage::newScript()
{
    return std::make_shared<CppLanguageScript>();
}

} // as