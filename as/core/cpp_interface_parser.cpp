//
// Created by Alex Zelenshikov on 22.04.2024.
//

#include "clang/Basic/LangOptions.h"
#include "clang/Basic/TargetInfo.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/CodeGen/CodeGenABITypes.h"

#include "llvm/Support/MemoryBuffer.h"
#include "llvm/TargetParser/Host.h"


#include "cpp_interface_parser.h"

namespace as
{

bool CollectInterfaceASTVisitor::VisitRecordDecl(clang::RecordDecl *RD)
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
          auto function_type = clang::CodeGen::convertFreeFunctionType(m_cgm, function);
          auto func_name = function->getNameInfo().getName().getAsString();
          interface->methods[func_name] = function_type;
        }
      }
    }

    m_interfaces[interface->name] = std::move(interface);
  }

  return true;
}

std::unique_ptr<clang::ASTConsumer> CollectInterfaceAction::CreateASTConsumer(clang::CompilerInstance &compiler, llvm::StringRef file)
{
  m_code_gen.reset(clang::CreateLLVMCodeGen(
      compiler.getDiagnostics(), "types-converter",
      &compiler.getVirtualFileSystem(), compiler.getHeaderSearchOpts(),
      compiler.getPreprocessorOpts(), compiler.getCodeGenOpts(), m_context));

  m_code_gen->Initialize(compiler.getASTContext());
  clang::CodeGen::CodeGenModule& cgm = m_code_gen->CGM();
  return std::make_unique<CollectInterfaceASTConsumer>(&compiler.getASTContext(), m_interfaces, cgm);
}

std::shared_ptr<CPPInterface> CPPParser::getInterface(const std::string& name, const std::string& source_code)
{
  if (!m_parsed_interfaces.contains(name)) {
    parse(source_code);
  }

  return m_parsed_interfaces[name];
}

void CPPParser::parse(const std::string& code)
{
  clang::CompilerInstance compiler;

  auto invocation = std::make_shared<clang::CompilerInvocation>();
  auto mem_buffer = llvm::MemoryBuffer::getMemBuffer(code);

  invocation->getLangOpts()->CPlusPlus = true;
  invocation->getLangOpts()->CPlusPlus17 = true;

  invocation->getFrontendOpts().Inputs.push_back(clang::FrontendInputFile(*mem_buffer, clang::Language::CXX));
  invocation->getFrontendOpts().ProgramAction = clang::frontend::EmitLLVMOnly;
  invocation->getFrontendOpts().DashX = clang::InputKind(clang::Language::CXX);
  invocation->getCodeGenOpts().CodeModel = "default";
  invocation->getTargetOpts().Triple = llvm::sys::getDefaultTargetTriple();

  compiler.setInvocation(std::move(invocation));

  compiler.createDiagnostics();
  compiler.setTarget(clang::TargetInfo::CreateTargetInfo(compiler.getDiagnostics(), compiler.getInvocation().TargetOpts));
  compiler.createFileManager();
  compiler.createSourceManager(compiler.getFileManager());
  compiler.createPreprocessor(clang::TU_Complete);

  CollectInterfaceAction action(m_parsed_interfaces, m_context);
  if (!compiler.ExecuteAction(action))
  {
    llvm::errs() << "Failed to parse!\n";
  }
}

void CPPParser::dump(llvm::raw_fd_ostream& stream)
{
  for (const auto& [name, interface]: m_parsed_interfaces)
  {
    interface->dump(stream);
  }
}

void CPPInterface::dump(llvm::raw_fd_ostream& stream)
{
  stream << "Interface: " << name << "\n";

  for (const auto& [method, signature]: methods)
  {
    stream << "  " << method << " " << *signature << "\n";
  }
}

}
