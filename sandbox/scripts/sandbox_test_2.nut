local counter = 100;

function foo(a, b)
{
    counter = counter + 100;
    return a + b + 200000 + counter;
}

function bar(a)
{
    return a * 200000;
}

print("Load test 2\n")