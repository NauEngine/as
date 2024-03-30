//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_LANGUAGE_PROCESSOR_H
#define AS_PROTO_LANGUAGE_PROCESSOR_H

#include <string>

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

    virtual std::shared_ptr<IScriptModule> RegisterScriptModule(const std::string& filename) = 0;
    virtual void InsertModulesInto(llvm::orc::LLJIT* jit) = 0;
  };
} // namespace as

#endif //AS_PROTO_LANGUAGE_PROCESSOR_H
