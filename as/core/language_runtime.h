//
// Created by ivn on 29.05.2024.
//

#ifndef LANGUAGE_RUNTIME_H
#define LANGUAGE_RUNTIME_H

namespace as
{

struct ILanguageRuntime
{
    virtual ~ILanguageRuntime() = default;

    virtual const char* name() = 0;
    virtual const void* ptr() = 0;
};

} // namespace as


#endif //LANGUAGE_RUNTIME_H
