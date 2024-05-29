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

void IvnScriptLanguageScript::load(const std::string& filename)
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

std::unique_ptr<llvm::Module> IvnScriptLanguageScript::createModule(const std::string& export_name,
        llvm::LLVMContext& context)
{
    return std::make_unique<llvm::Module>(export_name, context);
}

llvm::Function* IvnScriptLanguageScript::buildModule(const std::string& init_name,
    const std::string& module_name,
    const ScriptInterface& interface,
    llvm::Module& module)
{
    const auto vtable = ir::buildVTable(module_name, interface, module, &IvnScriptLanguageScript::buildFunction, this);
    return ir::createInitFunc(module, init_name, module_name, vtable, nullptr, "");
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
    auto result = script::build(context, module, bare_name, *f, signature, errors);
    for (const auto &error: errors) {
      std::cerr << m_filename << ":" << error.line << ":" << error.column << ": error: " << error.message << "\n";
    }

    return result;
};

}
