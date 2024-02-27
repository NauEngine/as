//===------- HowToUseLLJIT.cpp - An example use of ORC-based LLJIT --------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
//  This small program provides an example of how to quickly build a small
//  module with a 'add1' function and use of IRBuilder to create add & return
//  instructions.
//
// Goal:
//  The goal of this snippet is to create in the memory
//  the LLVM module consisting of a function as follow:
//
// int add1(int x) {
//   return x+1;
// }
//  add1(42);
//
// then compile the module via LLJIT, then execute the 'add1'
// function and return result to a driver, i.e. to a "host program".
//
//===----------------------------------------------------------------------===//

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;
using namespace llvm::orc;

ExitOnError ExitOnErr;

Function* createAdd(Module& module, const char* name, int constant)
{
  auto& context = module.getContext();

  Function *Add1F =
      Function::Create(FunctionType::get(Type::getInt32Ty(context),
                                         {Type::getInt32Ty(context)}, false),
                       Function::ExternalLinkage, name, module);

  BasicBlock *BB = BasicBlock::Create(context, "EntryBlock", Add1F);

  IRBuilder<> builder(BB);

  Value *One = builder.getInt32(constant);

  assert(Add1F->arg_begin() != Add1F->arg_end()); // Make sure there's an arg

  Argument *ArgX = &*Add1F->arg_begin();          // Get the arg
  ArgX->setName("AnArg");            // Give it a nice symbolic name for fun.

  Value *Add = builder.CreateAdd(One, ArgX);
  builder.CreateRet(Add);

  return Add1F;
}

Function* createFoo(Module& module, Function* fadd, const char* name, int constant)
{
  auto& context = module.getContext();

  Function *FooF =
      Function::Create(FunctionType::get(Type::getInt32Ty(context), {}, false),
                       Function::ExternalLinkage, name, module);

  BasicBlock *BB = BasicBlock::Create(context, "EntryBlock", FooF);

  IRBuilder<> builder(BB);
  Value *Ten = builder.getInt32(constant);

  CallInst *Add1CallRes = builder.CreateCall(fadd, Ten);
  Add1CallRes->setTailCall(true);

  builder.CreateRet(Add1CallRes);

  return FooF;
}


int main(int argc, char *argv[]) {
  // Initialize LLVM.
  InitLLVM X(argc, argv);

  InitializeNativeTarget();
  InitializeNativeTargetAsmPrinter();

  ThreadSafeContext ts_context(std::make_unique<LLVMContext>());
  ThreadSafeModule ts_module_1(std::make_unique<Module>("test1", *ts_context.getContext()), ts_context);
  ThreadSafeModule ts_module_2(std::make_unique<Module>("test2", *ts_context.getContext()), ts_context);

  ts_module_1.withModuleDo([](Module& module) {
    createAdd(module, "add", 1);
  });

  Function* add_func = ts_module_1.getModuleUnlocked()->getFunction("add");

  ts_module_1.withModuleDo([add_func](Module& module) {
    createFoo(module, add_func, "foo", 20);
  });

  // Create an LLJIT instance.
  auto jit = ExitOnErr(LLJITBuilder().create());

  ExitOnErr(jit->addIRModule(std::move(ts_module_1)));
  ExitOnErr(jit->addIRModule(std::move(ts_module_2)));

  // Look up the JIT'd function, cast it to a function pointer, then call it.
  auto add_addr = ExitOnErr(jit->lookup("add"));
  auto foo_addr = ExitOnErr(jit->lookup("foo"));
  int (*add)(int) = add_addr.toPtr<int(int)>();
  int (*foo)() = foo_addr.toPtr<int()>();

  int result_1 = add(42);
  int result_2 = foo();
  outs() << result_1 << "\n";
  outs() << result_2 << "\n";

  return 0;
}
