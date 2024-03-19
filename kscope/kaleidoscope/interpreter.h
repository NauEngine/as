//
// Created by Alex Zelenshikov on 10.11.2023.
//

#ifndef KALEIDOSCOPE_INTERPRETER_H
#define KALEIDOSCOPE_INTERPRETER_H

#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Passes/StandardInstrumentations.h"

#include "../compiler/jit.h"

namespace kscope
{

class PrototypeAST;
class ExprAST;

class Interpreter
{
public:
  std::unique_ptr<llvm::LLVMContext> context;
  std::unique_ptr<llvm::Module> module;
  std::unique_ptr<llvm::IRBuilder<>> builder;
  std::map<std::string, llvm::AllocaInst *> named_values;

  std::unique_ptr<llvm::FunctionPassManager> TheFPM;
  std::unique_ptr<llvm::FunctionAnalysisManager> TheFAM;
  std::unique_ptr<llvm::ModuleAnalysisManager> TheMAM;
  std::unique_ptr<llvm::PassInstrumentationCallbacks> ThePIC;
  std::unique_ptr<llvm::StandardInstrumentations> TheSI;

  std::map<std::string, std::unique_ptr<PrototypeAST>> function_protos;
  std::map<char, int> binop_precedence;

  std::unique_ptr<as::JIT> jit;

  void Init();
  void InitializeModuleAndManagers();
  llvm::Function* GetFunction(const std::string& name);
  llvm::AllocaInst* CreateEntryBlockAlloca(llvm::Function* function, const std::string& var_name) const;
};

} // end kscope namespace

#endif //KALEIDOSCOPE_INTERPRETER_H
