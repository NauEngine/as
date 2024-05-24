//
// Created by Alex Zelenshikov on 23.04.2024.
//

#include <string>
#include <utility>

#include "core.h"
#include "ir.h"
#include "language.h"
#include "language_script.h"
#include "script_module.h"

#include "cpp_interface_parser.h"
#include "script_module_compile.h"


namespace as
{

struct ScriptObject
{
    void* vtable;
    explicit ScriptObject(void* vtable): vtable(vtable) { }
};

ScriptModuleVTable::ScriptModuleVTable(const std::string& safe_name,
    std::shared_ptr<ScriptModuleCompile> module,
    std::shared_ptr<llvm::orc::LLJIT> jit,
    llvm::orc::ThreadSafeContext ts_context):
    m_module(module)
{
    auto llvm_module = m_module->getModule(); // compile(safe_name, interface, ts_context);
    m_vtable = getVTableAddr(safe_name, std::move(llvm_module), jit, ts_context);
}

void* ScriptModuleVTable::newInstance()
{
    return new ScriptObject(m_vtable.toPtr<void*>());
}

llvm::orc::ExecutorAddr ScriptModuleVTable::getVTableAddr(const std::string& safe_name,
    std::unique_ptr<llvm::Module> module,
    std::shared_ptr<llvm::orc::LLJIT> jit,
    llvm::orc::ThreadSafeContext ts_context)
{
    auto vtable_name = safe_name; //ir::interface_vtable_name(m_safe_name, m_interface->name);

    auto& context = *ts_context.getContext();

    m_module->getScript()->executeModule(jit, context, module.get());

    //llvm::errs() << "\nINTERFACE MODULE: \n" << *module << "\n";
    llvm::cantFail(jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(module), ts_context)));

    return llvm::cantFail(jit->lookup(safe_name));
}

}
