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

    void doSimpleTest(const char* code);
    void doIntegerTest(const char* code);
    void doDoubleTest(const char* code, TreatDouble treat_as);
    void doModulesTest(const char* code1, const char* code2);
    void doExternalObjTest(const char* code);
    void doGlobalVarTest(const char* code);
    void doHotReloadTest(const char* code_before, const char* code_after);

    void doCompileStaticInitTest(const char* code);
    void doCompileDebugInfoTest(const char* code);

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
