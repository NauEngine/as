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
  };

} // as

#endif //AS_PROTO_SCRIPT_MODULE_H
