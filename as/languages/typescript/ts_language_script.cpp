//
// Created by ivn on 28.05.2024.
//

#include "ts_language_script.h"

namespace as {
    void TsLanguageScript::load(const std::string& filename)
    {
    }

    void TsLanguageScript::prepareModule(llvm::LLVMContext& context, llvm::Module* module)
    {
    }

    llvm::Function* TsLanguageScript::buildFunction(const std::string& bare_name, llvm::FunctionType* signature,
            llvm::LLVMContext& context, llvm::Module* module)
    {
        return nullptr;
    }

    void TsLanguageScript::executeModule(const std::shared_ptr<llvm::orc::LLJIT>& jit, llvm::LLVMContext& context,
            llvm::Module* module)
    {
    }
} // as