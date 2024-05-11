#include <iostream>

#include "module.h"

namespace script {

void Module::addImport(std::string path) {
  imports.push_back(std::move(path));
}

void Module::addFunction(ModuleFunction function) {
  functions.push_back(std::move(function));
}

const std::vector<std::string>& Module::getImports() const {
  return imports;
}
const std::vector<ModuleFunction>& Module::getFunctions() const {
  return functions;
}
//
//void Module::print() const {
//  if (errors.empty()) {
//    std::cout << "Imports (" << imports.size() << "):\n";
//    for (const auto& import: imports) {
//      std::cout << " " << import << "\n";
//    }
//
//    std::cout << "Functions (" << functions.size() << "):\n";
//    for (const auto& func: functions) {
//      std::cout << " " << func.name;
//      if (!func.args.empty()) {
//        std::cout << ":";
//        for (const auto& arg: func.args) {
//          std::cout << " " << arg;
//        }
//      }
//      std::cout << "\n";
//      if (func.body.empty()) {
//        std::cout << "  No body!\n";
//      } else {
//        for (const auto& expr: func.body) {
//          expr->print(2);
//        }
//      }
//    }
//  } else {
//    std::cout << "Errors (" << errors.size() << "):\n";
//    for (const auto& error: errors) {
//      std::cout << " E: (" << error.line << ':' << error.column << "): " << error.message << '\n' << "foo";
//    }
//  }
//}
//
//void Module::codegen(const std::string& module) {
//  Interpreter interpreter(module);
//  for (const auto& func: functions) {
//    interpreter.addFunction(func.name, func.args);
//  }
//
//  for (const auto& func: functions) {
//    interpreter.implementFunction(*this, func.name, func.body);
//  }
//
//  interpreter.print();
//}

}