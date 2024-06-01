#!/bin/bash

cd "$(dirname "$0")/../build"

cmake \
    -DCMAKE_C_COMPILER=/usr/local/opt/llvm@17/bin/clang \
    -DCMAKE_CXX_COMPILER=/usr/local/opt/llvm@17/bin/clang++ \
    ..

#cmake --build .
