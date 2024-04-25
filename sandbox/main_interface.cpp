//
// Created by Alex Zelenshikov on 14.04.2024.
//

#include <iostream>

#include "as/core/core.h"
#include "as/core/cpp_interface_parser.h"
#include "as/core/cpp_interface.h"
#include "as/core/language_processor.h"
#include "as/core/script_module.h"

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

class MockLanguageProcessor : public ILanguageProcessor
{
public:
  MockLanguageProcessor() = default;
  ~MockLanguageProcessor() override = default;

  void init(std::shared_ptr<llvm::orc::LLJIT> _jit, llvm::orc::ThreadSafeContext context, std::shared_ptr<CPPParser> parser) override
  {
    jit = _jit;
    ts_context = context;
    cpp_parser = parser;
  }

  llvm::Expected<llvm::orc::ExecutorAddr> new_instance(const std::string& instance_name, const std::string& type_name, const std::string& source_code) override
  {
    auto cpp_interface = cpp_parser->get_interface(type_name, source_code);

    if (!llvm_interfaces.contains(cpp_interface->name))
    {
      auto module = build_cpp_interface_module(cpp_interface);
      llvm::errs() << "\nINTERFACE MODULE: \n" << *module << "\n";

      std::string ErrStr;
      llvm::raw_string_ostream OS(ErrStr);
      if (llvm::verifyModule(*module, &OS)) {
        llvm::errs() << "The module is broken!\n";
        exit(1);
      }

      auto error = jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(module), ts_context));
      if (error)
      {
        return error;
      }
    }

    if (!llvm_interfaces.contains(cpp_interface->name))
    {
      return llvm::createStringError(llvm::inconvertibleErrorCode(), "Cannot build instance");
    }

    auto instance_module = build_cpp_interface_instance_module(llvm_interfaces[cpp_interface->name].get(), instance_name);
    llvm::outs() << "\nINSTANCE MODULE: \n" << *instance_module << "\n";
    std::string ErrStr;
    llvm::raw_string_ostream OS(ErrStr);
    if (llvm::verifyModule(*instance_module, &OS)) {
      llvm::errs() << "The instance module is broken!\n";
      exit(1);
    }


    auto error = jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(instance_module), ts_context));
    if (error)
    {
      return error;
    }

    return jit->lookup(instance_name);
  }

private:
  struct LLVMInterface
  {
    llvm::StructType* interface_type = nullptr;
    llvm::StructType* vtable_type = nullptr;
    std::string vtable_name;
  };

  llvm::orc::ThreadSafeContext ts_context;
  std::shared_ptr<CPPParser> cpp_parser;
  std::unordered_map<std::string, std::unique_ptr<LLVMInterface>> llvm_interfaces;
  std::shared_ptr<llvm::orc::LLJIT> jit;

  static std::string get_instance_module_name(const std::string& instance_name)
  {
    return "__instance_" + instance_name;
  }

  static std::string get_interface_module_name(const std::string& type_name)
  {
    return "__mock_module_" + type_name;
  }

  static std::string get_interface_type_name(const std::string& type_name)
  {
    return "__mock_struct_" + type_name;
  }

  static std::string get_interface_vtable_type_name(const std::string& type_name)
  {
    return "__mock_vtable_type_" + type_name;
  }

  static std::string get_interface_vtable_name(const std::string& type_name)
  {
    return "__mock_vtable_" + type_name;
  }

  std::unique_ptr<llvm::Module> build_cpp_interface_module(const std::shared_ptr<CPPInterface>& interface)
  {
    auto llvm_interface = std::make_unique<LLVMInterface>();

    auto module_name = get_interface_module_name(interface->name);
    auto type_name = get_interface_type_name(interface->name);
    auto vtable_type_name = get_interface_vtable_type_name(interface->name);
    llvm_interface->vtable_name = get_interface_vtable_name(interface->name);

    llvm::LLVMContext& context = *ts_context.getContext();
    std::unique_ptr<llvm::Module> module = std::make_unique<llvm::Module>(module_name, context);

    llvm_interface->interface_type = llvm::StructType::create(context, type_name);
    llvm::PointerType* interface_type_ptr = llvm::PointerType::get(llvm_interface->interface_type, 0);

    auto num_methods = interface->methods.size();
    std::vector<llvm::Type*> vtable_types(num_methods);
    std::vector<llvm::Constant*> vtable_methods(num_methods);

    auto i = interface->methods.size() - 1;
    for (const auto& [func_name, signature] : interface->methods)
    {
      llvm::FunctionType* func_type = build_function_type(signature, interface_type_ptr);
      llvm::Function* method = build_function(func_type, interface->name + "_" + func_name, context, module.get());
      vtable_types[i] = llvm::PointerType::get(func_type, 0);
      vtable_methods[i] = method;
      i--;
    }

    llvm_interface->vtable_type = llvm::StructType::create(context, vtable_type_name);
    llvm_interface->vtable_type->setBody(vtable_types);

    llvm_interface->interface_type->setBody(llvm::PointerType::get(llvm_interface->vtable_type, 0));

    // Create a global vtable
    llvm::Value* vtable = new llvm::GlobalVariable(*module, llvm_interface->vtable_type, true, llvm::GlobalValue::ExternalLinkage,
                                                   llvm::ConstantStruct::get(llvm_interface->vtable_type, vtable_methods),
                                                   llvm_interface->vtable_name);

    llvm_interfaces[interface->name] = std::move(llvm_interface);
    return std::move(module);
  }

  std::unique_ptr<llvm::Module> build_cpp_interface_instance_module(LLVMInterface* llvm_interface, const std::string& instance_name)
  {
    llvm::LLVMContext& context = *ts_context.getContext();
    std::unique_ptr<llvm::Module> module = std::make_unique<llvm::Module>(get_instance_module_name(instance_name), context);

    llvm::Constant* vtable = new llvm::GlobalVariable(*module, llvm_interface->vtable_type, true, llvm::GlobalValue::ExternalLinkage,
                                                   nullptr, // external
                                                   llvm_interface->vtable_name);

    auto ScriptInstance = new llvm::GlobalVariable(*module, llvm_interface->interface_type, false, llvm::GlobalValue::ExternalLinkage,
                                                   llvm::ConstantStruct::get(llvm_interface->interface_type, {vtable}), instance_name);

    return module;
  }

  static llvm::FunctionType* build_function_type(llvm::FunctionType* signature, llvm::PointerType* interface_type_ptr)
  {
    llvm::Type* ret_type = signature->getReturnType();
    std::vector<llvm::Type*> args(signature->getNumParams() + 1);
    args[0] = interface_type_ptr;
    for (int i = 0; i < signature->getNumParams(); ++i)
    {
      args[i + 1] = signature->getParamType(i);
    }

    return llvm::FunctionType::get(ret_type, args, false);
  }

  // Mock functions that sums all its arguments
  static llvm::Function* build_function(llvm::FunctionType* signature, const std::string& name, llvm::LLVMContext& context, llvm::Module* module)
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

  auto mock_processor = std::make_unique<MockLanguageProcessor>();
  script_core->registerLanguage("mock", std::move(mock_processor));

  auto script_module = script_core->newScriptModule("mock");
  auto instance1 = script_module->new_instance<ScriptBase>("instance1");
  auto instance2 = script_module->new_instance<ScriptBase>("instance2");
  auto instance3 = script_module->new_instance<ScriptFoo>("instance3");

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