//
// Created by Alex Zelenshikov on 21.03.2024.
//

#ifndef AS_PROTO_LUASCRIPTMODULE_H
#define AS_PROTO_LUASCRIPTMODULE_H

#include "as/core/ScriptModule.h"

struct lua_State;

namespace as
{
  class LuaScriptModule : public IScriptModule
  {
  public:
    explicit LuaScriptModule(lua_State* state);

    void RunScript() override;
    void RunFunction() override;

  private:
    lua_State* lua_state = nullptr;
  };
}

#endif //AS_PROTO_LUASCRIPTMODULE_H
