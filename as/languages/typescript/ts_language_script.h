//
// Created by ivn on 28.05.2024.
//

#pragma once
#include <llvm/IR/GlobalVariable.h>

#include "as/core/language_script.h"

namespace as {

class TypeScriptLanguageScript: public ILanguageScript {
public:
    explicit TypeScriptLanguageScript(mlir::MLIRContext& context);
    ~TypeScriptLanguageScript() override = default;

    void load(const std::string& filename, llvm::LLVMContext& context) override;

    std::shared_ptr<ScriptInterface> getInterface(const std::string& filename, CPPParser& cpp_paser) override
    {
        return nullptr;
    }

    std::unique_ptr<llvm::Module> createModule(llvm::LLVMContext& context) override;

    llvm::Function* buildModule(const std::string& init_name,
        const std::string& module_name,
        const ScriptInterface& interface,
        llvm::Module& module) override;

    void materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit,
        llvm::Module& module,
        llvm::LLVMContext& context) override;

private:
    mlir::MLIRContext& m_context;
    mlir::OwningOpRef<mlir::ModuleOp> m_module;
};

} // as
