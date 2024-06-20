#pragma once

DEFINE_SCRIPT_INTERFACE(IntegerScript,
    virtual int pass(int arg) = 0;
    virtual int mul(int arg1, int arg2) = 0;
    virtual int add(int arg1, int arg2, int arg3) = 0;
)
