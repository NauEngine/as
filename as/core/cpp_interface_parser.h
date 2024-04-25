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
    std::unordered_map<std::string_view, llvm::FunctionType*> methods;

    void dump(llvm::raw_fd_ostream& stream);
  };

  using CPPInterfaces = std::unordered_map <std::string_view, std::shared_ptr<CPPInterface>>;

  class CPPParser
  {
  public:
    explicit CPPParser(llvm::LLVMContext& context) : context(context) {}

    std::shared_ptr<CPPInterface> get_interface(std::string_view name, std::string_view source_code);
    void dump(llvm::raw_fd_ostream& stream);

  private:
    llvm::LLVMContext& context;
    CPPInterfaces parsed_interfaces;

    void parse(std::string_view code);
  };


class CollectInterfaceASTVisitor : public clang::RecursiveASTVisitor<CollectInterfaceASTVisitor>
{
public:
  CollectInterfaceASTVisitor(clang::ASTContext *context, CPPInterfaces& interfaces,  clang::CodeGen::CodeGenModule& cgm)
      : context(context), interfaces(interfaces), cgm(cgm) {}

  bool VisitRecordDecl(clang::RecordDecl* record_decl);

private:
  clang::ASTContext *context;
  CPPInterfaces& interfaces;
  clang::CodeGen::CodeGenModule& cgm;
};

class CollectInterfaceASTConsumer : public clang::ASTConsumer
{
  public:
    explicit CollectInterfaceASTConsumer(clang::ASTContext *Context, CPPInterfaces& interfaces, clang::CodeGen::CodeGenModule& cgm)
        : visitor(Context, interfaces, cgm) {}

    void HandleTranslationUnit(clang::ASTContext &Context) override {
      visitor.TraverseDecl(Context.getTranslationUnitDecl());
    }

  private:
    CollectInterfaceASTVisitor visitor;
  };

class CollectInterfaceAction : public clang::ASTFrontendAction {
  public:
    explicit CollectInterfaceAction(CPPInterfaces& interfaces, llvm::LLVMContext& context)
        : interfaces(interfaces), context(context) {}

    std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(clang::CompilerInstance &compiler, llvm::StringRef file) override;

  private:
    CPPInterfaces& interfaces;
    std::unique_ptr<clang::CodeGenerator> code_gen;
    llvm::LLVMContext& context;
  };


} // namespace as


#endif //AS_PROTO_CPP_INTERFACE_PARSER_H
