//
// Created by ivn on 20.06.2024.
//

#pragma once

#include <gtest/gtest.h>

#include "as/core/core.h"
#include "as/core/language.h"
#include "as/core/language_runtime.h"

class FeaturesTestFixture : public testing::Test {
protected:
    FeaturesTestFixture();
    ~FeaturesTestFixture() override;

    virtual const char* getLanguageName() const = 0;
    virtual std::shared_ptr<as::ILanguage> createLanguage() const = 0;
    virtual std::shared_ptr<as::ILanguageRuntime> createRuntime() const = 0;

    void SetUp() override;

    as::Core& getCore()
    {
        return *m_core;
    }

    std::string copyFile(const std::string& source_file, const std::string& dest_file);
    std::string createFile(const std::string& content, const std::string& dest_file);

    void doSimpleTest(const char* code);
    void doIntegerTest(const char* code);
    void doDoubleTest(const char* code, bool as_integer);
    void doModulesTest(const char* code1, const char* code2);
    void doExternalObjTest(const char* code);
    void doGlobalVarTest(const char* code);
    void doHotReloadTest(const char* code_before, const char* code_after);

private:
    std::unique_ptr<as::Core> m_core;
    std::unordered_set<std::filesystem::path> m_temp_files;
};
