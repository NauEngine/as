//
// Created by Alex Zelenshikov on 19.03.2024.
//

#ifdef __cplusplus
extern "C" {
#endif

#include "lua_core.h"

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
#include "lua/ldo.c"  // [AZ] TODO
#include "lua/lmathlib.c"   // [AZ] TODO

#ifdef __cplusplus
}
#endif
