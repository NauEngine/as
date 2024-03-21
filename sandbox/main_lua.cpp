#include <iostream>

#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/ManagedStatic.h"

#include "LLVMCompiler.h"

extern "C"
{
#include "lua/lobject.h"
#include "lua/lua.h"
#include "lua/lauxlib.h"
#include "lua/lualib.h"
#include "lua/lstate.h"
}

#define toproto(L,i) (clvalue(L->top+(i))->l.p)

int main()
{
  llvm::llvm_shutdown_obj llvm_shutdown;   // Call llvm_shutdown() on exit.

  llvm::InitializeAllTargets();
  llvm::InitializeAllTargetMCs();
  llvm::InitializeAllAsmPrinters();
  llvm::InitializeAllAsmParsers();


  as::LLVMCompiler compiler(true);
  compiler.SetDumpCompiled(true);

  lua_State *l = luaL_newstate();
  luaL_openlibs(l);

  luaL_loadfile(l, "../../sandbox/scripts/test.lua");

  Proto* p = toproto(l, -1);

  compiler.Compile(l, p);

  lua_pcall(l, 0, LUA_MULTRET, 0);

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
