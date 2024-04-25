//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_LANGUAGE_PROCESSOR_H
#define AS_PROTO_LANGUAGE_PROCESSOR_H

#include "llvm/Support/Error.h"
#include "llvm/ExecutionEngine/Orc/Shared/ExecutorAddress.h"

#include <string>
#include "errors.h"

namespace llvm::orc
{
  class LLJIT;
  class ThreadSafeContext;
}

namespace as
{
  class IScriptModule;
  class CPPParser;

  class ILanguageProcessor
  {
  public:
    virtual ~ILanguageProcessor() = default;

    virtual void init(llvm::orc::ThreadSafeContext ts_context, std::shared_ptr<CPPParser> parser) = 0;
    virtual llvm::Expected<llvm::orc::ExecutorAddr> new_instance(const char* type_name, const char* source_code) = 0;
    virtual std::shared_ptr<IScriptModule> newScriptModule() = 0;
    virtual void insertModulesInto(llvm::orc::LLJIT* jit) = 0;

    // empty name for entry point
    virtual llvm::Expected<std::string> getFunctionName(const std::string& filename, const std::string& name) = 0;
  };
} // namespace as

#endif //AS_PROTO_LANGUAGE_PROCESSOR_H
