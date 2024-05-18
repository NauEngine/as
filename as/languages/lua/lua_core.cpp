//
// Created by Alex Zelenshikov on 19.03.2024.
//

#ifdef __cplusplus
extern "C" {
#endif

#include "lua_core.h"
#include "lua/lobject.h"


void llvm_newproto (lua_State *L, Proto *f);
void llvm_freeproto (lua_State *L, Proto *f);
int llvm_precall_jit (lua_State *L, StkId func, int nresults);
int llvm_precall_lua (lua_State *L, StkId func, int nresults);

extern void llvm_compiler_compile(lua_State *L, Proto *p);
extern void llvm_compiler_compile_all(lua_State *L, Proto *p);
extern void llvm_compiler_free(lua_State *L, Proto *p);


/* functions */
#define JIT_NEWPROTO(L,f) llvm_newproto(L,f)
#define JIT_FREEPROTO(L,f) llvm_freeproto(L,f)
#define JIT_PRECALL llvm_precall_lua

#include "lua/lapi.c"
#include "lua/lcode.c"
#include "lua/ldebug.c"
#include "lua/ldump.c"
#include "lua/lfunc.c"
#include "lua/lgc.c"
#include "lua/llex.c"
#include "lua/lmem.c"
#include "lua/lobject.c"
#include "lua/lopcodes.c"
#include "lua/lparser.c"
#include "lua/lstate.c"
#include "lua/lstring.c"
#include "lua/ltable.c"
#include "lua/ltm.c"
#include "lua/lundump.c"
#include "lua/lvm.c"
#include "lua/lzio.c"

#include "lua/lbaselib.c"
#include "lua/lcoco.c"
#include "lua/ldblib.c"
#include "lua/liolib.c"
#include "lua/linit.c"
#include "lua/loadlib.c"
#include "lua/loslib.c"
#include "lua/lstrlib.c"
#include "lua/ltablib.c"

#include "lua/lauxlib.c"


//#include "llvm_lmathlib.c" // [AZ] TODO
#include "lua/lmathlib.c"   // [AZ] TODO

// Hook lua loading
#define luaD_protectedparser luaD_protectedparser_original
#include "lua/ldo.c"
#undef luaD_protectedparser

#include "lua_hooks.cpp"

void llvm_newproto (lua_State *L, Proto *f) {
    (void)L;
    f->jit_func = NULL;
}

void llvm_freeproto (lua_State *L, Proto *f) {
    llvm_compiler_free(L, f);
}

#ifdef __cplusplus
}
#endif
