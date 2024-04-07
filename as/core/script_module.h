//
// Created by Alex Zelenshikov on 21.03.2024.
//

#ifndef AS_PROTO_SCRIPT_MODULE_H
#define AS_PROTO_SCRIPT_MODULE_H

namespace as
{

  class IScriptModule
  {
  public:
    virtual ~IScriptModule() = default;

    virtual void RunScript() = 0;
    virtual void RunFunction() = 0;

    // TODO [AZ] add function signature
    virtual void setInterface(const std::vector<std::string>& func_names) = 0;
    virtual void load(const std::string& filename) = 0;

    virtual llvm::Expected<std::string> getEntryPointAlias() = 0;
    virtual llvm::Expected<std::string> getFunctionAlias(const std::string& func_name) = 0;

    //virtual void InsertModuleInto(llvm::orc::LLJIT* jit) = 0;
  };

} // as

#endif //AS_PROTO_SCRIPT_MODULE_H
