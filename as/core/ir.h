//
// Created by Alex Zelenshikov on 26.04.2024.
//

#ifndef AS_PROTO_IR_BUILD_HELPERS_H
#define AS_PROTO_IR_BUILD_HELPERS_H

#include <format>

#include <llvm/IR/IRBuilder.h>

#include "as.h"
#include "cpp_interface_parser.h"

namespace llvm
{
    class FunctionType;
    class GlobalVariable;
}

namespace as::ir
{
    // TODO AZ add instance wars directly without modules
    static std::string instance_module_name(const std::string& instance_name)
    {
        return "__instance_" + instance_name;
    }

    static std::string native_interface_module_name(const std::string& lang_prefix, const std::string& type_name)
    {
        return std::format("__{}_module_{}", lang_prefix, type_name);
    }

    static std::string interface_module_name(const std::string& safe_name, const std::string& type_name)
    {
        return std::format("__{}_module_{}", safe_name, type_name);
    }

    static std::string interface_name(const std::string& type_name)
    {
        return std::format("__str_{}", type_name);
    }

    static std::string interface_type_name(const std::string& type_name)
    {
        return std::format("__interface_type_{}", type_name);
    }

    static std::string interface_vtable_type_name(const std::string& type_name)
    {
        return std::format("__interface_vtbl_type_{}", type_name);
    }

    static std::string interface_vtable_name(const std::string& safe_name, const std::string& type_name)
    {
        return std::format("__{}_vtable_{}", safe_name, type_name);
    }

    static std::string safe_name(const std::string& filename)
    {
        std::string result(filename);
        for(auto & it : result) {
            if (!isalnum(it))
                it = '_';
        }

        std::hash<std::string> hasher;
        return result + '_' + std::to_string(hasher(filename));
    }

    template<typename T>
    static llvm::GlobalVariable* buildVTable(const std::string& variable_name,
        const ScriptInterface& interface,
        llvm::Module& module,
        llvm::Function*(T::*buildFunction)(const std::string&,
            llvm::FunctionType*,
            llvm::Module&,
            llvm::LLVMContext&),
        T* self)
    {
        auto& context = module.getContext();

        const auto num_methods = interface.methodNames.size();
        std::vector<llvm::Constant*> methods(num_methods);

        llvm::PointerType* opaque_ptr_t = llvm::PointerType::get(context, 0);
        llvm::Constant* opaque_null_ptr = llvm::ConstantPointerNull::get(opaque_ptr_t);

        for (int i = 0; i < num_methods; ++i)
        {
            if (auto funt_type = interface.methodTypes[i])
            {
                auto func_name = interface.methodNames[i];
                llvm::Function* method = (self->*buildFunction)(func_name, funt_type, module, context);
                methods[i] = method ? method : opaque_null_ptr;
            }
            else
            {
                methods[i] = opaque_null_ptr;
            }
        }

        return new llvm::GlobalVariable(module, interface.vtable_t, true, llvm::GlobalValue::InternalLinkage,
            llvm::ConstantStruct::get(interface.vtable_t, methods),
            variable_name);
    }

    // converts c++ interface signature into inner method type by adding 'this' pointer as first arg
    llvm::FunctionType* buildInterfaceMethodType(llvm::FunctionType* method_t, llvm::PointerType* interface_ptr_t);
    llvm::GlobalVariable* buildGlobalString(llvm::LLVMContext& context, llvm::Module* module, const std::string& name, const std::string& value);
    llvm::Function* сreateFunctionDecl(
            llvm::Module* module,
            llvm::Type *result,
            llvm::ArrayRef<llvm::Type*> params,
            const char* name);

    llvm::Function* createRegisterModuleDecl(llvm::Module& module);

    llvm::Function* createRequireRuntimeDecl(llvm::Module& module);

    // void buildRequireRuntimeCall(llvm::Module& module,
    //     llvm::Function* requireRuntime,
    //     const std::string& runtime_name,
    //     llvm::GlobalVariable* runtime);

    llvm::Function* createRegisterInitDecl(llvm::Module& module);

    void buildRegisterModuleCall(llvm::Module& module,
        llvm::Function* registerModule,
        const std::string& module_name,
        llvm::GlobalVariable* vtable);

    void buildGlobalCtor(llvm::Module& module, llvm::Function* ctor, const unsigned priority);

    /**
     *
     * @param module - Модуль, куда все добавлять
     * @param init_name - Имя для init функции, если она должна быть публичной. Пустая строка, если нужен конструктор для регистрации init функции
     * @param module_name - Имя модуля, под которым этот модуль будет регистрироваться (ir::safe_name)
     * @param vtable - Переменная, в которой хранится vtable, может быть null, тогда vtable не будет регистрироваться
     * @param runtime - Переменная, куда класть runtime, может быть null, тогда runtime не нужен
     * @param runtime_name - Имя рантайма, может быть пустой строкой, тогда runtime не нужен
     * @return - init функция для данного модуля
     */
    llvm::Function* createInitFunc(llvm::Module& module,
                                   const std::string& export_name,
                                   const std::string& module_name,
                                   llvm::GlobalVariable* vtable,
                                   llvm::GlobalVariable* runtime,
                                   const std::string& runtime_name);

} // namespace as

#endif //AS_PROTO_IR_BUILD_HELPERS_H
