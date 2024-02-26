//
// Created by Alex Zelenshikov on 13.11.2023.
//

#include "parser_loop.h"
#include "ast.h"
#include "interpreter.h"
#include "errors.h"

namespace kscope
{

ParserLoop::ParserLoop(Interpreter& interpreter) :
  interpreter(interpreter)
{
}

int ParserLoop::GetTokPrecedence()
{
  if (!isascii(current_token))
    return -1;

  // Make sure it's a declared binop.
  int prec = interpreter.binop_precedence[current_token];
  if (prec <= 0)
    return -1;

  return prec;
}

/// top ::= definition | external | expression | ';'
void ParserLoop::Run()
{
  // Prime the first token.
  fprintf(stderr, "ready> ");
  GetNextToken();

  while (true) {
    fprintf(stderr, "ready> ");
    switch (current_token)
    {
      case tok_eof:
        return;
      case ';': // ignore top-level semicolons.
        GetNextToken();
        break;
      case tok_def:
        HandleDefinition();
        break;
      case tok_extern:
        HandleExtern();
        break;
      default:
        HandleTopLevelExpression();
        break;
    }
  }
}

void ParserLoop::HandleDefinition()
{
  if (auto FnAST = ParseDefinition())
  {
    if (auto *FnIR = FnAST->codegen(interpreter))
    {
      fprintf(stderr, "Read function definition:");
      FnIR->print(llvm::errs());
      fprintf(stderr, "\n");
      ExitOnErr(interpreter.jit->AddModule(
          llvm::orc::ThreadSafeModule(std::move(interpreter.module), std::move(interpreter.context))));
      interpreter.InitializeModuleAndManagers();
    }
  }
  else
  {
    // Skip token for error recovery.
    GetNextToken();
  }
}

void ParserLoop::HandleExtern()
{
  if (auto ProtoAST = ParseExtern())
  {
    if (auto *FnIR = ProtoAST->codegen(interpreter))
    {
      fprintf(stderr, "Read extern: ");
      FnIR->print(llvm::errs());
      fprintf(stderr, "\n");
      interpreter.function_protos[ProtoAST->getName()] = std::move(ProtoAST);
    }
  }
  else
  {
    // Skip token for error recovery.
    GetNextToken();
  }
}

void ParserLoop::HandleTopLevelExpression()
{
  // Evaluate a top-level expression into an anonymous function.
  if (auto FnAST = ParseTopLevelExpr())
  {
    if (FnAST->codegen(interpreter))
    {
      // Create a ResourceTracker to track JIT'd memory allocated to our
      // anonymous expression -- that way we can free it after executing.
      auto RT = interpreter.jit->GetMainJITDylib().createResourceTracker();

      auto TSM = llvm::orc::ThreadSafeModule(std::move(interpreter.module), std::move(interpreter.context));
      ExitOnErr(interpreter.jit->AddModule(std::move(TSM), RT));
      interpreter.InitializeModuleAndManagers();

      // Search the JIT for the __anon_expr symbol.
      auto ExprSymbol = ExitOnErr(interpreter.jit->Lookup("__anon_expr"));

      // Get the symbol's address and cast it to the right type (takes no
      // arguments, returns a double) so we can call it as a native function.
      double (*FP)() = ExprSymbol.getAddress().toPtr<double (*)()>();
      fprintf(stdout, "Evaluated to %f\n", FP());

      // Delete the anonymous expression module from the JIT.
      ExitOnErr(RT->remove());
    }
  }
  else
  {
    // Skip token for error recovery.
    GetNextToken();
  }
}

/// numberexpr ::= number
std::unique_ptr<ExprAST> ParserLoop::ParseNumberExpr()
{
  auto result = std::make_unique<NumberExprAST>(num_val);
  GetNextToken(); // consume the number
  return std::move(result);
}

/// parenexpr ::= '(' expression ')'
std::unique_ptr<ExprAST> ParserLoop::ParseParenExpr()
{
    GetNextToken(); // eat (.
    auto v = ParseExpression();
    if (!v)
      return nullptr;

    if (current_token != ')')
      return LogError("expected ')'");

    GetNextToken(); // eat ).

    return v;
  }

/// identifierexpr
///   ::= identifier
///   ::= identifier '(' expression* ')'
std::unique_ptr<ExprAST> ParserLoop::ParseIdentifierExpr()
{
    std::string id_name = identifier_str;

    GetNextToken(); // eat identifier.

    if (current_token != '(') // Simple variable ref.
      return std::make_unique<VariableExprAST>(id_name);

    // Call.
    GetNextToken(); // eat (

    std::vector<std::unique_ptr<ExprAST>> args;
    if (current_token != ')')
    {
      while (true)
      {
        if (auto arg = ParseExpression())
          args.push_back(std::move(arg));
        else
          return nullptr;

        if (current_token == ')')
          break;

        if (current_token != ',')
          return LogError("Expected ')' or ',' in argument list");

        GetNextToken();
      }
    }

    // Eat the ')'.
    GetNextToken();

    return std::make_unique<CallExprAST>(id_name, std::move(args));
  }

/// primary
///   ::= identifierexpr
///   ::= numberexpr
///   ::= parenexpr
std::unique_ptr<ExprAST> ParserLoop::ParsePrimary()
{
  switch (current_token)
  {
    default:
      return LogError("unknown token when expecting an expression");
    case tok_identifier:
      return ParseIdentifierExpr();
    case tok_number:
      return ParseNumberExpr();
    case '(':
      return ParseParenExpr();
    case tok_if:
      return ParseIfExpr();
    case tok_for:
      return ParseForExpr();
    case tok_var:
      return ParseVarExpr();
  }
}

/// binoprhs
///   ::= ('+' primary)*
std::unique_ptr<ExprAST> ParserLoop::ParseBinOpRHS(int expr_prec, std::unique_ptr<ExprAST> lhs)
{
    // If this is a binop, find its precedence.
    while (true)
    {
      int token_prec = GetTokPrecedence();

      // If this is a binop that binds at least as tightly as the current binop,
      // consume it, otherwise we are done.
      if (token_prec < expr_prec)
        return lhs;

      // Okay, we know this is a binop.
      int bin_op = current_token;
      GetNextToken(); // eat binop

      // Parse the primary expression after the binary operator.
      auto rhs = ParseUnary();
      if (!rhs)
        return nullptr;

      // If BinOp binds less tightly with RHS than the operator after RHS, let
      // the pending operator take RHS as its LHS.
      int next_prec = GetTokPrecedence();
      if (token_prec < next_prec)
      {
        rhs = ParseBinOpRHS(token_prec + 1, std::move(rhs));
        if (!rhs)
          return nullptr;
      }

      // Merge LHS/RHS.
      lhs = std::make_unique<BinaryExprAST>(bin_op, std::move(lhs), std::move(rhs));
    }
  }

/// expression
///   ::= primary binoprhs
///
std::unique_ptr<ExprAST> ParserLoop::ParseExpression()
{
  auto lhs = ParseUnary();
  if (!lhs)
    return nullptr;

  return ParseBinOpRHS(0, std::move(lhs));
}

/// prototype
///   ::= id '(' id* ')'
std::unique_ptr<PrototypeAST> ParserLoop::ParsePrototype()
{
  std::string function_name;

  unsigned kind = 0;  // 0 = identifier, 1 = unary, 2 = binary.
  unsigned binary_precedence = 30;

  switch (current_token)
  {
    default:
      return LogErrorP("Expected function name in prototype");
    case tok_identifier:
      function_name = identifier_str;
      kind = 0;
      GetNextToken();
      break;
    case tok_unary:
      GetNextToken();
      if (!isascii(current_token))
        return LogErrorP("Expected unary operator");
      function_name = "unary";
      function_name += (char)current_token;
      kind = 1;
      GetNextToken();
      break;
    case tok_binary:
      GetNextToken();
      if (!isascii(current_token))
        return LogErrorP("Expected binary operator");
      function_name = "binary";
      function_name += (char)current_token;
      kind = 2;
      GetNextToken();

      // Read the precedence if present.
      if (current_token == tok_number) {
        if (num_val < 1 || num_val > 100)
          return LogErrorP("Invalid precedence: must be 1..100");
        binary_precedence = (unsigned)num_val;
        GetNextToken();
      }
      break;
  }

  if (current_token != '(')
    return LogErrorP("Expected '(' in prototype");

  std::vector<std::string> arg_names;
  while (GetNextToken() == tok_identifier)
    arg_names.push_back(identifier_str);
  if (current_token != ')')
    return LogErrorP("Expected ')' in prototype");

  // success.
  GetNextToken();  // eat ')'.

  // Verify right number of names for operator.
  if (kind && arg_names.size() != kind)
    return LogErrorP("Invalid number of operands for operator");

  return std::make_unique<PrototypeAST>(function_name, std::move(arg_names), kind != 0,
                                        binary_precedence);
}

/// definition ::= 'def' prototype expression
std::unique_ptr<FunctionAST> ParserLoop::ParseDefinition()
{
  GetNextToken(); // eat def.

  auto proto = ParsePrototype();
  if (!proto)
    return nullptr;

  if (auto expr = ParseExpression())
    return std::make_unique<FunctionAST>(std::move(proto), std::move(expr));

  return nullptr;
}

/// toplevelexpr ::= expression
std::unique_ptr<FunctionAST> ParserLoop::ParseTopLevelExpr()
{
  if (auto E = ParseExpression()) {
    // Make an anonymous proto.
    auto Proto = std::make_unique<PrototypeAST>("__anon_expr",
                                                std::vector<std::string>());
    return std::make_unique<FunctionAST>(std::move(Proto), std::move(E));
  }
  return nullptr;
}

/// external ::= 'extern' prototype
std::unique_ptr<PrototypeAST> ParserLoop::ParseExtern()
{
  GetNextToken(); // eat extern.
  return ParsePrototype();
}

/// ifexpr ::= 'if' expression 'then' expression 'else' expression
std::unique_ptr<ExprAST> ParserLoop::ParseIfExpr()
{
  GetNextToken();  // eat the if.

  // condition.
  auto cond_expr = ParseExpression();
  if (!cond_expr)
    return nullptr;

  if (current_token != tok_then)
    return LogError("expected then");

  GetNextToken();  // eat the then

  auto then_expr = ParseExpression();
  if (!then_expr)
    return nullptr;

  if (current_token != tok_else)
    return LogError("expected else");

  GetNextToken();

  auto else_expr = ParseExpression();
  if (!else_expr)
    return nullptr;

  return std::make_unique<IfExprAST>(std::move(cond_expr), std::move(then_expr),
                                     std::move(else_expr));
}

/// forexpr ::= 'for' identifier '=' expr ',' expr (',' expr)? 'in' expression
std::unique_ptr<ExprAST> ParserLoop::ParseForExpr() {
  GetNextToken();  // eat the for.

  if (current_token != tok_identifier)
    return LogError("expected identifier after for");

  std::string id_name = identifier_str;
  GetNextToken();  // eat identifier.

  if (current_token != '=')
    return LogError("expected '=' after for");
  GetNextToken();  // eat '='.

  auto start_expr = ParseExpression();
  if (!start_expr)
    return nullptr;

  if (current_token != ',')
    return LogError("expected ',' after for start value");
  GetNextToken();

  auto end_expr = ParseExpression();
  if (!end_expr)
    return nullptr;

  // The step value is optional.
  std::unique_ptr<ExprAST> step_expr;
  if (current_token == ',') {
    GetNextToken();
    step_expr = ParseExpression();
    if (!step_expr)
      return nullptr;
  }

  if (current_token != tok_in)
    return LogError("expected 'in' after for");
  GetNextToken();  // eat 'in'.

  auto body_expr = ParseExpression();
  if (!body_expr)
    return nullptr;

  return std::make_unique<ForExprAST>(id_name, std::move(start_expr),
                                      std::move(end_expr), std::move(step_expr),
                                      std::move(body_expr));
}

/// unary
///   ::= primary
///   ::= '!' unary
std::unique_ptr<ExprAST> ParserLoop::ParseUnary()
{
  // If the current token is not an operator, it must be a primary expr.
  if (!isascii(current_token) || current_token == '(' || current_token == ',')
    return ParsePrimary();

  // If this is a unary operator, read it.
  int opc = current_token;
  GetNextToken();
  if (auto operand = ParseUnary())
    return std::make_unique<UnaryExprAST>(opc, std::move(operand));

  return nullptr;
}

/// varexpr ::= 'var' identifier ('=' expression)?
//                    (',' identifier ('=' expression)?)* 'in' expression
  std::unique_ptr<ExprAST> ParserLoop::ParseVarExpr()
  {
    GetNextToken(); // eat the var.

    std::vector<std::pair<std::string, std::unique_ptr<ExprAST>>> var_names;

    // At least one variable name is required.
    if (current_token != tok_identifier)
      return LogError("expected identifier after var");

    while (true)
    {
      std::string name = identifier_str;
      GetNextToken(); // eat identifier.

      // Read the optional initializer.
      std::unique_ptr<ExprAST> init_expr = nullptr;
      if (current_token == '=')
      {
        GetNextToken(); // eat the '='.

        init_expr = ParseExpression();
        if (!init_expr)
          return nullptr;
      }

      var_names.push_back(std::make_pair(name, std::move(init_expr)));

      // End of var list, exit loop.
      if (current_token != ',')
        break;
      GetNextToken(); // eat the ','.

      if (current_token != tok_identifier)
        return LogError("expected identifier list after var");
    }

    // At this point, we have to have 'in'.
    if (current_token != tok_in)
      return LogError("expected 'in' keyword after 'var'");
    GetNextToken(); // eat 'in'.

    auto body_expr = ParseExpression();
    if (!body_expr)
      return nullptr;

    return std::make_unique<VarExprAST>(std::move(var_names), std::move(body_expr));
  }

int ParserLoop::GetNextToken()
{
  current_token = ReadToken();
  return current_token;
}

int ParserLoop::ReadToken()
{
  while (isspace(last_char))
  {
    last_char = getchar();
  }

  if (isalpha(last_char))
  { // identifier: [a-zA-Z][a-zA-Z0-9]*
    identifier_str = last_char;
    while (isalnum((last_char = getchar())))
    {
      identifier_str += last_char;
    }

    if (identifier_str == "def")
      return tok_def;
    if (identifier_str == "extern")
      return tok_extern;
    if (identifier_str == "if")
      return tok_if;
    if (identifier_str == "then")
      return tok_then;
    if (identifier_str == "else")
      return tok_else;
    if (identifier_str == "for")
      return tok_for;
    if (identifier_str == "in")
      return tok_in;
    if (identifier_str == "binary")
      return tok_binary;
    if (identifier_str == "unary")
      return tok_unary;
    if (identifier_str == "var")
      return tok_var;

    return tok_identifier;
  }

  if (isdigit(last_char) || last_char == '.') { // Number: [0-9.]+
    std::string num_str;

    do {
      num_str += last_char;
      last_char = getchar();
    } while (isdigit(last_char) || last_char == '.');

    num_val = strtod(num_str.c_str(), nullptr);
    return tok_number;
  }

  if (last_char == '#') {
    // Comment until end of line.
    do
      last_char = getchar();
    while (last_char != EOF && last_char != '\n' && last_char != '\r');

    if (last_char != EOF)
      return ReadToken();
  }

  // Check for end of file.  Don't eat the EOF.
  if (last_char == EOF)
    return tok_eof;

  // Otherwise, just return the character as its ascii value.
  int this_char = last_char;
  last_char = getchar();
  return this_char;
}

}