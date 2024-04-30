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

class ScriptModule
{
public:
  explicit ScriptModule(std::shared_ptr<LanguageProcessor> language_processor) :
      language_processor(std::move(language_processor))
  {}

  void load(const std::string& filename);

  template<typename Interface> Interface* newInstance(const std::string& instance_name)
  {
    const char* source_code = get_source_code<Interface>();
    const char* type_name = get_type_name<Interface>();
    auto script_instance_sym = cantFail(language_processor->newInstance(instance_name, type_name, source_code));
    return script_instance_sym.template toPtr<Interface*>();
  }

private:
  std::shared_ptr<LanguageProcessor> language_processor;
};

class IScriptModule
{
public:
  virtual ~IScriptModule() = default;

  virtual void runScript() = 0;
  virtual void runFunction(const std::string& func) = 0;

  virtual void runFunctionN1(const std::string& func, int n) = 0; // TODO experiment

  // TODO [AZ] add function signature
  virtual void setInterface(const std::vector<std::string>& interface) = 0;
  virtual void load(const std::string& filename) = 0;

  //virtual void InsertModuleInto(llvm::orc::LLJIT* jit) = 0;
};

} // as

#endif //AS_PROTO_SCRIPT_MODULE_H
