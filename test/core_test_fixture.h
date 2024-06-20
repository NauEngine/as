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
    ~CoreTestFixture() override = default;

    virtual const char* getLanguageName() const = 0;
    virtual std::shared_ptr<as::ILanguage> createLanguage() const = 0;
    virtual std::shared_ptr<as::ILanguageRuntime> createRuntime() const = 0;

    void SetUp() override;

    as::Core& getCore()
    {
        return *m_core;
    }

private:
    std::unique_ptr<as::Core> m_core;
};
