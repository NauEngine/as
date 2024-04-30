//
// Created by Alex Zelenshikov on 30.04.2024.
//

#include "llvm/IR/Verifier.h"

#include "language_processor.h"

#include "language.h"
#include "ir_names.h"
#include "cpp_interface_parser.h"

namespace as
{

LanguageProcessor::LanguageProcessor(std::unique_ptr<ILanguage> language, std::shared_ptr<llvm::orc::LLJIT> jit,
  llvm::orc::ThreadSafeContext ts_context, std::shared_ptr<CPPParser> cpp_parser) :
  ts_context(std::move(ts_context)),
  cpp_parser(std::move(cpp_parser)),
  jit(std::move(jit)),
  language(std::move(language))
{

}

llvm::Expected<llvm::orc::ExecutorAddr> LanguageProcessor::newInstance(const std::string& instance_name, const std::string& type_name, const std::string& source_code)
{
  auto cpp_interface = cpp_parser->get_interface(type_name, source_code);

  if (!llvm_interfaces.contains(cpp_interface->name))
  {
    auto llvm_interface = buildInterfaceModule("mock", cpp_interface);

    llvm::errs() << "\nINTERFACE MODULE: \n" << *llvm_interface->module << "\n";

    std::string ErrStr;
    llvm::raw_string_ostream OS(ErrStr);
    if (llvm::verifyModule(*llvm_interface->module, &OS)) {
      llvm::errs() << "The module is broken!\n";
      exit(1);
    }

    if (auto error = jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(llvm_interface->module), ts_context)))
    {
      return error;
    }

    llvm_interfaces[cpp_interface->name] = std::move(llvm_interface);
  }

  if (!llvm_interfaces.contains(cpp_interface->name))
  {
    return llvm::createStringError(llvm::inconvertibleErrorCode(), "Cannot build instance");
  }

  auto instance_module = buildInstanceModule(llvm_interfaces[cpp_interface->name].get(),
                                                 instance_name);

  llvm::outs() << "\nINSTANCE MODULE: \n" << *instance_module << "\n";
  std::string ErrStr;
  llvm::raw_string_ostream OS(ErrStr);
  if (llvm::verifyModule(*instance_module, &OS)) {
    llvm::errs() << "The instance module is broken!\n";
    exit(1);
  }

  if (auto error = jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(instance_module), ts_context)))
  {
    return error;
  }

  return jit->lookup(instance_name);
}

std::unique_ptr<LLVMScriptInterface> LanguageProcessor::buildInterfaceModule(const std::string& lang, const std::shared_ptr<CPPInterface>& interface)
{
  auto llvm_interface = std::make_unique<LLVMScriptInterface>();

  auto module_name = ir::interface_module_name(language->prefix(), interface->name);
  auto type_name = ir::interface_type_name(language->prefix(), interface->name);
  auto vtable_type_name = ir::interface_vtable_type_name(language->prefix(), interface->name);
  llvm_interface->vtable_name = ir::interface_vtable_name(language->prefix(), interface->name);

  auto& context = *ts_context.getContext();

  std::unique_ptr<llvm::Module> module = std::make_unique<llvm::Module>(module_name, context);

  llvm_interface->interface_t = llvm::StructType::create(context, type_name);
  llvm::PointerType* interface_type_ptr = llvm::PointerType::get(llvm_interface->interface_t, 0);

  auto num_methods = interface->methods.size();
  std::vector<llvm::Type*> vtable_types(num_methods);
  std::vector<llvm::Constant*> vtable_methods(num_methods);

  auto i = interface->methods.size() - 1;
  for (const auto& [func_name, signature] : interface->methods)
  {
    llvm::FunctionType* func_type = buildInstanceMethodType(signature, interface_type_ptr);
    llvm::Function* method = language->buildFunction(func_type, interface->name + "_" + func_name, context, module.get());
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


std::unique_ptr<llvm::Module> LanguageProcessor::buildInstanceModule(const LLVMScriptInterface* llvm_interface, const std::string& instance_name)
{
  auto& context = *ts_context.getContext();

  std::unique_ptr<llvm::Module> module = std::make_unique<llvm::Module>(ir::instance_module_name(instance_name), context);

  llvm::Constant* vtable = new llvm::GlobalVariable(*module, llvm_interface->vtable_t, true, llvm::GlobalValue::ExternalLinkage,
                                                    nullptr, // external
                                                    llvm_interface->vtable_name);

  auto ScriptInstance = new llvm::GlobalVariable(*module, llvm_interface->interface_t, false, llvm::GlobalValue::ExternalLinkage,
                                                 llvm::ConstantStruct::get(llvm_interface->interface_t, {vtable}), instance_name);

  return module;
}

llvm::FunctionType* LanguageProcessor::buildInstanceMethodType(llvm::FunctionType* signature, llvm::PointerType* interface_ptr_t)
{
  llvm::Type* ret_type = signature->getReturnType();
  std::vector<llvm::Type*> args(signature->getNumParams() + 1);
  args[0] = interface_ptr_t;
  for (int i = 0; i < signature->getNumParams(); ++i)
  {
    args[i + 1] = signature->getParamType(i);
  }

  return llvm::FunctionType::get(ret_type, args, false);
}

} // namespace as