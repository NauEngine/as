#define DEFINE_SCRIPT_INTERFACE(Type, I) I

DEFINE_SCRIPT_INTERFACE(TestScript,
struct TestScript
{
    virtual double foo(int a, double b) = 0;
    virtual int bar(int a) = 0;
};
)

class Test: public TestScript
{
public:
    double foo(int a, double b)
    {
        return a + b;
    }

    int bar(int a)
    {
        return a * 10;
    }
};
