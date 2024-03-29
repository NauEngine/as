//
// Created by Alex Zelenshikov on 06.02.2024.
//

#include <iostream>

#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"

#include "Core.h"
#include "LanguageProcessor.h"

namespace
{
  llvm::ExitOnError ExitOnErr;
}

namespace as
{
  Core::Core()
  {
    llvm::InitializeAllTargets();
    llvm::InitializeAllTargetMCs();
    llvm::InitializeAllAsmPrinters();
    llvm::InitializeAllAsmParsers();

    jit = ExitOnErr(llvm::orc::LLJITBuilder().create());
  }

  Core::~Core()
  {
    llvm::llvm_shutdown();
  }

  void Core::RegisterLanguage(const std::string& language_name, std::unique_ptr<ILanguageProcessor> processor)
  {
    processors[language_name] = std::move(processor);
  }

  std::shared_ptr<IScriptModule>  Core::RegisterScriptModule(const std::string& filename, const std::string& language_name)
  {
    // TODO make error handling
    return processors[language_name]->RegisterScriptModule(filename);
  }

  void Core::Init()
  {
    std::cout << "Script Core started!" << std::endl;
  }

  void Core::Update()
  {
//    std::cout << "Script Core Update" << std::endl;
//
//    for (auto& [name, processor] : processors)
//    {
//      processor->Update();
//    }
  }
} // as