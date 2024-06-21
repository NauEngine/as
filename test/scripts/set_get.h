#pragma once

DEFINE_SCRIPT_INTERFACE(SetGetScript,
    virtual int get() = 0;
    virtual void set(int value) = 0;
)
