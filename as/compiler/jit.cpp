//
// Created by Alex Zelenshikov on 05.02.2024.
//

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/GVN.h"

#include "jit.h"

namespace as {

  JIT::JIT(
      std::unique_ptr<llvm::orc::ExecutionSession> es,
      std::unique_ptr<llvm::orc::EPCIndirectionUtils> epciu,
      llvm::orc::JITTargetMachineBuilder jtmb,
      llvm::DataLayout dl) :
  execution_session(std::move(es)),
  epc_inderection_utils(std::move(epciu)),
  data_layout(dl),
  mangle(*execution_session, data_layout),
  object_layer(*execution_session,[]() { return std::make_unique<llvm::SectionMemoryManager>(); }),
  compile_layer(*execution_session, object_layer, std::make_unique<llvm::orc::ConcurrentIRCompiler>(jtmb)),
  optimize_layer(*execution_session, compile_layer, OptimizeModule),
  cod_layer(*execution_session, optimize_layer, epc_inderection_utils->getLazyCallThroughManager(),
               [this] { return epc_inderection_utils->createIndirectStubsManager(); }),
  main_jd(execution_session->createBareJITDylib("<main>"))
  {
    auto dl_search_generator = cantFail(llvm::orc::DynamicLibrarySearchGenerator::GetForCurrentProcess(
        data_layout.getGlobalPrefix()));
    main_jd.addGenerator(std::move(dl_search_generator));

    if (jtmb.getTargetTriple().isOSBinFormatCOFF())
    {
      object_layer.setOverrideObjectFlagsWithResponsibilityFlags(true);
      object_layer.setAutoClaimResponsibilityForObjectSymbols(true);
    }
  }

  JIT::~JIT()
  {
    if (auto err = execution_session->endSession())
    {
      execution_session->reportError(std::move(err));
    }

    if (auto err = epc_inderection_utils->cleanup())
      execution_session->reportError(std::move(err));
  }

  llvm::Expected<std::unique_ptr<JIT>> JIT::Create()
  {
    auto epc = llvm::orc::SelfExecutorProcessControl::Create();
    if (!epc)
    {
      return epc.takeError();
    }

    auto es = std::make_unique<llvm::orc::ExecutionSession>(std::move(*epc));

    auto epciu = llvm::orc::EPCIndirectionUtils::Create(*es);
    if (!epciu)
    {
      return epciu.takeError();
    }

    (*epciu)->createLazyCallThroughManager(*es, llvm::orc::ExecutorAddr::fromPtr(&HandleLazyCallThroughError));

    if (auto error = setUpInProcessLCTMReentryViaEPCIU(**epciu))
    {
      return std::move(error);
    }
    llvm::orc::JITTargetMachineBuilder jtmb(es->getExecutorProcessControl().getTargetTriple());

    auto dl = jtmb.getDefaultDataLayoutForTarget();
    if (!dl)
    {
      return dl.takeError();
    }

    return std::make_unique<JIT>(std::move(es), std::move(*epciu), std::move(jtmb), std::move(*dl));
  }

  llvm::Error JIT::AddModule(llvm::orc::ThreadSafeModule tsm, llvm::orc::ResourceTrackerSP rt)
  {
    if (!rt)
    {
      rt = main_jd.getDefaultResourceTracker();
    }

    return cod_layer.add(rt, std::move(tsm));
  }

  llvm::Expected<llvm::orc::ExecutorSymbolDef> JIT::Lookup(llvm::StringRef name)
  {
    return execution_session->lookup({&main_jd}, mangle(name.str()));
  }

  llvm::Expected<llvm::orc::ThreadSafeModule> JIT::OptimizeModule(
      llvm::orc::ThreadSafeModule tsm, const
    llvm::orc::MaterializationResponsibility& r)
  {
    tsm.withModuleDo([](llvm::Module& module) {

      fprintf(stdout, "Passing optimization\n");
      // Create a function pass manager.
      auto pass_manager = std::make_unique<llvm::legacy::FunctionPassManager>(&module);

      // Add some optimizations.
      pass_manager->add(llvm::createInstructionCombiningPass());
      pass_manager->add(llvm::createReassociatePass());
      pass_manager->add(llvm::createGVNPass());
      pass_manager->add(llvm::createCFGSimplificationPass());
      pass_manager->doInitialization();

      // Run the optimizations over all functions in the module being added to
      // the JIT.
      for (auto& function : module)
      {
        pass_manager->run(function);
      }
    });

    return std::move(tsm);
  }

  void JIT::HandleLazyCallThroughError() {
    llvm::errs() << "LazyCallThrough error: Could not find function body";
    exit(1);
  }
} // namespace as