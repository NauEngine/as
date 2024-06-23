//
// Created by ivn on 20.06.2024.
//

#include <fstream>

#include <regex>
#include <gmock/gmock-function-mocker.h>

#include "as/core/script_module_compile.h"

#include "features_test_fixture.h"

#include "ir_language.h"
#include "includes/simple.h"
#include "includes/integer.h"
#include "includes/double.h"
#include "includes/set_get.h"

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

std::vector<std::string> split(const std::string& content, const std::string& delimeter)
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

std::string match(const std::string& regex, const std::string& text)
{
    std::regex r(regex, std::regex_constants::ECMAScript);
    std::smatch m;
    if (!std::regex_search(text, m, r))
        return "";

    return m[1].str();
}

std::string findCtorFunction(const std::string& ll_code)
{
    return match(R"(\@llvm\.global_ctors\s+=\s+appending global.*i32\s+\d+,\s+ptr\s([^\s,]+),\s+ptr\s+null\s*\}\])", ll_code);
}

std::string findFunctionBody(const std::string& ll_code, const std::string& declaration, const std::string& name)
{
    return match("define\\s+" + declaration + "\\s+" + name + R"(\s*\([^)]*\)[^{]*\{\s*entry\:([^}]*)\})", ll_code);
}

std::string findFunctionDebugEntry(const std::string& ll_code, const std::string& declaration, const std::string& name)
{
    auto attrs = match("define\\s+" + declaration + "\\s+" + name + R"(\([^)]*\)\s*([^{]*)\s*\{)", ll_code);
    return match(R"(\!dbg\s+(\!\d+))", attrs);
}

std::string findFunctionCallArgument(const std::string& ll_code, const std::string& func, int index)
{
    auto args_str = match(R"(call\s+\w+\s+)" + func + R"(\(\s*([^)]*)\))", ll_code);
    if (args_str.empty())
        return "";
    if (index < 0)
        return " ";

    auto args = split(args_str, ",");
    if (index >= args.size())
        return "";

    return split(match("^\\s*(.*)\\s*$", args[index]), " ")[1];
}

std::string getDebugEntryIndex(const std::string& debug_entry)
{
    return match(R"(\!(\d+))", debug_entry);
}

std::string findDebugAttr(const std::string& ll_code, const std::string& debug_entry_index, const std::string& attr_name)
{
    return match(R"(\!)" + debug_entry_index + R"(\s*=\s*[^(]*\(.*)" + attr_name + R"(\s*:\s*([^,)]+))", ll_code);
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

as::Core& FeaturesTestFixture::ensureCore(bool register_language)
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

std::string FeaturesTestFixture::compile(const std::string& file_name, const std::string& interface)
{
    auto module = interface.empty() ? ensureCompile().newScriptModule(file_name) : ensureCompile().newScriptModule(interface, file_name);
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

void FeaturesTestFixture::doSimpleTest()
{
    ASSERT_NE(getSimpleScript42(), nullptr);

    ASSERT_TRUE(writeHeader<SimpleScript>());
    auto script_name = writeCode("test_simple", getSimpleScript42());
    ASSERT_FALSE(script_name.empty());

    auto module = ensureCore(true).newScriptModule<SimpleScript>(script_name);
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    EXPECT_EQ(instance->foo(), 42);
}

void FeaturesTestFixture::doIntegerTest()
{
    ASSERT_NE(getIntegerScript(), nullptr);

    ASSERT_TRUE(writeHeader<IntegerScript>());
    auto script_name = writeCode("test_integer", getIntegerScript());
    ASSERT_FALSE(script_name.empty());

    auto module = ensureCore(true).newScriptModule<IntegerScript>(script_name);
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

void FeaturesTestFixture::doDoubleTest(TreatDouble treat_as)
{
    ASSERT_NE(getDoubleScript(), nullptr);

    ASSERT_TRUE(writeHeader<DoubleScript>());
    auto script_name = writeCode("test_double", getDoubleScript());
    ASSERT_FALSE(script_name.empty());

    auto module = ensureCore(true).newScriptModule<DoubleScript>(script_name);
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

void FeaturesTestFixture::doModulesTest()
{
    ASSERT_NE(getSimpleScript42(), nullptr);
    ASSERT_NE(getSimpleScript4242(), nullptr);

    ASSERT_TRUE(writeHeader<SimpleScript>());
    auto script_name1 = writeCode("test_simple1", getSimpleScript42());
    ASSERT_FALSE(script_name1.empty());

    auto script_name2 = writeCode("test_simple2", getSimpleScript4242());
    ASSERT_FALSE(script_name2.empty());

    auto module1 = ensureCore(true).newScriptModule<SimpleScript>(script_name1);
    ASSERT_NE(module1, nullptr);

    auto module2 = ensureCore(true).newScriptModule<SimpleScript>(script_name2);
    ASSERT_NE(module2, nullptr);

    auto instance1 = module1->newInstance();
    ASSERT_NE(instance1, nullptr);

    auto instance2 = module2->newInstance();
    ASSERT_NE(instance2, nullptr);

    EXPECT_EQ(instance1->foo(), 42);
    EXPECT_EQ(instance2->foo(), 4242);
}

void FeaturesTestFixture::doExternalObjTest()
{
    ASSERT_NE(getSimpleExternalScript(), nullptr);

    MockExternalObj external;
    ensureCore(true).registerInstance<SetGetScript>(&external, "external");

    ASSERT_TRUE(writeHeader<SimpleScript>());
    auto script_name = writeCode("test_external_obj", getSimpleExternalScript());
    ASSERT_FALSE(script_name.empty());

    auto module = ensureCore(true).newScriptModule<SimpleScript>(script_name);
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    testing::Expectation set_call = EXPECT_CALL(external, set(42));
    EXPECT_CALL(external, get()).After(set_call).WillOnce(testing::Return(42));

    instance->foo();
}

void FeaturesTestFixture::doGlobalVarTest()
{
    ASSERT_NE(getSetGetGlobalScript(), nullptr);

    ASSERT_TRUE(writeHeader<SetGetScript>());
    auto script_name = writeCode("test_global_var", getSetGetGlobalScript());
    ASSERT_FALSE(script_name.empty());

    auto module = ensureCore(true).newScriptModule<SetGetScript>(script_name);
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

void FeaturesTestFixture::doHotReloadTest()
{
    ASSERT_NE(getSimpleScript42(), nullptr);
    ASSERT_NE(getSimpleScript4242(), nullptr);

    ASSERT_TRUE(writeHeader<SimpleScript>());
    auto script_name = writeCode("test_simple", getSimpleScript42());
    ASSERT_FALSE(script_name.empty());

    auto module = ensureCore(true).newScriptModule<SimpleScript>(script_name);
    ASSERT_NE(module, nullptr);

    auto instance = module->newInstance();
    ASSERT_NE(instance, nullptr);

    EXPECT_EQ(instance->foo(), 42);

    ASSERT_FALSE(writeCode("test_simple", getSimpleScript4242()).empty());
    ensureCore(true).reload(script_name);

    EXPECT_EQ(instance->foo(), 4242);
}

void FeaturesTestFixture::doCompileStaticInitTest()
{
    ASSERT_NE(getSimpleScript42(), nullptr);

    ASSERT_TRUE(writeHeader<SimpleScript>());
    auto script_name = writeCode("test_simple", getSimpleScript42());
    ASSERT_FALSE(script_name.empty());

    auto ll_code = compile(script_name);
    EXPECT_FALSE(ll_code.empty());

    auto cotr_func_name = findCtorFunction(ll_code);
    ASSERT_FALSE(cotr_func_name.empty());

    auto cotr_func_body = findFunctionBody(ll_code, "internal void", cotr_func_name);
    ASSERT_FALSE(cotr_func_body.empty());

    auto init_func_name = findFunctionCallArgument(cotr_func_body, "@__asRegisterInit", 1);
    ASSERT_FALSE(init_func_name.empty());

    auto init_func_body = findFunctionBody(ll_code, "internal void", init_func_name);
    ASSERT_FALSE(init_func_body.empty());

    ASSERT_FALSE(findFunctionCallArgument(init_func_body, "@__asRegisterVTable", -1).empty());
}

void FeaturesTestFixture::doCompileLinkTest()
{
    ASSERT_NE(getSimpleScript42(), nullptr);

    ASSERT_TRUE(writeHeader<SimpleScript>());
    auto script_name = writeCode("some_unique_name", getSimpleScript42());
    ASSERT_FALSE(script_name.empty());

    auto ll_code = compile(script_name);
    EXPECT_FALSE(ll_code.empty());

    ASSERT_FALSE(writeCode("some_unique_name", ll_code).empty());

    auto& core = ensureCore(false);
    core.registerLanguage(getLanguageName(), std::make_shared<IRLanguage>());

    auto module = ensureCore(true).newScriptModule<SimpleScript>(script_name);
    ASSERT_EQ(module, nullptr);

    auto module2 = ensureCore(true).newScriptModule<SimpleScript>(script_name);
    ASSERT_NE(module2, nullptr);

    auto instance = module2->newInstance();
    ASSERT_NE(instance, nullptr);

    EXPECT_EQ(instance->foo(), 42);
}

void FeaturesTestFixture::doCompileDebugInfoTest(const std::string& func_pattern)
{
    ASSERT_NE(getSimpleScript42(), nullptr);

    ASSERT_TRUE(writeHeader<SimpleScript>());
    auto script_name = writeCode("test_simple", getSimpleScript42());
    ASSERT_FALSE(script_name.empty());

    auto ll_code = compile(script_name);
    EXPECT_FALSE(ll_code.empty());

    auto func_dbg_entry = getDebugEntryIndex(findFunctionDebugEntry(ll_code, "linkonce_odr i32", func_pattern));
    EXPECT_FALSE(func_dbg_entry.empty());

    auto func_file_dbg_entry = getDebugEntryIndex(findDebugAttr(ll_code, func_dbg_entry, "file"));
    EXPECT_FALSE(func_file_dbg_entry.empty());

    auto func_file_name_dbg_entry = match("\"([^\"]+)\"", findDebugAttr(ll_code, func_file_dbg_entry, "filename"));
    EXPECT_FALSE(func_file_name_dbg_entry.empty());

    EXPECT_TRUE(func_file_name_dbg_entry.ends_with(script_name));
}