#include <fstream>
#include "clang/CodeGen/CodeGenAction.h"
#include "clang/CodeGen/BackendUtil.h"
#include "clang/Frontend/CompilerInstance.h"
#include "llvm/TargetParser/Host.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"

#include "cpp_language_script.h"

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

namespace as {
void CppLanguageScript::load(const std::string& filename)
{
    std::ifstream ifs(filename);
    m_content = { std::istreambuf_iterator<char>(ifs), std::istreambuf_iterator<char>() };
}

std::unique_ptr<llvm::Module> CppLanguageScript::createModule(llvm::LLVMContext& context)
{
    clang::CompilerInstance compiler;

    auto invocation = std::make_shared<clang::CompilerInvocation>();
    auto mem_buffer = llvm::MemoryBuffer::getMemBuffer(m_content);

    invocation->getLangOpts()->CPlusPlus = true;
    invocation->getLangOpts()->CPlusPlus11 = true;
    invocation->getLangOpts()->CPlusPlus20 = true;
    invocation->getLangOpts()->Bool = true;
    invocation->getLangOpts()->EmitAllDecls = true;

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
    if (!compiler.hasDiagnostics())
    {
        return nullptr;
    }
    compiler.setTarget(clang::TargetInfo::CreateTargetInfo(compiler.getDiagnostics(), compiler.getInvocation().TargetOpts));
    compiler.createFileManager();
    compiler.createSourceManager(compiler.getFileManager());
    compiler.createPreprocessor(clang::TU_Complete);

    std::unique_ptr<clang::CodeGenAction> action(new MyEmitLLVMOnlyAction());
    if (!compiler.ExecuteAction(*action))
    {
        return nullptr;
    }

    auto result = action->takeModule();

    for (auto &f : *result) {
        llvm::outs() << f.getName() << ": isDeclaration = " << f.isDeclaration() <<  "\n";
        if (!f.isDeclaration()) {
            f.addFnAttr(llvm::Attribute::NoInline);
            f.addFnAttr(llvm::Attribute::OptimizeNone);
        }
    }

    // result->print(llvm::outs(), nullptr);

    return result;
}

llvm::Function* CppLanguageScript::buildModule(const std::string& init_name,
    const std::string& module_name,
    const ScriptInterface& interface,
    llvm::Module& module)
{
    // module.print(llvm::errs(), nullptr);
    return nullptr;
}

void CppLanguageScript::materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit,
    llvm::Module& module,
    llvm::LLVMContext& context)
{
}
} // as