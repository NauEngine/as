#pragma once

#include <memory>
#include <string>
#include <vector>

#include "expression.h"

namespace script {

struct ModuleFunction {
  int line;
  int column;
  std::string name;
  std::vector<std::string> args;
  std::vector<std::unique_ptr<Expression>> body;

  ModuleFunction(int line, int column, std::string name, std::vector<std::string> args, std::vector<std::unique_ptr<Expression>> body):
    line(line), column(column), name(std::move(name)), args(std::move(args)), body(std::move(body)) {};
};

class Module {
public:
  void addImport(std::string path);
  void addFunction(ModuleFunction function);

  const std::vector<std::string>& getImports() const;
  const std::vector<ModuleFunction>& getFunctions() const;

private:
  std::vector<std::string> imports;
  std::vector<ModuleFunction> functions;
};

}
