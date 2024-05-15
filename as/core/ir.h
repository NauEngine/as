//
// Created by Alex Zelenshikov on 26.04.2024.
//

#ifndef AS_PROTO_IR_BUILD_HELPERS_H
#define AS_PROTO_IR_BUILD_HELPERS_H

#include <format>

#include "as.h"

namespace as::ir
{
  static std::string instance_module_name(const std::string& instance_name)
  {
    return "__instance_" + instance_name;
  }

  static std::string interface_module_name(const std::string& safe_name, const std::string& type_name)
  {
    return std::format("__{}_module_{}", safe_name, type_name);
  }

  static std::string interface_type_name(const std::string& type_name)
  {
    return std::format("__interface_type_{}", type_name);
  }

  static std::string interface_vtable_type_name(const std::string& type_name)
  {
    return std::format("__interface_vtbl_type_{}", type_name);
  }

  static std::string interface_vtable_name(const std::string& safe_name, const std::string& type_name)
  {
    return std::format("__{}_vtable_{}", safe_name, type_name);
  }

  static std::string safe_name(const std::string& filename)
  {
    std::string result(filename);
    for(auto & it : result) {
        if (!isalnum(it))
            it = '_';
    }

    std::hash<std::string> hasher;
    return result + '_' + std::to_string(hasher(filename));
  }

  // converts c++ interface signature into inner method type by adding 'this' pointer as first arg
  llvm::FunctionType* buildInterfaceMethodType(llvm::FunctionType* method_t, llvm::PointerType* interface_ptr_t);

} // namespace as

#endif //AS_PROTO_IR_BUILD_HELPERS_H
