//
// Created by Alex Zelenshikov on 18.05.2024.
//

#include "llvm/IR/IRBuilder.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/GVN.h"
#include "llvm/Transforms/Utils.h"
#include "llvm/Transforms/Utils/Cloning.h"


#include "llvm_optimizer.h"

namespace as
{

LLVMOptimizer::LLVMOptimizer(llvm::Module* module)
{
    m_passManager = std::make_unique<llvm::legacy::FunctionPassManager>(module);

    m_passManager->add(llvm::createDeadCodeEliminationPass());
    m_passManager->add(llvm::createPromoteMemoryToRegisterPass());
    m_passManager->add(llvm::createInstructionCombiningPass());
    // m_passManager->add(llvm::createJumpThreadingPass());
    // m_passManager->add(llvm::createConstantPropagationPass());
    m_passManager->add(llvm::createReassociatePass());
    m_passManager->add(llvm::createGVNPass());
    m_passManager->add(llvm::createCFGSimplificationPass());
    m_passManager->add(llvm::createEarlyCSEPass());
    m_passManager->doInitialization();
}

void LLVMOptimizer::runOptimizationPasses(llvm::Function* func) const
{
    m_passManager->run(*func);
}

void LLVMOptimizer::inlineAll(llvm::Function* func) const
{
    std::list<llvm::CallInst*> calls;

    for (auto& blocks : *func)
    {
        for (auto& instruction : blocks)
        {
            if (auto* call = llvm::dyn_cast<llvm::CallInst>(&instruction))
            {
                calls.push_back(call);
            }
        }
    }

    llvm::InlineFunctionInfo IFI;
    for (const auto& call : calls)
    {
        llvm::InlineFunction(*call, IFI);
    }
}

void LLVMOptimizer::inlineByName(llvm::Function* func, const char* funcToInline) const
{
    std::list<llvm::CallInst*> calls;

    for (auto& blocks : *func)
    {
        for (auto& instruction : blocks)
        {
            if (auto* call = llvm::dyn_cast<llvm::CallInst>(&instruction))
            {
                if (auto *callee = call->getCalledFunction())
                {
                    if (callee->getName() == funcToInline)
                    {
                        calls.push_back(call);
                    }
                }
            }
        }
    }

    llvm::InlineFunctionInfo IFI;
    for (const auto& call : calls)
    {
        llvm::InlineFunction(*call, IFI);
    }
}

} // namespace as
