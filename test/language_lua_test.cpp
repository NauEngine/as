//
// Created by ivn on 20.06.2024.
//

#include <gtest/gtest.h>

#include "as/core/core.h"
#include "as/languages/lua/lua_language.h"

#include "./scripts/simple_script.h"
#include "./scripts/integer_script.h"
#include "./scripts/double_script.h"

class LanguageLuaTest : public testing::Test
{
protected:
    LanguageLuaTest() :
        m_core(std::make_unique<as::Core>("../../test/scripts"))
    {
        auto language = std::make_shared<as::LuaLanguage>();
        m_core->registerLanguage("lua", std::move(language));
    }

    ~LanguageLuaTest() override = default;

    as::Core& getCore()
    {
        return *m_core;
    }

private:
    std::unique_ptr<as::Core> m_core;
};

TEST_F(LanguageLuaTest, LanguageLuaSimpleTest)
{
    auto module = getCore().newScriptModule<SimpleScript>("simple_script.lua");
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    EXPECT_EQ(instance->foo(), 42);
}

TEST_F(LanguageLuaTest, LanguageLuaIntegerTest)
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

TEST_F(LanguageLuaTest, LanguageLuaDoubleTest)
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
