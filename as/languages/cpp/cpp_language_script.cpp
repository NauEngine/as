#include <fstream>
#include "clang/CodeGen/CodeGenAction.h"
#include "clang/CodeGen/BackendUtil.h"
#include "clang/AST/Mangle.h"
#include "llvm/TargetParser/Host.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"

#include "cpp_language_script.h"

#include <llvm/ExecutionEngine/Orc/Core.h>

#include "as/core/ir.h"
#include "as/core/script_interface.h"

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
    explicit CollectNamesAction(llvm::LLVMContext& context,
        std::shared_ptr<as::ScriptInterface>& script_interface,
        std::unordered_map<std::string, std::string>& func_names):
        m_context(context),
        m_script_interface(script_interface),
        m_func_names(func_names) {}

    std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(clang::CompilerInstance &compiler,
        llvm::StringRef file) override;

    void setScriptInterface(clang::RecordDecl* record_decl)
    {

        m_script_interface = as::ScriptInterface::fromRecordDecl(record_decl, m_context, m_code_gen->CGM());
    }

    void addFuncName(const std::string& name, const std::string mangled_name)
    {
        m_func_names[name] = mangled_name;
    }

private:
    llvm::LLVMContext& m_context;
    std::unique_ptr<clang::CodeGenerator> m_code_gen;
    std::shared_ptr<as::ScriptInterface>& m_script_interface;
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
        {
            m_action.setScriptInterface(record_decl);
            return true;
        }

        for (auto it = record_decl->decls_begin(); it != record_decl->decls_end(); ++it)
        {
            if (!it->isFunctionOrFunctionTemplate())
            {
                continue;
            }

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
    m_code_gen.reset(clang::CreateLLVMCodeGen(
        compiler.getDiagnostics(), "types-converter",
        &compiler.getVirtualFileSystem(), compiler.getHeaderSearchOpts(),
        compiler.getPreprocessorOpts(), compiler.getCodeGenOpts(), m_context));

    m_code_gen->Initialize(compiler.getASTContext());

    return std::make_unique<CollectNamesASTConsumer>(*this, compiler.getASTContext());
}

namespace as {

void CppLanguageScript::load(const std::string& filename, llvm::LLVMContext& context)
{
    std::ifstream ifs(filename);
    m_content = { std::istreambuf_iterator<char>(ifs), std::istreambuf_iterator<char>() };
    m_content = "#define DEFINE_SCRIPT_INTERFACE(Type, I) I\n" + m_content;
    createCompiler(std::filesystem::path(filename).parent_path());

    auto action2 = std::make_unique<CollectNamesAction>(context, m_script_interface, m_func_names);
    m_compiler->ExecuteAction(*action2);
}

void CppLanguageScript::createCompiler(const std::string& base_path)
{
    auto invocation = std::make_shared<clang::CompilerInvocation>();

    invocation->getLangOpts()->CPlusPlus = true;
    invocation->getLangOpts()->CPlusPlus11 = true;
    invocation->getLangOpts()->CPlusPlus20 = true;
    invocation->getLangOpts()->Bool = true;
    invocation->getLangOpts()->EmitAllDecls = true;

    auto &headerSearchOpts = invocation->getHeaderSearchOpts();
    headerSearchOpts.AddPath(base_path, clang::frontend::Quoted, false, false);

    auto mem_buffer = llvm::MemoryBuffer::getMemBuffer(m_content);
    invocation->getFrontendOpts().Inputs.push_back(clang::FrontendInputFile(*mem_buffer, clang::Language::CXX));
    invocation->getFrontendOpts().ProgramAction = clang::frontend::EmitLLVMOnly;
    invocation->getFrontendOpts().DashX = clang::InputKind(clang::Language::CXX);

    invocation->getCodeGenOpts().CodeModel = "default";

    invocation->getTargetOpts().Triple = llvm::sys::getDefaultTargetTriple();

    m_compiler = std::make_unique<clang::CompilerInstance>();
    m_compiler->setInvocation(std::move(invocation));

    m_compiler->createDiagnostics();
    if (!m_compiler->hasDiagnostics())
    {
        m_compiler.reset();
        return;
    }

    m_compiler->setTarget(clang::TargetInfo::CreateTargetInfo(m_compiler->getDiagnostics(), m_compiler->getInvocation().TargetOpts));
    m_compiler->createFileManager();
    m_compiler->createSourceManager(m_compiler->getFileManager());
    m_compiler->createPreprocessor(clang::TU_Complete);
}

std::shared_ptr<ScriptInterface> CppLanguageScript::getInterface(const std::string& filename, CPPParser& cpp_paser)
{
    return m_script_interface;
}

std::unique_ptr<llvm::Module> CppLanguageScript::createModule(llvm::LLVMContext& context)
{
    auto action = std::make_unique<clang::EmitLLVMOnlyAction>(&context);
    if (!m_compiler->ExecuteAction(*action))
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
                                    llvm::orc::JITDylib& lib,
                                    llvm::Module& module, llvm::LLVMContext& context)
{
}
} // as