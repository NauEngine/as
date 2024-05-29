//
// Created by ivn on 21.05.2024.
//

#include "llvm/IR/Constants.h"

#include "cpp_interface_parser.h"
#include "language_script.h"

#include <llvm/ExecutionEngine/Orc/LLJIT.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Verifier.h>

#include "ir.h"

#include "script_module_compile.h"

namespace as {

ScriptModuleCompile::ScriptModuleCompile(const std::string& export_name,
        const ScriptInterface& interface,
        std::shared_ptr<ILanguageScript> language_script,
        llvm::LLVMContext& context,
        bool add_init):
    m_export_name(export_name),
    m_language_script(std::move(language_script))
{
    compile(interface, context, add_init);
}

void ScriptModuleCompile::dump(llvm::raw_fd_ostream& stream) const
{
    stream << *m_module;
}

void ScriptModuleCompile::materialize(std::shared_ptr<llvm::orc::LLJIT>& jit,
    llvm::orc::ThreadSafeContext ts_context)
{
    auto& context = *ts_context.getContext();
    m_language_script->materialize(jit, *m_module, context);

    // llvm::errs() << "\nINTERFACE MODULE: \n" << *m_module << "\n";
    llvm::cantFail(jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(m_module), ts_context)));

    const auto init_func_addr = llvm::cantFail(jit->lookup("init_" + m_export_name));
    const auto init_func = init_func_addr.toPtr<void*()>();
    init_func();
}

void ScriptModuleCompile::compile(const ScriptInterface& interface,
    llvm::LLVMContext& context,
    bool add_init)
{
    m_module = std::move(m_language_script->createModule("", context));
    const auto init_name = add_init ? "" : "init_" + m_export_name;
    m_language_script->buildModule(init_name, m_export_name, interface, *m_module);
}

} // as