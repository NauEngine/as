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

    virtual void runScript() = 0;
    virtual void runFunction(const std::string& func) = 0;

    virtual void runFunctionN1(const std::string& func, int n) = 0; // TODO experiment

    // TODO [AZ] add function signature
    virtual void setInterface(const std::vector<std::string>& interface) = 0;
    virtual void load(const std::string& filename) = 0;

    virtual llvm::Expected<std::string> getEntryPointAlias() = 0;
    virtual llvm::Expected<std::string> getFunctionAlias(const std::string& func_name) = 0;

    //virtual void InsertModuleInto(llvm::orc::LLJIT* jit) = 0;
  };

} // as

#endif //AS_PROTO_SCRIPT_MODULE_H
