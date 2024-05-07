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
    auto cpp_interface = m_cpp_parser->get_interface(type_name, source_code);

    if (!m_llvm_interfaces.contains(cpp_interface->name))
    {
        auto llvm_interface = buildInterfaceModule(language_script, cpp_interface);

        llvm::errs() << "\nINTERFACE MODULE: \n" << *llvm_interface->module << "\n";

        if (auto error = m_jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(llvm_interface->module), m_ts_context)))
        {
            return error;
        }

        m_llvm_interfaces[cpp_interface->name] = std::move(llvm_interface);
    }

    if (!m_llvm_interfaces.contains(cpp_interface->name))
    {
        return llvm::createStringError(llvm::inconvertibleErrorCode(), "Cannot build instance");
    }

    auto instance_module = buildInstanceModule(m_llvm_interfaces[cpp_interface->name].get(),
                                                   instance_name);

    if (auto error = m_jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(instance_module), m_ts_context)))
    {
        return error;
    }

    return m_jit->lookup(instance_name);
}

std::unique_ptr<LLVMScriptInterface> ScriptModule::buildInterfaceModule(
      const std::shared_ptr<ILanguageScript>& language_script,
      const std::shared_ptr<CPPInterface>& interface)
{
  auto llvm_interface = std::make_unique<LLVMScriptInterface>();

  auto module_name = ir::interface_module_name(m_script_id, interface->name);
  auto type_name = ir::interface_type_name(m_script_id, interface->name);
  auto vtable_type_name = ir::interface_vtable_type_name(m_script_id, interface->name);
  llvm_interface->vtable_name = ir::interface_vtable_name(m_script_id, interface->name);

  auto& context = *m_ts_context.getContext();

  std::unique_ptr<llvm::Module> module = std::make_unique<llvm::Module>(module_name, context);

  language_script->prepareModule(context, module.get());

  llvm_interface->interface_t = llvm::StructType::create(context, type_name);
  llvm::PointerType* interface_type_ptr = llvm::PointerType::get(llvm_interface->interface_t, 0);

  auto num_methods = interface->methods.size();
  std::vector<llvm::Type*> vtable_types(num_methods);
  std::vector<llvm::Constant*> vtable_methods(num_methods);

  auto i = interface->methods.size() - 1;
  for (const auto& [func_name, signature] : interface->methods)
  {
    llvm::FunctionType* func_type = ir::buildInterfaceMethodType(signature, interface_type_ptr);
    auto decorated_name = std::format("{}_{}_{}", interface->name, func_name, m_script_id);
    llvm::Function* method = language_script->buildFunction(func_type, func_name, decorated_name, context, module.get());
    vtable_types[i] = llvm::PointerType::get(func_type, 0);
    vtable_methods[i] = method;
    i--;
  }

  llvm_interface->vtable_t = llvm::StructType::create(context, vtable_type_name);
  llvm_interface->vtable_t->setBody(vtable_types);

  llvm_interface->interface_t->setBody(llvm::PointerType::get(llvm_interface->vtable_t, 0));

  // Create a global vtable
  llvm::Value* vtable = new llvm::GlobalVariable(*module, llvm_interface->vtable_t, true, llvm::GlobalValue::ExternalLinkage,
                                                 llvm::ConstantStruct::get(llvm_interface->vtable_t, vtable_methods),
                                                 llvm_interface->vtable_name);

  llvm_interface->module = std::move(module);

  return std::move(llvm_interface);
}


std::unique_ptr<llvm::Module> ScriptModule::buildInstanceModule(const LLVMScriptInterface* llvm_interface, const std::string& instance_name)
{
    auto& context = *m_ts_context.getContext();

    std::unique_ptr<llvm::Module> module = std::make_unique<llvm::Module>(ir::instance_module_name(instance_name), context);

    llvm::Constant* vtable = new llvm::GlobalVariable(*module, llvm_interface->vtable_t, true, llvm::GlobalValue::ExternalLinkage,
                                                    nullptr, // external
                                                    llvm_interface->vtable_name);

    auto ScriptInstance = new llvm::GlobalVariable(*module, llvm_interface->interface_t, false, llvm::GlobalValue::ExternalLinkage,
                                                 llvm::ConstantStruct::get(llvm_interface->interface_t, {vtable}), instance_name);

    return module;
}


}
