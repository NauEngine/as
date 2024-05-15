//
// Created by Alex Zelenshikov on 09.05.2024.
//

#include "llvm/IR/IRBuilder.h"

#include "sq_language_script.h"

#include "squirrel/include/squirrel.h"
#include "squirrel/include/sqstdio.h"

#include "sq_ir.h"

static std::string getSafeName(const std::string& filename)
{
    std::string result(filename);
    for(auto & it : result) {
        if (!isalnum(it))
            it = '_';
    }

    std::hash<std::string> hasher;
    return result + '_' + std::to_string(hasher(filename));
}

namespace as
{
void SquirrelLanguageScript::load(const std::string& filename)
{
    if (SQ_SUCCEEDED(sqstd_loadfile(m_sq_vm, filename.c_str(), SQTrue)))
    {
        m_script_func = std::make_unique<SQObject>();
        if (SQ_SUCCEEDED(sq_getstackobj(m_sq_vm, -1, m_script_func.get())))
        {
            sq_addref(m_sq_vm, m_script_func.get());
            safeModuleName = getSafeName(filename);
        }
        else
        {
            m_script_func = nullptr;
        }
    }
}

SquirrelLanguageScript::SquirrelLanguageScript(SQVM* vm, const std::shared_ptr<SquirrelIR>& sq_ir) :
    m_sq_vm(vm),
    m_sq_ir(sq_ir)
{
}

SquirrelLanguageScript::~SquirrelLanguageScript()
{
    if (m_script_func)
    {
        sq_release(m_sq_vm, m_script_func.get());
        m_script_func = nullptr;
    }

    for (const auto& [name, func] : m_funcs)
    {
        sq_release(m_sq_vm, func.get());
    }

    m_funcs.clear();
}

void SquirrelLanguageScript::prepareModule(llvm::LLVMContext& context, llvm::Module* module)
{
    m_sq_vm_extern = new llvm::GlobalVariable(*module, m_sq_ir->sq_vm_ptr_t, false, llvm::GlobalValue::ExternalLinkage,
                                              nullptr,
                                              SquirrelIR::SQUIRREL_VM_GLOBAL_VAR);

    const SQInteger top = sq_gettop(m_sq_vm);

    sq_pushobject(m_sq_vm, *m_script_func);
    sq_pushroottable(m_sq_vm);

    sq_call(m_sq_vm, 1, SQFalse, SQTrue);
    sq_settop(m_sq_vm, top);
}

llvm::Function* SquirrelLanguageScript::buildFunction(
    llvm::FunctionType* signature,
    const std::string& bare_name,
    const std::shared_ptr<llvm::orc::LLJIT>& jit,
    llvm::LLVMContext& context,
    llvm::Module* module)
{
    llvm::IRBuilder<> builder(context);
    llvm::Function* func = llvm::Function::Create(signature, llvm::Function::InternalLinkage, bare_name, module);
    llvm::BasicBlock* block = llvm::BasicBlock::Create(context, "entry", func);
    builder.SetInsertPoint(block);

    llvm::Value* sq_closure = buildGlobalVarForSQClosure(bare_name, jit, context, module);

    // TODO [AZ] Do we need memcpy here?

    builder.CreateCall(m_sq_ir->sq_pushobject_apapter_f, {m_sq_vm_extern, sq_closure});
    builder.CreateCall(m_sq_ir->sq_pushroottable_f, {m_sq_vm_extern});

    // 0 arg is pointer to structure, skip it
    for (int i = 1; i < signature->getNumParams(); ++i)
    {
        llvm::Value* arg = func->getArg(i);
        const llvm::Type* arg_type = arg->getType();
        if (arg_type == m_sq_ir->int32_t)
        {
            llvm::Value* arg64 = builder.CreateSExt(arg, m_sq_ir->int64_t);
            builder.CreateCall(m_sq_ir->sq_pushinteger_f, {m_sq_vm_extern, arg64});
        }
        else if (arg_type == m_sq_ir->double_t)
        {
            llvm::Value* argFloat = builder.CreateFPTrunc(arg, m_sq_ir->float_t);
            builder.CreateCall(m_sq_ir->sq_pushfloat_f, {m_sq_vm_extern, argFloat});
        }
    }

    llvm::Constant* num_args = builder.getInt64(signature->getNumParams());
    llvm::Constant* true_val = builder.getInt64(1);
    llvm::Constant* stack_top = builder.getInt64(-1);

    builder.CreateCall(m_sq_ir->sq_call_f, {m_sq_vm_extern, num_args, true_val, true_val});

    const llvm::Type* ret_type = func->getReturnType();
    llvm::Value* ret = nullptr;

    if (ret_type == m_sq_ir->int32_t)
    {
        llvm::Value* result = builder.CreateAlloca(m_sq_ir->int64_t, 0U);
        builder.CreateCall(m_sq_ir->sq_getinteger_f, {m_sq_vm_extern, stack_top, result});
        llvm::Value* result64 = builder.CreateLoad(m_sq_ir->int64_t, result);
        ret = builder.CreateTrunc(result64, m_sq_ir->int32_t);
    }
    else if (ret_type == m_sq_ir->double_t)
    {
        llvm::Value* result = builder.CreateAlloca(m_sq_ir->float_t, 0U);
        builder.CreateCall(m_sq_ir->sq_getfloat_f, {m_sq_vm_extern, stack_top, result});
        llvm::Value* resultFloat = builder.CreateLoad(m_sq_ir->float_t, result);
        ret = builder.CreateFPExt(resultFloat, m_sq_ir->double_t);
    }

    builder.CreateRet(ret);

    return func;
}

llvm::Value* SquirrelLanguageScript::buildGlobalVarForSQClosure(
    const std::string& bare_name,
    const std::shared_ptr<llvm::orc::LLJIT>& jit,
    llvm::LLVMContext& context,
    llvm::Module* module)
{
    const SQInteger top = sq_gettop(m_sq_vm);

    sq_pushroottable(m_sq_vm);
    sq_pushstring(m_sq_vm, _SC(bare_name.c_str()), -1);

    auto sq_closure = std::make_unique<SQObject>();

    if (SQ_SUCCEEDED(sq_get(m_sq_vm, -2)))
    {
        sq_getstackobj(m_sq_vm, -1, sq_closure.get());
        sq_addref(m_sq_vm, sq_closure.get());
    }

    sq_settop(m_sq_vm, top);

    auto sq_decorated_name = std::format("{}_{}_sqobj", safeModuleName, bare_name);

    // TODO [AZ] handle errors

    auto error = jit->getMainJITDylib().define(llvm::orc::absoluteSymbols({
      {
        jit->mangleAndIntern(sq_decorated_name),
        { llvm::orc::ExecutorAddr::fromPtr(sq_closure.get()), llvm::JITSymbolFlags::Exported }
      }
    }));

    if (error)
    {
        llvm::errs() << error;
    }

    m_funcs[bare_name] = std::move(sq_closure);

    return new llvm::GlobalVariable(*module, m_sq_ir->sq_object_ptr_t, false, llvm::GlobalValue::ExternalLinkage,
                                              nullptr,
                                              sq_decorated_name);
}

} // namespace as