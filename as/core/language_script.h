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
  * @param    [in] interface_name Name of interface
  * @param    [in] function_name Name of function
  * @param    [in] context    LLVM context
  * @param    [in] module     LLVM module to insert function into
  * @return                   Pointer to IR function inside Module
  */
  virtual llvm::Function* buildFunction(
      llvm::FunctionType* signature,
      const std::string& interface_name,
      const std::string& function_name,
      llvm::LLVMContext& context,
      llvm::Module* module) = 0;
};

} // namespace as


#endif //LANGUAGE_SCRIPT_H
