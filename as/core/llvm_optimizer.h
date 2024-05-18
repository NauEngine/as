//
// Created by Alex Zelenshikov on 18.05.2024.
//

#ifndef LLVM_OPTIMIZER_H
#define LLVM_OPTIMIZER_H

#include "llvm/IR/LegacyPassManager.h"

namespace llvm
{
    class Module;
    class Function;
}

namespace as
{

class LLVMOptimizer
{
public:
    explicit LLVMOptimizer(llvm::Module* module);

    void runOptimizationPasses(llvm::Function* func) const;
    void inlineAll(llvm::Function* func) const;
    void inlineByName(llvm::Function* func, const char* funcToInline) const;
private:
    std::unique_ptr<llvm::legacy::FunctionPassManager> m_passManager;
};

}


#endif //LLVM_OPTIMIZER_H
