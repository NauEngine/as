//
// Created by Alex Zelenshikov on 09.05.2024.
//

#include <cstdarg>
#include <cstdio>

#include "squirrel/include/squirrel.h"
#include "squirrel/include/sqstdio.h"
#include "squirrel/include/sqstdaux.h"

#ifdef SQUNICODE

#define scvprintf vfwprintf
#else

#define scvprintf vfprintf
#endif

void printfunc(HSQUIRRELVM v,const SQChar *s,...)
{
    va_list vl;
    va_start(vl, s);
    scvprintf(stdout, s, vl);
    va_end(vl);
}

void errorfunc(HSQUIRRELVM v,const SQChar *s,...)
{
    va_list vl;
    va_start(vl, s);
    scvprintf(stderr, s, vl);
    va_end(vl);
}

void call_foo(HSQUIRRELVM sq_vm, int n, float f, const SQChar *s)
{
    SQInteger top = sq_gettop(sq_vm); //saves the stack size before the call
    sq_pushroottable(sq_vm); //pushes the global table
    sq_pushstring(sq_vm, _SC("foo"), -1);

    if (SQ_SUCCEEDED(sq_get(sq_vm, -2)))
    { //gets the field 'foo' from the global table
        sq_pushroottable(sq_vm); //push the 'this' (in this case is the global table)
        sq_pushinteger(sq_vm, n);
        sq_pushfloat(sq_vm, f);
        sq_pushstring(sq_vm, s, -1);
        sq_call(sq_vm, 4, SQFalse, SQTrue); //calls the function
    }

    sq_settop(sq_vm, top); //restores the original stack size
}

int main()
{
    HSQUIRRELVM sq_vm = sq_open(1024); // creates a VM with initial stack size 1024

    //REGISTRATION OF STDLIB
    //sq_pushroottable(v); //push the root table where the std function will be registered
    //sqstd_register_iolib(v);  //registers a library
    // ... call here other stdlibs string,math etc...
    //sq_pop(v,1); //pops the root table
    //END REGISTRATION OF STDLIB

    sqstd_seterrorhandlers(sq_vm); //registers the default error handlers

    sq_setprintfunc(sq_vm, printfunc, errorfunc); //sets the print function

    sq_pushroottable(sq_vm); //push the root table(were the globals of the script will be stored)

    if (SQ_SUCCEEDED(sqstd_dofile(sq_vm, _SC("../../sandbox/scripts/test.nut"), SQFalse, SQTrue))) // also prints syntax errors if any
    {
        call_foo(sq_vm, 1, 2.5, _SC("teststring"));
    }

    sq_pop(sq_vm, 1); //pops the root table

    sq_close(sq_vm);

    return 0;
}