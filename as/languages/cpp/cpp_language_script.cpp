#include <fstream>
#include "clang/CodeGen/CodeGenAction.h"
#include "clang/CodeGen/BackendUtil.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/AST/Mangle.h"
#include "llvm/TargetParser/Host.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"

#include "cpp_language_script.h"

#include "as/core/ir.h"

bool isImplementation(clang::RecordDecl* record_decl)
{
    for (auto it = record_decl->decls_begin(); it != record_decl->decls_end(); ++it)
    {
        if (!it->isFunctionOrFunctionTemplate())
            continue;

        const auto f = it->getAsFunction();
        if (f->isPure())
            return false;
    }

    return true;
}

class CollectNamesAction : public clang::ASTFrontendAction {
public:
    explicit CollectNamesAction(std::unordered_map<std::string, std::string>& func_names): m_func_names(func_names) {}

    std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(clang::CompilerInstance &compiler,
        llvm::StringRef file) override;

    void addFuncName(const std::string& name, const std::string mangled_name)
    {
        m_func_names[name] = mangled_name;
    }

private:
    std::unordered_map<std::string, std::string>& m_func_names;
};

class CollectNamesASTVisitor : public clang::RecursiveASTVisitor<CollectNamesASTVisitor>
{
public:
    explicit CollectNamesASTVisitor(CollectNamesAction& action, clang::ASTContext& context):
        m_action(action),
        m_context(context.createMangleContext())
    {}

    bool VisitRecordDecl(clang::RecordDecl* record_decl)
    {
        if (!isImplementation(record_decl))
            return true;

        for (auto it = record_decl->decls_begin(); it != record_decl->decls_end(); ++it)
        {
            if (!it->isFunctionOrFunctionTemplate())
                continue;

            const auto f = it->getAsFunction();
            if (f->isPure() || !f->hasBody())
                continue;

            const std::string func_name = f->getNameAsString();
            if (m_context->shouldMangleDeclName(f))
            {
                std::string func_mangled_name;
                llvm::raw_string_ostream func_mangled_name_stream(func_mangled_name);
                m_context->mangleName(f, func_mangled_name_stream);
                m_action.addFuncName(func_name, func_mangled_name);
            }
            else
            {
                m_action.addFuncName(func_name, func_name);
            }
        }

        return true;
    }

private:
    CollectNamesAction& m_action;
    std::unique_ptr<clang::MangleContext> m_context;
};

class CollectNamesASTConsumer : public clang::ASTConsumer
{
public:
    explicit CollectNamesASTConsumer(CollectNamesAction& action, clang::ASTContext& context)
        : m_visitor(action, context) {}

    void HandleTranslationUnit(clang::ASTContext &Context) override {
        m_visitor.TraverseDecl(Context.getTranslationUnitDecl());
    }

private:
    CollectNamesASTVisitor m_visitor;
};

std::unique_ptr<clang::ASTConsumer> CollectNamesAction::CreateASTConsumer(clang::CompilerInstance &compiler,
    llvm::StringRef file)
{
    return std::make_unique<CollectNamesASTConsumer>(*this, compiler.getASTContext());
}

namespace as {

void CppLanguageScript::load(const std::string& filename)
{
    std::ifstream ifs(filename);
    m_base_path = std::filesystem::path(filename).parent_path();
    m_content = { std::istreambuf_iterator<char>(ifs), std::istreambuf_iterator<char>() };
}

std::string CppLanguageScript::findHeader(const std::string& filename)
{
    return "";
}

std::unique_ptr<llvm::Module> CppLanguageScript::createModule(llvm::LLVMContext& context)
{
    clang::CompilerInstance compiler;

    auto invocation = std::make_shared<clang::CompilerInvocation>();

    invocation->getLangOpts()->CPlusPlus = true;
    invocation->getLangOpts()->CPlusPlus11 = true;
    invocation->getLangOpts()->CPlusPlus20 = true;
    invocation->getLangOpts()->Bool = true;
    invocation->getLangOpts()->EmitAllDecls = true;

    // [TODO] AZ Make adjustable path to include
    auto &headerSearchOpts = invocation->getHeaderSearchOpts();
    headerSearchOpts.AddPath("../../", clang::frontend::Quoted, false, false);
    headerSearchOpts.AddPath(m_base_path, clang::frontend::Quoted, false, false);

    auto mem_buffer = llvm::MemoryBuffer::getMemBuffer(m_content);
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

    auto action = std::make_unique<clang::EmitLLVMOnlyAction>(&context);
    if (!compiler.ExecuteAction(*action))
    {
        return nullptr;
    }

    auto action2 = std::make_unique<CollectNamesAction>(m_func_names);
    if (!compiler.ExecuteAction(*action2))
    {
        return nullptr;
    }

    return action->takeModule();
}

llvm::Function* CppLanguageScript::buildModule(const std::string& init_name,
    const std::string& module_name,
    const ScriptInterface& interface,
    llvm::Module& module)
{
    const auto vtable = ir::buildVTable(module_name, interface, module, &CppLanguageScript::buildFunction, this);
    return ir::createInitFunc(module, init_name, module_name, vtable);
}

llvm::Function* CppLanguageScript::buildFunction(const std::string& name,
    llvm::FunctionType* signature,
    llvm::Module& module,
    llvm::LLVMContext& context)
{
    return module.getFunction(m_func_names[name]);
}

void CppLanguageScript::materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit,
    llvm::Module& module,
    llvm::LLVMContext& context)
{
}
} // as