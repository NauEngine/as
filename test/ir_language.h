//
// Created by ivn on 23.06.2024.
//

#pragma once

#include "llvm/ExecutionEngine/Orc/Core.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Passes/StandardInstrumentations.h"
#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"

#include "as/core/language.h"
#include "as/core/language_script.h"

class IRLanguageScript : public as::ILanguageScript
{
public:
    void load(const std::string& filename, llvm::LLVMContext& context) override;

    std::shared_ptr<as::ScriptInterface> getInterface(const std::string& filename, as::CPPParser& cpp_paser) override
    {
        return nullptr;
    }

    std::unordered_map<std::string, std::shared_ptr<as::ScriptInterface>>
        getRequires(const std::string& filename, as::CPPParser& cpp_paser) override
    {
        return std::unordered_map<std::string, std::shared_ptr<as::ScriptInterface>>();
    }

    std::unique_ptr<llvm::Module> createModule(llvm::LLVMContext& context) override;

    llvm::Function* buildModule(const std::string& init_name,
        const std::string& module_name,
        const as::ScriptInterface& interface,
        const std::unordered_map<std::string, std::shared_ptr<as::ScriptInterface>>& externalRequires,
        llvm::Module& module) override;

    void materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit,
        llvm::orc::JITDylib& lib,
        llvm::Module& module,
        llvm::LLVMContext& context) override;

private:
    std::unique_ptr<llvm::Module> m_module;
};

class IRLanguage : public as::ILanguage {
public:
    const char* prefix() override
    {
        return "ll";
    }

    void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext context) override
    {
    }

    void registerInstance(void* instance, const std::string& instanceName,
        const std::shared_ptr<as::ScriptInterface>& cppInterface) override
    {
    }

    std::shared_ptr<as::ILanguageScript> newScript() override
    {
        return std::make_shared<IRLanguageScript>();
    }
};
