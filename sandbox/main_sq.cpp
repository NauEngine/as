//
// Created by Alex Zelenshikov on 09.05.2024.
//

#include <cstdarg>
#include <cstdio>
#include <iostream>

#include "squirrel/include/squirrel.h"
#include "squirrel/include/sqstdio.h"
#include "squirrel/include/sqstdaux.h"

void printfunc(HSQUIRRELVM v,const SQChar *s,...)
{
    va_list vl;
    va_start(vl, s);
    vfprintf(stdout, s, vl);
    va_end(vl);
}

void errorfunc(HSQUIRRELVM v,const SQChar *s,...)
{
    va_list vl;
    va_start(vl, s);
    vfprintf(stderr, s, vl);
    va_end(vl);
}

SQInteger call_foo(HSQUIRRELVM sq_vm, HSQOBJECT func, int a, int b)
{
    const SQInteger top = sq_gettop(sq_vm);

    sq_pushobject(sq_vm, func);
    sq_pushroottable(sq_vm); //push the 'this' (in this case is the global table)
    sq_pushinteger(sq_vm, a);
    sq_pushinteger(sq_vm, b);
    sq_call(sq_vm, 3, SQTrue, SQTrue); //calls the function

    SQInteger result;
    if (!SQ_SUCCEEDED(sq_getinteger(sq_vm, -1, &result)))
    {
        result = -1;
    }
    sq_settop(sq_vm, top); //restores the original stack size

    return result;
}

void saveFunction(HSQUIRRELVM sq_vm, HSQOBJECT& base_func, HSQOBJECT& func, const char* name)
{
    const SQInteger top = sq_gettop(sq_vm);

    sq_pushobject(sq_vm, base_func);
    sq_pushroottable(sq_vm);

    if (SQ_SUCCEEDED(sq_call(sq_vm, 1, SQFalse,SQTrue)))
    {
        sq_pushroottable(sq_vm);
        sq_pushstring(sq_vm, _SC(name), -1);

        if (SQ_SUCCEEDED(sq_get(sq_vm, -2)))
        {
            sq_getstackobj(sq_vm, -1, &func);
            sq_addref(sq_vm, &func);
        }
    }

    sq_settop(sq_vm, top);
}

SQRESULT loadScript(HSQUIRRELVM sq_vm, HSQOBJECT& base_func, const char* file)
{
    const SQInteger top = sq_gettop(sq_vm);

    //at least one entry must exist in order for us to push it as the environment
    if (top == 0)
    {
        return sq_throwerror(sq_vm, _SC("environment table expected"));
    }

    if (SQ_SUCCEEDED(sqstd_loadfile(sq_vm, file, SQTrue)))
    {
        if (SQ_SUCCEEDED(sq_getstackobj(sq_vm, -1, &base_func)))
        {
            sq_addref(sq_vm, &base_func);
            return 1;
        }
    }

    return SQ_ERROR;
}

int main()
{
    HSQUIRRELVM sq_vm = sq_open(1024); // creates a VM with initial stack size 1024
    sqstd_seterrorhandlers(sq_vm); //registers the default error handlers
    sq_setprintfunc(sq_vm, printfunc, errorfunc); //sets the print function

    sq_pushroottable(sq_vm); //push the root table(were the globals of the script will be stored)

    HSQOBJECT base_funcs[2];
    HSQOBJECT funcs[2];

    bool test_1_loaded = SQ_SUCCEEDED(loadScript(sq_vm, base_funcs[0], "../../sandbox/scripts/test_1.nut"));
    saveFunction(sq_vm, base_funcs[0], funcs[0], "foo");
    std::cout.flush();
    bool test_2_loaded = SQ_SUCCEEDED(loadScript(sq_vm, base_funcs[1], "../../sandbox/scripts/test_2.nut"));
    saveFunction(sq_vm, base_funcs[1], funcs[1], "foo");
    std::cout.flush();

    if (test_1_loaded && test_2_loaded)
    {
        std::cout << " Test 1 (foo) -> " << call_foo(sq_vm, funcs[0], 1, 2) << std::endl;
        std::cout << " Test 2 (foo) -> " << call_foo(sq_vm, funcs[1], 1, 2) << std::endl;
        std::cout << " Test 1 (foo) -> " << call_foo(sq_vm, funcs[0], 1, 2) << std::endl;
        std::cout << " Test 2 (foo) -> " << call_foo(sq_vm, funcs[1], 1, 2) << std::endl;
    }

    sq_pop(sq_vm, 1); //pops the root table

    sq_close(sq_vm);

    return 0;
}