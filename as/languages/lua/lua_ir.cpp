//
// Created by Alex Zelenshikov on 02.05.2024.
//

#include "llvm/IR/IRBuilder.h"

#include "as/core/core_utils.h"

#include "bc/lapi_bc.h"
#include "bc/lauxlib_bc.h"
#include "bc/lua_vm_ops_bc.h"

#include "lua_ir.h"

extern "C"
{
#include "lua/lua.h"
}

namespace as
{

void LuaIR::init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context, lua_State* lua_state)
{
    llvm::LLVMContext& context = *ts_context.getContext();
    // init lapi bc
    m_lapiModule = utils::loadEmbeddedBitcode(context, "lapi_bc", lapi_bc, sizeof(lapi_bc));
    m_lauxlibModule = utils::loadEmbeddedBitcode(context, "lauxlib_bc", lauxlib_bc, sizeof(lauxlib_bc));
    m_luaVMModule = utils::loadEmbeddedBitcode(context, "lua_vm_ops_bc", lua_vm_ops_bc, sizeof(lua_vm_ops_bc));

    // parse types & functions
    int8_t = llvm::Type::getInt8Ty(context);
    int16_t = llvm::Type::getInt16Ty(context);
    int32_t = llvm::Type::getInt32Ty(context);
    int64_t = llvm::Type::getInt64Ty(context);
    void_t = llvm::Type::getVoidTy(context);
    double_t = llvm::Type::getDoubleTy(context);

    lua_State_t = llvm::StructType::getTypeByName(context, "struct.lua_State");
    TValue_t = llvm::StructType::getTypeByName(context, "struct.lua_TValue");
    if (TValue_t == nullptr)
    {
        TValue_t = llvm::StructType::getTypeByName(context, "struct.TValue");
    }
    LClosure_t = llvm::StructType::getTypeByName(context, "struct.LClosure");

    lua_State_ptr_t = llvm::PointerType::getUnqual(lua_State_t);
    TValue_ptr_t = llvm::PointerType::getUnqual(TValue_t);
    LClosure_ptr_t = llvm::PointerType::getUnqual(LClosure_t);

    lua_func_t = llvm::FunctionType::get(int32_t, {lua_State_ptr_t}, false);
    lua_func_ptr_t = llvm::PointerType::get(lua_func_t, 0);

    // lapi functions
    lua_rawgeti_f = m_lapiModule->getFunction("lua_rawgeti");
    lua_pushinteger_f = m_lapiModule->getFunction("lua_pushinteger");
    lua_pushnumber_f = m_lapiModule->getFunction("lua_pushnumber");
    lua_call_f = m_lapiModule->getFunction("lua_call");
    lua_call_compiled_f = m_lapiModule->getFunction("lua_call_compiled");
    lua_tointeger_f = m_lapiModule->getFunction("lua_tointeger");
    lua_tonumber_f = m_lapiModule->getFunction("lua_tonumber");
    lua_settop_f = m_lapiModule->getFunction("lua_settop");

    // lauxlib functions
    luaL_checkudata_f = m_lauxlibModule->getFunction("luaL_checkudata");

    // lua vm functions
    vm_mini_vm_f = m_luaVMModule->getFunction("vm_mini_vm");
    vm_get_current_closure_f = m_luaVMModule->getFunction("vm_get_current_closure");
    vm_get_current_constants_f = m_luaVMModule->getFunction("vm_get_current_constants");
    vm_get_number_f = m_luaVMModule->getFunction("vm_get_number");
    vm_get_long_f = m_luaVMModule->getFunction("vm_get_long");
    vm_set_number_f = m_luaVMModule->getFunction("vm_set_number");
    vm_set_long_f = m_luaVMModule->getFunction("vm_set_long");

    prepareVMOpcodes(context);

    // bound lua_State to global var
    // TODO [AZ] handle errors

    auto error = jit->getMainJITDylib().define(llvm::orc::absoluteSymbols({
      {
        jit->mangleAndIntern(LUA_STATE_GLOBAL_VAR),
        { llvm::orc::ExecutorAddr::fromPtr(lua_state), llvm::JITSymbolFlags::Exported }
      }
    }));

    if (error)
    {
        llvm::errs() << error;
    }
}

void LuaIR::prepareVMOpcodes(llvm::LLVMContext& context)
{
    for (int i = 0; true; ++i)
    {
        const vm_func_info* func_info = &vm_op_functions[i];
        const auto opcode = func_info->opcode;
        if (opcode < 0)
        {
            break;
        }

        auto op_function = std::make_unique<OPFunctionVariant>(func_info);

        op_function->func = m_luaVMModule->getFunction(func_info->name);

        if (!op_function->func)
        {
            std::vector<llvm::Type*> func_args;

            for (int x = 0; func_info->params[x] != VAR_T_VOID; ++x)
            {
                func_args.push_back(getVarType(context, func_info->params[x], func_info->hint));
            }

            const auto func_type = llvm::FunctionType::get(
                getVarType(context, func_info->ret_type, func_info->hint), func_args, false);
            op_function->func = llvm::Function::Create(func_type, llvm::Function::ExternalLinkage,
                                          func_info->name, m_luaVMModule.get());
        }

        op_functions[opcode].variants[func_info->hint] = std::move(op_function);
    }
}

llvm::Type* LuaIR::getVarType(llvm::LLVMContext& context, val_t type, hint_t hints) const
{
    switch(type) {
        case VAR_T_VOID:
            return void_t;
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
          return int32_t;
        case VAR_T_LUA_STATE_PTR:
            return lua_State_ptr_t;
        case VAR_T_K:
            return TValue_ptr_t;
        case VAR_T_CL:
            return LClosure_ptr_t;
        case VAR_T_OP_VALUE_0:
        case VAR_T_OP_VALUE_1:
        case VAR_T_OP_VALUE_2:
          if(hints & HINT_USE_LONG) {
              return int64_t;
          }
        return double_t;
        default:
            fprintf(stderr, "Error: missing var_type=%d\n", type);
        exit(1);
    }
}

OPFunctionVariant* LuaIR::getOpcodeVariant(int opcode, hint_t hint_mask)
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

llvm::Value* LuaIR::buildPopValue(llvm::IRBuilder<>& builder, llvm::Value* lua_state_ir, const llvm::Type* type, int stackPos) const
{
    llvm::Value* ret = nullptr;

    llvm::Value* stackPos_ir = builder.getInt32(stackPos);

    if (type == int32_t)
    {
        llvm::Value* result = builder.CreateCall(lua_tointeger_f, {lua_state_ir, stackPos_ir});
        ret = builder.CreateTrunc(result, int32_t);
    }
    else if (type == double_t)
    {
        ret = builder.CreateCall(lua_tonumber_f, {lua_state_ir, stackPos_ir});
    }

    return ret;
}

void LuaIR::buildPushValue(llvm::IRBuilder<>& builder, llvm::Value* lua_state_ir, const llvm::Type* type, llvm::Value* value) const
{
    if (type == int32_t)
    {
        llvm::Value* arg64 = builder.CreateSExt(value, int64_t);
        builder.CreateCall(lua_pushinteger_f, {lua_state_ir, arg64});
    }
    else if (type == double_t)
    {
        builder.CreateCall(lua_pushnumber_f, {lua_state_ir, value});
    }
}

} // namespace as
