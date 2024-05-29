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

    void load(const std::string& filename) override;

    std::unique_ptr<llvm::Module> createModule(const std::string& export_name, llvm::LLVMContext& context) override;

    llvm::GlobalVariable* buildVTable(const std::string& export_name,
        const ScriptInterface& interface,
        llvm::Module& module,
        llvm::LLVMContext& context) override;

    void materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit,
        llvm::Module& module,
        llvm::LLVMContext& context) override;

private:
    mlir::MLIRContext& m_context;
    mlir::OwningOpRef<mlir::ModuleOp> m_module;
};

} // as
