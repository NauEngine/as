#include "llvm/IR/Verifier.h"

#include "expression.h"
#include "module.h"
#include "error.h"

#include "interpreter.h"

namespace script {

// Interpreter::Interpreter() {
//   context = std::make_unique<llvm::LLVMContext>();
//   builder = std::make_unique<llvm::IRBuilder<>>(*context.getContext());
// }
//
// void Interpreter::addGlobalVariable(const std::string &name) {
//   globals.emplace_back(name);
// }
//
// const std::vector<std::string>& Interpreter::getGlobalVariables() const {
//   return globals;
// }
//
// void Interpreter::addGlobalFunction(const std::string &name, int args) {
//   funcs.push_back({ name, args });
// }
//
// const std::vector<std::pair<std::string, int>>& Interpreter::getGlobalFunction() const {
//   return funcs;
// }
//
// llvm::LLVMContext* Interpreter::getContext() {
//   return context.getContext();
// }
//
// llvm::IRBuilder<>* Interpreter::getBuilder() {
//   return builder.get();
// }
//
// std::unique_ptr<llvm::Module> Interpreter::createModule(const std::string& name) {
//   return std::make_unique<llvm::Module>(name, *context.getContext());
// }

class ModuleContext: public InterpreterContext {
public:
  explicit ModuleContext(llvm::LLVMContext& llvmContext, llvm::Module& llvmModule): context(llvmContext), module(llvmModule), covertReturn(false)
  {
    builder = std::make_unique<llvm::IRBuilder<>>(llvmContext);

//     // type for global struct
//     std::vector<llvm::Type*> members;
//     members.push_back(llvm::Type::getInt32Ty(*interpreter.getContext()));
//     members.push_back(llvm::Type::getInt32Ty(*interpreter.getContext()));
//
//     structType = llvm::StructType::create(*interpreter.getContext(), members, "GlobalStruct");
//
//     // function from global struct
// //    for (const auto& func: interpreter.getGlobalFunction()) {
// //      std::vector<llvm::Type*> argTypes(func.second, llvm::Type::getInt32Ty(*interpreter.getContext()));
// //      argTypes.insert(argTypes.begin(), llvm::PointerType::getUnqual(structType));
// //      llvm::FunctionType* funcType = llvm::FunctionType::get(llvm::Type::getInt32Ty(*interpreter.getContext()), argTypes, false);
// //      llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, "GlobalStruct_" + func.first, module.get());
// //    }
//
//   auto pointerType = llvm::PointerType::get(llvm::Type::getInt32Ty(*interpreter.getContext()), 0);
//     {
//       std::vector<llvm::Type*> argTypes(1, llvm::Type::getInt32Ty(*interpreter.getContext()));
//       argTypes.insert(argTypes.begin(), pointerType);
//       argTypes.insert(argTypes.begin(), llvm::PointerType::getUnqual(structType));
//       llvm::FunctionType* funcType = llvm::FunctionType::get(llvm::Type::getInt32Ty(*interpreter.getContext()), argTypes, false);
//       llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, "__call0", module.get());
//     }
//
//     {
//       std::vector<llvm::Type*> argTypes(2, llvm::Type::getInt32Ty(*interpreter.getContext()));
//       argTypes.insert(argTypes.begin(), pointerType);
//       argTypes.insert(argTypes.begin(), llvm::PointerType::getUnqual(structType));
//       llvm::FunctionType* funcType = llvm::FunctionType::get(llvm::Type::getInt32Ty(*interpreter.getContext()), argTypes, false);
//       llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, "__call1", module.get());
//     }
//
//     // global structs from context
//     for (const auto& var: interpreter.getGlobalVariables()) {
//       globals[var] = module->getOrInsertGlobal(var, structType);
//     }
//
//     globals["__executor"] = module->getOrInsertGlobal("__executor", pointerType);
  }

  llvm::LLVMContext& getContext() {
    return context;
  }

  llvm::IRBuilder<>* getBuilder() override {
    return builder.get();
  }

  [[nodiscard]] bool hasFunction(const std::string& name) const override {
    return module.getFunction(name) != nullptr;
  }

  llvm::Function* getFunction(const std::string& name) override {
    return module.getFunction(name);
  }

  llvm::Value* addVariable(const std::string& name, llvm::Value* value) override {
    if (hasVariable(name))
      return nullptr;

    auto var = getBuilder()->CreateAlloca(llvm::Type::getInt32Ty(context), nullptr, name);
    getBuilder()->CreateStore(value, var);

    locals[name] = var;
    return value;
  }

  [[nodiscard]] bool hasVariable(const std::string& name) const override {
    return variables.contains(name) || globals.contains(name) || locals.contains(name);
  }

  llvm::Value* getVariable(const std::string& name) override {
    if (variables.contains(name))
      return variables[name];
    if (globals.contains(name)) {
      auto global = globals[name];
      llvm::Value* globalPtr = builder->CreatePointerCast(global, llvm::PointerType::getUnqual(structType), "p_" + name);
      variables[name] = globalPtr;
      return globalPtr;
    }
    if (locals.contains(name)) {
      auto var = locals[name];
      auto load = getBuilder()->CreateLoad(llvm::Type::getInt32Ty(context), var, "l_" + name);
      variables[name] = load;
      return load;
    }

    return nullptr;
  }

  llvm::Value* getGlobalVariable(const std::string& self, const std::string& name, unsigned index) override {
    if (!globals.contains(self))
      return nullptr;

    std::vector<llvm::Type*> members;
    members.push_back(llvm::Type::getInt32Ty(context));
    members.push_back(llvm::Type::getInt32Ty(context));

    llvm::Value* globalPtr = getVariable(self);
    llvm::Value* varPtr = builder->CreateStructGEP(structType, globalPtr, index, "p_" + name);
    llvm::Value* value = builder->CreateLoad(llvm::Type::getInt32Ty(context), varPtr, name);

    return value;
  }

  llvm::Value* getConstant(int value) override {
    return llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), value);
  }

  void declareFunction(const std::string& name, llvm::FunctionType* signature, const std::vector<std::string>& args) {
    auto func = getFunction(name);
    if (func)
      return;

    llvm::Function* result = llvm::Function::Create(signature, llvm::Function::InternalLinkage, name, module);
    unsigned index = 0;
    for (auto& arg: result->args()) {
      if (index == 0)
      {
        arg.setName("__this");
      }
      else
      {
        arg.setName(args[index - 1]);
      }

      index++;
    }
  }

  void startFunction(const std::string& name) {
    auto func = getFunction(name);
    if (!func)
      return;

    auto block = llvm::BasicBlock::Create(context, "entry", func);
    builder->SetInsertPoint(block);

    variables.clear();
    for (auto &arg: func->args())
    {
      if (arg.getType()->isIntegerTy() || arg.getType()->isPointerTy())
      {
        variables[std::string(arg.getName())] = &arg;
      }
      else
      {
        variables[std::string(arg.getName())] = builder->CreateFPToSI(&arg, builder->getInt32Ty(), "i_" + arg.getName());
      }
    }

    covertReturn = !func->getReturnType()->isIntegerTy() && !func->getReturnType()->isVoidTy();
  }

  bool needConvertReturn() const override {
    return covertReturn;
  }

private:
  llvm::LLVMContext& context;
  llvm::Module& module;

  std::unique_ptr<llvm::IRBuilder<>> builder;

  std::map<std::string, llvm::Value *> variables;
  std::map<std::string, llvm::Constant *> globals;
  std::map<std::string, llvm::AllocaInst *> locals;
  llvm::StructType* structType;

  bool covertReturn;
};

void callRuntimeFunction(ModuleContext& c,
    llvm::Function* runtimeOnEnter,
    llvm::GlobalVariable* runtime,
    const std::string& value)
{
    auto voidPtrType = llvm::PointerType::get(llvm::Type::getInt8Ty(c.getContext()), 0);
    auto loadedRuntime = c.getBuilder()->CreateLoad(voidPtrType, runtime);
    c.getBuilder()->CreateCall(runtimeOnEnter, { loadedRuntime, c.getBuilder()->CreateGlobalStringPtr(value) });
}

llvm::Function* build(llvm::LLVMContext& context,
    llvm::Module& module,
    const std::string& funcName,
    const ModuleFunction& func,
    llvm::FunctionType* signature,
    llvm::GlobalVariable* runtime,
    llvm::Function* runtimeOnEnter,
    std::vector<Error>& errors)
{
  ModuleContext c(context, module);
  c.declareFunction(funcName, signature, func.args);
  c.startFunction(funcName);
  auto f = c.getFunction(funcName);
  bool hasError = false;

  callRuntimeFunction(c, runtimeOnEnter, runtime, funcName);

  for (const auto& expr: func.body)
  {
    if (!expr->codegen(c, errors)) {
      hasError = true;
      break;
    }
  }

  if (hasError) {
    f->eraseFromParent();
  } else {
    llvm::verifyFunction(*f);
  }

  return f;
}

}
