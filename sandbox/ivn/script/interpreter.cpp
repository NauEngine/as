#include "llvm/IR/Verifier.h"

#include "expression.h"
#include "module.h"
#include "error.h"

#include "interpreter.h"

namespace script {

Interpreter::Interpreter() {
  context = std::make_unique<llvm::LLVMContext>();
  builder = std::make_unique<llvm::IRBuilder<>>(*context.getContext());
}

void Interpreter::addGlobalVariable(const std::string &name) {
  globals.emplace_back(name);
}

const std::vector<std::string>& Interpreter::getGlobalVariables() const {
  return globals;
}

void Interpreter::addGlobalFunction(const std::string &name, int args) {
  funcs.push_back({ name, args });
}

const std::vector<std::pair<std::string, int>>& Interpreter::getGlobalFunction() const {
  return funcs;
}

llvm::LLVMContext* Interpreter::getContext() {
  return context.getContext();
}

llvm::orc::ThreadSafeContext& Interpreter::getThreadSafeContext() {
  return context;
}

llvm::IRBuilder<>* Interpreter::getBuilder() {
  return builder.get();
}

std::unique_ptr<llvm::Module> Interpreter::createModule(const std::string& name) {
  return std::make_unique<llvm::Module>(name, *context.getContext());
}

class ModuleContext: public InterpreterContext {
public:
  explicit ModuleContext(Interpreter& interpreter, const std::string& name): interpreter(interpreter) {
    module = interpreter.createModule(name);

    // type for global struct
    std::vector<llvm::Type*> members;
    members.push_back(llvm::Type::getInt32Ty(*interpreter.getContext()));
    members.push_back(llvm::Type::getInt32Ty(*interpreter.getContext()));

    structType = llvm::StructType::create(*interpreter.getContext(), members, "GlobalStruct");

    // function from global struct
//    for (const auto& func: interpreter.getGlobalFunction()) {
//      std::vector<llvm::Type*> argTypes(func.second, llvm::Type::getInt32Ty(*interpreter.getContext()));
//      argTypes.insert(argTypes.begin(), llvm::PointerType::getUnqual(structType));
//      llvm::FunctionType* funcType = llvm::FunctionType::get(llvm::Type::getInt32Ty(*interpreter.getContext()), argTypes, false);
//      llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, "GlobalStruct_" + func.first, module.get());
//    }

  auto pointerType = llvm::PointerType::get(llvm::Type::getInt32Ty(*interpreter.getContext()), 0);
    {
      std::vector<llvm::Type*> argTypes(1, llvm::Type::getInt32Ty(*interpreter.getContext()));
      argTypes.insert(argTypes.begin(), pointerType);
      argTypes.insert(argTypes.begin(), llvm::PointerType::getUnqual(structType));
      llvm::FunctionType* funcType = llvm::FunctionType::get(llvm::Type::getInt32Ty(*interpreter.getContext()), argTypes, false);
      llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, "__call0", module.get());
    }

    {
      std::vector<llvm::Type*> argTypes(2, llvm::Type::getInt32Ty(*interpreter.getContext()));
      argTypes.insert(argTypes.begin(), pointerType);
      argTypes.insert(argTypes.begin(), llvm::PointerType::getUnqual(structType));
      llvm::FunctionType* funcType = llvm::FunctionType::get(llvm::Type::getInt32Ty(*interpreter.getContext()), argTypes, false);
      llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, "__call1", module.get());
    }

    // global structs from context
    for (const auto& var: interpreter.getGlobalVariables()) {
      globals[var] = module->getOrInsertGlobal(var, structType);
    }

    globals["__executor"] = module->getOrInsertGlobal("__executor", pointerType);
  }

  llvm::IRBuilder<>* getBuilder() override {
    return interpreter.getBuilder();
  }

  [[nodiscard]] bool hasFunction(const std::string& name) const override {
    return module->getFunction(name) != nullptr;
  }

  llvm::Function* getFunction(const std::string& name) override {
    return module->getFunction(name);
  }

  llvm::Value* addVariable(const std::string& name, llvm::Value* value) override {
    if (hasVariable(name))
      return nullptr;

    auto var = getBuilder()->CreateAlloca(llvm::Type::getInt32Ty(*interpreter.getContext()), nullptr, name);
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
      llvm::Value* globalPtr = interpreter.getBuilder()->CreatePointerCast(global, llvm::PointerType::getUnqual(structType), "p_" + name);
      variables[name] = globalPtr;
      return globalPtr;
    }
    if (locals.contains(name)) {
      auto var = locals[name];
      auto load = getBuilder()->CreateLoad(llvm::Type::getInt32Ty(*interpreter.getContext()), var, "l_" + name);
      variables[name] = load;
      return load;
    }

    return nullptr;
  }

  llvm::Value* getGlobalVariable(const std::string& self, const std::string& name, unsigned index) override {
    if (!globals.contains(self))
      return nullptr;

    std::vector<llvm::Type*> members;
    members.push_back(llvm::Type::getInt32Ty(*interpreter.getContext()));
    members.push_back(llvm::Type::getInt32Ty(*interpreter.getContext()));

    llvm::Value* globalPtr = getVariable(self);
    llvm::Value* varPtr = interpreter.getBuilder()->CreateStructGEP(structType, globalPtr, index, "p_" + name);
    llvm::Value* value = interpreter.getBuilder()->CreateLoad(llvm::Type::getInt32Ty(*interpreter.getContext()), varPtr, name);

    return value;
  }

  llvm::Value* getConstant(int value) override {
    return llvm::ConstantInt::get(llvm::Type::getInt32Ty(*interpreter.getContext()), value);
  }

  void declareFunction(const std::string& name, const std::vector<std::string>& args) {
    auto func = getFunction(name);
    if (func)
      return;

    std::vector<llvm::Type*> argTypes(args.size(), llvm::Type::getInt32Ty(*interpreter.getContext()));
    llvm::FunctionType* funcType = llvm::FunctionType::get(llvm::Type::getInt32Ty(*interpreter.getContext()), argTypes, false);
    llvm::Function* result = llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, name, module.get());
    unsigned index = 0;
    for (auto& arg: result->args()) {
      arg.setName(args[index++]);
    }
  }

  void startFunction(const std::string& name) {
    auto func = getFunction(name);
    if (!func)
      return;

    auto block = llvm::BasicBlock::Create(*interpreter.getContext(), "entry", func);
    interpreter.getBuilder()->SetInsertPoint(block);

    variables.clear();
    for (auto &arg: func->args())
      variables[std::string(arg.getName())] = &arg;
  }

  std::unique_ptr<llvm::Module> extract() {
    return std::move(module);
  }

private:
  Interpreter& interpreter;
  std::unique_ptr<llvm::Module> module;
  std::map<std::string, llvm::Value *> variables;
  std::map<std::string, llvm::Constant *> globals;
  std::map<std::string, llvm::AllocaInst *> locals;

  llvm::StructType* structType;
};

std::unique_ptr<llvm::Module> build(Interpreter& interpreter, const std::string& name, const Module& module, std::vector<Error>& errors) {
  ModuleContext context(interpreter, name);

  for (const auto& func: module.getFunctions()) {
    if (context.hasFunction(func.name)) {
      errors.emplace_back(func.line, func.column, "Function '$@' already declared", func.name);
    } else {
      context.declareFunction(func.name, func.args);
    }
  }

  for (const auto& func: module.getFunctions()) {
    auto f = context.getFunction(func.name);
    if (!f) {
      errors.emplace_back(func.line, func.column, "Cannot find function '$@'", func.name);
      continue;
    }

    bool hasError = false;
    context.startFunction(func.name);
    for (const auto& expr: func.body) {
      if (!expr->codegen(context, errors)) {
        hasError = true;
        break;
      }
    }

    if (hasError) {
      f->eraseFromParent();
    } else {
      llvm::verifyFunction(*f);
    }
  }

  return context.extract();
}

}
