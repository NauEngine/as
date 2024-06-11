//
// Created by ivn on 06.06.2024.
//

#pragma once

#include <string>

#include "clang/AST/Decl.h"
#include "llvm/IR/DerivedTypes.h"
#include "clang/CodeGen/CodeGenABITypes.h"

namespace as {

struct ScriptInterface
{
    // Name of interface
    std::string name;
    // Ordered vector of method names, if some name is empty it means that method is not pure
    std::vector<std::string> methodNames;
    // Types if method since vtable_t contains pointers to methods
    std::vector<llvm::FunctionType*> methodTypes;
    // Type of script interface
    llvm::StructType* interface_t = nullptr;
    // Type of pointer to script interface
    llvm::PointerType* interface_ptr_t = nullptr;
    // Type of vtable for script interface
    llvm::StructType* vtable_t = nullptr;

    void dump(llvm::raw_fd_ostream& stream) const;

    static std::shared_ptr<ScriptInterface> fromRecordDecl(clang::RecordDecl* record_decl,
        llvm::LLVMContext& context,
        clang::CodeGen::CodeGenModule &cgm);
};

} // as
