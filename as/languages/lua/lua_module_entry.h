//
// Created by Alex Zelenshikov on 04.09.2024.
//

#ifndef LUA_MODULE_ENTRY_H
#define LUA_MODULE_ENTRY_H

#ifdef __cplusplus
extern "C" {
#endif

#include "lua/lauxlib.h"

typedef struct InstanceMetatable
{
    const char* instance_name;
    const char* name;
    luaL_Reg* methods;
} InstanceMetatable;

typedef struct InstanceMetatableList
{
    int num_metatables;
    InstanceMetatable* metatables;
} InstanceMetatableList;

void __force_link_module_entry();

#ifdef __cplusplus
}
#endif

#endif //LUA_MODULE_ENTRY_H
