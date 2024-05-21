//
// Created by ivn on 21.05.2024.
//

#include "llvm/IR/Constants.h"

#include "cpp_interface_parser.h"
#include "language_script.h"

#include "script_module_compile.h"


namespace as {
ScriptModuleCompile::ScriptModuleCompile(const std::string& export_name,
        std::shared_ptr<ScriptInterface> interface,
        std::shared_ptr<ILanguageScript> language_script,
        llvm::orc::ThreadSafeContext ts_context):
    m_language_script(std::move(language_script)),
    m_ts_context(std::move(ts_context))
{
    compile(export_name, interface);
}

void ScriptModuleCompile::dump(llvm::raw_fd_ostream& stream)
{
    stream << *m_module;
}

void ScriptModuleCompile::compile(const std::string& export_name, std::shared_ptr<ScriptInterface> interface)
{
    auto& context = *m_ts_context.getContext();

    m_module = std::make_unique<llvm::Module>(export_name, context);

    m_language_script->prepareModule(context, m_module.get());

    auto num_methods = interface->methodNames.size();
    std::vector<llvm::Constant*> vtableMethods(num_methods);

    llvm::PointerType* opaque_ptr_t = llvm::PointerType::get(context, 0);
    llvm::Constant* opaque_null_ptr = llvm::ConstantPointerNull::get(opaque_ptr_t);

    for (int i = 0; i < interface->methodNames.size(); ++i)
    {
        if (auto funcType = interface->methodTypes[i])
        {
            auto funcName = interface->methodNames[i];
            llvm::Function* method = m_language_script->buildFunction(funcName, funcType, context, m_module.get());
            vtableMethods[i] = method;
        }
        else
        {
            vtableMethods[i] = opaque_null_ptr;
        }
    }

    // Create a global vtable
    new llvm::GlobalVariable(*m_module, interface->vtable_t, true, llvm::GlobalValue::ExternalLinkage,
        llvm::ConstantStruct::get(interface->vtable_t, vtableMethods),
        export_name);
}
} // as