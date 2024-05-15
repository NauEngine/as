//
// Created by Alex Zelenshikov on 01.05.2024.
//

#ifndef LANGUAGE_SCRIPT_H
#define LANGUAGE_SCRIPT_H

#include <string>

namespace llvm
{
  class Function;
  class FunctionType;
  class LLVMContext;
  class Module;

  namespace orc
  {
    class LLJIT;
  }
}

namespace as
{

struct ILanguageScript
{
  virtual ~ILanguageScript() = default;

  virtual void load(const std::string& filename) = 0;

  virtual void prepareModule(llvm::LLVMContext& context, llvm::Module* module) = 0;

    /**
  * @brief    Builds language specific IR function which emulates c++ interface
  * @param    [in] signature  IR signature of C++ interface method
  * @param    [in] bare_name  Bare name of function in interface
  * @param    [in] jit        LLVM jit engine
  * @param    [in] context    LLVM context
  * @param    [in] module     LLVM module to insert function into
  * @return                   Pointer to IR function inside Module
  */
  virtual llvm::Function* buildFunction(
      llvm::FunctionType* signature,
      const std::string& bare_name,
      const std::shared_ptr<llvm::orc::LLJIT>& jit,
      llvm::LLVMContext& context,
      llvm::Module* module) = 0;
};

} // namespace as


#endif //LANGUAGE_SCRIPT_H
