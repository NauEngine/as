//
// Created by Alex Zelenshikov on 07.05.2024.
//

#include <fstream>
#include <regex>
#include <sstream>

#include "llvm/IR/IRBuilder.h"

namespace as::ir
{
llvm::FunctionType* buildInterfaceMethodType(llvm::FunctionType* signature, llvm::PointerType* interface_ptr_t)
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

llvm::GlobalVariable* buildGlobalString(llvm::LLVMContext& context, llvm::Module* module, const std::string& name, const std::string& value)
{
    llvm::Constant* strConstant = llvm::ConstantDataArray::getString(context, value, true);
    llvm::Type* int8_t = llvm::Type::getInt8Ty(context);

    llvm::ArrayType* array_t = llvm::ArrayType::get(int8_t, value.size() + 1);

    return new llvm::GlobalVariable(*module, array_t, true, llvm::GlobalValue::PrivateLinkage, strConstant, name);
}

llvm::Function* сreateFunctionDecl(
    llvm::Module* module,
    llvm::Type *result,
    llvm::ArrayRef<llvm::Type*> params,
    const char* name)
{
    const auto func_type = llvm::FunctionType::get(result, params, false);
    return llvm::Function::Create(func_type, llvm::Function::ExternalLinkage, name, module);
}

llvm::Function* createRegisterModuleDecl(llvm::Module& module)
{
    llvm::LLVMContext& context = module.getContext();

    const auto void_t = llvm::Type::getVoidTy(context);
    const auto char_ptr_t = llvm::Type::getInt8PtrTy(context);
    const auto void_ptr_t = llvm::Type::getInt8PtrTy(context);
    const auto func_t = llvm::FunctionType::get(void_t, { char_ptr_t, void_ptr_t }, false);
    return llvm::Function::Create(func_t, llvm::Function::ExternalLinkage, "__asRegisterModule", module);
}

llvm::Function* createRequireRuntimeDecl(llvm::Module& module)
{
    llvm::LLVMContext& context = module.getContext();

    const auto void_ptr_t = llvm::Type::getInt8PtrTy(context);
    const auto char_ptr_t = llvm::Type::getInt8PtrTy(context);
    const auto func_t = llvm::FunctionType::get(void_ptr_t, { char_ptr_t }, false);
    return llvm::Function::Create(func_t, llvm::Function::ExternalLinkage, "__asRequireRuntime", module);
}

llvm::Function* createRegisterInitDecl(llvm::Module& module)
{
    llvm::LLVMContext& context = module.getContext();

    const auto void_t = llvm::Type::getVoidTy(context);
    const auto char_ptr_t = llvm::Type::getInt8PtrTy(context);
    const auto void_ptr_t = llvm::Type::getInt8PtrTy(context);
    const auto func_t = llvm::FunctionType::get(void_t, { char_ptr_t, void_ptr_t }, false);
    return llvm::Function::Create(func_t, llvm::Function::ExternalLinkage, "__asRegisterInit", module);
}

void buildRegisterModuleCall(llvm::Module& module, llvm::Function* registerModule, const std::string& module_name, llvm::GlobalVariable* vtable)
{
    llvm::LLVMContext& context = module.getContext();
    llvm::IRBuilder<> builder(context);

    llvm::Value* module_name_var = builder.CreateGlobalStringPtr(module_name, module_name + "_str");
    builder.CreateCall(registerModule, { module_name_var, vtable });
}

void buildGlobalCtor(llvm::Module& module, llvm::Function* ctor, const unsigned priority)
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

llvm::Function* createInitFunc(llvm::Module& module,
    const std::string& init_name,
    const std::string& module_name,
    llvm::GlobalVariable* vtable,
    llvm::GlobalVariable* runtime,
    const std::string& runtime_name)
{
    llvm::LLVMContext& context = module.getContext();
    llvm::IRBuilder<> builder(context);

    const auto regsiter_module_func = vtable ? createRegisterModuleDecl(module) : nullptr;
    const auto require_runtime_func = runtime && !runtime_name.empty() ? createRequireRuntimeDecl(module) : nullptr;
    const auto register_init_func = init_name.empty() ? createRegisterInitDecl(module) : nullptr;
    const auto module_name_var = vtable || init_name.empty() ? builder.CreateGlobalStringPtr(module_name, ".module_name", 0, &module) : nullptr;

    const auto void_t = llvm::Type::getVoidTy(context);
    llvm::FunctionType* init_func_t = llvm::FunctionType::get(void_t, {}, false);
    const auto linkage = init_name.empty() ? llvm::Function::InternalLinkage : llvm::Function::ExternalLinkage;
    const auto name = init_name.empty() ? ".init_" + module_name : init_name;
    llvm::Function* init_func = llvm::Function::Create(init_func_t, linkage, name, module);
    builder.SetInsertPoint(llvm::BasicBlock::Create(context, "entry", init_func));

    if (vtable)
    {
        builder.CreateCall(regsiter_module_func, { module_name_var, vtable });
    }

    if (runtime && !runtime_name.empty())
    {
        const auto runtime_name_var = builder.CreateGlobalStringPtr(runtime_name, ".runtime_name");
        const auto runtime_value = builder.CreateCall(require_runtime_func, { runtime_name_var });
        builder.CreateStore(runtime_value, runtime);
    }

    builder.CreateRetVoid();

    if (init_name.empty())
    {
        llvm::FunctionType* ctor_func_t = llvm::FunctionType::get(void_t, {}, false);
        llvm::Function* ctor_func = llvm::Function::Create(ctor_func_t, llvm::Function::InternalLinkage, ".ctor_" + module_name, module);

        builder.SetInsertPoint(llvm::BasicBlock::Create(context, "entry", ctor_func));
        builder.CreateCall(register_init_func, { module_name_var, init_func });
        builder.CreateRetVoid();

        buildGlobalCtor(module, ctor_func, 0);
    }

    return init_func;
}

std::string getImplements(const std::string& filepath, const std::string& pattern)
{
    std::ifstream file(filepath);
    if (!file.is_open())
    {
        return "";
    }

    char buffer[1025];  // Buffer to store up to 1024 characters + null terminator
    file.read(buffer, 1024);  // Read the first 1024 characters from the file
    buffer[file.gcount()] = '\0';  // Ensure null termination

    std::string content(buffer);  // Convert buffer to std::string for easier processing
    std::istringstream iss(content);  // Use istringstream to read line by line
    std::string line;

    std::regex implements("implements\\s+\"([^\"]+)\"");

    while (std::getline(iss, line))
    {
        if (line.rfind(pattern, 0) != 0)
            continue;

        std::smatch matches;
        if (!std::regex_search(line, matches, implements) || matches.size() != 2)
            continue;

        return matches[1].str();
    }

    return "";
}


} // namespace as::ir