#include <iostream>

#include "error.h"
#include "interpreter.h"

#include "expression.h"

namespace script {

void NumberExpression::print(int ident) {
  std::cout << std::string(ident, ' ') << value << '\n';
}

void VariableExpression::print(int ident) {
  std::cout << std::string(ident, ' ');
  if (!self.empty()) {
    std::cout << self << '.';
  }
  std::cout << name << '\n';
}

void BinaryOperatorExpression::print(int ident) {
  std::cout << std::string(ident, ' ') << op << '\n';
  lhs->print(ident + 1);
  rhs->print(ident + 1);
}

void CalleeExpression::print(int ident) {
  std::cout << std::string(ident, ' ') << "call ";
  if (!self.empty()) {
    std::cout << self << '.';
  }
  std::cout << name << '\n';
  for (const auto& it: args) {
    it->print(ident + 1);
  }
}

void AssignmentExpression::print(int ident) {
  std::cout << std::string(ident, ' ') << "var " << name << " =\n";
  expression->print(ident + 1);
}

void ReturnExpression::print(int ident) {
  std::cout << std::string(ident, ' ') << "return\n";
  expression->print(ident + 1);
}

llvm::Value* NumberExpression::codegen(InterpreterContext& interpreter, std::vector<Error>& errors) const {
  return interpreter.getBuilder()->getInt32(value);
}

llvm::Value* VariableExpression::codegen(InterpreterContext& interpreter, std::vector<Error>& errors) const {
  if (!self.empty()) {
    auto selfResult = interpreter.getGlobalVariable(self, name, *name.c_str() - 'a');
    if (!selfResult) {
      errors.emplace_back(line, column, "Unknown global variable '$@' referenced", self + "." + name);
    }

    return selfResult;
  }

  auto result = interpreter.getVariable(name);
  if (!result) {
    errors.emplace_back(line, column, "Unknown variable '$@' referenced", name);
  }

  return result;
}

llvm::Value* BinaryOperatorExpression::codegen(InterpreterContext& interpreter, std::vector<Error>& errors) const {
  auto l = lhs->codegen(interpreter, errors);
  auto r = rhs->codegen(interpreter, errors);
  if (!l || !r)
    return nullptr;

  switch (op) {
    case '+':
      return interpreter.getBuilder()->CreateAdd(l, r, "addtmp");
    case '-':
      return interpreter.getBuilder()->CreateSub(l, r, "subtmp");
  }

  errors.emplace_back(line, column, "Unknown operator '$@'", std::string(1, op));
  return nullptr;
}

llvm::Value* CalleeExpression::codegen(InterpreterContext& interpreter, std::vector<Error>& errors) const {
  std::string fullName = self.empty() ? name : (args.empty() ? "__call0" : "__call1");

  auto func = interpreter.getFunction(fullName);
  if (!func) {
    errors.emplace_back(line, column, "Unknown function '$@' referenced", name);
    return nullptr;
  }

  const size_t argsSize = self.empty() ? args.size() : args.size() + 3;

  if (func->arg_size() != argsSize) {
    errors.emplace_back(line, column, "Invalid number of arguments passed", name);
    return nullptr;
  }

  std::vector<llvm::Value*> callArgs;

  if (!self.empty()) {
    callArgs.push_back(interpreter.getVariable("__executor"));
    callArgs.push_back(interpreter.getVariable(self));
    callArgs.push_back(interpreter.getConstant(*name.c_str() - 'a'));
  }

  for (auto &arg: args) {
    auto a = arg->codegen(interpreter, errors);
    if (!a)
      return nullptr;

    callArgs.push_back(a);
  }

  return interpreter.getBuilder()->CreateCall(func, callArgs, "calltmp");
}

llvm::Value* AssignmentExpression::codegen(InterpreterContext& interpreter, std::vector<Error>& errors) const {
  auto value = expression->codegen(interpreter, errors);
  if (!value)
    return nullptr;

  auto result = interpreter.addVariable(name, value);
  if (!result)
    errors.emplace_back(line, column, "Cannot declare variable '$@'");

  return result;
}

llvm::Value* ReturnExpression::codegen(InterpreterContext& interpreter, std::vector<Error>& errors) const {
  auto value = expression->codegen(interpreter, errors);
  if (!value)
    return nullptr;

  return interpreter.getBuilder()->CreateRet(value);
}

}
