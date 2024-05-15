//
// Created by Alex Zelenshikov on 23.04.2024.
//

#include <string>

#include "core.h"
#include "cpp_interface_parser.h"
#include "ir.h"
#include "language.h"
#include "language_script.h"
#include "script_module.h"


namespace as
{

struct ScriptObject
{
    void* vtable;
    explicit ScriptObject(void* vtable): vtable(vtable) { }
};

ScriptModule::ScriptModule(
    std::shared_ptr<ILanguage> language,
    std::shared_ptr<llvm::orc::LLJIT> jit,
    llvm::orc::ThreadSafeContext ts_context,
    std::shared_ptr<CPPParser> cpp_parser
    ) :
    m_language(std::move(language)),
    m_jit(std::move(jit)),
    m_ts_context(std::move(ts_context)),
    m_cpp_parser(std::move(cpp_parser)),
    m_script_id(0)
{
    m_language_script = m_language->newScript();
}

void ScriptModule::load(const std::string& filename, ScriptId script_id)
{
    m_script_id = script_id;
    m_language_script->load(filename);
}

void* ScriptModule::newInstance(
    const std::shared_ptr<ILanguageScript>& language_script,
    const std::string& type_name,
    const std::string& source_code)
{
    auto scriptInterface = m_cpp_parser->getInterface(type_name, source_code);
    scriptInterface->dump(llvm::errs());

    if (!m_vtables.contains(scriptInterface->name))
    {
        auto [v_table_name, module] = buildInterfaceModule(language_script, scriptInterface);

        llvm::errs() << "\nINTERFACE MODULE: \n" << *module << "\n";

        llvm::cantFail(m_jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(module), m_ts_context)));
        m_vtables[scriptInterface->name] = v_table_name;
    }

    auto vtable = llvm::cantFail(m_jit->lookup(m_vtables[scriptInterface->name]));
    return new ScriptObject(vtable.toPtr<void*>());
}


std::tuple<std::string, std::unique_ptr<llvm::Module>> ScriptModule::buildInterfaceModule(
    const std::shared_ptr<ILanguageScript>& language_script,
    const std::shared_ptr<ScriptInterface>& interface)
{
    auto module_name = ir::interface_module_name(m_script_id, interface->name);
    auto vtable_name = ir::interface_vtable_name(m_script_id, interface->name);

    auto& context = *m_ts_context.getContext();

    std::unique_ptr<llvm::Module> module = std::make_unique<llvm::Module>(module_name, context);

    language_script->prepareModule(context, module.get());

    auto num_methods = interface->methodNames.size();
    std::vector<llvm::Constant*> vtableMethods(num_methods);

    llvm::PointerType* opaque_ptr_t = llvm::PointerType::get(context, 0);
    llvm::Constant* opaque_null_ptr = llvm::ConstantPointerNull::get(opaque_ptr_t);

    for (int i = 0; i < interface->methodNames.size(); ++i)
    {
        if (auto funcType = interface->methodTypes[i])
        {
            auto funcName = interface->methodNames[i];
            auto decoratedName = std::format("{}_{}_{}", interface->name, funcName, m_script_id);
            llvm::Function* method = language_script->buildFunction(funcType, funcName, decoratedName, m_jit, context, module.get());
            llvm::errs() << *method << "\n";
            vtableMethods[i] = method;
        } else
        {
            llvm::errs() << "null\n";
            vtableMethods[i] = opaque_null_ptr;
        }
    }

    // Create a global vtable
    llvm::Value* vtable = new llvm::GlobalVariable(*module, interface->vtable_t, true, llvm::GlobalValue::ExternalLinkage,
                                                   llvm::ConstantStruct::get(interface->vtable_t, vtableMethods),
                                                   vtable_name);

    return {vtable_name, std::move(module)};
}

}
