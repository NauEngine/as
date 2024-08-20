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
    bool_t = llvm::Type::getInt1Ty(context);
    char_ptr_t = llvm::Type::getInt8PtrTy(context);

    sq_vm_t = llvm::StructType::getTypeByName(context, "struct.SQVM");
    sq_vm_ptr_t = llvm::PointerType::getUnqual(sq_vm_t);
    
    sq_func_t = llvm::FunctionType::get(int64_t, {sq_vm_ptr_t}, false);
    sq_func_ptr_t = llvm::PointerType::get(sq_func_t, 0);

    sq_object_t = llvm::StructType::getTypeByName(context, "struct.tagSQObject");
    sq_object_ptr_t = llvm::PointerType::getUnqual(sq_object_t);

    sq_pushobject_f = m_api_module->getFunction("sq_pushobject");
    sq_pushroottable_f = m_api_module->getFunction("sq_pushroottable");
    sq_pushinteger_f = m_api_module->getFunction("sq_pushinteger");
    sq_pushfloat_f = m_api_module->getFunction("sq_pushfloat");
    sq_call_f = m_api_module->getFunction("sq_call");
    sq_getinteger_f = m_api_module->getFunction("sq_getinteger");
    sq_getfloat_f = m_api_module->getFunction("sq_getfloat");
    sq_pushbool_f = m_api_module->getFunction("sq_pushbool");
    sq_getbool_f = m_api_module->getFunction("sq_getbool");
    sq_pushstring_f = m_api_module->getFunction("sq_pushstring");
    sq_getstring_f = m_api_module->getFunction("sq_getstring");
    sq_getinstanceup_f = m_api_module->getFunction("sq_getinstanceup");
    sq_gettop_f = m_api_module->getFunction("sq_gettop");
    sq_get_f = m_api_module->getFunction("sq_get");
    sq_pop_f = m_api_module->getFunction("sq_pop");
    sq_gettype_f = m_api_module->getFunction("sq_gettype");
    sq_newtable_f = m_api_module->getFunction("sq_newtable");
    sq_pushnull_f = m_api_module->getFunction("sq_pushnull");
    sq_next_f = m_api_module->getFunction("sq_next");
    sq_getsize_f = m_api_module->getFunction("sq_getsize");
    sq_getdelegate_f = m_api_module->getFunction("sq_getdelegate");
    sq_getuserpointer_f = m_api_module->getFunction("sq_getuserpointer");
    sq_throwerror_f = m_api_module->getFunction("sq_throwerror");

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

llvm::Value* SquirrelIR::buildPopValue(llvm::IRBuilder<>& builder, llvm::Value* sq_vm_var, const llvm::Type* type, int stackPos) const
{
  llvm::Value* ret = nullptr;

  llvm::Value* stackPos_ir = builder.getInt64(stackPos);

  // Добавляем вызов функции вывода в пустышку
  llvm::FunctionType* printfType = llvm::FunctionType::get(builder.getInt32Ty(), builder.getInt8PtrTy(), true);
  llvm::Module* module = builder.GetInsertBlock()->getParent()->getParent();
  llvm::FunctionCallee printfFunc = module->getOrInsertFunction("printf", printfType);

  if (type == int32_t)
  {
    llvm::Value* result = builder.CreateAlloca(int64_t);
    builder.CreateCall(sq_getinteger_f, {sq_vm_var, stackPos_ir, result});
    llvm::Value* result64 = builder.CreateLoad(int64_t, result);
    ret = builder.CreateTrunc(result64, int32_t);
  }
  else if (type == int64_t)
  {
    llvm::Value* result = builder.CreateAlloca(int64_t, 0U);
    builder.CreateCall(sq_getinteger_f, {sq_vm_var, stackPos_ir, result});
    ret = builder.CreateLoad(int64_t, result);
  }
  else if (type == float_t)
  {
    llvm::Value* result = builder.CreateAlloca(float_t, 0U);
    builder.CreateCall(sq_getfloat_f, {sq_vm_var, stackPos_ir, result});
    ret = builder.CreateLoad(float_t, result);
  }
  else if (type == double_t)
  {
    llvm::Value* result = builder.CreateAlloca(float_t, 0U);
    builder.CreateCall(sq_getfloat_f, {sq_vm_var, stackPos_ir, result});
    llvm::Value* resultFloat = builder.CreateLoad(float_t, result);
    ret = builder.CreateFPExt(resultFloat, double_t);
  }
  else if (type == bool_t)
  {
    llvm::Value* result = builder.CreateAlloca(bool_t, 0U);
    builder.CreateCall(sq_getbool_f, {sq_vm_var, stackPos_ir, result});
    ret = builder.CreateLoad(bool_t, result);
  }
  else if (type == char_ptr_t)
  {
    llvm::Value* result = builder.CreateAlloca(char_ptr_t, 0U);
    builder.CreateCall(sq_getstring_f, {sq_vm_var, stackPos_ir, result});
    ret = builder.CreateLoad(char_ptr_t, result);
  }
  else if (type == void_t)
  {

  }
  else
  {
    llvm::errs() << "SquirrelLanguageScript::buildFunction: Unsupported return type: ";
    type->print(llvm::errs());
    llvm::errs() << "\n";
  }

  return ret;
}

void SquirrelIR::buildPushValue(llvm::IRBuilder<>& builder, llvm::Value* sq_vm_var, const llvm::Type* type, llvm::Value* value) const
{
  if (type == int32_t)
  {
    llvm::Value* arg64 = builder.CreateSExt(value, int64_t);
    builder.CreateCall(sq_pushinteger_f, {sq_vm_var, arg64});
  }
  else if (type == int64_t)
  {
    builder.CreateCall(sq_pushinteger_f, {sq_vm_var, value});
  }
  else if (type == float_t)
  {
    builder.CreateCall(sq_pushfloat_f, {sq_vm_var, value});
  }
  else if (type == double_t)
  {
    llvm::Value* argFloat = builder.CreateFPTrunc(value, float_t);
    builder.CreateCall(sq_pushfloat_f, {sq_vm_var, argFloat});
  }
  else if (type == bool_t)
  {
    builder.CreateCall(sq_pushbool_f, {sq_vm_var, value});
  } 
  else if (type == char_ptr_t)
  {
    llvm::Value* length = llvm::ConstantInt::get(llvm::Type::getIntNTy(builder.getContext(), sizeof(SQInteger) * 8), -1);
    builder.CreateCall(sq_pushstring_f, {sq_vm_var, value, length});
  }
  else if (type == void_t)
  {
      
  }
  else
  {
    llvm::errs() << "SquirrelLanguageScript::buildFunction: Unsupported argument type: ";
    type->print(llvm::errs());
    llvm::errs() << "\n";
  }
}

} // namespace as