//
// Created by Alex Zelenshikov on 20.03.2024.
//

#ifndef AS_PROTO_LUA_CORE_H
#define AS_PROTO_LUA_CORE_H

#ifdef __cplusplus
extern "C" {
#endif

#define lua_c
#define loslib_c
#define LUA_CORE

#include "lua/lua.h"
/* extern all lua Core functions. */
#undef LUAI_FUNC
#define LUAI_FUNC extern

#ifdef __cplusplus
}
#endif

#endif //AS_PROTO_LUA_CORE_H
