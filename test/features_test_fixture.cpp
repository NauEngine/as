//
// Created by ivn on 20.06.2024.
//

#include <fstream>

#include "features_test_fixture.h"

#include <regex>
#include <gmock/gmock-function-mocker.h>

#include "./scripts/simple.h"
#include "./scripts/integer.h"
#include "./scripts/double.h"
#include "./scripts/set_get.h"

static const auto BASE_SCRIPTS_PATH = ".";

template <> const char* getHeaderFileName<SimpleScript>() { return "simple.h"; }
template <> const char* getHeaderFileName<IntegerScript>() { return "integer.h"; }
template <> const char* getHeaderFileName<DoubleScript>() { return "double.h"; }
template <> const char* getHeaderFileName<SetGetScript>() { return "set_get.h"; }

class MockExternalObj : public SetGetScript
{
public:
    MOCK_METHOD(int, get, (), (override));
    MOCK_METHOD(void, set, (int a), (override));
};

FeaturesTestFixture::~FeaturesTestFixture()
{
    for (const auto& file_path: m_temp_files)
    {
        std::error_code ec;
        std::filesystem::remove(file_path, ec);
    }

    m_temp_files.clear();
}

as::Core& FeaturesTestFixture::ensureCore()
{
    if (m_core)
        return *m_core;

    m_core = std::make_unique<as::Core>(BASE_SCRIPTS_PATH);
    m_core->registerLanguage(getLanguageName(), createLanguage());

    if (auto runtime = createRuntime())
        m_core->registerRuntime(std::move(runtime));

    return *m_core;
}

bool FeaturesTestFixture::writeFile(const std::string& file_name, const std::string& content)
{
    const auto dest_file_full_path = std::filesystem::path(BASE_SCRIPTS_PATH) / file_name;

    std::ofstream file(dest_file_full_path);
    file << content;
    file.close();

    m_temp_files.insert(dest_file_full_path);
    return true;
}

bool FeaturesTestFixture::writeHeader(const std::string& file_name, const std::string& code)
{
    std::regex header_update(R"(^\s*struct\s+(\w+)\s+\{([^}]+)\};)", std::regex_constants::ECMAScript);
    auto code_updated = std::regex_replace(code, header_update, "#pragma once\n\nDEFINE_SCRIPT_INTERFACE($1,\n$2\n)");
    return writeFile(file_name, code_updated);
}

std::string FeaturesTestFixture::writeCode(const std::string& file_name, const std::string& code)
{
    const auto full_file_name = file_name + "." + getLanguageName();
    if (!writeFile(full_file_name, code))
        return "";

    return full_file_name;
}

void FeaturesTestFixture::doSimpleTest(const char* code)
{
    writeHeader<SimpleScript>();
    auto script_name = writeCode("test_simple", code);
    ASSERT_FALSE(script_name.empty());

    auto module = ensureCore().newScriptModule<SimpleScript>(script_name);
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    EXPECT_EQ(instance->foo(), 42);
}

void FeaturesTestFixture::doIntegerTest(const char* code)
{
    writeHeader<IntegerScript>();
    auto script_name = writeCode("test_integer", code);
    ASSERT_FALSE(script_name.empty());

    auto module = ensureCore().newScriptModule<IntegerScript>(script_name);
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

void FeaturesTestFixture::doDoubleTest(const char* code, TreatDouble treat_as)
{
    writeHeader<DoubleScript>();
    auto script_name = writeCode("test_double", code);
    ASSERT_FALSE(script_name.empty());

    auto module = ensureCore().newScriptModule<DoubleScript>(script_name);
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    if (treat_as == TreatDouble::AsDouble)
    {
        EXPECT_DOUBLE_EQ(instance->pass(0), 0);
        EXPECT_DOUBLE_EQ(instance->pass(4.2), 4.2);
        EXPECT_DOUBLE_EQ(instance->pass(4.8), 4.8);

        EXPECT_DOUBLE_EQ(instance->mul(0.5, 100), 50);
        EXPECT_DOUBLE_EQ(instance->mul(100, 4.2), 420);

        EXPECT_DOUBLE_EQ(instance->add(0, 1, 2), 3);
        EXPECT_DOUBLE_EQ(instance->add(42.4, 42.4, 42.4), 127.2);
    }
    else if (treat_as == TreatDouble::AsFloat)
    {
        EXPECT_FLOAT_EQ(instance->pass(0), 0);
        EXPECT_FLOAT_EQ(instance->pass(4.2), 4.2);
        EXPECT_FLOAT_EQ(instance->pass(4.8), 4.8);

        EXPECT_FLOAT_EQ(instance->mul(0.5, 100), 50);
        EXPECT_FLOAT_EQ(instance->mul(100, 4.2), 420);

        EXPECT_FLOAT_EQ(instance->add(0, 1, 2), 3);
        EXPECT_FLOAT_EQ(instance->add(42.4, 42.4, 42.4), 127.2);
    } else if (treat_as == TreatDouble::AsInteger)
    {
        EXPECT_EQ(instance->pass(0), 0);
        EXPECT_EQ(instance->pass(4.2), 4);
        EXPECT_EQ(instance->pass(4.8), 4);

        EXPECT_EQ(instance->mul(0.5, 100), 0);
        EXPECT_EQ(instance->mul(100, 4.2), 400);

        EXPECT_EQ(instance->add(0, 1, 2), 3);
        EXPECT_EQ(instance->add(42.4, 42.4, 42.4), 126.0);
    }
}

void FeaturesTestFixture::doModulesTest(const char* code1, const char* code2)
{
    writeHeader<SimpleScript>();
    auto script_name1 = writeCode("test_simple1", code1);
    ASSERT_FALSE(script_name1.empty());

    auto script_name2 = writeCode("test_simple2", code2);
    ASSERT_FALSE(script_name2.empty());

    auto module1 = ensureCore().newScriptModule<SimpleScript>(script_name1);
    ASSERT_NE(module1, nullptr);

    auto module2 = ensureCore().newScriptModule<SimpleScript>(script_name2);
    ASSERT_NE(module2, nullptr);

    auto instance1 = module1->newInstance();
    ASSERT_NE(instance1, nullptr);

    auto instance2 = module2->newInstance();
    ASSERT_NE(instance2, nullptr);

    EXPECT_EQ(instance1->foo(), 42);
    EXPECT_EQ(instance2->foo(), 4242);
}

void FeaturesTestFixture::doExternalObjTest(const char* code)
{
    MockExternalObj external;
    ensureCore().registerInstance<SetGetScript>(&external, "external");

    writeHeader<SimpleScript>();
    auto script_name = writeCode("test_external_obj", code);
    ASSERT_FALSE(script_name.empty());

    auto module = ensureCore().newScriptModule<SimpleScript>(script_name);
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    testing::Expectation set_call = EXPECT_CALL(external, set(42));
    EXPECT_CALL(external, get()).After(set_call).WillOnce(testing::Return(42));

    instance->foo();
}

void FeaturesTestFixture::doGlobalVarTest(const char* code)
{
    writeHeader<SetGetScript>();
    auto script_name = writeCode("test_global_var", code);
    ASSERT_FALSE(script_name.empty());

    auto module = ensureCore().newScriptModule<SetGetScript>(script_name);
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    auto instance2 = module->newInstance();
    ASSERT_NE(instance2, nullptr);

    instance->set(42);
    instance2->set(4242);

    EXPECT_EQ(instance->get(), 4242);
    EXPECT_EQ(instance2->get(), 4242);
}

void FeaturesTestFixture::doHotReloadTest(const char* code_before, const char* code_after)
{
    writeHeader<SimpleScript>();
    auto script_name = writeCode("test_simple", code_before);
    ASSERT_FALSE(script_name.empty());

    auto module = ensureCore().newScriptModule<SimpleScript>(script_name);
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    EXPECT_EQ(instance->foo(), 42);

    ASSERT_FALSE(writeCode("test_simple", code_after).empty());
    ensureCore().reload(script_name);

    EXPECT_EQ(instance->foo(), 4242);
}
