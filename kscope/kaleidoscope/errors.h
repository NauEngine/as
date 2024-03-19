//
// Created by Alex Zelenshikov on 10.11.2023.
//

#ifndef KALEIDOSCOPE_ERRORS_H
#define KALEIDOSCOPE_ERRORS_H

#include "llvm/IR/Value.h"
#include "llvm/Support/Error.h"

namespace kscope
{

class ExprAST;
class PrototypeAST;

static llvm::ExitOnError ExitOnErr;

llvm::Value* LogErrorV(const char* str);
std::unique_ptr <ExprAST> LogError(const char* str);
std::unique_ptr <PrototypeAST> LogErrorP(const char* str);

}

#endif //KALEIDOSCOPE_ERRORS_H
