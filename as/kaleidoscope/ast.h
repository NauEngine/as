//
// Created by Alex Zelenshikov on 10.11.2023.
//

#ifndef KALEIDOSCOPE_AST_H
#define KALEIDOSCOPE_AST_H

#include "llvm/IR/Value.h"
#include <string>
#include <vector>

//===----------------------------------------------------------------------===//
// Abstract Syntax Tree (aka Parse Tree)
//===----------------------------------------------------------------------===//
namespace kscope
{
  class Interpreter;

/// ExprAST - Base class for all expression nodes.
  class ExprAST
  {
  public:
    virtual ~ExprAST() = default;

    virtual llvm::Value* codegen(Interpreter& interpreter) = 0;
  };

/// NumberExprAST - Expression class for numeric literals like "1.0".
  class NumberExprAST : public ExprAST
  {
    double value;

  public:
    NumberExprAST(double value) :
        value(value)
    {}

    llvm::Value* codegen(Interpreter& interpreter) override;
  };

/// VariableExprAST - Expression class for referencing a variable, like "a".
  class VariableExprAST : public ExprAST
  {
    std::string name;

  public:
    VariableExprAST(const std::string& name) :
        name(name)
    {}

    llvm::Value* codegen(Interpreter& interpreter) override;
    const std::string& getName() const { return name; }
  };

/// BinaryExprAST - Expression class for a binary operator.
  class BinaryExprAST : public ExprAST
  {
    char op;
    std::unique_ptr<ExprAST> lhs, rhs;

  public:
    BinaryExprAST(char op, std::unique_ptr<ExprAST> lhs, std::unique_ptr<ExprAST> rhs) :
        op(op), lhs(std::move(lhs)), rhs(std::move(rhs))
    {}

    llvm::Value* codegen(Interpreter& interpreter) override;
  };

/// CallExprAST - Expression class for function calls.
  class CallExprAST : public ExprAST
  {
    std::string callee;
    std::vector<std::unique_ptr<ExprAST>> args;

  public:
    CallExprAST(const std::string& callee, std::vector<std::unique_ptr<ExprAST>> args) :
        callee(callee), args(std::move(args))
    {}

    llvm::Value* codegen(Interpreter& interpreter) override;
  };

/// PrototypeAST - This class represents the "prototype" for a function,
/// which captures its name, and its argument names (thus implicitly the number
/// of arguments the function takes).
  class PrototypeAST {
    std::string name;
    std::vector<std::string> args;
    bool is_operator;
    unsigned precedence;  // Precedence if a binary op.

  public:
    PrototypeAST(const std::string& name, std::vector<std::string> args,
                 bool is_operator = false, unsigned precedence = 0):
        name(name),
        args(std::move(args)),
        is_operator(is_operator),
        precedence(precedence)
        {}

    llvm::Function* codegen(Interpreter& interpreter);
    const std::string& getName() const { return name; }

    bool isUnaryOp() const { return is_operator && args.size() == 1; }
    bool isBinaryOp() const { return is_operator && args.size() == 2; }

    char getOperatorName() const
    {
      assert(isUnaryOp() || isBinaryOp());
      return name[name.size() - 1];
    }

    unsigned getBinaryPrecedence() const { return precedence; }
  };
/// FunctionAST - This class represents a function definition itself.
  class FunctionAST
  {
    std::unique_ptr<PrototypeAST> proto;
    std::unique_ptr<ExprAST> body;

  public:
    FunctionAST(std::unique_ptr<PrototypeAST> proto, std::unique_ptr<ExprAST> body) :
        proto(std::move(proto)), body(std::move(body))
    {}

    llvm::Function* codegen(Interpreter& interpreter);
  };

/// IfExprAST - Expression class for if/then/else.
  class IfExprAST : public ExprAST {
    std::unique_ptr<ExprAST> cond_expr;
    std::unique_ptr<ExprAST> then_expr;
    std::unique_ptr<ExprAST> else_expr;

  public:
    IfExprAST(std::unique_ptr<ExprAST> cond_expr, std::unique_ptr<ExprAST> then_expr, std::unique_ptr<ExprAST> else_expr) :
      cond_expr(std::move(cond_expr)),
      then_expr(std::move(then_expr)),
      else_expr(std::move(else_expr))
      {}

    llvm::Value* codegen(Interpreter& interpreter) override;
  };

  /// ForExprAST - Expression class for for/in.
  class ForExprAST : public ExprAST {
    std::string var_name;
    std::unique_ptr<ExprAST> start_expr;
    std::unique_ptr<ExprAST> end_expr;
    std::unique_ptr<ExprAST> step_expr;
    std::unique_ptr<ExprAST> body_expr;

  public:
    ForExprAST(const std::string& var_name, std::unique_ptr<ExprAST> start_expr,
               std::unique_ptr<ExprAST> end_expr, std::unique_ptr<ExprAST> step_expr,
               std::unique_ptr<ExprAST> body_expr) :
      var_name(var_name),
      start_expr(std::move(start_expr)),
      end_expr(std::move(end_expr)),
      step_expr(std::move(step_expr)),
      body_expr(std::move(body_expr))
      {}

    llvm::Value* codegen(Interpreter& interpreter) override;
  };

/// UnaryExprAST - Expression class for a unary operator.
  class UnaryExprAST : public ExprAST {
    char opcode;
    std::unique_ptr<ExprAST> operand;

  public:
    UnaryExprAST(char opcode, std::unique_ptr<ExprAST> operand)
        : opcode(opcode), operand(std::move(operand)) {}

    llvm::Value* codegen(Interpreter& interpreter) override;
  };

  /// VarExprAST - Expression class for var/in
  class VarExprAST : public ExprAST {
    std::vector<std::pair<std::string, std::unique_ptr<ExprAST>>> var_names;
    std::unique_ptr<ExprAST> body;

  public:
    VarExprAST(std::vector<std::pair<std::string, std::unique_ptr<ExprAST>>> var_names,
               std::unique_ptr<ExprAST> body) :
      var_names(std::move(var_names)),
      body(std::move(body))
      {}

    llvm::Value* codegen(Interpreter& interpreter) override;
  };

} // end kscope namespace

#endif //KALEIDOSCOPE_AST_H
