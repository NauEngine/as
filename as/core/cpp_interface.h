//
// Created by Alex Zelenshikov on 23.04.2024.
//

#pragma once

#define DEFINE_SCRIPT_INTERFACE(Type, I)        \
struct Type                                     \
{                                               \
    I                                           \
    static const char* getSourceCode()          \
    {                                           \
        return "struct "#Type" { "#I" };";      \
    }                                           \
};
