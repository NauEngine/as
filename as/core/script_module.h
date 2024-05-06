//
// Created by Alex Zelenshikov on 21.03.2024.
//

#ifndef AS_PROTO_SCRIPT_MODULE_H
#define AS_PROTO_SCRIPT_MODULE_H

#include "llvm/ExecutionEngine/Orc/Shared/ExecutorAddress.h"

#include "cpp_interface.h"
#include "language_processor.h"

namespace as
{
class LanguageProcessor;
class Core;
struct ILanguageScript;

class ScriptModule
{
public:
  explicit ScriptModule(std::shared_ptr<LanguageProcessor> language_processor);

  void load(const std::string& filename);

  template<typename Interface> Interface* newInstance(const std::string& instance_name)
  {
    const char* source_code = get_source_code<Interface>();
    const char* type_name = get_type_name<Interface>();
    auto script_instance_sym = cantFail(m_language_processor->newInstance(m_language_script, instance_name, type_name, source_code));
    return script_instance_sym.template toPtr<Interface*>();
  }

private:
  std::shared_ptr<LanguageProcessor> m_language_processor;
  std::shared_ptr<ILanguageScript> m_language_script;
};

} // as

#endif //AS_PROTO_SCRIPT_MODULE_H
