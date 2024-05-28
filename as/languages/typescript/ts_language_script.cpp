//
// Created by ivn on 28.05.2024.
//

#include "llvm/Support/SourceMgr.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/IR/OwningOpRef.h"
#include "mlir/IR/BuiltinOps.h"
#include "tsc/include/TypeScript/DataStructs.h"

#include "ts_language_script.h"

int compileTypeScriptFileIntoMLIR(mlir::MLIRContext &, llvm::SourceMgr &, mlir::OwningOpRef<mlir::ModuleOp> &, CompileOptions&);

namespace as {
    TypeScriptLanguageScript::TypeScriptLanguageScript(mlir::MLIRContext& context):
        m_context(context)
    {
    }

    void TypeScriptLanguageScript::load(const std::string& filename)
    {

    }

    void TypeScriptLanguageScript::prepareModule(llvm::LLVMContext& context, llvm::Module* module)
    {
    }

    llvm::Function* TypeScriptLanguageScript::buildFunction(const std::string& bare_name, llvm::FunctionType* signature,
            llvm::LLVMContext& context, llvm::Module* module)
    {
        return nullptr;
    }

    void TypeScriptLanguageScript::executeModule(const std::shared_ptr<llvm::orc::LLJIT>& jit, llvm::LLVMContext& context,
            llvm::Module* module)
    {
    }
} // as