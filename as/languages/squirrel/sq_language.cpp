//
// Created by Alex Zelenshikov on 09.05.2024.
//

#include "sq_language.h"

#include "as/core/ir.h"

#include "sq_ir.h"
#include "sq_language_script.h"

#include "squirrel/include/squirrel.h"
#include "squirrel/include/sqstdaux.h"

#include <iostream>
#include <iomanip>

namespace
{

void printfunc(HSQUIRRELVM v,const SQChar *s,...)
{
    va_list vl;
    va_start(vl, s);
    vfprintf(stdout, s, vl);
    va_end(vl);
}

void errorfunc(HSQUIRRELVM v,const SQChar *s,...)
{
    va_list vl;
    va_start(vl, s);
    vfprintf(stderr, s, vl);
    va_end(vl);
}

}

namespace as
{
SquirrelLanguage::SquirrelLanguage()
{
    m_sq_vm = sq_open(STACK_SIZE);
    sqstd_seterrorhandlers(m_sq_vm);
    sq_setprintfunc(m_sq_vm, printfunc, errorfunc);
}

SquirrelLanguage::~SquirrelLanguage()
{
    if (m_sq_vm)
    {
        // Release all metatables
        for (auto& pair : m_createdMetatables) {
            sq_release(m_sq_vm, &pair.second);
        }
        m_createdMetatables.clear();

        // Close Squirrel VM
        sq_close(m_sq_vm);
        m_sq_vm = nullptr;
    }
}

void SquirrelLanguage::init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context)
{
    m_jit = std::move(jit);
    m_ts_context = std::move(ts_context);

    m_sq_ir = std::make_shared<SquirrelIR>();
    m_sq_ir->init(m_jit, m_ts_context, m_sq_vm);
}

std::shared_ptr<as::ILanguageScript> SquirrelLanguage::newScript()
{
    return std::make_shared<SquirrelLanguageScript>(m_sq_vm, m_sq_ir);
}

void SquirrelLanguage::registerInstance(void* instance, const std::string& instanceName, const std::shared_ptr<ScriptInterface>& interface)
{
    if (m_createdMetatables.find(interface->name) == m_createdMetatables.end())
    {
        createInterfaceMetatable(interface);
    }

    sq_newtable(m_sq_vm);

    if (instance == nullptr) {
        llvm::errs() << "Error: instance is null.\n";
        return;
    }

    // Bind user data (pointer at instance) to __instance key in instance table
    sq_pushstring(m_sq_vm, "__instance", -1);
    sq_pushuserpointer(m_sq_vm, instance);
    sq_newslot(m_sq_vm, -3, SQFalse);

    // Set a metatable as a delegate for instance table
    HSQOBJECT metatable = m_createdMetatables[interface->name];
    sq_pushobject(m_sq_vm, metatable);
    if (SQ_FAILED(sq_setdelegate(m_sq_vm, -2))) {
        llvm::errs() << "Failed to set metatable for table '" << instanceName << "'. Stack type: " << sq_gettype(m_sq_vm, -2) << "\n";
        return;
    }

    // Storing instance table in the root table
    sq_pushroottable(m_sq_vm);
    sq_pushstring(m_sq_vm, instanceName.c_str(), -1);
    sq_push(m_sq_vm, -3);
    sq_newslot(m_sq_vm, -3, SQFalse);
    
    // Clear stack
    sq_pop(m_sq_vm, sq_gettop(m_sq_vm));
}

void SquirrelLanguage::createInterfaceMetatable(const std::shared_ptr<ScriptInterface>& interface)
{
    llvm::LLVMContext& context = *m_ts_context.getContext();
    auto module_name = ir::native_interface_module_name(prefix(), interface->name);
    std::unique_ptr<llvm::Module> module = std::make_unique<llvm::Module>(module_name, context);

    auto var_name = ir::interface_name(interface->name);
    auto type_name_var = ir::buildGlobalString(context, module.get(), var_name, interface->name);

    std::vector<std::string> decoratedNames(interface->methodNames.size());
    int countPureMethods = 0;

    for (int i = 0; i < interface->methodNames.size(); ++i)
    {
        if (auto methodType = interface->methodTypes[i])
        {
            countPureMethods++;
            auto methodName = interface->methodNames[i];
            decoratedNames[i] = std::format("__squirrel_{}_{}", interface->name, methodName);
            buildSqCFunction(context, module.get(), methodType, i, decoratedNames[i], type_name_var); 
        }
    }

    sq_newtable(m_sq_vm);

    if (auto error = m_jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(module), m_ts_context))) {
        llvm::errs() << "Error adding IR module.\n";
        return;
    }

    for (int i = 0; i < interface->methodNames.size(); ++i)
    {
        if (interface->methodTypes[i])
        {
            auto address = llvm::cantFail(m_jit->lookup(decoratedNames[i]));
            const auto func = address.toPtr<SQFUNCTION>();

            if (func == nullptr) {
                llvm::errs() << "Error: method '" << interface->methodNames[i] << "' is null.\n";
                continue;
            }

            sq_pushstring(m_sq_vm, interface->methodNames[i].c_str(), -1);
            sq_newclosure(m_sq_vm, func, 0);
            sq_newslot(m_sq_vm, -3, SQFalse);
        }
    }

    HSQOBJECT metatable;
    sq_getstackobj(m_sq_vm, -1, &metatable);
    sq_addref(m_sq_vm, &metatable);
    m_createdMetatables[interface->name] = metatable;

    sq_pop(m_sq_vm, 1);
}

void SquirrelLanguage::buildSqCFunction(
  llvm::LLVMContext& context,
  llvm::Module* module,
  llvm::FunctionType* methodType,
  int methodPosition,
  const std::string& methodName,
  llvm::Value* type_name_var
) const
{
    llvm::IRBuilder<> builder(context);
    llvm::Function* func = llvm::Function::Create(m_sq_ir->sq_func_t, llvm::Function::ExternalLinkage, methodName, module);
    llvm::BasicBlock* block = llvm::BasicBlock::Create(context, "entry", func);
    builder.SetInsertPoint(block);

    llvm::Type* opaquePtr_t = llvm::PointerType::get(builder.getInt64Ty(), 0);
    llvm::Value* sq_vm_var = func->getArg(0);
    llvm::Constant* int64_pos1 = llvm::ConstantInt::get(llvm::Type::getInt64Ty(context), 1);
    llvm::Constant* int64_neg1 = llvm::ConstantInt::get(llvm::Type::getInt64Ty(context), -1);
    
    // Get the value of a key from a table that contains a pointer to an instance
    llvm::Value* key = builder.CreateGlobalStringPtr("__instance");
    builder.CreateCall(m_sq_ir->sq_pushstring_f, {sq_vm_var, key, int64_neg1});
    builder.CreateCall(m_sq_ir->sq_get_f, {sq_vm_var, int64_pos1});

    // Check that the retrieved object is a user pointer
    llvm::Value* objType = builder.CreateCall(m_sq_ir->sq_gettype_f, {sq_vm_var, int64_neg1});
    llvm::Value* userPointerType = llvm::ConstantInt::get(builder.getInt64Ty(), OT_USERPOINTER);
    llvm::Value* isUserPointer = builder.CreateICmpEQ(objType, userPointerType);

    llvm::BasicBlock* checkFailedBlock = llvm::BasicBlock::Create(context, "check_failed", func);
    llvm::BasicBlock* continueBlock = llvm::BasicBlock::Create(context, "continue", func);
    builder.CreateCondBr(isUserPointer, continueBlock, checkFailedBlock);

    builder.SetInsertPoint(checkFailedBlock);
    builder.CreateCall(m_sq_ir->sq_throwerror_f, {sq_vm_var, builder.CreateGlobalStringPtr("Expected user pointer")});
    builder.CreateRetVoid();

    builder.SetInsertPoint(continueBlock);

    // Get a pointer to an instance
    llvm::Value* instancePtr = builder.CreateAlloca(opaquePtr_t);
    builder.CreateCall(m_sq_ir->sq_getuserpointer_f, {sq_vm_var, int64_neg1, instancePtr});

    // Remove the pointer from the stack top
    builder.CreateCall(m_sq_ir->sq_pop_f, {sq_vm_var, int64_pos1});

    llvm::Value* vtblPtr = builder.CreateLoad(opaquePtr_t, instancePtr);
    llvm::Value* vtbl = builder.CreateLoad(opaquePtr_t, vtblPtr);
    llvm::Value* methodPtr = builder.CreateGEP(opaquePtr_t, vtbl, {builder.getInt64(methodPosition)});
    llvm::Value* method = builder.CreateLoad(opaquePtr_t, methodPtr);

    std::vector<llvm::Value*> args(methodType->getNumParams());
    args[0] = vtblPtr;

    for (int i = 1; i < methodType->getNumParams(); ++i)
    {
        args[i] = m_sq_ir->buildPopValue(builder, sq_vm_var, methodType->getParamType(i), i + 1);
    }

    llvm::Value* callResult = builder.CreateCall(methodType, method, args);
    m_sq_ir->buildPushValue(builder, sq_vm_var, methodType->getReturnType(), callResult);
    llvm::Constant* result = builder.getInt64(methodType->getReturnType()->isVoidTy() ? 0 : 1);
    builder.CreateRet(result);
}

} //namespace as