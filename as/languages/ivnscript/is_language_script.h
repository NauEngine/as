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

    std::unique_ptr<llvm::Module> createModule(const std::string& export_name, llvm::LLVMContext& context) override;

    llvm::GlobalVariable* buildVTable(const std::string& export_name,
        const ScriptInterface& interface,
        llvm::Module& module,
        llvm::LLVMContext& context) override;

    void materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit,
        llvm::Module& module,
        llvm::LLVMContext& context) override {}

private:
    std::unique_ptr<script::Module> m_module;
    std::string m_filename;

    llvm::Function* buildFunction(const std::string& name,
        llvm::FunctionType* signature,
        llvm::Module& module,
        llvm::LLVMContext& context);
};

} // namespace as
