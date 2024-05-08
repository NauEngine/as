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

struct CPPInterface
{
  std::string name;
  std::unordered_map<std::string, llvm::FunctionType*> methods;

  void dump(llvm::raw_fd_ostream& stream);
};

using CPPInterfaces = std::unordered_map <std::string, std::shared_ptr<CPPInterface>>;

class CPPParser
{
public:
  explicit CPPParser(llvm::LLVMContext& context) : m_context(context) {}

  std::shared_ptr<CPPInterface> getInterface(const std::string& name, const std::string& source_code);
  void dump(llvm::raw_fd_ostream& stream);

private:
  llvm::LLVMContext& m_context;
  CPPInterfaces m_parsed_interfaces;

  void parse(const std::string& code);
};

class CollectInterfaceASTVisitor : public clang::RecursiveASTVisitor<CollectInterfaceASTVisitor>
{
public:
  CollectInterfaceASTVisitor(clang::ASTContext *context, CPPInterfaces& interfaces,  clang::CodeGen::CodeGenModule& cgm)
      : m_context(context), m_interfaces(interfaces), m_cgm(cgm) {}

  bool VisitRecordDecl(clang::RecordDecl* record_decl);

private:
  clang::ASTContext *m_context;
  CPPInterfaces& m_interfaces;
  clang::CodeGen::CodeGenModule& m_cgm;
};

class CollectInterfaceASTConsumer : public clang::ASTConsumer
{
public:
  explicit CollectInterfaceASTConsumer(clang::ASTContext *Context, CPPInterfaces& interfaces, clang::CodeGen::CodeGenModule& cgm)
      : m_visitor(Context, interfaces, cgm) {}

  void HandleTranslationUnit(clang::ASTContext &Context) override {
    m_visitor.TraverseDecl(Context.getTranslationUnitDecl());
  }

private:
  CollectInterfaceASTVisitor m_visitor;
};

class CollectInterfaceAction : public clang::ASTFrontendAction {
  public:
    explicit CollectInterfaceAction(CPPInterfaces& interfaces, llvm::LLVMContext& context)
        : m_interfaces(interfaces), m_context(context) {}

    std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(clang::CompilerInstance &compiler, llvm::StringRef file) override;

  private:
    CPPInterfaces& m_interfaces;
    std::unique_ptr<clang::CodeGenerator> m_code_gen;
    llvm::LLVMContext& m_context;
  };


} // namespace as


#endif //AS_PROTO_CPP_INTERFACE_PARSER_H
