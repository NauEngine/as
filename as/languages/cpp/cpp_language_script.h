//
// Created by ivn on 04.06.2024.
//

#pragma once
#include "as/core/language_script.h"

namespace as {

class CppLanguageScript: public ILanguageScript
{
public:
    ~CppLanguageScript() override = default;

    void load(const std::string& filename) override;

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
    std::string m_base_path;
    std::unordered_map<std::string, std::string> m_func_names;

    llvm::Function* buildFunction(const std::string& name,
        llvm::FunctionType* signature,
        llvm::Module& module,
        llvm::LLVMContext& context);
};

} // as
