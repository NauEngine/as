//
// Created by ivn on 29.05.2024.
//

#include "is_language_runtime.h"

#include <iostream>

extern "C" void __isRuntimeOnEnter(const char* data, const char* value)
{
    std::cout << ">>> " << data << " :: " << value << std::endl;
}

extern "C" void __isRuntimeOnExit(const char* data, const char* value)
{
    std::cout << "<<< " << data << " :: " << value << std::endl;
}

namespace as {
} // as