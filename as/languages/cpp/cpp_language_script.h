//
// Created by ivn on 04.06.2024.
//

#pragma once
#include "as/core/language_script.h"
#include "clang/Frontend/CompilerInstance.h"

namespace as {

class CppLanguageScript: public ILanguageScript
{
public:
    ~CppLanguageScript() override = default;

    void load(const std::string& filename, llvm::LLVMContext& context) override;

    std::shared_ptr<ScriptInterface> getInterface(const std::string& filename, CPPParser& cpp_paser) override;

    std::unique_ptr<llvm::Module> createModule(llvm::LLVMContext& context) override;

    llvm::Function* buildModule(const std::string& init_name,
        const std::string& module_name,
        const ScriptInterface& interface,
        llvm::Module& module) override;

    void materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit,
        llvm::Module& module,
        llvm::LLVMContext& context) override;

private:
    std::string m_content;
    std::unique_ptr<clang::CompilerInstance> m_compiler;
    std::shared_ptr<ScriptInterface> m_script_interface;
    std::unordered_map<std::string, std::string> m_func_names;

    void createCompiler(const std::string& base_path);

    llvm::Function* buildFunction(const std::string& name,
        llvm::FunctionType* signature,
        llvm::Module& module,
        llvm::LLVMContext& context);
};

} // as
