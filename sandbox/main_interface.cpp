//
// Created by Alex Zelenshikov on 14.04.2024.
//

#include <iostream>

//#include "clang/Frontend/ASTUnit.h"
//#include "clang/Frontend/CompilerInstance.h"
//#include "clang/FrontendTool/Utils.h"
//#include "clang/Tooling/Tooling.h"

#include "clang/Frontend/Utils.h"
#include "clang/Frontend/ASTConsumers.h"
#include "clang/AST/ASTContext.h"
#include "clang/AST/RecursiveASTVisitor.h"
//#include "clang/Frontend/ASTFrontendAction.h"

#include "clang/Frontend/CompilerInstance.h"
#include "clang/Frontend/CompilerInvocation.h"
#include "clang/Frontend/TextDiagnosticPrinter.h"
#include "clang/Basic/DiagnosticOptions.h"
#include "clang/Basic/TargetOptions.h"
#include "clang/Basic/TargetInfo.h"
#include "clang/Frontend/Utils.h"
#include "clang/Lex/PreprocessorOptions.h"
#include "clang/CodeGen/CodeGenAction.h"
#include "clang/CodeGen/ModuleBuilder.h"
#include "clang/CodeGen/CodeGenABITypes.h"

#include "llvm/ADT/STLExtras.h"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/ExecutionEngine/MCJIT.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/ExecutionEngine/Orc/Core.h"
#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"
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
#include "llvm/TargetParser/Host.h"


using namespace clang;

template <typename T> const char* get_source_code();

#define DEFINE_SCRIPT_INTERFACE(Type, I) \
I \
template <> const char* get_source_code<Type>() { return #I; }

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
  virtual void test1() = 0;
  virtual int* test2(int a, int b, double c) = 0;
};
)


struct CPPInterface
{
  std::string name;
  std::unordered_map<std::string, llvm::FunctionType*> methods;
};

using CPPInterfaces = std::unordered_map<std::string, std::unique_ptr<CPPInterface>>;

class CollectInterfaceASTVisitor : public RecursiveASTVisitor<CollectInterfaceASTVisitor> {
public:
  CollectInterfaceASTVisitor(ASTContext *context, CPPInterfaces& interfaces,  CodeGen::CodeGenModule& cgm)
      : context(context), interfaces(interfaces), cgm(cgm) {}

  bool VisitRecordDecl(RecordDecl *RD)
  {
    if (RD->isThisDeclarationADefinition())
    {
      auto interface = std::make_unique<CPPInterface>();
      interface->name = RD->getNameAsString();

      for (auto it = RD->decls_begin(); it != RD->decls_end(); ++it)
      {
        if (it->isFunctionOrFunctionTemplate())
        {
          auto function = it->getAsFunction();

          if (function->isPure())
          {
            auto function_type = convertFreeFunctionType(cgm, function);
            auto func_name = function->getNameInfo().getName().getAsString();
            interface->methods[func_name] = function_type;
          }
        }
      }

      interfaces[interface->name] = std::move(interface);
    }

    return true;
  }

private:
  ASTContext *context;
  CPPInterfaces& interfaces;
  CodeGen::CodeGenModule& cgm;
};

class CollectInterfaceASTConsumer : public ASTConsumer {
public:
  explicit CollectInterfaceASTConsumer(ASTContext *Context, CPPInterfaces& interfaces, CodeGen::CodeGenModule& cgm)
      : visitor(Context, interfaces, cgm) {}

  void HandleTranslationUnit(ASTContext &Context) override {
    visitor.TraverseDecl(Context.getTranslationUnitDecl());
  }

private:
  CollectInterfaceASTVisitor visitor;
};

class CollectInterfaceAction : public ASTFrontendAction {
public:
  explicit CollectInterfaceAction(CPPInterfaces& interfaces, llvm::LLVMContext& context)
  : interfaces(interfaces), context(context) {}

  std::unique_ptr<ASTConsumer> CreateASTConsumer(CompilerInstance &compiler, StringRef file) override
  {
    code_gen.reset(CreateLLVMCodeGen(
        compiler.getDiagnostics(), "types-converter",
        &compiler.getVirtualFileSystem(), compiler.getHeaderSearchOpts(),
        compiler.getPreprocessorOpts(), compiler.getCodeGenOpts(), context));

    code_gen->Initialize(compiler.getASTContext());

    CodeGen::CodeGenModule& cgm = code_gen->CGM();

    return std::make_unique<CollectInterfaceASTConsumer>(&compiler.getASTContext(), interfaces, cgm);
  }
private:
  CPPInterfaces& interfaces;
  std::unique_ptr<CodeGenerator> code_gen;
  llvm::LLVMContext& context;
};

class CPPStructInterfaceParser
{
public:
  bool parse(llvm::LLVMContext& context, const std::string &code)
  {
    CompilerInstance compiler;

    auto invocation = std::make_shared<CompilerInvocation>();
    auto mem_buffer = llvm::MemoryBuffer::getMemBuffer(code);

    invocation->getLangOpts()->CPlusPlus = true;
    invocation->getLangOpts()->CPlusPlus17 = true;

    invocation->getFrontendOpts().Inputs.push_back(FrontendInputFile(*mem_buffer, Language::CXX));
    invocation->getFrontendOpts().ProgramAction = frontend::EmitLLVMOnly;
    invocation->getFrontendOpts().DashX = InputKind(Language::CXX);
    invocation->getCodeGenOpts().CodeModel = "default";
    invocation->getTargetOpts().Triple = llvm::sys::getDefaultTargetTriple();

    compiler.setInvocation(std::move(invocation));

    compiler.createDiagnostics();
    compiler.setTarget(TargetInfo::CreateTargetInfo(compiler.getDiagnostics(), compiler.getInvocation().TargetOpts));
    compiler.createFileManager();
    compiler.createSourceManager(compiler.getFileManager());
    compiler.createPreprocessor(TU_Complete);

    CollectInterfaceAction action(parsed_interfaces, context);
    if (!compiler.ExecuteAction(action)) {
      llvm::errs() << "Failed to parse!\n";
      return false;
    }

    return true;
  }

  const CPPInterfaces& get_parsed_interfaces() { return parsed_interfaces; }
  void dump(llvm::raw_fd_ostream& stream)
  {
    for(const auto& [name, interface] : parsed_interfaces)
    {
      stream << "Interface: " << name << "\n";

      for(const auto& [method, signature] : interface->methods)
      {
        stream << "  " << method << " " << *signature << "\n";
      }
    }
  }
private:
  CPPInterfaces parsed_interfaces;
};

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

  std::string sb_code = get_source_code<ScriptBase>();
  std::string foo_code = get_source_code<ScriptFoo>();

  CPPStructInterfaceParser cpp_parser;

  cpp_parser.parse(*context.get(), sb_code);
  cpp_parser.parse(*context.get(), foo_code);

  cpp_parser.dump(llvm::outs());

  auto module = create_module(*context.get());

  auto JIT = cantFail(llvm::orc::LLJITBuilder().create());

  cantFail(JIT->addIRModule(llvm::orc::ThreadSafeModule(std::move(module), std::move(context))));

  auto ScriptInstanceSym = cantFail(JIT->lookup("scriptInstance"));
  auto script_instance = ScriptInstanceSym.toPtr<ScriptBase*>();

  std::cout << script_instance->test1() << std::endl;
  std::cout << script_instance->test2(100) << std::endl;
  std::cout << script_instance->test3(3, 4) << std::endl;
}