//
// Created by ivn on 20.06.2024.
//

#include <gtest/gtest.h>

#include "as/core/core.h"
#include "as/languages/ivnscript/is_language_runtime.h"
#include "as/languages/ivnscript/is_language.h"

#include "features_test_fixture.h"

static const char* CODE_SIMPLE_42 = R"(
// implements "simple.h"

function foo()
{
    return 42;
}
)";

static const char* CODE_SIMPLE_4242 = R"(
// implements "simple.h"

function foo()
{
    return 4242;
}
)";

static const char* CODE_INTEGER = R"(
// implements "integer.h"

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
    var x = a + b;
    return x + c;
}
)";

static const char* CODE_DOUBLE = R"(
// implements "double.h"

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
    var x = a + b;
    return x + c;
}
)";

class IvnScriptLanguageTest : public FeaturesTestFixture
{
protected:
    const char* getLanguageName() const override
    {
        return "is";
    }

    std::shared_ptr<as::ILanguage> createLanguage() const override
    {
        return std::make_shared<as::IvnScriptLanguage>();
    }

    std::shared_ptr<as::ILanguageRuntime> createRuntime() const override
    {
        return std::make_shared<as::IvnScriptLanguageRuntime>("langiage_is_test");
    }
};

TEST_F(IvnScriptLanguageTest, SimpleTest)
{
    doSimpleTest(CODE_SIMPLE_42);
}

TEST_F(IvnScriptLanguageTest, IntegerTest)
{
    doIntegerTest(CODE_INTEGER);
}

TEST_F(IvnScriptLanguageTest, DoubleTest)
{
    doDoubleTest(CODE_DOUBLE, TreatDouble::AsInteger);
}

TEST_F(IvnScriptLanguageTest, ModulesTest)
{
    doModulesTest(CODE_SIMPLE_42, CODE_SIMPLE_4242);
}

TEST_F(IvnScriptLanguageTest, HotReloadTest)
{
    doHotReloadTest(CODE_SIMPLE_42, CODE_SIMPLE_4242);
}

TEST_F(IvnScriptLanguageTest, CompileStaticInitTest)
{
    doCompileStaticInitTest(CODE_SIMPLE_42);
}
