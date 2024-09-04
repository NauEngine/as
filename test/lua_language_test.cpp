//
// Created by ivn on 20.06.2024.
//

#include <gtest/gtest.h>

#include "as/core/core.h"
#include "as/languages/lua/lua_language.h"
#include "as/languages/lua/lua_language_runtime.h"

#include "features_test_fixture.h"

static const char* CODE_SIMPLE_42 = R"(
-- implements "simple.h"

function foo()
    return 42
end
)";

static const char* CODE_SIMPLE_4242 = R"(
-- implements "simple.h"

function foo()
    return 4242
end
)";

static const char* CODE_SIMPLE_EXTERNAL = R"(
-- implements "simple.h"
-- require external implements "set_get.h"

function foo()
    external:set(42)
    return external:get()
end
)";

static const char* CODE_INTEGER = R"(
-- implements "integer.h"

function pass(a)
    return a
end

function mul(a, b)
    return a * b
end

function add(a, b, c)
    return a + b + c
end
)";

static const char* CODE_DOUBLE = R"(
-- implements "double.h"

function pass(a)
    return a
end

function mul(a, b)
    return a * b
end

function add(a, b, c)
    return a + b + c
end
)";

static const char* CODE_SET_GET_GLOBAL = R"(
-- implements "set_get.h"

value = 0;

function set(v)
    value = v
end

function get()
    return value
end
)";

class LuaLanguageTest : public FeaturesTestFixture
{
protected:
    const char* getLanguageName() const override
    {
        return "lua";
    }

    std::shared_ptr<as::ILanguage> createLanguage() const override
    {
        return std::make_shared<as::LuaLanguage>();
    }

    std::shared_ptr<as::ILanguageRuntime> createRuntime() const override
    {
        return std::make_shared<as::LuaLanguageRuntime>();
    }

    const char* getSimpleScript42() const override { return CODE_SIMPLE_42; }
    const char* getSimpleScript4242() const override { return CODE_SIMPLE_4242; }
    const char* getSimpleExternalScript() const override { return CODE_SIMPLE_EXTERNAL; }
    const char* getIntegerScript() const override { return CODE_INTEGER; }
    const char* getDoubleScript() const override { return CODE_DOUBLE; }
    const char* getSetGetGlobalScript() const override { return CODE_SET_GET_GLOBAL; }
};

TEST_F(LuaLanguageTest, SimpleTest)
{
    doSimpleTest();
}

TEST_F(LuaLanguageTest, IntegerTest)
{
    doIntegerTest();
}

TEST_F(LuaLanguageTest, DoubleTest)
{
    doDoubleTest(TreatDouble::AsDouble);
}

TEST_F(LuaLanguageTest, ExternalObjTest)
{
    doExternalObjTest();
}

TEST_F(LuaLanguageTest, GlobalVarTest)
{
    doGlobalVarTest();
}

TEST_F(LuaLanguageTest, ModulesTest)
{
    doModulesTest();
}

TEST_F(LuaLanguageTest, HotReloadTest)
{
    doHotReloadTest();
}

TEST_F(LuaLanguageTest, CompileStaticInitTest)
{
    doCompileStaticInitTest();
}

TEST_F(LuaLanguageTest, CompileLinkTest)
{
    doCompileLinkTest();
}
