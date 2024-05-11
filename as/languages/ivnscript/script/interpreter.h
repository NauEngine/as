#pragma once

#include <memory>
#include <vector>
#include <string>

#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Passes/StandardInstrumentations.h"
#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"

namespace script {

struct Error;
class ModuleFunction;

class InterpreterContext {
public:
  virtual ~InterpreterContext() = default;

  virtual llvm::IRBuilder<>* getBuilder() = 0;

  [[nodiscard]] virtual bool hasFunction(const std::string& name) const = 0;
  virtual llvm::Function* getFunction(const std::string& name) = 0;

  virtual llvm::Value* addVariable(const std::string& name, llvm::Value* value) = 0;
  [[nodiscard]] virtual bool hasVariable(const std::string& name) const = 0;
  virtual llvm::Value* getVariable(const std::string& name) = 0;

  virtual llvm::Value* getGlobalVariable(const std::string& self, const std::string& name, unsigned index) = 0;

  virtual llvm::Value* getConstant(int value) = 0;
};

// class Interpreter {
// public:
//   Interpreter();
//
//   void addGlobalVariable(const std::string& name);
//   const std::vector<std::string>& getGlobalVariables() const;
//
//   void addGlobalFunction(const std::string& name, int args);
//   const std::vector<std::pair<std::string, int>>& getGlobalFunction() const;
//
//   llvm::LLVMContext* getContext();
//   llvm::IRBuilder<>* getBuilder();
//
//   std::unique_ptr<llvm::Module> createModule(const std::string& name);
//
//
// private:
//   llvm::orc::ThreadSafeContext context;
//   std::unique_ptr<llvm::IRBuilder<>> builder;
//
//   std::vector<std::string> globals;
//   std::vector<std::pair<std::string, int>> funcs;
// };

llvm::Function* build(llvm::LLVMContext& context, llvm::Module* module, const std::string& funcName, const ModuleFunction& func, std::vector<Error>& errors);

}
