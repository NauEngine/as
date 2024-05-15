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


namespace as
{

struct ScriptObject
{
    void* vtable;
    explicit ScriptObject(void* vtable): vtable(vtable) { }
};

ScriptModuleImpl::ScriptModuleImpl(
    const std::string& filename,
    std::shared_ptr<ILanguageScript> language_script,
    std::shared_ptr<CPPParser> cpp_parser,
    const std::string& type_name,
    const std::string& source_code,
    std::shared_ptr<llvm::orc::LLJIT> jit,
    llvm::orc::ThreadSafeContext ts_context) :
    m_safe_name(ir::safe_name(filename)),
    m_language_script(std::move(language_script)),
    m_interface(cpp_parser->getInterface(type_name, source_code)),
    m_jit(std::move(jit)),
    m_ts_context(std::move(ts_context))
{
}

void* ScriptModuleImpl::newInstance()
{
    return new ScriptObject(getVTableAddr().toPtr<void*>());
}

llvm::orc::ExecutorAddr ScriptModuleImpl::getVTableAddr()
{
    if (!m_vtable_name.empty())
    {
        return llvm::cantFail(m_jit->lookup(m_vtable_name));
    }

    auto module_name = ir::interface_module_name(m_safe_name, m_interface->name);
    auto vtable_name = ir::interface_vtable_name(m_safe_name, m_interface->name);

    auto& context = *m_ts_context.getContext();

    std::unique_ptr<llvm::Module> module = std::make_unique<llvm::Module>(module_name, context);

    m_language_script->prepareModule(context, module.get());

    auto num_methods = m_interface->methodNames.size();
    std::vector<llvm::Constant*> vtableMethods(num_methods);

    llvm::PointerType* opaque_ptr_t = llvm::PointerType::get(context, 0);
    llvm::Constant* opaque_null_ptr = llvm::ConstantPointerNull::get(opaque_ptr_t);

    for (int i = 0; i < m_interface->methodNames.size(); ++i)
    {
        if (auto funcType = m_interface->methodTypes[i])
        {
            auto funcName = m_interface->methodNames[i];
            llvm::Function* method = m_language_script->buildFunction(funcName, funcType, context, module.get());
            llvm::errs() << *method << "\n";
            vtableMethods[i] = method;
        }
        else
        {
            llvm::errs() << "null\n";
            vtableMethods[i] = opaque_null_ptr;
        }
    }

    m_language_script->executeModule(m_jit, context, module.get());

    // Create a global vtable
    new llvm::GlobalVariable(*module, m_interface->vtable_t, true, llvm::GlobalValue::ExternalLinkage,
        llvm::ConstantStruct::get(m_interface->vtable_t, vtableMethods),
        vtable_name);

    llvm::errs() << "\nINTERFACE MODULE: \n" << *module << "\n";
    llvm::cantFail(m_jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(module), m_ts_context)));
    m_vtable_name = std::move(vtable_name);

    return llvm::cantFail(m_jit->lookup(m_vtable_name));
}

}
