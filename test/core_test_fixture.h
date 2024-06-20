//
// Created by ivn on 20.06.2024.
//

#pragma once

#include <gtest/gtest.h>

#include "as/core/core.h"
#include "as/core/language.h"
#include "as/core/language_runtime.h"

class CoreTestFixture : public testing::Test {
protected:
    CoreTestFixture();
    ~CoreTestFixture() override;

    virtual const char* getLanguageName() const = 0;
    virtual std::shared_ptr<as::ILanguage> createLanguage() const = 0;
    virtual std::shared_ptr<as::ILanguageRuntime> createRuntime() const = 0;

    void SetUp() override;

    as::Core& getCore()
    {
        return *m_core;
    }

    std::string copyFile(const std::string& source_file, const std::string& dest_file);

private:
    std::unique_ptr<as::Core> m_core;
    std::unordered_set<std::filesystem::path> m_temp_files;
};
