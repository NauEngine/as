//
// Created by ivn on 20.06.2024.
//

#include <gtest/gtest.h>

#include "as/core/core.h"
#include "as/languages/ivnscript/is_language_runtime.h"
#include "as/languages/ivnscript/is_language.h"

#include "core_test_fixture.h"

#include "./scripts/simple_script.h"
#include "./scripts/integer_script.h"
#include "./scripts/double_script.h"

class IvnScriptLanguageTest : public CoreTestFixture
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
    auto module = getCore().newScriptModule<SimpleScript>("simple_script.is");
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    EXPECT_EQ(instance->foo(), 42);
}

TEST_F(IvnScriptLanguageTest, IntegerTest)
{
    auto module = getCore().newScriptModule<IntegerScript>("integer_script.is");
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

TEST_F(IvnScriptLanguageTest, DoubleTest)
{
    auto module = getCore().newScriptModule<DoubleScript>("double_script.is");
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    EXPECT_EQ(instance->pass(0), 0);
    EXPECT_EQ(instance->pass(4.2), 4);
    EXPECT_EQ(instance->pass(4.8), 4);

    EXPECT_EQ(instance->mul(0.5, 100), 0);
    EXPECT_EQ(instance->mul(100, 4.2), 400);

    EXPECT_EQ(instance->add(0, 1, 2), 3);
    EXPECT_EQ(instance->add(42.4, 42.4, 42.4), 126.0);
}

TEST_F(IvnScriptLanguageTest, ModulesTest)
{
    auto module = getCore().newScriptModule<SimpleScript>("simple_script.is");
    ASSERT_NE(module, nullptr);

    auto module2 = getCore().newScriptModule<SimpleScript>("simple_script2.is");
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    auto instance2 = module2->newInstance();
    ASSERT_NE(instance2, nullptr);

    EXPECT_EQ(instance->foo(), 42);
    EXPECT_EQ(instance2->foo(), 4242);
}
