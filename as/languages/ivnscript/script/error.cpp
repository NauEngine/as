#include "tokenizer.h"

#include "error.h"

namespace script {

std::string formatMessage(const std::string& message, const std::string& param) {
  std::string result(message);

  if (param.empty())
    return result;

  const auto pos = result.find("$@");
  if (pos != std::string::npos) {
    result.replace(pos, 2, param);
  }

  return result;
}

std::string getTokenString(const Token& token) {
  if (token.type == TOK_END_OF_CONTENT)
    return "EOF";

  return {token.text, static_cast<size_t>(token.length)};
}

Error::Error(const Token& token, const std::string& message):
  line(token.line), column(token.column), message(formatMessage(message, getTokenString(token))) {}

Error::Error(int line, int column, const std::string& message, const std::string& param):
  line(line), column(column), message(formatMessage(message, param)) {}

}