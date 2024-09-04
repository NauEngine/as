#include "as/core/cpp_interface.h"

DEFINE_SCRIPT_INTERFACE(Logger,
    virtual void warn(int a, int b) = 0;
    virtual void debug(int a, int b) = 0;
)
