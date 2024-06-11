
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
#include "ir.h"

namespace as
{

bool CollectInterfaceASTVisitor::VisitRecordDecl(clang::RecordDecl *RD)
{
  auto interface = ScriptInterface:: fromRecordDecl(RD, m_llvmContext, m_cgm);
  if (interface)
      m_interfaces[interface->name] = std::move(interface);

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
  return std::make_unique<CollectInterfaceASTConsumer>(m_context, &compiler.getASTContext(), m_interfaces, cgm);
}

const std::shared_ptr<ScriptInterface>& CPPParser::getInterface(const std::string& source_code)
{
    return parse(source_code);
}

const std::shared_ptr<ScriptInterface>& CPPParser::parse(const std::string& code)
{
    clang::CompilerInstance compiler;

    std::string code_with_hack = "typedef long long int64_t;\ntypedef int int32_t;\n" + code;

    auto invocation = std::make_shared<clang::CompilerInvocation>();
    auto mem_buffer = llvm::MemoryBuffer::getMemBuffer(code_with_hack);

    invocation->getLangOpts()->CPlusPlus = true;
    invocation->getLangOpts()->CPlusPlus11 = true;
    invocation->getLangOpts()->CPlusPlus20 = true;
    invocation->getLangOpts()->Bool = true;

    // [TODO] AZ Make adjustable path to include
    auto &headerSearchOpts = invocation->getHeaderSearchOpts();
    headerSearchOpts.AddPath("../", clang::frontend::Quoted, false, false);

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

    ScriptInterfaces newInterfaces;
    CollectInterfaceAction action(newInterfaces, m_context);
    if (!compiler.ExecuteAction(action))
    {
        llvm::errs() << "Failed to parse!\n";
        return m_null_ptr;
    }

    m_parsedInterfaces.insert(newInterfaces.begin(), newInterfaces.end());
    return m_parsedInterfaces[newInterfaces.begin()->first];
}

void CPPParser::dump(llvm::raw_fd_ostream& stream)
{
  for (const auto& [name, interface]: m_parsedInterfaces)
  {
    interface->dump(stream);
  }
}

}
