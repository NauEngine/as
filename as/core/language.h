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
  struct ILanguage
  {
    virtual ~ILanguage() = default;

    /**
    * @brief    Returns language specific prefix for symbols inside IR
    * @return   Prefix
    */
    virtual const char* prefix() = 0;

    /**
    * @brief    Builds language specific IR function which emulates c++ interface
    * @param    [in] signature  IR signature of C++ interface method
    * @param    [in] name       Method name
    * @param    [in] context    LLVM context
    * @param    [in] module     LLVM module to insert function into
    * @return                   Pointer to IR function inside Module
    */
    virtual llvm::Function* buildFunction(llvm::FunctionType* signature, const std::string& name,
                                          llvm::LLVMContext& context, llvm::Module* module) = 0;
  };
} // namespace as


#endif //LANGUAGE_H
