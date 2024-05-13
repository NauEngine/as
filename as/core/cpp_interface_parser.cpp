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
  if (RD->isThisDeclarationADefinition())
  {
    auto interface = std::make_unique<ScriptInterface>();
    interface->name = RD->getNameAsString();

    const auto type_name = ir::interface_type_name(interface->name);
    const auto vtable_type_name = ir::interface_vtable_type_name(interface->name);

    interface->interface_t = llvm::StructType::create(m_llvmContext, type_name);
    interface->interface_ptr_t = llvm::PointerType::get(interface->interface_t, 0);
    llvm::Type* opaque_ptr_t = llvm::PointerType::get(m_llvmContext, 0);

    std::vector<llvm::Type*> vtable_types;

    for (auto it = RD->decls_begin(); it != RD->decls_end(); ++it)
    {
      if (it->isFunctionOrFunctionTemplate())
      {
        const auto function = it->getAsFunction();

        if (function->isPure())
        {
          llvm::FunctionType* function_type = clang::CodeGen::convertFreeFunctionType(m_cgm, function);
          llvm::FunctionType* method_type = ir::buildInterfaceMethodType(function_type, interface->interface_ptr_t);

          auto func_name = function->getNameInfo().getName().getAsString();
          interface->methodNames.push_back(func_name);
          interface->methodTypes.push_back(method_type);
          vtable_types.push_back(llvm::PointerType::get(method_type, 0));
        }
        else
        {
          interface->methodNames.emplace_back("");
          interface->methodTypes.push_back(nullptr);
          vtable_types.push_back(opaque_ptr_t);
        }
      }
    }

    interface->vtable_t = llvm::StructType::create(m_llvmContext, vtable_type_name);
    interface->vtable_t->setBody(vtable_types);

    interface->interface_t->setBody(llvm::PointerType::get(interface->vtable_t, 0));

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
  return std::make_unique<CollectInterfaceASTConsumer>(m_context, &compiler.getASTContext(), m_interfaces, cgm);
}

std::shared_ptr<ScriptInterface> CPPParser::getInterface(const std::string& name, const std::string& source_code)
{
  if (!m_parsedInterfaces.contains(name)) {
    parse(source_code);
  }

  return m_parsedInterfaces[name];
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

  CollectInterfaceAction action(m_parsedInterfaces, m_context);
  if (!compiler.ExecuteAction(action))
  {
    llvm::errs() << "Failed to parse!\n";
  }
}

void CPPParser::dump(llvm::raw_fd_ostream& stream)
{
  for (const auto& [name, interface]: m_parsedInterfaces)
  {
    interface->dump(stream);
  }
}

void ScriptInterface::dump(llvm::raw_fd_ostream& stream)
{
  stream << "Interface: " << name << "\n";

  for (int i = 0; i < methodNames.size(); ++i)
  {
    stream << "  " << methodNames[i] << " " << *vtable_t->getTypeAtIndex(i) << "\n";
  }
}

}
