//
// Created by Alex Zelenshikov on 26.04.2024.
//

#ifndef AS_PROTO_IR_BUILD_HELPERS_H
#define AS_PROTO_IR_BUILD_HELPERS_H

#include <format>

namespace as::ir
{
  static std::string instance_module_name(const std::string& instance_name)
  {
    return "__instance_" + instance_name;
  }

  static std::string interface_module_name(const char* prefix, const std::string& type_name)
  {
    return std::format("__{}_module_{}", prefix, type_name);
  }

  static std::string interface_type_name(const char* prefix, const std::string& type_name)
  {
    return std::format("__{}_interface_{}", prefix, type_name);
  }

  static std::string interface_vtable_type_name(const char* prefix, const std::string& type_name)
  {
    return std::format("__{}_vtable_type_{}", prefix, type_name);
  }

  static std::string interface_vtable_name(const char* prefix, const std::string& type_name)
  {
    return std::format("__{}_vtable_{}", prefix, type_name);
  }
} // namespace as

#endif //AS_PROTO_IR_BUILD_HELPERS_H
