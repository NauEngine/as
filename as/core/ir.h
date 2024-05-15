//
// Created by Alex Zelenshikov on 26.04.2024.
//

#ifndef AS_PROTO_IR_BUILD_HELPERS_H
#define AS_PROTO_IR_BUILD_HELPERS_H

#include <format>

#include "as.h"

namespace llvm
{
  class FunctionType;
  class GlobalVariable;
}

namespace as::ir
{
  // TODO AZ add instance wars directly without modules
  static std::string instance_module_name(const std::string& instance_name)
  {
    return "__instance_" + instance_name;
  }

  static std::string native_interface_module_name(const std::string& lang_prefix, const std::string& type_name)
  {
    return std::format("__{}_module_{}", lang_prefix, type_name);
  }

  static std::string interface_module_name(ScriptId script_id, const std::string& type_name)
  {
    return std::format("__{}_module_{}", script_id, type_name);
  }

  static std::string interface_name(const std::string& type_name)
  {
    return std::format("__str_{}", type_name);
  }

  static std::string interface_type_name(const std::string& type_name)
  {
    return std::format("__interface_type_{}", type_name);
  }

  static std::string interface_vtable_type_name(const std::string& type_name)
  {
    return std::format("__interface_vtbl_type_{}", type_name);
  }

  static std::string interface_vtable_name(ScriptId script_id, const std::string& type_name)
  {
    return std::format("__{}_vtable_{}", script_id, type_name);
  }

  // converts c++ interface signature into inner method type by adding 'this' pointer as first arg
  llvm::FunctionType* buildInterfaceMethodType(llvm::FunctionType* method_t, llvm::PointerType* interface_ptr_t);
  llvm::GlobalVariable* buildGlobalString(llvm::LLVMContext& context, llvm::Module* module, const std::string& name, const std::string& value);
} // namespace as

#endif //AS_PROTO_IR_BUILD_HELPERS_H
