//
// Created by Alex Zelenshikov on 07.05.2024.
//

#include <fstream>
#include <regex>
#include <sstream>

#include <set>

#include "cpp_interface_parser.h"
#include "script_interface.h"
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

llvm::GlobalVariable* buildString(llvm::Module& module, const std::string& name, const std::string& value)
{
    auto& context = module.getContext();
    llvm::Constant* strConstant = llvm::ConstantDataArray::getString(context, value, true);
    llvm::Type* int8_t = llvm::Type::getInt8Ty(context);

    llvm::ArrayType* array_t = llvm::ArrayType::get(int8_t, value.size() + 1);

    return new llvm::GlobalVariable(module, array_t, true, llvm::GlobalValue::PrivateLinkage, strConstant, name);
}

llvm::Constant* wrapArrayIntoGlobal(
    llvm::Constant* array,
    const char* array_name,
    llvm::Module& module)
{
    auto& context = module.getContext();

    const auto array_global = new llvm::GlobalVariable(module, array->getType(), false,
        llvm::GlobalValue::InternalLinkage, array, array_name);

    const auto idx_list =
    {
        llvm::Constant::getNullValue(llvm::IntegerType::get(context, 32)),
    };

    return llvm::ConstantExpr::getGetElementPtr(array_global->getType(), array_global, idx_list);
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

llvm::Function* createRegisterVTableDecl(llvm::Module& module)
{
    llvm::LLVMContext& context = module.getContext();

    const auto void_t = llvm::Type::getVoidTy(context);
    const auto char_ptr_t = llvm::Type::getInt8PtrTy(context);
    const auto void_ptr_t = llvm::Type::getInt8PtrTy(context);
    const auto int_t = llvm::Type::getInt32Ty(context);
    const auto func_t = llvm::FunctionType::get(void_t, { void_ptr_t, char_ptr_t, void_ptr_t, int_t }, false);
    return llvm::Function::Create(func_t, llvm::Function::ExternalLinkage, "__asRegisterVTable", module);
}

llvm::Function* createRequireRuntimeDecl(llvm::Module& module)
{
    llvm::LLVMContext& context = module.getContext();

    const auto void_ptr_t = llvm::Type::getInt8PtrTy(context);
    const auto char_ptr_t = llvm::Type::getInt8PtrTy(context);
    const auto func_t = llvm::FunctionType::get(void_ptr_t, { void_ptr_t, char_ptr_t }, false);
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
    const std::string& runtime_name,
    llvm::Function* custom_init)
{
    llvm::LLVMContext& context = module.getContext();
    llvm::IRBuilder<> builder(context);

    const auto regsiter_vtable_func = vtable ? createRegisterVTableDecl(module) : nullptr;
    const auto require_runtime_func = runtime && !runtime_name.empty() ? createRequireRuntimeDecl(module) : nullptr;
    const auto register_init_func = init_name.empty() ? createRegisterInitDecl(module) : nullptr;
    const auto module_name_var = vtable || init_name.empty() ? builder.CreateGlobalStringPtr(module_name, ".module_name", 0, &module) : nullptr;

    const auto void_t = llvm::Type::getVoidTy(context);
    const auto void_ptr_t = llvm::Type::getInt8PtrTy(context);
    llvm::FunctionType* init_func_t = llvm::FunctionType::get(void_t, { void_ptr_t }, false);
    const auto linkage = init_name.empty() ? llvm::Function::InternalLinkage : llvm::Function::ExternalLinkage;
    const auto name = init_name.empty() ? ".init_" + module_name : init_name;
    llvm::Function* init_func = llvm::Function::Create(init_func_t, linkage, name, module);
    builder.SetInsertPoint(llvm::BasicBlock::Create(context, "entry", init_func));
    const auto core_arg = init_func->arg_begin();

    if (vtable)
    {
        int vtable_size = -1;
        if (vtable->getValueType()->isStructTy())
        {
            const auto vtable_type = static_cast<llvm::StructType*>(vtable->getValueType());
            vtable_size = vtable_type->elements().size();
        }

        auto vtable_size_var = llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), vtable_size);
        builder.CreateCall(regsiter_vtable_func, { core_arg, module_name_var, vtable, vtable_size_var });
    }

    if (runtime && !runtime_name.empty())
    {
        const auto runtime_name_var = builder.CreateGlobalStringPtr(runtime_name, ".runtime_name");
        const auto runtime_value = builder.CreateCall(require_runtime_func, { core_arg, runtime_name_var });
        builder.CreateStore(runtime_value, runtime);
    }

    if (custom_init)
    {
        builder.CreateCall(custom_init, {core_arg});
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
        llvm::errs() << "Cannot open file \"" << filepath << "\"\n";
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

    llvm::errs() << "Cannot find implements signature in file \"" << filepath << "\"\n";
    return "";
}

std::unordered_map<std::string, std::string> getRequires(const std::string& filepath, const std::string& pattern)
{
    std::ifstream file(filepath);
    if (!file.is_open()) {
        llvm::errs() << "Error opening file: " << filepath << "\n";
        exit(1);
    }

    std::unordered_map<std::string, std::string> result;

    std::string line;
    std::regex exp(pattern + "\\s*require\\s+(\\w+)\\s+implements\\s+(\\S+)");
    std::smatch matches;

    while (std::getline(file, line))
    {
        if (std::regex_match(line, matches, exp) && matches.size() == 3)
        {
            llvm::errs() << "Match: " << matches[1] << " -> " << matches[2] << "\n";
            result[matches[1]] = matches[2];
        }
    }

    file.close();

    return result;
}

std::string getRelativeFileName(const std::string& base_filename, const std::string& filename)
{
    if (filename.empty())
        return nullptr;

    std::filesystem::path base_file_path(std::filesystem::path(base_filename).parent_path());
    std::filesystem::path file_path = base_file_path / filename;

    return file_path;
}

std::shared_ptr<ScriptInterface> getInterface(const std::string& filename,
    const std::string& interface_filename,
    CPPParser& cpp_parser)
{
    std::ifstream ifs(getRelativeFileName(filename, interface_filename));
    std::string interface_content{ std::istreambuf_iterator<char>(ifs), std::istreambuf_iterator<char>() };
    interface_content = "#define DEFINE_SCRIPT_INTERFACE(Type, I) struct Type { I };\n" + interface_content;

    return cpp_parser.getInterface(interface_content);
}

void addMissingDeclarations(llvm::Module& module)
{
    std::set<std::string> declaredFunctions;

    for (llvm::Function& func : module)
    {
        declaredFunctions.insert(func.getName().str());
    }

    for (llvm::Function& func : module)
    {
        for (llvm::BasicBlock& block : func)
        {
            for (llvm::Instruction &instruction : block)
            {
                if (llvm::CallInst* callInst = dyn_cast<llvm::CallInst>(&instruction))
                {
                    if (llvm::Function* calledFunc = callInst->getCalledFunction())
                    {
                        std::string funcName = calledFunc->getName().str();

                        if (declaredFunctions.find(funcName) == declaredFunctions.end())
                        {
                            llvm::FunctionType* funcType = calledFunc->getFunctionType();
                            module.getOrInsertFunction(funcName, funcType);
                            declaredFunctions.insert(funcName);
                        }
                    }
                }
            }
        }
    }
}


} // namespace as::ir
