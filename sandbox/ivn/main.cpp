#include <iostream>
#include "script/error.h"
#include "script/parser.h"
#include "script/interpreter.h"
#include "script/executor.h"

const char* CODE = "function foo() { g1.c(); g2.d(42); g3.d(13); var c = g1.b + g1.a; return c + g3.a; }";

struct Global1 {
  int a;
  int b;

  int c() {
    std::cout << "[foo] Global1: { a: " << a << ", b: " << b << " };\n";
    return 42;
  }
};

struct Global2 {
  int a;

  int d(int p) {
    std::cout << "[bar(" << p << ")] Global2: { a: " << a << " };\n";
    return 42;
  }
};

int main() {
  std::vector<script::Error> errors;
  script::Interpreter interpreter;

  interpreter.addGlobalVariable("g1");
  interpreter.addGlobalVariable("g2");
  interpreter.addGlobalVariable("g3");
//  interpreter.addGlobalFunction("c", 0);
//  interpreter.addGlobalFunction("d", 1);

  auto parsed = std::move(script::parse(CODE, errors));
  auto module = std::move(script::build(interpreter, "module1", *parsed, errors));

  if (!errors.empty()) {
    for (const auto &error: errors) {
      std::cout << "E: (" << error.line << ":" << error.column << "): " << error.message << "\n";
    }

    return 1;
  }

  module->print(llvm::outs(), nullptr);

  script::Executor executor;
  Global1 g1 = { 42, 13 };
  Global2 g2 = { 420 };
  Global2 g3 = { 1 };
  executor.addGlobalFunction("c", &Global1::c);
  executor.addGlobalFunction("d", &Global2::d);
  executor.addGlobalVariable("g1", &g1);
  executor.addGlobalVariable("g2", &g2);
  executor.addGlobalVariable("g3", &g3);
  executor.addModule(std::move(module), interpreter.getThreadSafeContext());

  auto func = executor.getSymbol<int()>("foo");
  auto result = func();
  std::cout << "Return value: " << result << "\n";

  return 0;
}
