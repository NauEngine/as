//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_LANGUAGE_PROCESSOR_H
#define AS_PROTO_LANGUAGE_PROCESSOR_H

#include "llvm/Support/Error.h"

#include <string>
#include "errors.h"

namespace llvm::orc
{
  class LLJIT;
}

namespace as
{
  class IScriptModule;

  class ILanguageProcessor
  {
  public:
    virtual ~ILanguageProcessor() = default;

    virtual std::shared_ptr<IScriptModule> newScriptModule() = 0;
    virtual void insertModulesInto(llvm::orc::LLJIT* jit) = 0;

    // empty name for entry point
    virtual llvm::Expected<std::string> getFunctionName(const std::string& filename, const std::string& name) = 0;
  };
} // namespace as

#endif //AS_PROTO_LANGUAGE_PROCESSOR_H
