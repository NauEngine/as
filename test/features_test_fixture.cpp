//
// Created by ivn on 20.06.2024.
//

#include <fstream>

#include <regex>
#include <gmock/gmock-function-mocker.h>

#include "as/core/script_module_compile.h"

#include "features_test_fixture.h"

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

std::string findCtorFunction(const std::string& ll_code)
{
    std::regex global_ctors_regex(R"(\@llvm\.global_ctors\s+=\s+appending global.*i32\s+\d+,\s+ptr\s([^\s,]+),\s+ptr\s+null\s*\}\])", std::regex_constants::ECMAScript);
    std::smatch matches;

    if (!std::regex_search(ll_code, matches, global_ctors_regex))
        return "";

    return matches[1].str();
}

std::string findFunctionBody(const std::string& ll_code, const std::string& declaration, const std::string& name)
{
    std::regex body_regex("define\\s+" + declaration + "\\s+" + name + R"(\s*\([^)]*\)\s*\{\s*entry\:([^}]*)\})", std::regex_constants::ECMAScript);
    std::smatch matches;

    if (!std::regex_search(ll_code, matches, body_regex))
        return "";

    return matches[1].str();
}

std::vector<std::string> splitString(const std::string& content, const std::string& delimeter)
{
    std::vector<std::string> result;
    auto prev_pos = content.begin();
    auto next_pos = std::search(prev_pos, content.end(),
                               delimeter.begin(), delimeter.end());
    while (next_pos != content.end())
    {
        result.emplace_back(prev_pos, next_pos);
        prev_pos = next_pos + delimeter.size();
        next_pos = std::search(prev_pos, content.end(),
                               delimeter.begin(), delimeter.end());
    }

    if (prev_pos != content.end())
    {
        result.emplace_back(prev_pos, content.end());
    }
    return result;
}

std::string funcFunctionCallArgument(const std::string& ll_code, const std::string& func, int index)
{
    std::regex args_regex(R"(call\s+\w+\s+)" + func + R"(\(\s*([^)]*)\))", std::regex_constants::ECMAScript);
    std::smatch matches;

    if (!std::regex_search(ll_code, matches, args_regex))
        return "";

    if (index < 0)
        return " ";

    const auto& args = splitString(matches[1].str(), ",");
    if (index >= args.size())
        return "";

    return splitString(args[index], " ")[2];
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

as::CoreCompile& FeaturesTestFixture::ensureCompile()
{
    if (m_core_compile)
        return *m_core_compile;

    m_core_compile = std::make_unique<as::CoreCompile>(BASE_SCRIPTS_PATH, true);
    m_core_compile->registerLanguage(getLanguageName(), createLanguage());

    return *m_core_compile;
}

std::string FeaturesTestFixture::compile(const std::string file_name)
{
    auto module = ensureCompile().newScriptModule(file_name);
    std::string result;
    llvm::raw_string_ostream stream(result);
    module->dump(stream);

    return result;
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

std::string FeaturesTestFixture::writeCode(const std::string& file_name, const std::string& code)
{
    const auto full_file_name = file_name + "." + getLanguageName();
    if (!writeFile(full_file_name, code))
        return "";

    return full_file_name;
}

bool FeaturesTestFixture::writeHeader(const std::string& file_name, const std::string& code)
{
    std::regex header_update(R"(^\s*struct\s+(\w+)\s+\{([^}]+)\};)", std::regex_constants::ECMAScript);
    auto code_updated = std::regex_replace(code, header_update, "#pragma once\n\nDEFINE_SCRIPT_INTERFACE($1,\n$2\n)");
    return writeFile(file_name, code_updated);
}

void FeaturesTestFixture::doSimpleTest(const char* code)
{
    ASSERT_TRUE(writeHeader<SimpleScript>());
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
    ASSERT_TRUE(writeHeader<IntegerScript>());
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
    ASSERT_TRUE(writeHeader<DoubleScript>());
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
    ASSERT_TRUE(writeHeader<SimpleScript>());
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

    ASSERT_TRUE(writeHeader<SimpleScript>());
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
    ASSERT_TRUE(writeHeader<SetGetScript>());
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
    ASSERT_TRUE(writeHeader<SimpleScript>());
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

void FeaturesTestFixture::doCompileStaticInitTest(const char* code)
{
    ASSERT_TRUE(writeHeader<SimpleScript>());
    auto script_name = writeCode("test_simple", code);
    ASSERT_FALSE(script_name.empty());

    auto ll_code = compile(script_name);
    EXPECT_FALSE(ll_code.empty());

    auto cotr_func_name = findCtorFunction(ll_code);
    ASSERT_FALSE(cotr_func_name.empty());

    auto cotr_func_body = findFunctionBody(ll_code, "internal void", cotr_func_name);
    ASSERT_FALSE(cotr_func_body.empty());

    auto init_func_name = funcFunctionCallArgument(cotr_func_body, "@__asRegisterInit", 1);
    ASSERT_FALSE(init_func_name.empty());

    auto init_func_body = findFunctionBody(ll_code, "internal void", init_func_name);
    ASSERT_FALSE(init_func_body.empty());

    ASSERT_FALSE(funcFunctionCallArgument(init_func_body, "@__asRegisterVTable", -1).empty());
}
