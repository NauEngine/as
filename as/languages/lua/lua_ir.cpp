//
// Created by Alex Zelenshikov on 02.05.2024.
//

#include "llvm/IR/IRBuilder.h"
#include "llvm/Linker/Linker.h"

#include "as/core/core_utils.h"
#include "as/core/ir.h"

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
    auto lauxlibModule = utils::loadEmbeddedBitcode(context, "lauxlib_bc", lauxlib_bc, sizeof(lauxlib_bc));
    auto luaVMModule = utils::loadEmbeddedBitcode(context, "lua_vm_ops_bc", lua_vm_ops_bc, sizeof(lua_vm_ops_bc));

    llvm::Linker linker(*m_lapiModule);
    linker.linkInModule(std::move(lauxlibModule));
    linker.linkInModule(std::move(luaVMModule));

    // parse types & functions
    int8_t = llvm::Type::getInt8Ty(context);
    int16_t = llvm::Type::getInt16Ty(context);
    int32_t = llvm::Type::getInt32Ty(context);
    int64_t = llvm::Type::getInt64Ty(context);
    void_t = llvm::Type::getVoidTy(context);
    double_t = llvm::Type::getDoubleTy(context);
    float_t = llvm::Type::getFloatTy(context);
    bool_t = llvm::Type::getInt1Ty(context);
    char_ptr_t = llvm::Type::getInt8PtrTy(context);

    lua_State_t = llvm::StructType::getTypeByName(context, "struct.lua_State");
    TValue_t = llvm::StructType::getTypeByName(context, "struct.lua_TValue");
    if (TValue_t == nullptr)
    {
        TValue_t = llvm::StructType::getTypeByName(context, "struct.TValue");
    }
    LClosure_t = llvm::StructType::getTypeByName(context, "struct.LClosure");
    FunctionTree_t = llvm::StructType::getTypeByName(context, "struct.FunctionTree");

    lua_State_ptr_t = llvm::PointerType::getUnqual(lua_State_t);
    TValue_ptr_t = llvm::PointerType::getUnqual(TValue_t);
    LClosure_ptr_t = llvm::PointerType::getUnqual(LClosure_t);
//    FunctionTree_ptr_t = llvm::PointerType::getUnqual(FunctionTree_t);

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
    lua_pushboolean_f = m_lapiModule->getFunction("lua_pushboolean");
    lua_pushstring_f = m_lapiModule->getFunction("lua_pushstring");
    lua_toboolean_f = m_lapiModule->getFunction("lua_toboolean");
    lua_tolstring_f = m_lapiModule->getFunction("lua_tolstring");


    // lauxlib functions
    luaL_checkudata_f = m_lapiModule->getFunction("luaL_checkudata");

    // lua vm functions
    vm_mini_vm_f = ir::сreateFunctionDecl(m_lapiModule.get(), void_t,
        {lua_State_ptr_t, LClosure_ptr_t, int32_t, int32_t}, "vm_mini_vm");
    vm_get_current_closure_f = m_lapiModule->getFunction("vm_get_current_closure");
    vm_get_current_base_f = m_lapiModule->getFunction("vm_get_current_base");
    vm_get_current_constants_f = m_lapiModule->getFunction("vm_get_current_constants");
    vm_get_type_f = m_lapiModule->getFunction("vm_get_type");
    vm_get_number_f = m_lapiModule->getFunction("vm_get_number");
    vm_set_number_f = m_lapiModule->getFunction("vm_set_number");
    vm_arith_f = m_lapiModule->getFunction("vm_arith");

    vm_num_f[OP_ADD] = m_lapiModule->getFunction("vm_NUM_ADD");
    vm_num_f[OP_SUB] = m_lapiModule->getFunction("vm_NUM_SUB");
    vm_num_f[OP_MUL] = m_lapiModule->getFunction("vm_NUM_MUL");
    vm_num_f[OP_DIV] = m_lapiModule->getFunction("vm_NUM_DIV");
    vm_num_f[OP_MOD] = m_lapiModule->getFunction("vm_NUM_MOD");
    vm_num_f[OP_POW] = m_lapiModule->getFunction("vm_NUM_POW");

    vm_arith_tms_map[OP_ADD] = TM_ADD;
    vm_arith_tms_map[OP_SUB] = TM_SUB;
    vm_arith_tms_map[OP_MUL] = TM_MUL;
    vm_arith_tms_map[OP_DIV] = TM_DIV;
    vm_arith_tms_map[OP_MOD] = TM_MOD;
    vm_arith_tms_map[OP_POW] = TM_POW;

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
        const VmFuncInfo* func_info = &vm_op_functions[i];
        const auto opcode = func_info->opcode;
        if (opcode < 0)
        {
            break;
        }

        auto op_function = std::make_unique<OPFunctionVariant>(func_info);

        op_function->func = m_lapiModule->getFunction(func_info->name);

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
                                          func_info->name, m_lapiModule.get());
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
        case VAR_T_BASE:
        case VAR_T_K:
            return TValue_ptr_t;
        case VAR_T_CL:
            return LClosure_ptr_t;
        case VAR_T_OP_VALUE_0:
        case VAR_T_OP_VALUE_1:
        case VAR_T_OP_VALUE_2:
            return double_t;
        case VAR_T_FUNCITON_TREE:
            return TValue_ptr_t;
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
    else if (type == int64_t)
    {
        ret = builder.CreateCall(lua_tointeger_f, {lua_state_ir, stackPos_ir});
    }
    else if (type == float_t)
    {
        llvm::Value* result = builder.CreateCall(lua_tonumber_f, {lua_state_ir, stackPos_ir});
        ret = builder.CreateFPTrunc(result, float_t);
    }
    else if (type == double_t)
    {
        ret = builder.CreateCall(lua_tonumber_f, {lua_state_ir, stackPos_ir});
    }
    else if (type == bool_t)
    {
        llvm::Value* result = builder.CreateCall(lua_toboolean_f, {lua_state_ir, stackPos_ir});
        ret = builder.CreateTrunc(result, bool_t);
    }
    else if (type == char_ptr_t)
    {
        llvm::LLVMContext &context = builder.getContext();
        llvm::Value* nullPtr_ir = llvm::Constant::getNullValue(llvm::PointerType::getUnqual(llvm::Type::getInt8Ty(context)));
        ret = builder.CreateCall(lua_tolstring_f, {lua_state_ir, stackPos_ir, nullPtr_ir});
    }
    else if (type == void_t)
    {
        
    }
    else
    {
        llvm::errs() << "LuaIR::buildPopValue: Unsupported type\n";
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
    else if (type == int64_t)
    {
        builder.CreateCall(lua_pushinteger_f, {lua_state_ir, value});
    }
    else if (type == float_t)
    {
        llvm::Value* extendedValue = builder.CreateFPExt(value, double_t);
        builder.CreateCall(lua_pushnumber_f, {lua_state_ir, extendedValue});
    }
    else if (type == double_t)
    {
        builder.CreateCall(lua_pushnumber_f, {lua_state_ir, value});
    }
    else if (type == bool_t)
    {
        builder.CreateCall(lua_pushboolean_f, {lua_state_ir, value});
    }
    else if (type == char_ptr_t)
    {
        builder.CreateCall(lua_pushstring_f, {lua_state_ir, value});
    }
    else if (type == void_t)
    {
        
    }
    else
    {
        llvm::errs() << "LuaIR::buildPushValue: Unsupported type\n";
    }
}

} // namespace as
