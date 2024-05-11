//
// Created by Alex Zelenshikov on 30.04.2024.
//

#ifndef LANGUAGE_H
#define LANGUAGE_H

#include <string>

namespace llvm
{
  class Function;
  class FunctionType;
  class LLVMContext;
  class Module;
}

namespace as
{

struct CPPInterface;
struct ILanguageScript;

struct ILanguage
{
  virtual ~ILanguage() = default;

  virtual void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext context) = 0;

  virtual void registerInstance(
      void* instance,
      const std::string& instanceName,
      const std::shared_ptr<CPPInterface>& cppInterface) = 0;

  virtual std::shared_ptr<ILanguageScript> newScript() = 0;
};

} // namespace as


#endif //LANGUAGE_H
