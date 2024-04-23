#include <utility>

#include "expression.h"
#include "tokenizer.h"

#include "parser.h"

namespace script {

bool checkToken(Tokenizer& tokenizer, TokenType type, char c = 0) {
  if (!tokenizer.move())
    return false;

  const auto &token = tokenizer.current();
  if (token.type != type)
    return false;

  if (c && *token.text != c)
    return false;

  return true;
}

bool parseImport(Module& module, Tokenizer& tokenizer, std::vector<Error>& errors) {
  if (!checkToken(tokenizer, TOK_STRING)) {
    errors.emplace_back(tokenizer.current(), "Module path expected, but '$@' found");
    return false;
  }

  const std::string path(tokenizer.current().text, tokenizer.current().length);
  if (!checkToken(tokenizer, TOK_SYMBOL, ';')) {
    errors.emplace_back(tokenizer.current(), "Expected ';', but '$@' found");
    return false;
  }

  module.addImport(path);
  return true;
}

bool parseFunctionArgs(Tokenizer& tokenizer, std::vector<std::string>& args, std::vector<Error>& errors) {
  while (checkToken(tokenizer, TOK_IDENTIFIER)) {
    const std::string arg(tokenizer.current().text, tokenizer.current().length);
    args.push_back(arg);
    if (!checkToken(tokenizer, TOK_SYMBOL)) {
      errors.emplace_back(tokenizer.current(), "Expected ')', but '$@' found");
      return false;
    }

    const char c = *tokenizer.current().text;
    if (c == ')')
      return true;

    if (c != ',') {
      errors.emplace_back(tokenizer.current(), "Expected ')', but '$@' found");
      return false;
    }
  }

  if (tokenizer.current().type == TOK_SYMBOL && *tokenizer.current().text == ')')
    return true;

  errors.emplace_back(tokenizer.current(), "Expected function argument, but '$@' found");
  return false;
}

std::unique_ptr<Expression> parseExpression(Tokenizer &tokenizer, std::vector<Error>& errors, bool isSimple);

std::unique_ptr<CalleeExpression> parseFunctionCall(Tokenizer& tokenizer, std::vector<Error>& errors, const std::string& self) {
  const std::string name(tokenizer.current().text, tokenizer.current().length);
  const int line = tokenizer.current().line;
  const int column = tokenizer.current().column;

  if (!checkToken(tokenizer, TOK_SYMBOL, '(')) {
    errors.emplace_back(tokenizer.current(), "Expected '(', but '$@' found");
    return nullptr;
  }

  if (tokenizer.next().type == TOK_SYMBOL && *tokenizer.next().text == ')') {
    tokenizer.move();
    return std::make_unique<CalleeExpression>(line, column, self, name);
  }

  std::vector<std::unique_ptr<Expression>> args;
  while (auto expression = parseExpression(tokenizer, errors, false)) {
    args.push_back(std::move(expression));
    if (!checkToken(tokenizer, TOK_SYMBOL)) {
      errors.emplace_back(tokenizer.current(), "Expected ')', but '$@' found");
      return nullptr;
    }

    const char c = *tokenizer.current().text;
    if (c == ')') {
      return std::make_unique<CalleeExpression>(line, column, self, name, args);
    } else if (c != ',') {
      errors.emplace_back(tokenizer.current(), "Expected ')', but '$@' found");
      return nullptr;
    }
  }

  return nullptr;
}

std::unique_ptr<Expression> parseExpression(Tokenizer &tokenizer, std::vector<Error>& errors, bool isSimple) {
  tokenizer.move();
  const auto& token = tokenizer.current();
  if (token.type == TOK_NUMBER) {
    const std::string value(token.text, token.length);
    return std::make_unique<NumberExpression>(token.line, token.column, std::stoi(value));
  } else if (token.type != TOK_IDENTIFIER) {
    errors.emplace_back(tokenizer.current(), "Expected expression, but '$@' found");
    return nullptr;
  } else if (tokenizer.next().type != TOK_SYMBOL) {
    tokenizer.move();
    errors.emplace_back(tokenizer.current(), "Expected expression, but '$@' found");
    return nullptr;
  }

  char nextTokenChar = *tokenizer.next().text;
  int nextTokenLine = tokenizer.next().line;
  int nextTokenColumn = tokenizer.next().column;

  std::string self;

  if (nextTokenChar == '.') {
    self = std::string(tokenizer.current().text, tokenizer.current().length);
    tokenizer.move();
    if (!checkToken(tokenizer, TOK_IDENTIFIER)) {
      errors.emplace_back(tokenizer.current(), "Expected class member, but '$@' found");
      return nullptr;
    }

    nextTokenChar = *tokenizer.next().text;
    nextTokenLine = tokenizer.next().line;
    nextTokenColumn = tokenizer.next().column;
  }

  std::unique_ptr<Expression> lhs;
  if (nextTokenChar == '(') {
    lhs = parseFunctionCall(tokenizer, errors, self);

    nextTokenChar = *tokenizer.next().text;
    nextTokenLine = tokenizer.next().line;
    nextTokenColumn = tokenizer.next().column;
  } else {
    lhs = std::make_unique<VariableExpression>(token.line, token.column, self, std::string(token.text, token.length));
  }

  if (nextTokenChar == '+' || nextTokenChar == '-') {
    if (isSimple) {
      errors.emplace_back(nextTokenLine, nextTokenColumn, "Expected end of an expression, but '$@' found", std::string(1, nextTokenChar));
      return nullptr;
    }

    tokenizer.move();
    auto rhs = parseExpression(tokenizer, errors, true);
    if (!rhs)
      return nullptr;

    return std::make_unique<BinaryOperatorExpression>(nextTokenLine, nextTokenColumn, nextTokenChar, std::move(lhs), std::move(rhs));
  }

  return lhs;
}

bool parseFunctionBody(Tokenizer &tokenizer, std::vector<std::unique_ptr<Expression>>& body, std::vector<Error>& errors) {
  while (checkToken(tokenizer, TOK_IDENTIFIER)) {
    const auto& token = tokenizer.current();
    const int line = token.line;
    const int column = token.column;
    if (strncmp(token.text, "var", token.length) == 0) {
      if (!checkToken(tokenizer, TOK_IDENTIFIER)) {
        errors.emplace_back(tokenizer.current(), "Expected variable name, but '$@' found");
        return false;
      }

      const std::string name(tokenizer.current().text, tokenizer.current().length);

      if (!checkToken(tokenizer, TOK_SYMBOL, '=')) {
        errors.emplace_back(tokenizer.current(), "Expected '=', but '$@' found");
        return false;
      }

      auto value = parseExpression(tokenizer, errors, false);
      if (!value)
        return false;

      body.push_back(std::make_unique<AssignmentExpression>(line, column, name, std::move(value)));
    } else if (strncmp(token.text, "return", token.length) == 0) {
      auto value = parseExpression(tokenizer, errors, false);
      if (!value)
        return false;

      body.push_back(std::make_unique<ReturnExpression>(line, column, std::move(value)));
    } else {
      std::string self;
      if (tokenizer.next().type == TOK_SYMBOL && *tokenizer.next().text == '.') {
        self = std::string(tokenizer.current().text, tokenizer.current().length);
        tokenizer.move();
        if (!checkToken(tokenizer, TOK_IDENTIFIER)) {
          errors.emplace_back(tokenizer.current(), "Expected class member, but '$@' found");
          return false;
        }
      }

      auto value = parseFunctionCall(tokenizer, errors, self);
      if (!value)
        return false;

      body.push_back(std::move(value));
    }

    if (!checkToken(tokenizer, TOK_SYMBOL, ';')) {
      errors.emplace_back(tokenizer.current(), "Expected ';', but '$@' found");
      return false;
    }
  }

  if (tokenizer.current().type == TOK_SYMBOL && *tokenizer.current().text == '}')
    return true;

  errors.emplace_back(tokenizer.current(), "Expected expression, but '$@' found");
  return false;
}

bool parseFunction(Module& module, Tokenizer& tokenizer, std::vector<Error>& errors) {
  if (!checkToken(tokenizer, TOK_IDENTIFIER)) {
    errors.emplace_back(tokenizer.current(), "Expected function name, but '$@' found");
    return false;
  }

  const std::string name(tokenizer.current().text, tokenizer.current().length);
  const int line = tokenizer.current().line;
  const int column = tokenizer.current().column;

  if (!checkToken(tokenizer, TOK_SYMBOL, '(')) {
    errors.emplace_back(tokenizer.current(), "Expected '(', but '$@' found");
    return false;
  }

  std::vector<std::string> args;
  if (!parseFunctionArgs(tokenizer, args, errors))
    return false;

  if (!checkToken(tokenizer, TOK_SYMBOL, '{')) {
    errors.emplace_back(tokenizer.current(), "Expected '{', but '$@' found");
    return false;
  }

  std::vector<std::unique_ptr<Expression>> body;
  if (!parseFunctionBody(tokenizer, body, errors))
    return false;

  module.addFunction({ line, column, name, args, std::move(body) });
  return true;
}

std::unique_ptr<Module> parse(const char* content, std::vector<Error>& errors) {
  Tokenizer tokenizer(content);

  auto result = std::make_unique<Module>();
  bool inError = false;

  while (tokenizer.move()) {
    const auto &token = tokenizer.current();
    if (token.type == TOK_IDENTIFIER && strncmp(token.text, "import", token.length) == 0) {
      inError = !parseImport(*result.get(), tokenizer, errors);
    } else if (token.type == TOK_IDENTIFIER && strncmp(token.text, "function", token.length) == 0) {
      inError = !parseFunction(*result.get(), tokenizer, errors);
    } else if (!inError){
      errors.emplace_back(token, "Keyword 'import' or 'function' expected, but '$@' found");
      inError = true;
    }
  }

  return std::move(result);
}

}