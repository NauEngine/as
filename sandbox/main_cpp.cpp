#include <iostream>
#include <memory>

#include "clang/Basic/DiagnosticOptions.h"
#include "clang/Basic/LangOptions.h"
#include "clang/Basic/TargetInfo.h"
#include "clang/Basic/TargetOptions.h"
#include "clang/CodeGen/CodeGenAction.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Frontend/FrontendActions.h"
#include "clang/Frontend/TextDiagnosticPrinter.h"
#include "clang/Driver/Driver.h"
#include "clang/Driver/Compilation.h"
#include "clang/Driver/Job.h"
#include "llvm/TargetParser/Host.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/IntrusiveRefCntPtr.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "clang/CodeGen/BackendUtil.h"


class MyEmitLLVMOnlyAction : public clang::CodeGenAction {
public:
    MyEmitLLVMOnlyAction(llvm::LLVMContext *_VMContext = nullptr): CodeGenAction(clang::Backend_EmitLL, _VMContext) {}

protected:
    std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(clang::CompilerInstance &CI,
        llvm::StringRef InFile) override
    {
        return nullptr;
    }


private:
    virtual void anchor() { }

};

int main(int argc, char **argv) {
    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <source file>\n";
        return 1;
    }

    // Initialize LLVM targets
    llvm::InitializeNativeTarget();
    llvm::InitializeNativeTargetAsmPrinter();
    llvm::InitializeNativeTargetAsmParser();

    // Create a compiler instance
    clang::CompilerInstance compiler;
    compiler.createDiagnostics();

    // Set up the compiler invocation
    std::shared_ptr<clang::CompilerInvocation> invocation = std::make_shared<clang::CompilerInvocation>();

    invocation->getFrontendOpts().Inputs.push_back(clang::FrontendInputFile(argv[1], clang::Language::CXX));

    invocation->getLangOpts()->CPlusPlus = true;
    invocation->getLangOpts()->CPlusPlus11 = true;
    invocation->getLangOpts()->CPlusPlus20 = true;
    invocation->getLangOpts()->Bool = true;
    invocation->getLangOpts()->EmitAllDecls = true;

    invocation->getFrontendOpts().ProgramAction = clang::frontend::EmitLLVMOnly;
    // invocation->getFrontendOpts().ASTDumpAll = true;

    invocation->getCodeGenOpts().CodeModel = "default";

    invocation->getTargetOpts().Triple = llvm::sys::getDefaultTargetTriple();

    compiler.setInvocation(invocation);

    // Set target options
    std::shared_ptr<clang::TargetOptions> targetOpts = std::make_shared<clang::TargetOptions>();
    targetOpts->Triple = llvm::sys::getDefaultTargetTriple();
    clang::TargetInfo *target = clang::TargetInfo::CreateTargetInfo(compiler.getDiagnostics(), targetOpts);
    compiler.setTarget(target);

    // Create file manager and source manager
    compiler.createFileManager();
    compiler.createSourceManager(compiler.getFileManager());

    // Create the input file
    const clang::FileEntry *file = compiler.getFileManager().getFile(argv[1]).get();
    compiler.getSourceManager().setMainFileID(compiler.getSourceManager().createFileID(file, clang::SourceLocation(), clang::SrcMgr::C_User));

    compiler.createPreprocessor(clang::TranslationUnitKind::TU_Complete);
    compiler.createASTContext();

    // Set up the action to emit LLVM IR
    std::unique_ptr<clang::CodeGenAction> action(new clang::EmitLLVMOnlyAction());

    // Execute the action to generate LLVM IR
    if (!compiler.ExecuteAction(*action)) {
        llvm::errs() << "Failed to emit LLVM IR\n";
        return 1;
    }

    // Retrieve and print the module
    std::unique_ptr<llvm::Module> module = action->takeModule();
    if (!module)
    {
        llvm::errs() << "Module not generated\n";
        return 1;
    }

    for (auto &f : *module) {
        llvm::outs() << f.getName() << ": isDeclaration = " << f.isDeclaration() <<  "\n";
    }

    if (module) {
        module->print(llvm::outs(), nullptr);
    } else {
        llvm::errs() << "Module is null\n";
        return 1;
    }

    return 0;
}