#pragma once

#include <string>

/*
 * import "<filename>";=
 *
 * function <name>(<arg1>, <arg2>, ...) {
 *   var arg3 = arg1 + arg2;
 *   return arg3;
 * }
 *
 */

namespace script {

enum TokenType {
  TOK_INVALID_CHAR,
  TOK_INVALID_STRING,
  TOK_END_OF_CONTENT,

  TOK_IDENTIFIER,
  TOK_NUMBER,
  TOK_STRING,
  TOK_SYMBOL,
};

struct Token {
  int line;
  int column;

  TokenType type;
  const char *text;
  int length;

  explicit Token(const char* content);
};

class Tokenizer
{
public:
  explicit Tokenizer(const char* content);

  bool move();

  [[nodiscard]]
  const Token& current() const;

  [[nodiscard]]
  const Token& next() const;

private:
  const std::string content;
  Token token;
  Token nextToken;
};

}