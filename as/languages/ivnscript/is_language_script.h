//
// Created by ivn on 11.05.2024.
//
#pragma once

#include <memory>
#include <string>
#include <llvm/ExecutionEngine/Orc/Core.h>

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

    void load(const std::string& filename, llvm::LLVMContext& context) override;

    std::shared_ptr<ScriptInterface> getInterface(const std::string& filename, CPPParser& cpp_paser) override;

    std::unordered_map<std::string, std::shared_ptr<ScriptInterface>>
        getRequires(const std::string& filename, CPPParser& cpp_paser) override
    {
        return std::unordered_map<std::string, std::shared_ptr<ScriptInterface>>();
    }

    std::unique_ptr<llvm::Module> createModule(llvm::LLVMContext& context) override;

    llvm::Function* buildModule(const std::string& init_name,
        const std::string& module_name,
        const ScriptInterface& interface,
        const std::unordered_map<std::string, std::shared_ptr<ScriptInterface>>& externalRequires,
        llvm::Module& module) override;

    void materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit,
                     llvm::orc::JITDylib& lib,
                     llvm::Module& module, llvm::LLVMContext& context) override {}

private:
    std::unique_ptr<script::Module> m_module;
    std::string m_filename;

    llvm::GlobalVariable* m_runtime_var;
    llvm::Function* m_runtime_enter;

    llvm::Function* buildFunction(const std::string& name,
        llvm::FunctionType* signature,
        llvm::Module& module,
        llvm::LLVMContext& context);
};

} // namespace as
