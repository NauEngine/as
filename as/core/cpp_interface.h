//
// Created by Alex Zelenshikov on 23.04.2024.
//

#pragma once

template <typename T> const char* getSourceCode();

#define DEFINE_SCRIPT_INTERFACE(Type, I) I \
template <> const char* getSourceCode<Type>() { return #I; }
