
#include <gtest/gtest.h>
#include <gmock/gmock-function-mocker.h>
#include <gmock/gmock-nice-strict.h>

#include "as/core/core.h"
#include "as/core/core_compile.h"

#include "as/core/language.h"
#include "as/core/language_script.h"
#include "includes/set_get.h"
#include "includes/simple.h"
//
// Created by ivn on 22.06.2024.
//
// - newScriptModule для зарегистрированного языка
// - newScriptModule для незарегистриванного языка
// - newScriptModule с переопределением языка
// - поддержка basePath
// - registerInstance вызывает соотв. метод у ILanguage

class SomeObject final : public SetGetScript
{
public:
    SomeObject():
        m_value(0)
    {}

    virtual int get() { return m_value; }
    virtual void set(int value) { m_value = value; }
private:
    int m_value;
};

class MockLanguage : public as::ILanguage
{
public:
    MOCK_METHOD(const char *, prefix, (), (override));
    MOCK_METHOD(void, init, (std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext context), (override));
    MOCK_METHOD(void, registerInstance, (void* instance,
      const std::string& instanceName,
      const std::shared_ptr<as::ScriptInterface>& cppInterface), (override));
    MOCK_METHOD(std::shared_ptr<as::ILanguageScript>, newScript, (), (override));
};

typedef std::unordered_map<std::string, std::shared_ptr<as::ScriptInterface>> TRequires;

class MockLanguageScript : public as::ILanguageScript
{
public:
    MOCK_METHOD(void, load, (const std::string& filename, llvm::LLVMContext& context), (override));
    MOCK_METHOD(std::shared_ptr<as::ScriptInterface>, getInterface,
        (const std::string& filename, as::CPPParser& cpp_paser), (override));
    MOCK_METHOD(TRequires, getRequires,
        (const std::string& filename, as::CPPParser& cpp_paser), (override));
    MOCK_METHOD(std::unique_ptr<llvm::Module>, createModule, (llvm::LLVMContext& context), (override));
    MOCK_METHOD(llvm::Function*, buildModule, (const std::string& init_name,
        const std::string& module_name,
        const as::ScriptInterface& interface,
        const TRequires& externalRequires,
        llvm::Module& module), (override));
    MOCK_METHOD(void, materialize, (const std::shared_ptr<llvm::orc::LLJIT>& jit,
        llvm::orc::JITDylib& lib,
        llvm::Module& module,
        llvm::LLVMContext& context), (override));
};

TEST(CoreCompileTest, NewLanguageInitTest)
{
    auto compile = std::make_shared<as::CoreCompile>("", false);
    auto language = std::make_shared<MockLanguage>();

    EXPECT_CALL(*language, init(testing::_, testing::_));

    compile->registerLanguage("foo", language);
}

TEST(CoreCompileTest, RegiterInstanceTest)
{
    auto compile = std::make_shared<as::CoreCompile>("", false);
    auto language = std::make_shared<MockLanguage>();
    SomeObject obj;

    EXPECT_CALL(*language, init(testing::_, testing::_));
    EXPECT_CALL(*language, registerInstance(&obj, "obj", testing::_));

    compile->registerLanguage("foo", language);
    compile->registerInstance(&obj, "obj", compile->getInterface(SimpleScript::getSourceCode()));
}

TEST(CoreCompileTest, NewScriptModuleTest)
{
    auto compile = std::make_shared<as::CoreCompile>("", false);
    auto language = std::make_shared<MockLanguage>();
    auto language_script = std::make_shared<MockLanguageScript>();

    EXPECT_CALL(*language, init(testing::_, testing::_));
    EXPECT_CALL(*language, newScript()).WillOnce(testing::Return(language_script));
    EXPECT_CALL(*language_script, load("script.foo", testing::_));
    EXPECT_CALL(*language_script, getInterface("script.foo", testing::_));

    compile->registerLanguage("foo", language);
    compile->newScriptModule("script.foo");
}

TEST(CoreCompileTest, SelectLanguageTest)
{
    auto compile = std::make_shared<as::CoreCompile>("", false);
    auto language_foo = std::make_shared<testing::StrictMock<MockLanguage>>();
    auto language_baz = std::make_shared<testing::StrictMock<MockLanguage>>();
    auto language_script = std::make_shared<MockLanguageScript>();

    EXPECT_CALL(*language_foo, init(testing::_, testing::_));
    EXPECT_CALL(*language_baz, init(testing::_, testing::_));
    EXPECT_CALL(*language_foo, newScript()).WillOnce(testing::Return(language_script));
    EXPECT_CALL(*language_script, load("script.foo", testing::_));
    EXPECT_CALL(*language_script, getInterface("script.foo", testing::_));

    compile->registerLanguage("foo", language_foo);
    compile->registerLanguage("baz", language_baz);
    compile->newScriptModule("script.foo");
}

TEST(CoreCompileTest, OverrideLanguageTest)
{
    auto compile = std::make_shared<as::CoreCompile>("", false);
    auto language_foo = std::make_shared<testing::StrictMock<MockLanguage>>();
    auto language_baz = std::make_shared<testing::StrictMock<MockLanguage>>();
    auto language_script = std::make_shared<MockLanguageScript>();

    EXPECT_CALL(*language_foo, init(testing::_, testing::_));
    EXPECT_CALL(*language_baz, init(testing::_, testing::_));
    EXPECT_CALL(*language_baz, newScript()).WillOnce(testing::Return(language_script));
    EXPECT_CALL(*language_script, load("script.foo", testing::_));
    EXPECT_CALL(*language_script, getInterface("script.foo", testing::_));

    compile->registerLanguage("foo", language_foo);
    compile->registerLanguage("baz", language_baz);
    compile->newScriptModule("script.foo", "baz");
}

TEST(CoreCompileTest, BasePathTest)
{
    auto compile = std::make_shared<as::CoreCompile>("some/base/path", false);
    auto language = std::make_shared<MockLanguage>();
    auto language_script = std::make_shared<MockLanguageScript>();

    EXPECT_CALL(*language, init(testing::_, testing::_));
    EXPECT_CALL(*language, newScript()).WillOnce(testing::Return(language_script));
    EXPECT_CALL(*language_script, load("some/base/path/script.foo", testing::_));
    EXPECT_CALL(*language_script, getInterface("some/base/path/script.foo", testing::_));

    compile->registerLanguage("foo", language);
    compile->newScriptModule("script.foo");
}