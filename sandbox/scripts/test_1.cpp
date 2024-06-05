class Test
{
public:
    __attribute__((used)) double foo(int a, double b)
    {
        return a + b;
    }

    int bar(int a)
    {
        return a * 10;
    }
};
