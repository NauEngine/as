//
// Created by Alex Zelenshikov on 23.04.2024.
//

#ifndef AS_PROTO_CPP_INTERFACE_H
#define AS_PROTO_CPP_INTERFACE_H

template <typename T> const char* getSourceCode();
template <typename T> const char* getTypeName();

#define DEFINE_SCRIPT_INTERFACE(Type, I) \
I \
template <> const char* getSourceCode<Type>() { return #I; } \
template <> const char* getTypeName<Type>() { return #Type; } \

#endif //AS_PROTO_CPP_INTERFACE_H
