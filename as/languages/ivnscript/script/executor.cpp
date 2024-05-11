#include <iostream>

#include "llvm/Support/ManagedStatic.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/TargetSelect.h"
#include <llvm/ExecutionEngine/Orc/Core.h>
#include <llvm/ExecutionEngine/Orc/RTDyldObjectLinkingLayer.h>
#include <llvm/ExecutionEngine/Orc/IRCompileLayer.h>

#include "executor.h"

namespace script {

int __call0(Executor* executor, void* g, int index) {
  return executor->callGlobalFunction(g, index);
}

int __call1(Executor* executor, void* g, int index, int arg0) {
  return executor->callGlobalFunction(g, index, arg0);
}

Executor::Executor() {
  llvm::InitializeNativeTarget();
  llvm::InitializeNativeTargetAsmPrinter();

  auto j = llvm::orc::LLJITBuilder().create();
  jit = std::move(*j);

  auto e = jit->getMainJITDylib().define(llvm::orc::absoluteSymbols({{
    jit->mangleAndIntern("__call0"),
    { llvm::orc::ExecutorAddr::fromPtr((void*)&__call0), llvm::JITSymbolFlags::Exported | llvm::JITSymbolFlags::Callable }
  }}));


  auto e2 = jit->getMainJITDylib().define(llvm::orc::absoluteSymbols({{
    jit->mangleAndIntern("__call1"),
    { llvm::orc::ExecutorAddr::fromPtr((void*)&__call1), llvm::JITSymbolFlags::Exported | llvm::JITSymbolFlags::Callable }
  }}));

  auto e3 = jit->getMainJITDylib().define(llvm::orc::absoluteSymbols({{
    jit->mangleAndIntern("__executor"),
    { llvm::orc::ExecutorAddr::fromPtr(this), llvm::JITSymbolFlags::Exported }
  }}));
}

bool Executor::addGlobalVariable(const std::string& name, void* var) {
  auto e = jit->getMainJITDylib().define(llvm::orc::absoluteSymbols({{
    jit->mangleAndIntern(name),
    { llvm::orc::ExecutorAddr::fromPtr(var), llvm::JITSymbolFlags::Exported }
  }}));
  return bool(e);
}

bool Executor::addModule(std::unique_ptr<llvm::Module> module, llvm::orc::ThreadSafeContext& context) {
  auto rt = jit->getMainJITDylib().createResourceTracker();
  auto m = llvm::orc::ThreadSafeModule(std::move(module), context);

  auto e = jit->addIRModule(rt, std::move(m));
  return bool(e);
}

Executor::~Executor() {
  llvm::llvm_shutdown();
}

}