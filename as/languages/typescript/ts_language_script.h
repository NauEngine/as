//
// Created by ivn on 28.05.2024.
//

#pragma once
#include "as/core/language_script.h"

namespace as {

class TypeScriptLanguageScript: public ILanguageScript {
public:
    explicit TypeScriptLanguageScript(mlir::MLIRContext& context);
    ~TypeScriptLanguageScript() override = default;

    void load(const std::string& filename) override;

    std::unique_ptr<llvm::Module> createModule(const std::string& export_name, llvm::LLVMContext& context) override
    {
        return nullptr;
    }

    void prepareModule(llvm::LLVMContext& context, llvm::Module* module) override;

    llvm::Function* buildFunction(const std::string& bare_name, llvm::FunctionType* signature,
            llvm::LLVMContext& context, llvm::Module* module) override;

    void executeModule(const std::shared_ptr<llvm::orc::LLJIT>& jit, llvm::LLVMContext& context,
            llvm::Module* module) override;

private:
    mlir::MLIRContext& m_context;
    mlir::OwningOpRef<mlir::ModuleOp> m_module;
};

} // as
