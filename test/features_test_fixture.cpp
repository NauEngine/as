//
// Created by ivn on 20.06.2024.
//

#include <fstream>

#include "features_test_fixture.h"
#include <gmock/gmock-function-mocker.h>

#include "./scripts/simple.h"
#include "./scripts/integer.h"
#include "./scripts/double.h"
#include "./scripts/set_get.h"

static const auto BASE_SCRIPTS_PATH = "../..";
static const auto TEMP_SCRIPTS_PATH = "cmake-build-debug/test";

class MockExternalObj : public SetGetScript
{
public:
    MOCK_METHOD(int, get, (), (override));
    MOCK_METHOD(void, set, (int a), (override));
};

FeaturesTestFixture::FeaturesTestFixture() :
    m_core(std::make_unique<as::Core>(BASE_SCRIPTS_PATH))
{
}

FeaturesTestFixture::~FeaturesTestFixture()
{
    for (const auto& file_path: m_temp_files)
    {
        std::error_code ec;
        std::filesystem::remove(file_path, ec);
    }

    m_temp_files.clear();
}

void FeaturesTestFixture::SetUp()
{
    m_core->registerLanguage(getLanguageName(), createLanguage());

    if (auto runtime = createRuntime())
        m_core->registerRuntime(std::move(runtime));
}

std::string FeaturesTestFixture::copyFile(const std::string& source_file, const std::string& dest_file)
{
    const auto source_file_path = std::filesystem::path(BASE_SCRIPTS_PATH) / source_file;
    const auto dest_file_path = std::filesystem::path(TEMP_SCRIPTS_PATH) / dest_file;
    const auto dest_file_full_path = std::filesystem::path(BASE_SCRIPTS_PATH) / dest_file_path;

    auto copy_options = std::filesystem::copy_options::overwrite_existing;
    std::error_code ec;
    const auto copy_result = copy_file(source_file_path, dest_file_full_path, copy_options, ec);

    if (!copy_result)
        return "";

    m_temp_files.insert(dest_file_full_path);
    return dest_file_path;
}

std::string FeaturesTestFixture::createFile(const std::string& content, const std::string& dest_file)
{
    const auto dest_file_path = std::filesystem::path(TEMP_SCRIPTS_PATH) / dest_file;
    const auto dest_file_full_path = std::filesystem::path(BASE_SCRIPTS_PATH) / dest_file_path;

    std::ofstream file(dest_file_full_path);
    file << content;
    file.close();

    m_temp_files.insert(dest_file_full_path);
    return dest_file_path;
}

void FeaturesTestFixture::doSimpleTest(const char* code)
{
    ASSERT_FALSE(copyFile("test/scripts/simple.h", "simple.h").empty());

    auto script_name = createFile(code, std::string("test_simple.") + getLanguageName());
    ASSERT_FALSE(script_name.empty());

    auto module = getCore().newScriptModule<SimpleScript>(script_name);
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    EXPECT_EQ(instance->foo(), 42);
}

void FeaturesTestFixture::doIntegerTest(const char* code)
{
    ASSERT_FALSE(copyFile("test/scripts/integer.h", "integer.h").empty());

    auto script_name = createFile(code, std::string("test_integer.") + getLanguageName());
    ASSERT_FALSE(script_name.empty());

    auto module = getCore().newScriptModule<IntegerScript>(script_name);
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
    ASSERT_FALSE(copyFile("test/scripts/double.h", "double.h").empty());

    auto script_name = createFile(code, std::string("test_double.") + getLanguageName());
    ASSERT_FALSE(script_name.empty());

    auto module = getCore().newScriptModule<DoubleScript>(script_name);
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
    ASSERT_FALSE(copyFile("test/scripts/simple.h", "simple.h").empty());

    auto script_name1 = createFile(code1, std::string("test_simple1.") + getLanguageName());
    ASSERT_FALSE(script_name1.empty());

    auto script_name2 = createFile(code2, std::string("test_simple2.") + getLanguageName());
    ASSERT_FALSE(script_name2.empty());

    auto module1 = getCore().newScriptModule<SimpleScript>(script_name1);
    ASSERT_NE(module1, nullptr);

    auto module2 = getCore().newScriptModule<SimpleScript>(script_name2);
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
    getCore().registerInstance<SetGetScript>(&external, "external");

    ASSERT_FALSE(copyFile("test/scripts/simple.h", "simple.h").empty());

    auto script_name = createFile(code, std::string("test_simple_external_obj.") + getLanguageName());
    ASSERT_FALSE(script_name.empty());

    auto module = getCore().newScriptModule<SimpleScript>(script_name);
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    testing::Expectation set_call = EXPECT_CALL(external, set(42));
    EXPECT_CALL(external, get()).After(set_call).WillOnce(testing::Return(42));

    instance->foo();
}

void FeaturesTestFixture::doGlobalVarTest(const char* code)
{
    ASSERT_FALSE(copyFile("test/scripts/set_get.h", "set_get.h").empty());

    auto script_name = createFile(code, std::string("test_set_get_global_var.") + getLanguageName());
    ASSERT_FALSE(script_name.empty());

    auto module = getCore().newScriptModule<SetGetScript>(script_name);
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
    ASSERT_FALSE(copyFile("test/scripts/simple.h", "simple.h").empty());

    auto script_name = createFile(code_before, std::string("test_simple.") + getLanguageName());
    ASSERT_FALSE(script_name.empty());

    auto module = getCore().newScriptModule<SimpleScript>(script_name);
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    EXPECT_EQ(instance->foo(), 42);

    ASSERT_FALSE(createFile(code_after, std::string("test_simple.") + getLanguageName()).empty());
    getCore().reload(script_name);

    EXPECT_EQ(instance->foo(), 4242);
}