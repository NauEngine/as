//
// Created by Alex Zelenshikov on 22.04.2024.
//

#ifndef AS_PROTO_CPP_INTERFACE_PARSER_H
#define AS_PROTO_CPP_INTERFACE_PARSER_H

#include "clang/AST/ASTConsumer.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/Frontend/FrontendAction.h"
#include "clang/CodeGen/ModuleBuilder.h"

#include <string>
#include <unordered_map>

namespace llvm
{
  class FunctionType;
  class StructType;
  class PointerType;
  class LLVMContext;
  class raw_fd_ostream;
}

namespace clang
{
  class RecordDecl;

  namespace CodeGen
  {
    class CodeGenModule;
  }
};

namespace as
{

struct ScriptInterface
{
  // Name of interface
  std::string name;
  // Ordered vector of method names, if some name is empty it means that method is not pure
  std::vector<std::string> methodNames;
  // Types if method since vtable_t contains pointers to methods
  std::vector<llvm::FunctionType*> methodTypes;
  // Type of script interface
  llvm::StructType* interface_t = nullptr;
  // Type of pointer to script interface
  llvm::PointerType* interface_ptr_t = nullptr;
  // Type of vtable for script interface
  llvm::StructType* vtable_t = nullptr;

  void dump(llvm::raw_fd_ostream& stream);
};

using ScriptInterfaces = std::unordered_map <std::string, std::shared_ptr<ScriptInterface>>;

class CPPParser
{
public:
  explicit CPPParser(llvm::LLVMContext& context) : m_context(context) {}

  const std::shared_ptr<ScriptInterface>& getInterface(const std::string& name, const std::string& source_code);
  void dump(llvm::raw_fd_ostream& stream);

private:
  llvm::LLVMContext& m_context;
  ScriptInterfaces m_parsedInterfaces;
  std::shared_ptr<ScriptInterface> m_null_ptr;

  const std::shared_ptr<ScriptInterface>& parse(const std::string& code);
};

class CollectInterfaceASTVisitor : public clang::RecursiveASTVisitor<CollectInterfaceASTVisitor>
{
public:
  CollectInterfaceASTVisitor(llvm::LLVMContext& llvmContext, clang::ASTContext *context, ScriptInterfaces& interfaces,  clang::CodeGen::CodeGenModule& cgm) :
      m_llvmContext(llvmContext),
      m_astContext(context),
      m_interfaces(interfaces),
      m_cgm(cgm) {}

  bool VisitRecordDecl(clang::RecordDecl* record_decl);

private:
  llvm::LLVMContext& m_llvmContext;
  clang::ASTContext *m_astContext;
  ScriptInterfaces& m_interfaces;
  clang::CodeGen::CodeGenModule& m_cgm;
};

class CollectInterfaceASTConsumer : public clang::ASTConsumer
{
public:
    explicit CollectInterfaceASTConsumer(llvm::LLVMContext& llvmContext, clang::ASTContext *context, ScriptInterfaces& interfaces, clang::CodeGen::CodeGenModule& cgm)
        : m_visitor(llvmContext, context, interfaces, cgm) {}

    void HandleTranslationUnit(clang::ASTContext &Context) override {
        m_visitor.TraverseDecl(Context.getTranslationUnitDecl());
    }


private:
  CollectInterfaceASTVisitor m_visitor;
};

class CollectInterfaceAction : public clang::ASTFrontendAction {
  public:
    explicit CollectInterfaceAction(ScriptInterfaces& interfaces, llvm::LLVMContext& context)
        : m_interfaces(interfaces), m_context(context) {}

    std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(clang::CompilerInstance &compiler, llvm::StringRef file) override;

  private:
    ScriptInterfaces& m_interfaces;
    std::unique_ptr<clang::CodeGenerator> m_code_gen;
    llvm::LLVMContext& m_context;
    bool m_doNotParse;
  };


} // namespace as


#endif //AS_PROTO_CPP_INTERFACE_PARSER_H
