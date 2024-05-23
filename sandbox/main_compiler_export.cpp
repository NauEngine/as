//
// Created by ivn on 22.05.2024.
//
extern "C" void registerInterface(const char* name, void* vtable);

static int foo(void* p, int a, int b)
{
    return a + b;
}

struct Interface
{
    void* m_foo;
};

struct RegisterInterface
{
    RegisterInterface(Interface& i)
    {
        registerInterface("______sandbox_scripts_test_1_is_13297541326829458225", (void*)&i);
    }
};

Interface i({ (void*)&foo });
RegisterInterface r(i);

