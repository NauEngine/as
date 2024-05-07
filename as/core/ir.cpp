//
// Created by Alex Zelenshikov on 07.05.2024.
//

#include "llvm/IR/IRBuilder.h"

namespace as::ir
{
  llvm::FunctionType* buildInterfaceMethodType(llvm::FunctionType* signature, llvm::PointerType* interface_ptr_t)
  {
    llvm::Type* ret_type = signature->getReturnType();
    std::vector<llvm::Type*> args(signature->getNumParams() + 1);
    args[0] = interface_ptr_t;
    for (int i = 0; i < signature->getNumParams(); ++i)
    {
      args[i + 1] = signature->getParamType(i);
    }

    return llvm::FunctionType::get(ret_type, args, false);
  }
} // namespace as::ir