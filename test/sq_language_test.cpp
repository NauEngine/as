//
// Created by ivn on 21.06.2024.
//

#include <gtest/gtest.h>

#include "as/core/core.h"
#include "as/languages/squirrel/sq_language.h"

#include "features_test_fixture.h"

static const char* CODE_SIMPLE_42 = R"(
# implements "simple.h"

function foo()
{
    return 42;
}
)";

static const char* CODE_SIMPLE_4242 = R"(
# implements "simple.h"

function foo()
{
    return 4242;
}
)";

static const char* CODE_INTEGER = R"(
# implements "integer.h"

function pass(a)
{
    return a;
}

function mul(a, b)
{
    return a * b;
}

function add(a, b, c)
{
    return a + b + c;
}
)";

static const char* CODE_DOUBLE = R"(
# implements "double.h"

function pass(a)
{
    return a;
}

function mul(a, b)
{
    return a * b;
}

function add(a, b, c)
{
    return a + b + c;
}
)";

static const char* CODE_SET_GET_GLOBAL = R"(
# implements "set_get.h"

local value = 0;

function set(v)
{
    value = v;
}

function get()
{
    return value;
}
)";

class SquirrelLanguageTest : public FeaturesTestFixture
{
protected:
    const char* getLanguageName() const override
    {
        return "nut";
    }

    std::shared_ptr<as::ILanguage> createLanguage() const override
    {
        return std::make_shared<as::SquirrelLanguage>();
    }

    std::shared_ptr<as::ILanguageRuntime> createRuntime() const override
    {
        return nullptr;
    }
};

TEST_F(SquirrelLanguageTest, SimpleTest)
{
    doSimpleTest(CODE_SIMPLE_42);
}

TEST_F(SquirrelLanguageTest, IntegerTest)
{
    doIntegerTest(CODE_INTEGER);
}

TEST_F(SquirrelLanguageTest, DoubleTest)
{
    doDoubleTest(CODE_DOUBLE, TreatDouble::AsFloat);
}

TEST_F(SquirrelLanguageTest, GlobalVarTest)
{
    doGlobalVarTest(CODE_SET_GET_GLOBAL);
}

TEST_F(SquirrelLanguageTest, ModulesTest)
{
    doModulesTest(CODE_SIMPLE_42, CODE_SIMPLE_4242);
}

TEST_F(SquirrelLanguageTest, HotReloadTest)
{
    doHotReloadTest(CODE_SIMPLE_42, CODE_SIMPLE_4242);
}

TEST_F(SquirrelLanguageTest, CompileStaticInitTest)
{
    doCompileStaticInitTest(CODE_SIMPLE_42);
}
