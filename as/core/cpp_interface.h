//
// Created by Alex Zelenshikov on 23.04.2024.
//

#ifndef AS_PROTO_CPP_INTERFACE_H
#define AS_PROTO_CPP_INTERFACE_H

template <typename T> const char* get_source_code();

#define DEFINE_SCRIPT_INTERFACE(Type, I) \
I \
template <> const char* get_source_code<Type>() { return #I; }


#endif //AS_PROTO_CPP_INTERFACE_H
