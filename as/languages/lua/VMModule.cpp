//
// Created by Alex Zelenshikov on 27.02.2024.
//

#include <llvm/ExecutionEngine/Orc/ThreadSafeModule.h>
#include <assert.h>

#include "VMModule.h"
#include "Utils.h"
#include "lua_vm_ops_bc.h"

namespace as
{

VMModule::VMModule()
{

}

llvm::orc::ThreadSafeModule VMModule::Load(llvm::orc::ThreadSafeContext ts_context)
{
  llvm::LLVMContext& context = *ts_context.getContext();
  auto module = LoadEmbeddedBitcode(context, "lua_vm_ops_bc", lua_vm_ops_bc, sizeof(lua_vm_ops_bc));

  CollectVMTypes(context, module->getDataLayout());

  return {std::move(module), ts_context};
}

std::unique_ptr<VMModuleForwardDecl>  VMModule::PrepareForwardDeclarations(llvm::Module* module)
{
  auto decls = std::make_unique<VMModuleForwardDecl>();

  decls->PrepareVMFunctions(*this, module);
  decls->PrepareVMOpcodes(*this, module->getContext(), module);

  return std::move(decls);
}

void VMModule::CollectVMTypes(llvm::LLVMContext& context, const llvm::DataLayout& data_layout)
{
  t_int8 = llvm::Type::getInt8Ty(context);
  t_int16 = llvm::Type::getInt16Ty(context);
  t_int32 = llvm::Type::getInt32Ty(context);
  t_int64 = llvm::Type::getInt64Ty(context);
  t_void = llvm::Type::getVoidTy(context);
  t_double = llvm::Type::getDoubleTy(context);

  t_int32_ptr = llvm::PointerType::get(t_int32, 0);

  t_TValue = llvm::StructType::getTypeByName(context, "struct.lua_TValue");
  if (t_TValue == nullptr)
  {
    t_TValue = llvm::StructType::getTypeByName(context, "struct.TValue");
  }
  t_LClosure = llvm::StructType::getTypeByName(context, "struct.LClosure");
  t_lua_State = llvm::StructType::getTypeByName(context, "struct.lua_State");

  t_TValue_ptr = llvm::PointerType::getUnqual(t_TValue);
  t_LClosure_ptr = llvm::PointerType::getUnqual(t_LClosure);
  t_lua_State_ptr = llvm::PointerType::getUnqual(t_lua_State);

  t_lua_func = llvm::FunctionType::get(t_int32, {t_lua_State_ptr}, false);
  t_lua_func_ptr = llvm::PointerType::get(t_lua_func, 0);

  t_str_ptr = llvm::PointerType::get(llvm::IntegerType::get(context, 8), 0);

  unsigned num_size = data_layout.getTypeStoreSize(llvm::Type::getDoubleTy(context));
  unsigned ptr_size = data_layout.getPointerSize();
  unsigned max_padding_size = std::max(num_size, ptr_size);

  // union.constant_value
  // TODO: handle LUA_NUMBER types other then 'double'.
  t_constant_value = llvm::StructType::create(context, {t_double}, "union.constant_value", false);

  // struct.constant_type
  t_constant_type = llvm::StructType::create(context, {t_int32, t_int32, t_constant_value}, "struct.constant_type",
                                             false);
  t_constant_type_ptr = llvm::PointerType::get(t_constant_type, 0);

  // struct.constant_num_type
  t_constant_num = std::make_unique<ConstStruct>();
  auto num_value_type = llvm::StructType::get(context, {t_double}, false);
  t_constant_num->type = llvm::StructType::create(context, {t_int32, t_int32, num_value_type},
                                                  "struct.constant_num_type", false);
  t_constant_num->padding = nullptr;

  t_constant_bool = CreateConstStruct(context, max_padding_size - 4, "struct.constant_bool_type", t_int32);
  t_constant_str = CreateConstStruct(context, max_padding_size - ptr_size, "struct.constant_str_type", t_str_ptr);

  // create jit_LocVar structure type.
  // {varname, startpc, endpc}
  t_jit_LocVar = llvm::StructType::create(context, {t_str_ptr, t_int32, t_int32}, "struct.jit_LocVar", false);
  t_jit_LocVar_ptr = llvm::PointerType::get(t_jit_LocVar, 0);

  t_jit_proto = llvm::StructType::create(context, "struct.jit_proto");
  //t_jit_proto_ptr = llvm::PointerType::get(t_jit_proto, 0);

  llvm::Type* fields[] =
  {
      t_str_ptr, // name
      t_lua_func_ptr, // jit_func
      t_int32, // linedefined
      t_int32, // lastlinedefined
      t_int8, // nups
      t_int8, // numparams
      t_int8, // is_vararg
      t_int8, // maxstacksize
      t_int16, // sizek
      t_int16, // sizelocvars
      t_int32, // sizeupvalues
      t_int32, // sizep
      t_int32, // sizecode
      t_int32, // sizelineinfo
      t_constant_type_ptr, // k
      t_jit_LocVar_ptr, // locvars
      t_str_ptr, // upvalues
      llvm::PointerType::get(t_jit_proto, 0), // p
      t_int32_ptr, // code
      t_int32_ptr // lineinfo
  };

  t_jit_proto->setBody(fields, false);
  t_jit_proto_ptr = llvm::PointerType::get(t_jit_proto, 0);
}

std::unique_ptr<VMModule::ConstStruct> VMModule::CreateConstStruct(llvm::LLVMContext& context, unsigned pad_size, const char* name, llvm::Type* type)
{
  auto const_struct = std::make_unique<ConstStruct>();

  llvm::Type* value_type = nullptr;
  if (pad_size > 0)
  {
    auto pad_type = llvm::ArrayType::get(llvm::IntegerType::get(context, 8), pad_size);
    value_type = llvm::StructType::get(context, {t_int32, pad_type}, false);
    const_struct->padding = llvm::Constant::getNullValue(pad_type);
  }
  else
  {
    value_type = llvm::StructType::get(context, {t_int32}, false);
    const_struct->padding = nullptr;
  }

  const_struct->type = llvm::StructType::create(context, {t_int32, t_int32, value_type}, name, false);

  return std::move(const_struct);
}


void VMModuleForwardDecl::PrepareVMFunctions(VMModule& vm, llvm::Module* module)
{
  CreateFunctionDecl(module, vm.t_void, {vm.t_lua_State_ptr, vm.t_LClosure_ptr, vm.t_int32}, "vm_next_OP");
  CreateFunctionDecl(module, vm.t_void, {vm.t_lua_State_ptr, vm.t_LClosure_ptr, vm.t_int32, vm.t_int32}, "vm_print_OP");
  CreateFunctionDecl(module, vm.t_void, {vm.t_int32}, "vm_count_OP");
  CreateFunctionDecl(module, vm.t_void, {vm.t_lua_State_ptr, vm.t_LClosure_ptr, vm.t_int32, vm.t_int32}, "vm_mini_vm");

  CreateFunctionDecl(module, vm.t_LClosure_ptr, {vm.t_lua_State_ptr}, "vm_get_current_closure");
  CreateFunctionDecl(module, vm.t_TValue_ptr, {vm.t_LClosure_ptr}, "vm_get_current_constants");
  CreateFunctionDecl(module, vm.t_double, {vm.t_lua_State_ptr, vm.t_int32 }, "vm_get_number");
  CreateFunctionDecl(module, vm.t_int64, {vm.t_lua_State_ptr, vm.t_int32 }, "vm_get_long");
  CreateFunctionDecl(module, vm.t_void, {vm.t_lua_State_ptr, vm.t_int32, vm.t_double}, "vm_set_number");
  CreateFunctionDecl(module, vm.t_void, {vm.t_lua_State_ptr, vm.t_int32, vm.t_int64}, "vm_set_long");
}

void VMModuleForwardDecl::CreateFunctionDecl(llvm::Module* module, llvm::Type *result, llvm::ArrayRef<llvm::Type*> params, const char* name)
{
  auto func_type = llvm::FunctionType::get(result, params, false);
  functions[name] = llvm::Function::Create(func_type,
                                      llvm::Function::ExternalLinkage, name, module);
}

void VMModuleForwardDecl::PrepareVMOpcodes(VMModule& vm, llvm::LLVMContext& context, llvm::Module* module)
{
  for (int i = 0; true; ++i)
  {
    const vm_func_info* func_info = &vm_op_functions[i];
    auto opcode = func_info->opcode;
    if (opcode < 0) {
      break;
    }

    auto op_function = std::make_unique<OPFunctionVariant>(func_info);

    std::vector<llvm::Type*> func_args;

    for(int x = 0; func_info->params[x] != VAR_T_VOID; x++) {
      func_args.push_back(GetVarType(vm, context, func_info->params[x], func_info->hint));
    }

    auto func_type = llvm::FunctionType::get(
        GetVarType(vm, context, func_info->ret_type, func_info->hint), func_args, false);
    llvm::Function* func = llvm::Function::Create(func_type, llvm::Function::ExternalLinkage,
                                  func_info->name, module);
    op_function->func = func;

    op_functions[opcode].variants[func_info->hint] = std::move(op_function);
  }
}

llvm::Type* VMModuleForwardDecl::GetVarType(VMModule& vm, llvm::LLVMContext& context, val_t type, hint_t hints)
{
  switch(type) {
    case VAR_T_VOID:
      return vm.t_void;
    case VAR_T_INT:
    case VAR_T_ARG_A:
    case VAR_T_ARG_B:
    case VAR_T_ARG_BK:
    case VAR_T_ARG_Bx:
    case VAR_T_ARG_Bx_NUM_CONSTANT:
    case VAR_T_ARG_B_FB2INT:
    case VAR_T_ARG_sBx:
    case VAR_T_ARG_C:
    case VAR_T_ARG_CK:
    case VAR_T_ARG_C_NUM_CONSTANT:
    case VAR_T_ARG_C_NEXT_INSTRUCTION:
    case VAR_T_ARG_C_FB2INT:
    case VAR_T_PC_OFFSET:
    case VAR_T_INSTRUCTION:
    case VAR_T_NEXT_INSTRUCTION:
      return vm.t_int32;
    case VAR_T_LUA_STATE_PTR:
      return vm.t_lua_State_ptr;
    case VAR_T_K:
      return vm.t_TValue_ptr;
    case VAR_T_CL:
      return vm.t_LClosure_ptr;
    case VAR_T_OP_VALUE_0:
    case VAR_T_OP_VALUE_1:
    case VAR_T_OP_VALUE_2:
      if(hints & HINT_USE_LONG) {
        return vm.t_int64;
      }
      return llvm::Type::getDoubleTy(context);
    default:
      fprintf(stderr, "Error: missing var_type=%d\n", type);
      exit(1);
  }
}

OPFunctionVariant* VMModuleForwardDecl::op_func(int opcode, hint_t hint_mask)
{
  for (auto& [hint, variant] : op_functions[opcode].variants)
  {
    if ((hint & hint_mask) == hint)
    {
      return variant.get();
    }
  }

  assert(false);

  return nullptr;
}

} // namespace as

