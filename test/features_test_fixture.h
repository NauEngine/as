//
// Created by ivn on 20.06.2024.
//

#pragma once

#include <gtest/gtest.h>

#include "as/core/core.h"
#include "as/core/language.h"
#include "as/core/language_runtime.h"

template <typename T> const char* getHeaderFileName();

class FeaturesTestFixture : public testing::Test {
protected:
    enum class TreatDouble : unsigned short {
        AsDouble = 0,
        AsFloat = 1,
        AsInteger = 2
    };

    FeaturesTestFixture() = default;
    ~FeaturesTestFixture() override;

    virtual const char* getLanguageName() const = 0;
    virtual std::shared_ptr<as::ILanguage> createLanguage() const = 0;
    virtual std::shared_ptr<as::ILanguageRuntime> createRuntime() const = 0;

    virtual const char* getSimpleScript42() const { return nullptr; }
    virtual const char* getSimpleScript4242() const { return nullptr; }
    virtual const char* getSimpleExternalScript() const { return nullptr; }
    virtual const char* getIntegerScript() const { return nullptr; }
    virtual const char* getDoubleScript() const { return nullptr; }
    virtual const char* getSetGetGlobalScript() const { return nullptr; }

    void doSimpleTest();
    void doIntegerTest();
    void doDoubleTest(TreatDouble treat_as);
    void doExternalObjTest();
    void doGlobalVarTest();
    void doModulesTest();
    void doHotReloadTest();

    void doCompileStaticInitTest();
    void doCompileDebugInfoTest(const std::string& func_pattern);

private:
    std::unique_ptr<as::Core> m_core;
    std::unique_ptr<as::CoreCompile> m_core_compile;
    std::unordered_set<std::filesystem::path> m_temp_files;

    as::Core& ensureCore();
    as::CoreCompile& ensureCompile();

    std::string compile(const std::string file_name);

    bool writeFile(const std::string& file_name, const std::string& content);
    std::string writeCode(const std::string& file_name, const std::string& code);
    bool writeHeader(const std::string& file_name, const std::string& code);

    template<typename Interface>
    bool writeHeader()
    {
        return writeHeader(getHeaderFileName<Interface>(), Interface::getSourceCode());
    }
};
