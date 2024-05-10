//
// Created by Alex Zelenshikov on 10.05.2024.
//

#include "squirrel/include/squirrel.h"
#include "squirrel/include/sqstdio.h"
#include "squirrel/include/sqstdaux.h"

extern "C"
{

void sq_pushobject_apapter(HSQUIRRELVM sq_vm, HSQOBJECT* func)
{
    sq_pushobject(sq_vm, *func);
}

}

SQInteger call_foo(HSQUIRRELVM sq_vm, HSQOBJECT* func, int a, double b)
{
    sq_pushobject(sq_vm, *func);
    sq_pushroottable(sq_vm); //push the 'this' (in this case is the global table)
    sq_pushinteger(sq_vm, a);
    sq_pushfloat(sq_vm, b);
    sq_call(sq_vm, 3, SQTrue, SQTrue); //calls the function

    SQInteger result;
    sq_getinteger(sq_vm, -1, &result);

    return result;
}
