//
// Created by Alex Zelenshikov on 21.03.2024.
//

#ifndef AS_PROTO_SCRIPT_MODULE_H
#define AS_PROTO_SCRIPT_MODULE_H

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/ExecutionEngine/Orc/Shared/ExecutorAddress.h"

#include "cpp_interface.h"

namespace llvm
{
  class StructType;
  class Module;
}

namespace as
{

struct ILanguageScript;
struct ILanguage;

class  CPPParser;
struct ScriptInterface;

class ScriptModule
{
public:
  explicit ScriptModule(
    std::shared_ptr<ILanguage> language,
    std::shared_ptr<llvm::orc::LLJIT> jit,
    llvm::orc::ThreadSafeContext ts_context,
    std::shared_ptr<CPPParser> cpp_parser);

  void load(const std::string& filename, ScriptId script_id);

  template<typename Interface> Interface* newInstance(const std::string& instance_name)
  {
    const char* source_code = getSourceCode<Interface>();
    const char* type_name = getTypeName<Interface>();
    auto script_instance_sym = cantFail(newInstance(m_language_script, instance_name, type_name, source_code));
    return script_instance_sym.template toPtr<Interface*>();
  }

private:
  std::shared_ptr<ILanguage> m_language;
  std::shared_ptr<ILanguageScript> m_language_script;

  uint32_t m_script_id;

  std::unordered_map<std::string, std::string> m_vtables;

  std::shared_ptr<llvm::orc::LLJIT> m_jit;
  llvm::orc::ThreadSafeContext m_ts_context;
  std::shared_ptr<CPPParser> m_cpp_parser;

  llvm::Expected<llvm::orc::ExecutorAddr> newInstance(
    const std::shared_ptr<ILanguageScript>& language_script,
    const std::string& instance_name,
    const std::string& type_name,
    const std::string& source_code);

  std::tuple<std::string, std::unique_ptr<llvm::Module>> buildInterfaceModule(const std::shared_ptr<ILanguageScript>& language_script, const std::shared_ptr<ScriptInterface>& interface);
  std::unique_ptr<llvm::Module> buildInstanceModule(const std::string& vtable_name, const std::string& instance_name, const std::shared_ptr<ScriptInterface>& interface);
};

} // as

#endif //AS_PROTO_SCRIPT_MODULE_H
