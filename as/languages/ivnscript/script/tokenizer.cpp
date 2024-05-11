#include "tokenizer.h"

namespace script {

const char* SYMBOLS = "=+-*(){},;.";

TokenType getTokenType(char firstChar) {
  if (isalpha(firstChar))
    return TOK_IDENTIFIER;
  if (isdigit(firstChar))
    return TOK_NUMBER;
  if (firstChar == '"')
    return TOK_STRING;
  if (strchr(SYMBOLS, firstChar))
    return TOK_SYMBOL;

  return TOK_INVALID_CHAR;
}

bool isIdentifier(char c) {
  return isalnum(c) || c == '_';
}

void collectIdentifier(Token& token) {
  while (isIdentifier(token.text[token.length])) {
    token.length++;
  }
}

void collectNumber(Token& token) {
  while (isdigit(token.text[token.length])) {
    token.length++;
  }
}

void collectString(Token& token) {
  while (token.text[token.length] && token.text[token.length] != '"') {
    token.length++;
  }

  if (token.text[token.length] == '"') {
    token.text++;
    token.length--;
  } else {
    token.type = TOK_INVALID_STRING;
  }
}

bool moveToken(Token& token) {
  // move to the end of current token
  const int length = token.type == TOK_STRING ? token.length + 1 : token.length;
  token.text += length;
  token.column += length;
  token.length = 0;

  // find first non-space symbol
  while (isspace(*token.text)) {
    if (*token.text == '\n') {
      token.line++;
      token.column = 1;
    } else {
      token.column++;
    }

    token.text++;
  }

  const auto c = *token.text;
  if (!c) {
    token.type = TOK_END_OF_CONTENT;
    return false;
  }

  const auto type = getTokenType(c);
  token.type = type;
  token.length = 1;

  if (token.type == TOK_IDENTIFIER) {
    collectIdentifier(token);
  } else if (token.type == TOK_NUMBER) {
    collectNumber(token);
  } else if (token.type == TOK_STRING) {
    collectString(token);
  }

  return true;
}

Token::Token(const char*  content):
  line(1), column(1), type(TOK_INVALID_CHAR), text(content), length(0) {
}

Tokenizer::Tokenizer(const char* content):
  content(content), token(this->content.c_str()), nextToken((this->content.c_str())) {

  moveToken(nextToken);
}

bool Tokenizer::move() {
  token = nextToken;
  if (token.type == TOK_END_OF_CONTENT)
    return false;

  moveToken(nextToken);
  return true;
}

const Token& Tokenizer::current() const {
  return this->token;
}

const Token& Tokenizer::next() const {
  return this->nextToken;
}

}