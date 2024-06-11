//
// Created by ivn on 06.06.2024.
//

#include "script_interface.h"

#include "ir.h"

namespace as {

void ScriptInterface::dump(llvm::raw_fd_ostream& stream) const
{
    stream << "Interface: " << name << "\n";

    for (int i = 0; i < methodNames.size(); ++i)
    {
        stream << "  " << methodNames[i] << " " << *vtable_t->getTypeAtIndex(i) << "\n";
    }
}

std::shared_ptr<ScriptInterface> ScriptInterface::fromRecordDecl(clang::RecordDecl* record_decl,
    llvm::LLVMContext& context,
    clang::CodeGen::CodeGenModule &cgm)
{
    if (!record_decl->isThisDeclarationADefinition())
        return nullptr;

    auto interface = std::make_unique<ScriptInterface>();
    interface->name = record_decl->getNameAsString();

    const auto type_name = ir::interface_type_name(interface->name);
    const auto vtable_type_name = ir::interface_vtable_type_name(interface->name);

    interface->interface_t = llvm::StructType::create(context, type_name);
    interface->interface_ptr_t = llvm::PointerType::get(interface->interface_t, 0);

    auto opaque_ptr_t = llvm::PointerType::get(context, 0);
    std::vector<llvm::Type*> vtable_types;
    for (auto it = record_decl->decls_begin(); it != record_decl->decls_end(); ++it)
    {
        if (!it->isFunctionOrFunctionTemplate())
            continue;

        const auto function = it->getAsFunction();
        if (function->isPure())
        {
            llvm::FunctionType* function_type = clang::CodeGen::convertFreeFunctionType(cgm, function);
            llvm::FunctionType* method_type = ir::buildInterfaceMethodType(function_type, interface->interface_ptr_t);

            auto func_name = function->getNameInfo().getName().getAsString();
            interface->methodNames.push_back(func_name);
            interface->methodTypes.push_back(method_type);
            vtable_types.push_back(llvm::PointerType::get(method_type, 0));
        }
        else
        {
            interface->methodNames.emplace_back("");
            interface->methodTypes.push_back(nullptr);
            vtable_types.push_back(opaque_ptr_t);
        }
    }

    interface->vtable_t = llvm::StructType::create(context, vtable_type_name);
    interface->vtable_t->setBody(vtable_types);

    interface->interface_t->setBody(llvm::PointerType::get(interface->vtable_t, 0));
    return interface;
}

} // as