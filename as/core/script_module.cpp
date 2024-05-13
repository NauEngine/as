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

llvm::Expected<llvm::orc::ExecutorAddr> ScriptModule::newInstance(
    const std::shared_ptr<ILanguageScript>& language_script,
    const std::string& instance_name,
    const std::string& type_name,
    const std::string& source_code)
{
    auto scriptInterface = m_cpp_parser->getInterface(type_name, source_code);
    scriptInterface->dump(llvm::errs());

    if (!m_vtables.contains(scriptInterface->name))
    {
        auto [v_table_name, module] = buildInterfaceModule(language_script, scriptInterface);

        llvm::errs() << "\nINTERFACE MODULE: \n" << *module << "\n";

        if (auto error = m_jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(module), m_ts_context)))
        {
            return error;
        }

        m_vtables[scriptInterface->name] = v_table_name;
    }

    if (!m_vtables.contains(scriptInterface->name))
    {
        return llvm::createStringError(llvm::inconvertibleErrorCode(), "Cannot build instance");
    }

    auto instance_module = buildInstanceModule(m_vtables[scriptInterface->name], instance_name, scriptInterface);

    if (auto error = m_jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(instance_module), m_ts_context)))
    {
        return error;
    }

    return m_jit->lookup(instance_name);
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

std::unique_ptr<llvm::Module> ScriptModule::buildInstanceModule(const std::string& vtable_name, const std::string& instance_name, const std::shared_ptr<ScriptInterface>& interface)
{
    auto& context = *m_ts_context.getContext();

    std::unique_ptr<llvm::Module> module = std::make_unique<llvm::Module>(ir::instance_module_name(instance_name), context);

    llvm::Constant* vtable = new llvm::GlobalVariable(*module, interface->vtable_t, true, llvm::GlobalValue::ExternalLinkage,
                                                    nullptr, // external
                                                    vtable_name);

    auto scriptInstance = new llvm::GlobalVariable(*module, interface->interface_t, false, llvm::GlobalValue::ExternalLinkage,
                                                 llvm::ConstantStruct::get(interface->interface_t, {vtable}), instance_name);

    return module;
}


}
