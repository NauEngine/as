//
// Created by Alex Zelenshikov on 09.05.2024.
//

#include "llvm/IR/IRBuilder.h"

#include "as/core/core_utils.h"
#include "bc/sqapi_bc.h"

#include "sq_ir.h"
#include "squirrel/include/squirrel.h"


extern "C"
{
void sq_pushobject_apapter(HSQUIRRELVM sq_vm, HSQOBJECT* func)
{
    sq_pushobject(sq_vm, *func);
}
}

namespace as
{

void SquirrelIR::init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context, SQVM* sq_vm)
{
    llvm::LLVMContext& context = *ts_context.getContext();
    // init lapi bc
    m_api_module = utils::loadEmbeddedBitcode(context, "sqapi_bc", sqapi_bc, sizeof(sqapi_bc));

    int32_t = llvm::Type::getInt32Ty(context);
    int64_t = llvm::Type::getInt64Ty(context);
    float_t = llvm::Type::getFloatTy(context);
    double_t = llvm::Type::getDoubleTy(context);
    void_t  = llvm::Type::getVoidTy(context);

    sq_vm_t = llvm::StructType::getTypeByName(context, "struct.SQVM");
    sq_vm_ptr_t = llvm::PointerType::getUnqual(sq_vm_t);

    sq_object_t = llvm::StructType::getTypeByName(context, "struct.tagSQObject");
    sq_object_ptr_t = llvm::PointerType::getUnqual(sq_object_t);

    sq_pushobject_f = m_api_module->getFunction("sq_pushobject");
    sq_pushroottable_f = m_api_module->getFunction("sq_pushroottable");
    sq_pushinteger_f = m_api_module->getFunction("sq_pushinteger");
    sq_pushfloat_f = m_api_module->getFunction("sq_pushfloat");
    sq_call_f = m_api_module->getFunction("sq_call");
    sq_getinteger_f = m_api_module->getFunction("sq_getinteger");
    sq_getfloat_f = m_api_module->getFunction("sq_getfloat");

    llvm::IRBuilder<> builder(context);
    llvm::FunctionType* sq_pushobject_apapter_t = llvm::FunctionType::get(void_t, {sq_vm_ptr_t, sq_object_ptr_t}, false);
    sq_pushobject_apapter_f = llvm::Function::Create(sq_pushobject_apapter_t, llvm::Function::ExternalLinkage, "sq_pushobject_apapter", m_api_module.get());

    // TODO [AZ] handle errors

    auto error = jit->getMainJITDylib().define(llvm::orc::absoluteSymbols({
      {
        jit->mangleAndIntern(SQUIRREL_VM_GLOBAL_VAR),
        { llvm::orc::ExecutorAddr::fromPtr(sq_vm), llvm::JITSymbolFlags::Exported }
      }
    }));

    if (error)
    {
        llvm::errs() << error;
    }
}

} // namespace as