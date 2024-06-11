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

InitFunction ScriptModuleCompile::materialize(std::shared_ptr<llvm::orc::LLJIT>& jit,
    llvm::orc::ThreadSafeContext ts_context)
{
    auto& context = *ts_context.getContext();
    m_language_script->materialize(jit, *m_module, context);

    const auto init_name = "init_" + m_export_name;

    auto init_func_addr_prev = jit->lookup(init_name);
    if (init_func_addr_prev)
    {
        llvm::outs() << "Init function (" << init_name << ") already register. Remove it and register new one\n";
        
    }

    auto error_add = jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(m_module), ts_context));
    if (error_add)
    {
        llvm::errs() << "Cannot add module. " << error_add << "\n";
        return nullptr;
    }

    auto init_func_addr = jit->lookup(init_name);
    if (!init_func_addr)
    {
        llvm::errs() << "Cannot get init function (" << init_name << "). " << init_func_addr.takeError() << "\n";
        return nullptr;
    }

    return init_func_addr.get().toPtr<void(void*)>();
}

void ScriptModuleCompile::compile(const ScriptInterface& interface,
    llvm::LLVMContext& context,
    bool add_init)
{
    m_module = std::move(m_language_script->createModule(context));
    const auto init_name = add_init ? "" : "init_" + m_export_name;
    m_language_script->buildModule(init_name, m_export_name, interface, *m_module);
}

} // as