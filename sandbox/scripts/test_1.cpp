#include "test_script.h"

class Test: public TestScript
{
public:
    double foo(int a, double b) override
    {
        return a + b;
    }

    int bar(int a) override
    {
        return a * 10;
    }
};
