//
// Created by ivn on 20.06.2024.
//

#include <gtest/gtest.h>

#include "as/core/core.h"
#include "as/languages/ivnscript/is_language_runtime.h"
#include "as/languages/ivnscript/is_language.h"

#include "./scripts/simple_script.h"
#include "./scripts/integer_script.h"
#include "./scripts/double_script.h"

class LanguageIvnScriptTest : public testing::Test
{
protected:
    LanguageIvnScriptTest() :
        m_core(std::make_unique<as::Core>("../../test/scripts"))
    {
        auto language = std::make_shared<as::IvnScriptLanguage>();
        m_core->registerLanguage("is", std::move(language));

        auto runtime = std::make_shared<as::IvnScriptLanguageRuntime>("is_integration_test");
        m_core->registerRuntime(std::move(runtime));
    }

    ~LanguageIvnScriptTest() override = default;

    as::Core& getCore()
    {
        return *m_core;
    }

private:
    std::unique_ptr<as::Core> m_core;
};

TEST_F(LanguageIvnScriptTest, LanguageIvnScriptSimpleTest)
{
    auto module = getCore().newScriptModule<SimpleScript>("simple_script.is");
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    EXPECT_EQ(instance->foo(), 42);
}

TEST_F(LanguageIvnScriptTest, LanguageIvnScriptIntegerTest)
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

TEST_F(LanguageIvnScriptTest, LanguageIvnScriptDoubleTest)
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
