//
// Created by ivn on 21.05.2024.
//

#include "llvm/IR/Constants.h"

#include "cpp_interface_parser.h"
#include "language_script.h"

#include "script_module_compile.h"

#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Verifier.h>

static llvm::Function* callRegisterFunction(llvm::Module& module, const std::string& register_name, const std::string& export_name, llvm::GlobalVariable* vtable)
{
    llvm::LLVMContext& context = module.getContext();
    llvm::IRBuilder<> builder(context);

    llvm::Type* return_t = llvm::Type::getVoidTy(context);
    llvm::Type* char_ptr_t = llvm::Type::getInt8PtrTy(context);
    llvm::Type* void_ptr_t = llvm::Type::getInt8PtrTy(context);

    llvm::FunctionType* func_t = llvm::FunctionType::get(return_t, { char_ptr_t, void_ptr_t }, false);
    llvm::Function* func = llvm::Function::Create(func_t, llvm::Function::ExternalLinkage, register_name, module);

    llvm::FunctionType* init_func_t = llvm::FunctionType::get(return_t, {}, false);
    llvm::Function* init_func = llvm::Function::Create(init_func_t, llvm::Function::InternalLinkage, "_GLOBAL_CTOR_" + export_name, module);

    auto entry = llvm::BasicBlock::Create(context, "entry", init_func);
    builder.SetInsertPoint(entry);
    llvm::Value* export_name_var = builder.CreateGlobalStringPtr(export_name, export_name + "_str");
    builder.CreateCall(func, { export_name_var, vtable });
    builder.CreateRetVoid();

    return init_func;
}

static void addGlobalConstructor(llvm::Module& module, llvm::Function* ctor, unsigned priority)
{
    llvm::LLVMContext& context = module.getContext();
    llvm::IRBuilder<> builder(context);

    // Create an initializer for this constructor
    std::vector<llvm::Constant*> ctor_values = {
        builder.getInt32(priority),
        ctor,
        llvm::ConstantPointerNull::get(builder.getInt8PtrTy())
    };
    llvm::Constant* ctor_init = llvm::ConstantStruct::getAnon(ctor_values);

    // Get or create the llvm.global_ctors array
    llvm::GlobalVariable* ctors = module.getNamedGlobal("llvm.global_ctors");
    if (!ctors) {
        llvm::ArrayType* ctor_type = llvm::ArrayType::get(ctor_init->getType(), 1);
        ctors = new llvm::GlobalVariable(module, ctor_type, false,
            llvm::GlobalValue::AppendingLinkage,
            nullptr, "llvm.global_ctors");
    }

    // Append the new constructor to the existing array
    std::vector<llvm::Constant*> init_list;
    if (ctors->hasInitializer()) {
        auto* old_init = ctors->getInitializer();
        for (int i = 0; i < old_init->getNumOperands(); ++i)
            init_list.push_back(llvm::cast<llvm::Constant>(old_init->getOperand(i)));
    }
    init_list.push_back(ctor_init);

    // Update the initializer
    llvm::ArrayType* new_ctor_type = llvm::ArrayType::get(ctor_init->getType(), init_list.size());
    llvm::Constant* new_ctor_init = llvm::ConstantArray::get(new_ctor_type, init_list);
    ctors->setInitializer(new_ctor_init);
}

namespace as {

ScriptModuleCompile::ScriptModuleCompile(const std::string& export_name,
        const ScriptInterface& interface,
        std::shared_ptr<ILanguageScript> language_script,
        llvm::orc::ThreadSafeContext ts_context,
        bool add_init):
    m_language_script(std::move(language_script)),
    m_ts_context(std::move(ts_context))
{
    compile(export_name, interface, add_init);
}

void ScriptModuleCompile::dump(llvm::raw_fd_ostream& stream)
{
    stream << *m_module;
}

void ScriptModuleCompile::compile(const std::string& export_name, const ScriptInterface& interface, bool add_init)
{
    auto& context = *m_ts_context.getContext();
    m_module = std::make_unique<llvm::Module>(export_name, context);

    auto vtableMethods = compileFunctions(interface, context);

    // Create a global vtable
    auto vtable = new llvm::GlobalVariable(*m_module, interface.vtable_t, true, llvm::GlobalValue::ExternalLinkage,
        llvm::ConstantStruct::get(interface.vtable_t, vtableMethods),
        export_name);

    if (add_init)
    {
        auto ctor = callRegisterFunction(*m_module, "registerInterface", export_name, vtable);
        addGlobalConstructor(*m_module, ctor, 65535);
    }

    llvm::verifyModule(*m_module, &llvm::errs());
}

std::vector<llvm::Constant*> ScriptModuleCompile::compileFunctions(const ScriptInterface& interface, llvm::LLVMContext& context)
{
    m_language_script->prepareModule(context, m_module.get());

    auto num_methods = interface.methodNames.size();
    std::vector<llvm::Constant*> vtableMethods(num_methods);

    llvm::PointerType* opaque_ptr_t = llvm::PointerType::get(context, 0);
    llvm::Constant* opaque_null_ptr = llvm::ConstantPointerNull::get(opaque_ptr_t);

    for (int i = 0; i < interface.methodNames.size(); ++i)
    {
        if (auto funcType = interface.methodTypes[i])
        {
            auto funcName = interface.methodNames[i];
            llvm::Function* method = m_language_script->buildFunction(funcName, funcType, context, m_module.get());
            vtableMethods[i] = method;
        }
        else
        {
            vtableMethods[i] = opaque_null_ptr;
        }
    }

    return vtableMethods;
}

} // as