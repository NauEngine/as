//
// Created by ivn on 23.06.2024.
//

#include "ir_language.h"

#include <fstream>
#include "llvm/IRReader/IRReader.h"

void IRLanguageScript::load(const std::string& filename, llvm::LLVMContext& context)
{
    llvm::SMDiagnostic err;
    m_module = llvm::parseIRFile(filename, err, context);;
}

std::unique_ptr<llvm::Module> IRLanguageScript::createModule(llvm::LLVMContext& context)
{
    return std::move(m_module);
}

llvm::Function* IRLanguageScript::buildModule(const std::string& init_name,
    const std::string& module_name,
    const as::ScriptInterface& interface,
    const std::unordered_map<std::string, std::shared_ptr<as::ScriptInterface>>& externalRequires,
    llvm::Module& module)
{
    return module.getFunction(init_name);
}

void IRLanguageScript::materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit, llvm::orc::JITDylib& lib,
        llvm::Module& module, llvm::LLVMContext& context)
{
    jit->initialize(lib);
}

