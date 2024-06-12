# implements "test_script.h"

local counter = 0;

function foo(a, b)
{
    counter = counter + 1;
    return a + b + 100000 + counter;
}

function bar(a)
{
    return a * 100000;
}

print("Load test 1\n")