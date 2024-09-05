//
// Created by Alex Zelenshikov on 04.09.2024.
//

#include "as/core/core.h"

extern "C"
{
#include "lua/lauxlib.h"
#include "lua/ldebug.h"
#include "lua/ldo.h"
#include "lua/lfunc.h"
#include "lua/lobject.h"
#include "lua/lopcodes.h"
#include "lua/lstate.h"
#include "lua/lstring.h"
}

#include "lua_module_entry.h"

void __force_link_module_entry() {}

void prepare_metatable(as::Core* core, lua_State *L, const InstanceMetatable* metatable)
{
    luaL_newmetatable(L, metatable->name);

    lua_pushvalue(L, -1);
    lua_setfield(L, -2, "__index");

    luaL_register(L, NULL, metatable->methods);

    const void** udata = static_cast<const void**>(lua_newuserdata(L, sizeof(void*)));
    *udata = core->requireInstance(metatable->instance_name);

    luaL_getmetatable(L, metatable->name);
    lua_setmetatable(L, -2);

    lua_setglobal(L, metatable->instance_name);
}

void prepare_metatables(as::Core* core, lua_State *L, const InstanceMetatableList* metatables)
{
    for (int i = 0; i < metatables->num_metatables; ++i)
    {
        prepare_metatable(core, L, &metatables->metatables[i]);
    }
}

void prepare_strings(lua_State *L, const FunctionTree* ftree)
{
    for (int i = 0; i < ftree->sizek; ++i)
    {
        if (ftree->k_strings[i].size > 0)
        {
            TValue* o = &ftree->k[i];
            setsvalue2n(L, o, luaS_newlstr(L, ftree->k_strings[i].string, ftree->k_strings[i].size));
        }
    }

    for (int i = 0; i < ftree->num_children; ++i)
    {
        prepare_strings(L, ftree->children + i);
    }
}

extern "C" void module_entry_point(as::Core* core, lua_State *L, FunctionTree* ftree_root, InstanceMetatableList* metatable_list)
{
    prepare_strings(L, ftree_root);
    prepare_metatables(core, L, metatable_list);

    Closure* closure = luaF_newJclosure(L, ftree_root->num_upvalues, hvalue(gt(L)));
    closure->j.func = ftree_root;
    for (int i = 0; i < ftree_root->num_upvalues; ++i)
    {
        closure->l.upvals[i] = luaF_newupval(L);
    }
    setclvalue(L, L->top, closure);
    incr_top(L);
    lua_call(L, 0, LUA_MULTRET);
}

extern "C" void push_global_closure(lua_State *L, FunctionTree* ftree_root, int closure_id)
{
    Closure* cl = ftree_root->closures[closure_id];
    setclvalue(L, L->top, cl);
    incr_top(L);
}
