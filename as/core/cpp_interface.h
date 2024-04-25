//
// Created by Alex Zelenshikov on 23.04.2024.
//

#ifndef AS_PROTO_CPP_INTERFACE_H
#define AS_PROTO_CPP_INTERFACE_H

template <typename T> const char* get_source_code();
template <typename T> const char* get_type_name();

#define DEFINE_SCRIPT_INTERFACE(Type, I) \
I \
template <> const char* get_source_code<Type>() { return #I; } \
template <> const char* get_type_name<Type>() { return #Type; } \

#endif //AS_PROTO_CPP_INTERFACE_H
