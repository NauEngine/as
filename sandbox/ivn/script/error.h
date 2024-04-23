#pragma once

#include <string>

namespace script {

struct Token;

struct Error {
  int line;
  int column;

  std::string message;

  Error(int line, int column, std::string message):
    line(line), column(column), message(std::move(message)) {};

  Error(const Token& token, const std::string& message);
  Error(int line, int column, const std::string& message, const std::string& param);
};

}