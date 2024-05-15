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

  llvm::GlobalVariable* buildGlobalString(llvm::LLVMContext& context, llvm::Module* module, const std::string& name, const std::string& value)
  {
    llvm::Constant* strConstant = llvm::ConstantDataArray::getString(context, value, true);
    llvm::Type* int8_t = llvm::Type::getInt8Ty(context);

    llvm::ArrayType* array_t = llvm::ArrayType::get(int8_t, value.size() + 1);

    return new llvm::GlobalVariable(*module, array_t, true, llvm::GlobalValue::PrivateLinkage, strConstant, name);
  }
} // namespace as::ir