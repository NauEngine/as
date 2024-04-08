//
// Created by Alex Zelenshikov on 06.02.2024.
//

#include <iostream>

#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"

#include "core.h"
#include "language_processor.h"
#include "script_module.h"

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

//    auto func_addr = ExitOnErr(jit->lookup("test"));
//    p->jit_func = func_addr.toPtr<lua_CFunction>();

  }

  Core::~Core()
  {
    llvm::llvm_shutdown();
  }

  void Core::registerLanguage(const std::string& language_name, std::unique_ptr<ILanguageProcessor> processor)
  {
    processors[language_name] = std::move(processor);
  }

  std::shared_ptr<IScriptModule> Core::newScriptModule(const std::string& language_name)
  {
    // TODO make error handling
    auto script_module = processors[language_name]->newScriptModule();
    return script_module;
  }

  void Core::loadModulesIntoJit()
  {
    for (auto& [name, processor] : processors)
    {
      processor->insertModulesInto(jit.get());
    }
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