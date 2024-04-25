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

    virtual void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context, std::shared_ptr<CPPParser> parser) = 0;
    virtual llvm::Expected<llvm::orc::ExecutorAddr> new_instance(const std::string& instance_name, const std::string& type_name, const std::string& source_code) = 0;
  };
} // namespace as

#endif //AS_PROTO_LANGUAGE_PROCESSOR_H
