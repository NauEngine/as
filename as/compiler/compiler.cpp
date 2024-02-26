//
// Created by Alex Zelenshikov on 20.11.2023.
//

#include "llvm/IR/Module.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/TargetParser/Host.h"
#include "llvm/Target/TargetOptions.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FileSystem.h"

#include "compiler.h"

namespace as
{
  int Compiler::compile(llvm::Module* module)
  {
    auto target_triple = llvm::sys::getDefaultTargetTriple();
    module->setTargetTriple(target_triple);

    std::string error;
    auto target = llvm::TargetRegistry::lookupTarget(target_triple, error);

    // Print an error and exit if we couldn't find the requested target.
    // This generally occurs if we've forgotten to initialise the
    // TargetRegistry or we have a bogus target triple.
    if (!target)
    {
      llvm::errs() << error;
      return 1;
    }

    auto cpu = "generic";
    auto features = "";

    llvm::TargetOptions opt;
    auto rm = std::optional<llvm::Reloc::Model>();
    auto target_machine = target->createTargetMachine(target_triple, cpu, features, opt, rm);

    module->setDataLayout(target_machine->createDataLayout());

    auto filename = "output.o";
    std::error_code error_code;
    llvm::raw_fd_ostream dest(filename, error_code, llvm::sys::fs::OF_None);

    if (error_code)
    {
      llvm::errs() << "Could not open file: " << error_code.message();
      return 1;
    }

    llvm::legacy::PassManager pass_manager;
    auto file_type = llvm::CodeGenFileType::CGFT_ObjectFile;

    if (target_machine->addPassesToEmitFile(pass_manager, dest, nullptr, file_type))
    {
      llvm::errs() << "TheTargetMachine can't emit a file of this type";
      return 1;
    }

    pass_manager.run(*module);
    dest.flush();

    llvm::outs() << "Wrote " << filename << "\n";

    return 0;
  }
}