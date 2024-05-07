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
struct CPPInterface;

struct LLVMScriptInterface
{
  // Type of structure that presents binding of script functions to C++ abstract interface
  llvm::StructType* interface_t = nullptr;
  // Type of vtable for interface structure
  llvm::StructType* vtable_t = nullptr;
  // Name of GlobalVariable presenting vtable
  std::string vtable_name;
  // Module with script interface IR
  std::unique_ptr<llvm::Module> module;
};

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
    const char* source_code = get_source_code<Interface>();
    const char* type_name = get_type_name<Interface>();
    auto script_instance_sym = cantFail(newInstance(m_language_script, instance_name, type_name, source_code));
    return script_instance_sym.template toPtr<Interface*>();
  }

  llvm::Expected<llvm::orc::ExecutorAddr> newInstance(
    const std::shared_ptr<ILanguageScript>& language_script,
    const std::string& instance_name,
    const std::string& type_name,
    const std::string& source_code);

private:
  std::shared_ptr<ILanguage> m_language;
  std::shared_ptr<ILanguageScript> m_language_script;

  uint32_t m_script_id;

  std::unordered_map<std::string, std::unique_ptr<LLVMScriptInterface>> m_llvm_interfaces;

  std::shared_ptr<llvm::orc::LLJIT> m_jit;
  llvm::orc::ThreadSafeContext m_ts_context;
  std::shared_ptr<CPPParser> m_cpp_parser;

  std::unique_ptr<LLVMScriptInterface> buildInterfaceModule(const std::shared_ptr<ILanguageScript>& language_script, const std::shared_ptr<CPPInterface>& interface);
  std::unique_ptr<llvm::Module> buildInstanceModule(const LLVMScriptInterface* llvm_interface, const std::string& instance_name);
};

} // as

#endif //AS_PROTO_SCRIPT_MODULE_H
