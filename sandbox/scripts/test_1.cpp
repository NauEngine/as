struct TestScript
{
    virtual double foo(int a, double b) = 0;
    virtual int bar(int a) = 0;
};

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
