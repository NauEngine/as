//
// Created by Alex Zelenshikov on 09.05.2024.
//

#include "llvm/IR/IRBuilder.h"

#include "sq_language_script.h"

#include "squirrel/include/squirrel.h"
#include "squirrel/include/sqstdio.h"

#include "sq_ir.h"
#include "as/core/ir.h"

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
void SquirrelLanguageScript::load(const std::string& filename, llvm::LLVMContext& context)
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

std::shared_ptr<ScriptInterface> SquirrelLanguageScript::getInterface(const std::string& filename, CPPParser& cpp_paser)
{
    auto interface_filename = ir::getImplements(filename, "#");
    if (interface_filename.empty())
    {
        llvm::errs() << "Cannot find implementation for script " << filename << "\n";
        return nullptr;
    }

    return ir::getInterface(filename, interface_filename, cpp_paser);
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

std::unique_ptr<llvm::Module> SquirrelLanguageScript::createModule(
        llvm::LLVMContext& context)
{
    auto module = std::make_unique<llvm::Module>("sq_module", context);

    m_sq_vm_extern = new llvm::GlobalVariable(*module, m_sq_ir->sq_vm_ptr_t, false, llvm::GlobalValue::ExternalLinkage,
                                              nullptr,
                                              SquirrelIR::SQUIRREL_VM_GLOBAL_VAR);

    const SQInteger top = sq_gettop(m_sq_vm);

    sq_pushobject(m_sq_vm, *m_script_func);
    sq_pushroottable(m_sq_vm);

    sq_call(m_sq_vm, 1, SQFalse, SQTrue);
    sq_settop(m_sq_vm, top);

    return module;
}

llvm::Function* SquirrelLanguageScript::buildModule(const std::string& init_name,
    const std::string& module_name,
    const ScriptInterface& interface,
    const std::unordered_map<std::string, std::shared_ptr<ScriptInterface>>& externalRequires,
    llvm::Module& module)
{
    const auto vtable = ir::buildVTable(module_name, interface, module, &SquirrelLanguageScript::buildFunction, this);
    return ir::createInitFunc(module, init_name, module_name, vtable, nullptr, "");
}

llvm::Function* SquirrelLanguageScript::buildFunction(
        const std::string& bare_name,
        llvm::FunctionType* signature,
        llvm::Module& module,
        llvm::LLVMContext& context)
{
    llvm::IRBuilder<> builder(context);
    llvm::Function* func = llvm::Function::Create(signature, llvm::Function::InternalLinkage, bare_name, module);
    llvm::BasicBlock* block = llvm::BasicBlock::Create(context, "entry", func);
    builder.SetInsertPoint(block);

    llvm::Value* sq_closure = buildGlobalVarForSQClosure(bare_name, context, module);

    // TODO [AZ] Do we need memcpy here?

    builder.CreateCall(m_sq_ir->sq_pushobject_apapter_f, {m_sq_vm_extern, sq_closure});
    builder.CreateCall(m_sq_ir->sq_pushroottable_f, {m_sq_vm_extern});

    // 0 arg is pointer to structure, skip it
    for (int i = 1; i < signature->getNumParams(); ++i)
    {
        llvm::Value* arg = func->getArg(i);
        m_sq_ir->buildPushValue(builder, m_sq_vm_extern, arg->getType(), arg);
    }

    llvm::Constant* num_args = builder.getInt64(signature->getNumParams());
    llvm::Constant* true_val = builder.getInt64(1);
    llvm::Constant* stack_top = builder.getInt64(-1);

    builder.CreateCall(m_sq_ir->sq_call_f, {m_sq_vm_extern, num_args, true_val, true_val});

    const llvm::Type* ret_type = func->getReturnType();
    llvm::Value* ret = m_sq_ir->buildPopValue(builder, m_sq_vm_extern, ret_type, -1);

    builder.CreateRet(ret);

    return func;
}

void SquirrelLanguageScript::materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit,
    llvm::orc::JITDylib& lib,
    llvm::Module& module,
    llvm::LLVMContext& context)
{
    for (const auto& [name, func] : m_funcs)
    {
        auto error = lib.define(llvm::orc::absoluteSymbols({
          {
            jit->mangleAndIntern(name),
            { llvm::orc::ExecutorAddr::fromPtr(func.get()), llvm::JITSymbolFlags::Exported }
          }
        }));

        if (error)
        {
            llvm::errs() << error;
        }
    }
}

llvm::Value* SquirrelLanguageScript::buildGlobalVarForSQClosure(
    const std::string& bare_name,
    llvm::LLVMContext& context,
    llvm::Module& module)
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
    m_funcs.emplace_back(sq_decorated_name, std::move(sq_closure));

    return new llvm::GlobalVariable(module, m_sq_ir->sq_object_ptr_t, false, llvm::GlobalValue::ExternalLinkage,
                                              nullptr,
                                              sq_decorated_name);
}

} // namespace as