//
// Created by Alex Zelenshikov on 06.02.2024.
//

#include <iostream>

#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"

#include "llvm/IR/IRBuilder.h"

#include "core.h"
#include "language.h"
#include "script_module.h"
#include "cpp_interface_parser.h"

namespace
{
  llvm::ExitOnError ExitOnErr;
}

namespace as
{
  Core::Core():
    next_script_id(0)
  {
    ts_context = std::make_unique<llvm::LLVMContext>();
    cpp_interface_parser = std::make_shared<CPPParser>(*ts_context.getContext());

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

  void Core::registerLanguage(const std::string& language_name, std::shared_ptr<ILanguage> language)
  {
    language->init(jit, ts_context);
    languages[language_name] = std::move(language);
  }

  std::shared_ptr<ScriptModule> Core::newScriptModule(const std::string& language_name, const std::string& filename)
  {
    auto script_id = getScriptId(filename);
    auto script_module = std::make_shared<ScriptModule>(languages[language_name], jit, ts_context, cpp_interface_parser);
    script_module->load(filename, script_id);
    return script_module;
  }

  ScriptId Core::getScriptId(const std::string& path)
  {
    if (script_ids.contains(path))
    {
      return script_ids[path];
    }

    next_script_id++;
    script_ids[path] = next_script_id;

    return next_script_id;
  }

} // as