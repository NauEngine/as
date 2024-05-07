//
// Created by Alex Zelenshikov on 14.04.2024.
//

#include <iostream>

#include "as/core/core.h"
#include "as/core/cpp_interface_parser.h"
#include "as/core/cpp_interface.h"
#include "as/core/language_processor.h"
#include "as/core/language.h"
#include "as/core/script_module.h"
#include "as/core/ir.h"

#include "clang/Basic/TargetInfo.h"

#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/TargetParser/Host.h"

using namespace as;

DEFINE_SCRIPT_INTERFACE(ScriptBase,
struct ScriptBase
{
  virtual int test1() = 0;
  virtual int test2(int n) = 0;
  virtual int test3(int a, int b) = 0;
  virtual int test4(int a, int b, double c) = 0;
};
)

DEFINE_SCRIPT_INTERFACE(ScriptFoo,
struct ScriptFoo
{
  virtual int test1() = 0;
  virtual int test2(int a, int b, double c) = 0;
};
)


struct MockLanguage final : ILanguage
{
  const char* prefix() override { return "mock"; }

  llvm::Function* buildFunction(llvm::FunctionType* signature, const std::string& name,
                                        llvm::LLVMContext& context, llvm::Module* module) override
  {
    llvm::IRBuilder<> builder(context);
    llvm::Type* int32_t = llvm::Type::getInt32Ty(context);

    llvm::Function* func = llvm::Function::Create(signature, llvm::Function::ExternalLinkage, name, module);
    //func->setCallingConv(llvm::CallingConv::); // [AZ] TODO dive deep into calling conventions

    llvm::BasicBlock* block = llvm::BasicBlock::Create(context, "entry", func);
    builder.SetInsertPoint(block);

    llvm::Value* sum = llvm::ConstantInt::get(int32_t, 0);

    for (int i = 1; i < func->arg_size(); ++i)
    {
      llvm::Value* next_arg = func->getArg(i);

      if (next_arg->getType() != int32_t)
      {
        next_arg = builder.CreateFPToSI(next_arg, int32_t, "toInt");
      }

      sum = builder.CreateAdd(sum, next_arg);
    }

    builder.CreateRet(sum);

    return func;
  }
};

int main()
{
  auto script_core = std::make_shared<as::Core>();

  auto mock_processor = std::make_unique<MockLanguage>();
  script_core->registerLanguage("mock", std::move(mock_processor));

  auto script_module = script_core->newScriptModule("mock");
  auto instance1 = script_module->newInstance<ScriptBase>("instance1");
  auto instance2 = script_module->newInstance<ScriptBase>("instance2");
  auto instance3 = script_module->newInstance<ScriptFoo>("instance3");

  std::cout << instance1->test1() << std::endl;
  std::cout << instance1->test2(500) << std::endl;
  std::cout << instance1->test3(3, 4) << std::endl;
  std::cout << instance1->test4(1, 2, 30.0) << std::endl << std::endl;

  std::cout << instance2->test1() << std::endl;
  std::cout << instance2->test2(5000) << std::endl;
  std::cout << instance2->test3(3, 44) << std::endl;
  std::cout << instance2->test4(3, 2, 300.0) << std::endl << std::endl;

  std::cout << instance3->test1() << std::endl;
  std::cout << instance3->test2(3, 3, 2300.0) << std::endl << std::endl;
}