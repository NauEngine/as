//
// Created by ivn on 22.05.2024.
//
static int foo(void* p, int a, int b)
{
    return a + b;
}

struct Interface
{
    void* m_foo;
};

extern "C" Interface ______sandbox_scripts_test_1_is_13297541326829458225({ (void*)&foo });
