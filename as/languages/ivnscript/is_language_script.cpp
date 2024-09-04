//
// Created by ivn on 11.05.2024.
//

#include <algorithm>
#include <iostream>
#include <fstream>

#include "./script/parser.h"

#include "./is_language_script.h"

#include "as/core/ir.h"
#include "script/interpreter.h"

namespace as
{
IvnScriptLanguageScript::IvnScriptLanguageScript()
{

}

void IvnScriptLanguageScript::load(const std::string& filename, llvm::LLVMContext& context)
{
    m_filename = filename;

    std::ifstream ifs(m_filename);
    const std::string content{ std::istreambuf_iterator<char>(ifs), std::istreambuf_iterator<char>() };

    std::vector<script::Error> errors;
    m_module = std::move(script::parse(content.c_str(), errors));

    for (const auto &error: errors) {
      std::cerr << m_filename << ":" << error.line << ":" << error.column << ": error: " << error.message << "\n";
    }
}

std::shared_ptr<ScriptInterface> IvnScriptLanguageScript::getInterface(const std::string& filename,
                                                                       CPPParser& cpp_paser)
{
    auto interface_filename = ir::getImplements(filename, "//");
    if (interface_filename.empty())
    {
        llvm::errs() << "Cannot find implementation for script " << filename << "\n";
        return nullptr;
    }

    return ir::getInterface(filename, interface_filename, cpp_paser);
}

std::unique_ptr<llvm::Module> IvnScriptLanguageScript::createModule(
        llvm::LLVMContext& context)
{
    return std::make_unique<llvm::Module>("is_module", context);
}

llvm::Function* IvnScriptLanguageScript::buildModule(
    const std::string& init_name,
    const std::string& module_name,
    const ScriptInterface& interface,
    const std::unordered_map<std::string, std::shared_ptr<ScriptInterface>>& externalRequires,
    llvm::Module& module)
{
    auto& context = module.getContext();
    const auto void_ptr_t = llvm::Type::getInt8PtrTy(context);
    m_runtime_var = new llvm::GlobalVariable(module, void_ptr_t, false, llvm::GlobalValue::PrivateLinkage,
        llvm::ConstantPointerNull::get(void_ptr_t), ".runtime");

    const auto void_t = llvm::Type::getVoidTy(context);
    const auto char_ptr_t = llvm::Type::getInt8PtrTy(context);

    m_runtime_enter = ir::сreateFunctionDecl(&module, void_t, { void_ptr_t, char_ptr_t }, "__isRuntimeOnEnter");

    const auto vtable = ir::buildVTable(module_name, interface, module, &IvnScriptLanguageScript::buildFunction, this);
    return ir::createInitFunc(module, init_name, module_name, vtable, m_runtime_var, "is_runtime");
}

llvm::Function* IvnScriptLanguageScript::buildFunction(
        const std::string& bare_name,
        llvm::FunctionType* signature,
        llvm::Module& module,
        llvm::LLVMContext& context)
{
    auto const &funcs = m_module->getFunctions();
    auto f = std::find_if(funcs.begin(), funcs.end(), [bare_name](auto const &it)
    {
        return it.name == bare_name;
    });

    if (f == funcs.end())
    {
        return nullptr;
    }

    std::vector<script::Error> errors;
    auto result = script::build(context, module, bare_name, *f, signature, m_runtime_var, m_runtime_enter, errors);
    for (const auto &error: errors) {
      std::cerr << m_filename << ":" << error.line << ":" << error.column << ": error: " << error.message << "\n";
    }

    return result;
};

}
