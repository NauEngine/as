//
// Created by ivn on 21.06.2024.
//

#include <gtest/gtest.h>

#include "as/core/core.h"
#include "as/languages/cpp/cpp_language.h"

#include "features_test_fixture.h"

static const char* CODE_SIMPLE_42 = R"(
#include "simple.h"

class Test42: public SimpleScript
{
public:
    int foo()
    {
        return 42;
    }
};
)";

static const char* CODE_SIMPLE_4242 = R"(
#include "simple.h"

class Test42: public SimpleScript
{
public:
    int foo()
    {
        return 4242;
    }
};
)";

static const char* CODE_INTEGER = R"(
#include "integer.h"

class TestInteger: public IntegerScript
{
public:
    int pass(int arg) override
    {
        return arg;
    }

    int mul(int arg1, int arg2) override
    {
        return arg1 * arg2;
    }

    int add(int arg1, int arg2, int arg3) override
    {
        return arg1 + arg2 + arg3;
    }
};
)";

static const char* CODE_DOUBLE = R"(
#include "double.h"

class TestDouble: public DoubleScript
{
public:
    double pass(double arg) override
    {
        return arg;
    }

    double mul(double arg1, double arg2) override
    {
        return arg1 * arg2;
    }

    double add(double arg1, double arg2, double arg3) override
    {
        return arg1 + arg2 + arg3;
    }
};
)";

static const char* CODE_SET_GET_GLOBAL = R"(
#include "set_get.h"

static int g_value = 0;

class TestGlobal: public SetGetScript
{
public:
    int get() override
    {
        return g_value;
    }

    void set(int value) override
    {
        g_value = value;
    }
};
)";

class CppLanguageTest : public FeaturesTestFixture
{
protected:
    const char* getLanguageName() const override
    {
        return "cpp";
    }

    std::shared_ptr<as::ILanguage> createLanguage() const override
    {
        return std::make_shared<as::CppLanguage>();
    }

    std::shared_ptr<as::ILanguageRuntime> createRuntime() const override
    {
        return nullptr;
    }
};

TEST_F(CppLanguageTest, SimpleTest)
{
    doSimpleTest(CODE_SIMPLE_42);
}

TEST_F(CppLanguageTest, IntegerTest)
{
    doIntegerTest(CODE_INTEGER);
}

TEST_F(CppLanguageTest, DoubleTest)
{
    doDoubleTest(CODE_DOUBLE, TreatDouble::AsDouble);
}

TEST_F(CppLanguageTest, GlobalVarTest)
{
    doGlobalVarTest(CODE_SET_GET_GLOBAL);
}

TEST_F(CppLanguageTest, ModulesTest)
{
    doModulesTest(CODE_SIMPLE_42, CODE_SIMPLE_4242);
}

TEST_F(CppLanguageTest, HotReloadTest)
{
    doHotReloadTest(CODE_SIMPLE_42, CODE_SIMPLE_4242);
}

TEST_F(CppLanguageTest, CompileStaticInitTest)
{
    doCompileStaticInitTest(CODE_SIMPLE_42);
}

TEST_F(CppLanguageTest, CompileDebugInfoTest)
{
    doCompileDebugInfoTest(CODE_SIMPLE_42);
}
