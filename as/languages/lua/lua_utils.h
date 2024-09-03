//
// Created by Alex Zelenshikov on 06.05.2024.
//

#ifndef LUA_UTILS_H
#define LUA_UTILS_H

struct lua_State;
struct Proto;

namespace as
{

class LuaLocalState
{
public:
    explicit LuaLocalState();
    ~LuaLocalState();

    [[nodiscard]] lua_State* get() const { return m_luaState; }

private:
    lua_State* m_luaState = nullptr;
};

class LuaStackGuard
{
public:
  explicit LuaStackGuard(lua_State* lua_state);
  ~LuaStackGuard();

  LuaStackGuard(const LuaStackGuard&) = delete;
  LuaStackGuard& operator=(const LuaStackGuard&) = delete;

private:
  lua_State* const lua_state;
  const int top;
};

void printLuaFunction(const Proto* f, bool full);

} //namespace as


#endif //LUA_UTILS_H
