#include "test_script.h"

class Test: public TestScript
{
public:
    double foo(int a, double b)
    {
        return a + b + 1;
    }

    int bar(int a)
    {
        return a * 100;
    }
};
