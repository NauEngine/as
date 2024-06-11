//
// Created by ivn on 29.05.2024.
//

#include "is_language_runtime.h"

#include <iostream>

extern "C" void __isRuntimeOnEnter(const char* data, const char* value)
{
    if (!data)
    {
        std::cout << "[is] No runtime specified. Value = \"" << value << "\"" << std::endl;
        return;
    }

    if (*data == 0)
        return;

    std::cout << "[is] Runtime = \"" << data << "\". Value = \"" << value << "\"" << std::endl;
}

namespace as {
const char* IvnScriptLanguageRuntime::name()
{
    return "is_runtime";
}

const void* IvnScriptLanguageRuntime::ptr()
{
    return m_data.c_str();
}
} // as