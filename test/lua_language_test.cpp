//
// Created by ivn on 20.06.2024.
//

#include <gtest/gtest.h>

#include "as/core/core.h"
#include "as/languages/lua/lua_language.h"

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
        return nullptr;
    }
};

TEST_F(LuaLanguageTest, SimpleTest)
{
    doSimpleTest(CODE_SIMPLE_42);
}

TEST_F(LuaLanguageTest, IntegerTest)
{
    doIntegerTest(CODE_INTEGER);
}

TEST_F(LuaLanguageTest, DoubleTest)
{
    doDoubleTest(CODE_DOUBLE, false);
}

TEST_F(LuaLanguageTest, ExternalObjTest)
{
    doExternalObjTest(CODE_SIMPLE_EXTERNAL);
}

TEST_F(LuaLanguageTest, GlobalVarTest)
{
    doGlobalVarTest(CODE_SET_GET_GLOBAL);
}

TEST_F(LuaLanguageTest, HotReloadTest)
{
    doHotReloadTest(CODE_SIMPLE_42, CODE_SIMPLE_4242);
}
