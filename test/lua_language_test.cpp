//
// Created by ivn on 20.06.2024.
//

#include <gtest/gtest.h>

#include "as/core/core.h"
#include "as/languages/lua/lua_language.h"

#include "core_test_fixture.h"

#include "./scripts/simple_script.h"
#include "./scripts/integer_script.h"
#include "./scripts/double_script.h"

class LuaLanguageTest : public CoreTestFixture
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
    auto module = getCore().newScriptModule<SimpleScript>("simple_script.lua");
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    EXPECT_EQ(instance->foo(), 42);
}

TEST_F(LuaLanguageTest, IntegerTest)
{
    auto module = getCore().newScriptModule<IntegerScript>("integer_script.lua");
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    EXPECT_EQ(instance->pass(0), 0);
    EXPECT_EQ(instance->pass(42), 42);

    EXPECT_EQ(instance->mul(0, 100), 0);
    EXPECT_EQ(instance->mul(100, 42), 4200);

    EXPECT_EQ(instance->add(0, 1, 2), 3);
    EXPECT_EQ(instance->add(42, 42, 42), 126);
}

TEST_F(LuaLanguageTest, DoubleTest)
{
    auto module = getCore().newScriptModule<DoubleScript>("double_script.lua");
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    EXPECT_DOUBLE_EQ(instance->pass(0), 0);
    EXPECT_DOUBLE_EQ(instance->pass(4.2), 4.2);
    EXPECT_DOUBLE_EQ(instance->pass(4.8), 4.8);

    EXPECT_DOUBLE_EQ(instance->mul(0.5, 100), 50);
    EXPECT_DOUBLE_EQ(instance->mul(100, 4.2), 420);

    EXPECT_DOUBLE_EQ(instance->add(0, 1, 2), 3);
    EXPECT_DOUBLE_EQ(instance->add(42.4, 42.4, 42.4), 127.2);
}
