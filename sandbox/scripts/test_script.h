DEFINE_SCRIPT_INTERFACE(TestScript,
struct TestScript
{
    virtual double foo(int a, double b) = 0;
    virtual int bar(int a) = 0;
};
)