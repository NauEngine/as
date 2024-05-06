//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_LANGUAGE_PROCESSOR_H
#define AS_PROTO_LANGUAGE_PROCESSOR_H

#include "llvm/Support/Error.h"
#include "llvm/ExecutionEngine/Orc/Shared/ExecutorAddress.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"

#include <string>
#include "errors.h"

namespace llvm
{
  class StructType;
  class Module;
}

namespace as
{
  class IScriptModule;
  class CPPParser;
  struct CPPInterface;
  struct ILanguage;
  struct ILanguageScript;

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

  class LanguageProcessor
  {
  public:
    LanguageProcessor(std::unique_ptr<ILanguage> language, std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context,
              std::shared_ptr<CPPParser> cpp_parser);

    ~LanguageProcessor() = default;

    std::shared_ptr<ILanguageScript> newScript();

    llvm::Expected<llvm::orc::ExecutorAddr> newInstance(
      const std::shared_ptr<ILanguageScript>& language_script,
      const std::string& instance_name,
      const std::string& type_name,
      const std::string& source_code);

  private:
    llvm::orc::ThreadSafeContext m_ts_context;
    std::shared_ptr<CPPParser> m_cpp_parser;
    std::unordered_map<std::string, std::unique_ptr<LLVMScriptInterface>> m_llvm_interfaces;
    std::shared_ptr<llvm::orc::LLJIT> m_jit;
    std::unique_ptr<ILanguage> m_language;

    std::unique_ptr<LLVMScriptInterface> buildInterfaceModule(const std::shared_ptr<ILanguageScript>& language_script, const std::shared_ptr<CPPInterface>& interface);

    // builds new module for script instance GlobalVariable
    std::unique_ptr<llvm::Module> buildInstanceModule(const LLVMScriptInterface* llvm_interface, const std::string& instance_name);

    // converts c++ interface signature into inner method type by adding 'this' pointer as first arg
    static llvm::FunctionType* buildInstanceMethodType(llvm::FunctionType* signature, llvm::PointerType* interface_ptr_t);

  };
} // namespace as

#endif //AS_PROTO_LANGUAGE_PROCESSOR_H
