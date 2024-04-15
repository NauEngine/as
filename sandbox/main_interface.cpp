//
// Created by Alex Zelenshikov on 14.04.2024.
//

#include <iostream>

#include "llvm/ADT/STLExtras.h"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/ExecutionEngine/MCJIT.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/ExecutionEngine/Orc/Core.h"
#include <llvm/ExecutionEngine/Orc/ThreadSafeModule.h>
#include "llvm/IR/Argument.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/raw_ostream.h"

struct ScriptBase
{
  virtual int test1() = 0;
  virtual int test2(int n) = 0;
  virtual int test3(int a, int b) = 0;
};

// Implement in IR:
//struct Script : public ScriptBase
//{
//  int test1() override { return 10; }
//  int test2(int n) override { return 20 + n; }
//  int test3(int a, int b) override { return a + b; }
//};

std::unique_ptr<llvm::Module> create_module(llvm::LLVMContext& context)
{
  std::unique_ptr<llvm::Module> module = std::make_unique<llvm::Module>("myModule", context);
  llvm::IRBuilder<> Builder(context);

  auto int32_t = llvm::Type::getInt32Ty(context);

  llvm::StructType* ScriptType = llvm::StructType::create(context, "Script");

  // Function prototypes
  llvm::FunctionType* test1Type = llvm::FunctionType::get(int32_t, {llvm::PointerType::get(ScriptType, 0)}, false);
  llvm::FunctionType* test2Type = llvm::FunctionType::get(int32_t, {llvm::PointerType::get(ScriptType, 0), int32_t}, false);
  llvm::FunctionType* test3Type = llvm::FunctionType::get(int32_t, {llvm::PointerType::get(ScriptType, 0), int32_t, int32_t}, false);

  // VTable structure
  llvm::StructType* VTableType = llvm::StructType::create(context, "VTable");
  VTableType->setBody({
    llvm::PointerType::get(test1Type, 0),
    llvm::PointerType::get(test2Type, 0),
    llvm::PointerType::get(test3Type, 0)
  });

  // Script structure
  ScriptType->setBody(llvm::PointerType::get(VTableType, 0));

  // Functions
  llvm::Function* test1Func = llvm::Function::Create(test1Type, llvm::Function::ExternalLinkage, "test1", module.get());
  llvm::Function* test2Func = llvm::Function::Create(test2Type, llvm::Function::ExternalLinkage, "test2", module.get());
  llvm::Function* test3Func = llvm::Function::Create(test3Type, llvm::Function::ExternalLinkage, "test3", module.get());

  test1Func->setCallingConv(llvm::CallingConv::Fast);
  test2Func->setCallingConv(llvm::CallingConv::Fast);

  // Entry blocks
  llvm::BasicBlock* test1Block = llvm::BasicBlock::Create(context, "entry", test1Func);
  llvm::BasicBlock* test2Block = llvm::BasicBlock::Create(context, "entry", test2Func);
  llvm::BasicBlock* test3Block = llvm::BasicBlock::Create(context, "entry", test3Func);

  Builder.SetInsertPoint(test1Block);
  Builder.CreateRet(llvm::ConstantInt::get(int32_t, 10));

  Builder.SetInsertPoint(test2Block);
  Builder.CreateRet(Builder.CreateAdd(llvm::ConstantInt::get(int32_t, 20), test2Func->getArg(1)));

  Builder.SetInsertPoint(test3Block);
  Builder.CreateRet(Builder.CreateAdd(test3Func->getArg(1), test3Func->getArg(2)));

  // Create a global vtable
  auto VTable = new llvm::GlobalVariable(*module, VTableType, true, llvm::GlobalValue::ExternalLinkage,
                                         llvm::ConstantStruct::get(VTableType, {test1Func, test2Func, test3Func}), "vtable");

  // Create a global instance of Script with the vtable
  auto ScriptInstance = new llvm::GlobalVariable(*module, ScriptType, false, llvm::GlobalValue::ExternalLinkage,
                                                                  llvm::ConstantStruct::get(ScriptType, {VTable}), "scriptInstance");
  std::string ErrStr;
  llvm::raw_string_ostream OS(ErrStr);
  if (llvm::verifyModule(*module, &OS)) {
    llvm::errs() << "The module is broken!\n";
    exit(1);
  }

  module->print(llvm::errs(), nullptr);

  return module;
}

int main()
{
  llvm::InitializeNativeTarget();
  LLVMInitializeNativeAsmPrinter();

  auto context = std::make_unique<llvm::LLVMContext>();

  auto module = create_module(*context.get());

  auto JIT = cantFail(llvm::orc::LLJITBuilder().create());

  cantFail(JIT->addIRModule(llvm::orc::ThreadSafeModule(std::move(module), std::move(context))));

  auto ScriptInstanceSym = cantFail(JIT->lookup("scriptInstance"));
  auto script_instance = ScriptInstanceSym.toPtr<ScriptBase*>();

  std::cout << script_instance->test1() << std::endl;
  std::cout << script_instance->test2(100) << std::endl;
  std::cout << script_instance->test3(3, 4) << std::endl;
}