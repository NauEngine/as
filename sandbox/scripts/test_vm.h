#include "as/core/cpp_interface.h"

DEFINE_SCRIPT_INTERFACE(TestScript,
struct TestScript
{
    virtual int foo(int a, int b) = 0;
    virtual int bar(int a) = 0;
};
)
