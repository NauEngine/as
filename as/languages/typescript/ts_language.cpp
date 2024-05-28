//
// Created by ivn on 28.05.2024.
//

#include "tsc/include/TypeScript/MLIRGen.h"
#include "tsc/include/TypeScript/Config.h"
#include "tsc/include/TypeScript/TypeScriptDialect.h"
#include "tsc/include/TypeScript/TypeScriptOps.h"
#include "tsc/include/TypeScript/DiagnosticHelper.h"

#include "mlir/IR/Attributes.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Diagnostics.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/IR/Types.h"
#include "mlir/IR/Verifier.h"

#include "mlir/Dialect/ControlFlow/IR/ControlFlowOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/LLVMIR/LLVMDialect.h"
#include "mlir/Dialect/LLVMIR/LLVMTypes.h"
#include "mlir/Dialect/DLTI/DLTI.h"
#include "mlir/Dialect/Func/Extensions/AllExtensions.h"
#include "mlir/Dialect/Math/IR/Math.h"
#include "mlir/IR/Diagnostics.h"

#include "ts_language.h"


#include "ts_language_script.h"

namespace as {

TypeScriptLanguage::TypeScriptLanguage() :
    m_context()
{
    mlir::DialectRegistry registry;
    mlir::func::registerAllExtensions(registry);

    m_context.appendDialectRegistry(registry);
    // Load our Dialect in this MLIR Context.
    m_context.getOrLoadDialect<mlir::typescript::TypeScriptDialect>();
    m_context.getOrLoadDialect<mlir::arith::ArithDialect>();
    m_context.getOrLoadDialect<mlir::math::MathDialect>();
    m_context.getOrLoadDialect<mlir::cf::ControlFlowDialect>();
    m_context.getOrLoadDialect<mlir::func::FuncDialect>();
    m_context.getOrLoadDialect<mlir::DLTIDialect>();
    m_context.getOrLoadDialect<mlir::LLVM::LLVMDialect>();
}

void TypeScriptLanguage::init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext context)
{
}

std::shared_ptr<ILanguageScript> TypeScriptLanguage::newScript()
{
    return std::shared_ptr<ILanguageScript>(new TypeScriptLanguageScript(m_context));
}

} // as