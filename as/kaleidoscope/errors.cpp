//
// Created by Alex Zelenshikov on 10.11.2023.
//

#include "errors.h"
#include "ast.h"

namespace kscope
{

  llvm::Value* LogErrorV(const char* str)
  {
    LogError(str);
    return nullptr;
  }

  std::unique_ptr <ExprAST> LogError(const char* Str)
  {
    fprintf(stderr, "Error: %s\n", Str);
    return nullptr;
  }

  std::unique_ptr <PrototypeAST> LogErrorP(const char* Str)
  {
    LogError(Str);
    return nullptr;
  }

}