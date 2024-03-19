//
// Created by Alex Zelenshikov on 10.11.2023.
//

#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/StandardInstrumentations.h"
#include "llvm/Analysis/AssumptionCache.h"
#include "llvm/Analysis/BasicAliasAnalysis.h"
#include "llvm/Analysis/MemoryDependenceAnalysis.h"
#include "llvm/Analysis/MemorySSA.h"
#include "llvm/Analysis/OptimizationRemarkEmitter.h"
#include "llvm/Analysis/ProfileSummaryInfo.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/GVN.h"
#include "llvm/Transforms/Scalar/Reassociate.h"
#include "llvm/Transforms/Scalar/SimplifyCFG.h"
#include "llvm/Transforms/Utils/Mem2Reg.h"


#include "interpreter.h"
#include "ast.h"
#include "errors.h"

namespace kscope
{

void Interpreter::Init()
{
  jit = ExitOnErr(as::JIT::Create());

  binop_precedence['='] = 2;
  binop_precedence['<'] = 10;
  binop_precedence['+'] = 20;
  binop_precedence['-'] = 20;
  binop_precedence['*'] = 40; // highest.
}

void Interpreter::InitializeModuleAndManagers() {
  // Open a new context and module.
  context = std::make_unique<llvm::LLVMContext>();
  module = std::make_unique<llvm::Module>("KaleidoscopeJIT", *context);
  module->setDataLayout(jit->GetDataLayout());

  // Create a new builder for the module.
  builder = std::make_unique<llvm::IRBuilder<>>(*context);

  // Create new pass and analysis managers.
  TheFPM = std::make_unique<llvm::FunctionPassManager>();
  TheFAM = std::make_unique<llvm::FunctionAnalysisManager>();
  TheMAM = std::make_unique<llvm::ModuleAnalysisManager>();
  ThePIC = std::make_unique<llvm::PassInstrumentationCallbacks>();
  TheSI = std::make_unique<llvm::StandardInstrumentations>(*context,
      /*DebugLogging*/ true);
  TheSI->registerCallbacks(*ThePIC, TheMAM.get());

  // Add transform passes.
  TheFPM->addPass(llvm::PromotePass());
  // Do simple "peephole" optimizations and bit-twiddling optzns.
  TheFPM->addPass(llvm::InstCombinePass());
  // Reassociate expressions.
  TheFPM->addPass(llvm::ReassociatePass());
  // Eliminate Common SubExpressions.
  TheFPM->addPass(llvm::GVNPass());
  // Simplify the control flow graph (deleting unreachable blocks, etc).
  TheFPM->addPass(llvm::SimplifyCFGPass());

  // Register analysis passes used in these transform passes.
  TheFAM->registerPass([&] { return llvm::AAManager(); });
  TheFAM->registerPass([&] { return llvm::AssumptionAnalysis(); });
  TheFAM->registerPass([&] { return llvm::DominatorTreeAnalysis(); });
  TheFAM->registerPass([&] { return llvm::LoopAnalysis(); });
  TheFAM->registerPass([&] { return llvm::MemoryDependenceAnalysis(); });
  TheFAM->registerPass([&] { return llvm::MemorySSAAnalysis(); });
  TheFAM->registerPass([&] { return llvm::OptimizationRemarkEmitterAnalysis(); });
  TheFAM->registerPass([&] {
    return llvm::OuterAnalysisManagerProxy<llvm::ModuleAnalysisManager, llvm::Function>(*TheMAM);
  });
  TheFAM->registerPass(
      [&] { return llvm::PassInstrumentationAnalysis(ThePIC.get()); });
  TheFAM->registerPass([&] { return llvm::TargetIRAnalysis(); });
  TheFAM->registerPass([&] { return llvm::TargetLibraryAnalysis(); });

  TheMAM->registerPass([&] { return llvm::ProfileSummaryAnalysis(); });
}

llvm::Function* Interpreter::GetFunction(const std::string& name) {
  // First, see if the function has already been added to the current module.
  if (auto *F = module->getFunction(name))
    return F;

  // If not, check whether we can codegen the declaration from some existing
  // prototype.
  auto FI = function_protos.find(name);
  if (FI != function_protos.end())
    return FI->second->codegen(*this);

  // If no existing prototype exists, return null.
  return nullptr;
}

llvm::AllocaInst* Interpreter::CreateEntryBlockAlloca(llvm::Function* function, const std::string &var_name) const
{
  llvm::IRBuilder<> tmp_builder(&function->getEntryBlock(),
                                function->getEntryBlock().begin());
  return tmp_builder.CreateAlloca(llvm::Type::getDoubleTy(*context), nullptr, var_name);
}

}