#pragma once

#include <vector>
#include <string>

#include "llvm/IR/Value.h"

namespace script {

struct Error;
class InterpreterContext;

class Expression {
public:
  Expression(int line, int column):
    line(line), column(column) {}

  virtual ~Expression() = default;

  virtual void print(int ident) = 0;
  virtual llvm::Value* codegen(InterpreterContext& interpreter, std::vector<Error>& errors) const = 0;

protected:
  const int line;
  const int column;
};

class NumberExpression: public Expression {
public:
  NumberExpression(int line, int column, int value): Expression(line, column),
    value(value) {}

  void print(int ident) override;
  llvm::Value* codegen(InterpreterContext& interpreter, std::vector<Error>& errors) const override;

private:
  int value;
};

class VariableExpression: public Expression {
public:
  explicit VariableExpression(int line, int column, std::string self, std::string  name): Expression(line, column),
    self(std::move(self)), name(std::move(name)) {}

  void print(int ident) override;
  llvm::Value* codegen(InterpreterContext& interpreter, std::vector<Error>& errors) const override;

private:
  std::string self;
  std::string name;
};

class BinaryOperatorExpression: public Expression {
public:
  BinaryOperatorExpression(int line, int column, char op, std::unique_ptr<Expression> lhs, std::unique_ptr<Expression> rhs):
    Expression(line, column),op(op), lhs(std::move(lhs)), rhs(std::move(rhs)) {}

  void print(int ident) override;
  llvm::Value* codegen(InterpreterContext& interpreter, std::vector<Error>& errors) const override;

private:
  char op;
  std::unique_ptr<Expression> lhs;
  std::unique_ptr<Expression> rhs;
};

class CalleeExpression: public Expression {
public:
  explicit CalleeExpression(int line, int column, std::string self, std::string name): Expression(line, column),
    self(std::move(self)), name(std::move(name)) {}

  CalleeExpression(int line, int column, std::string self, std::string name, std::vector<std::unique_ptr<Expression>>& args):
    Expression(line, column), self(std::move(self)), name(std::move(name)), args(std::move(args)) {}

  void print(int ident) override;
  llvm::Value* codegen(InterpreterContext& interpreter, std::vector<Error>& errors) const override;

private:
  std::string self;
  std::string name;
  std::vector<std::unique_ptr<Expression>> args;
};

class AssignmentExpression: public Expression {
public:
  AssignmentExpression(int line, int column, std::string name, std::unique_ptr<Expression> expression):
    Expression(line, column), name(std::move(name)), expression(std::move(expression)) {}

  void print(int ident) override;
  llvm::Value* codegen(InterpreterContext& interpreter, std::vector<Error>& errors) const override;

private:
  std::string name;
  std::unique_ptr<Expression> expression;
};

class ReturnExpression: public Expression {
public:
  explicit ReturnExpression(int line, int column, std::unique_ptr<Expression> expression):
    Expression(line, column), expression(std::move(expression)) {}

  void print(int ident) override;
  llvm::Value* codegen(InterpreterContext& interpreter, std::vector<Error>& errors) const override;

private:
  std::unique_ptr<Expression> expression;
};

}
