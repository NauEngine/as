//
// Created by ivn on 11.05.2024.
//
#pragma once

#include <memory>
#include <string>

#include "llvm/IR/LLVMContext.h"
#include "as/core/language_script.h"

#include "./script/module.h"

namespace as
{

class IvnScriptLanguageScript final : public ILanguageScript
{
public:
    explicit IvnScriptLanguageScript();
    ~IvnScriptLanguageScript() override = default;

    void load(const std::string& filename) override;

    void prepareModule(llvm::LLVMContext& context, llvm::Module* module) override;

    llvm::Function* buildFunction(
        llvm::FunctionType* signature,
        const std::string& bare_name,
        const std::string& decorated_name,
        const std::shared_ptr<llvm::orc::LLJIT>& jit,
        llvm::LLVMContext& context,
        llvm::Module* module) override;

private:
    std::unique_ptr<script::Module> m_module;
    std::string m_filename;
};

} // namespace as
