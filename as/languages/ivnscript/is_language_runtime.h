//
// Created by ivn on 29.05.2024.
//

#pragma once
#include <string>

#include "as/core/language_runtime.h"

namespace as {

class IvnScriptLanguageRuntime: public ILanguageRuntime {
public:
    explicit IvnScriptLanguageRuntime(const std::string& data):
        m_data(data)
    {
    }

    ~IvnScriptLanguageRuntime() override = default;

    const char* name() override
    {
        return "is_runtime";
    }

    const void* ptr() override
    {
        return m_data.c_str();
    }

private:
    std::string m_data;
};

} // as
