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

    const char* name() override;
    const void* ptr() override;

private:
    std::string m_data;
};

} // as
