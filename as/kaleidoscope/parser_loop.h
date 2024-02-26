//
// Created by Alex Zelenshikov on 13.11.2023.
//

#ifndef KALEIDOSCOPE_PARSER_LOOP_H
#define KALEIDOSCOPE_PARSER_LOOP_H

#include <string>
#include <map>

namespace kscope
{

// The lexer returns tokens [0-255] if it is an unknown character, otherwise one
// of these for known things.
enum Token {
  tok_eof = -1,

  // commands
  tok_def = -2,
  tok_extern = -3,

  // primary
  tok_identifier = -4,
  tok_number = -5,

  // control
  tok_if = -6,
  tok_then = -7,
  tok_else = -8,
  tok_for = -9,
  tok_in = -10,

  // operators
  tok_binary = -11,
  tok_unary = -12,

  // var definition
  tok_var = -13
};

class ExprAST;
class PrototypeAST;
class FunctionAST;
class Interpreter;

class ParserLoop
{
public:
  explicit ParserLoop(Interpreter& interpreter);

  void Run();
  int GetNextToken();

private:
  int current_token = 0;
  int last_char = ' ';
  std::string identifier_str;
  double num_val = 0;

  Interpreter& interpreter;

  int ReadToken();

  int GetTokPrecedence();

  void HandleDefinition();
  void HandleExtern();
  void HandleTopLevelExpression();

  std::unique_ptr<ExprAST> ParseNumberExpr();
  std::unique_ptr<ExprAST> ParseParenExpr();
  std::unique_ptr<ExprAST> ParseIdentifierExpr();
  std::unique_ptr<ExprAST> ParsePrimary();
  std::unique_ptr<ExprAST> ParseBinOpRHS(int ExprPrec, std::unique_ptr<ExprAST> LHS);
  std::unique_ptr<ExprAST> ParseExpression();
  std::unique_ptr<PrototypeAST> ParsePrototype();
  std::unique_ptr<FunctionAST> ParseDefinition();
  std::unique_ptr<FunctionAST> ParseTopLevelExpr();
  std::unique_ptr<PrototypeAST> ParseExtern();
  std::unique_ptr<ExprAST> ParseIfExpr();
  std::unique_ptr<ExprAST> ParseForExpr();
  std::unique_ptr<ExprAST> ParseUnary();
  std::unique_ptr<ExprAST> ParseVarExpr();
};

}

#endif //KALEIDOSCOPE_PARSER_LOOP_H
