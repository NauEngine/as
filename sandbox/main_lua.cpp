#include <iostream>

extern "C"
{
#include "lua/lua.h"
#include "lua/lauxlib.h"
#include "lua/lualib.h"
}

int main()
{
  lua_State *l = luaL_newstate();
  luaL_openlibs(l);

  /* load script */
  luaL_dofile(l, "../../sandbox/scripts/test.lua");

  /* call mood() provided by script */
  lua_getglobal(l, "update");
  lua_call(l, 0, 0);
  lua_getglobal(l, "update");
  lua_call(l, 0, 0);
  lua_getglobal(l, "update");
  lua_call(l, 0, 0);
  lua_getglobal(l, "update");
  lua_call(l, 0, 0);


  lua_close(l);
  return 0;
}
