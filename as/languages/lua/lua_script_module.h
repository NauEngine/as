//
// Created by Alex Zelenshikov on 21.03.2024.
//

#ifndef AS_PROTO_LUA_SCRIPT_MODULE_H
#define AS_PROTO_LUA_SCRIPT_MODULE_H

#include "as/core/script_module.h"

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

#endif //AS_PROTO_LUA_SCRIPT_MODULE_H
