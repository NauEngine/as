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

llvm::orc::JITDylib* ScriptModuleCompile::getModuleLib(std::shared_ptr<llvm::orc::LLJIT>& jit)
{
    auto jd = jit->getJITDylibByName(m_export_name);
    if (!jd)
    {
        auto error_jd = jit->createJITDylib(m_export_name);
        if (!error_jd)
        {
            llvm::errs() << "Cannot create new library. " << error_jd.takeError() << "\n";
            return nullptr;
        }

        error_jd.get().addToLinkOrder(jit->getMainJITDylib());
        return &(error_jd.get());
    }

    auto error_jd_clear = jd->clear();
    if (error_jd_clear)
    {
        llvm::errs() << "Cannot clear existing library. " << error_jd_clear << "\n";
        return nullptr;
    }

    auto error_remove = jit->getExecutionSession().removeJITDylib(*jd);
    if (error_remove)
    {
        llvm::errs() << "Cannot remove existing library. " << error_remove << "\n";
        return nullptr;
    }

    auto error_jd2 = jit->createJITDylib(m_export_name);
    if (!error_jd2)
    {
        llvm::errs() << "Cannot create new library to replace. " << error_jd2.takeError() << "\n";
        return nullptr;
    }

    error_jd2.get().addToLinkOrder(jit->getMainJITDylib());
    return &(error_jd2.get());
}

InitFunction ScriptModuleCompile::materialize(std::shared_ptr<llvm::orc::LLJIT>& jit,
    llvm::orc::ThreadSafeContext ts_context)
{
    auto lib = getModuleLib(jit);
    if (!lib)
    {
        return nullptr;
    }

    auto& context = *ts_context.getContext();
    auto error_add = jit->addIRModule(*lib, llvm::orc::ThreadSafeModule(std::move(m_module), ts_context));
    if (error_add)
    {
        llvm::errs() << "Cannot add module. " << error_add << "\n";
        return nullptr;
    }

    m_language_script->materialize(jit, *lib, *m_module, context);

    const auto init_name = "init_" + m_export_name;
    auto init_func_addr = jit->lookup(*lib, init_name);
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