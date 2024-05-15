//
// Created by ivn on 11.05.2024.
//

#include <algorithm>
#include <iostream>
#include <fstream>

#include "./script/parser.h"

#include "./is_language_script.h"

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

void IvnScriptLanguageScript::prepareModule(llvm::LLVMContext& context, llvm::Module* module)
{

}

llvm::Function* IvnScriptLanguageScript::buildFunction(
    const std::string& bare_name,
    llvm::FunctionType* signature,
    llvm::LLVMContext& context,
    llvm::Module* module)
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
