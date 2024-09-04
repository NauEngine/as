//
// Created by Alex Zelenshikov on 02.05.2024.
//

#ifndef LUA_IR_H
#define LUA_IR_H

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/IR/IRBuilder.h"

extern "C"
{
#include "lua_vm_ops.h"
#include "lua/lopcodes.h"
}

struct lua_State;

namespace llvm
{
    class LLVMContext;
}

namespace as
{

struct OPFunctionVariant
{
  const VmFuncInfo* info;
  llvm::Function* func = nullptr;

  explicit OPFunctionVariant(const VmFuncInfo* info) :
      info(info)
  {}
};

struct OPFunction
{
  std::unordered_map<hint_t, std::unique_ptr<OPFunctionVariant>> variants;
};

class LuaIR
{
public:
    constexpr static const char* LUA_MAIN_IR_MODULE = "__lua_main_module__";

    // IR types
    llvm::Type* int8_t = nullptr;
    llvm::Type* int16_t = nullptr;
    llvm::Type* int32_t = nullptr;
    llvm::Type* int64_t = nullptr;
    llvm::Type* void_t = nullptr;
    llvm::Type* double_t = nullptr;
    llvm::Type* float_t = nullptr;
    llvm::Type* bool_t = nullptr;
    llvm::PointerType* char_ptr_t = nullptr;
    llvm::PointerType* void_ptr_t = nullptr;

    llvm::Type* lua_State_t = nullptr;
    llvm::StructType* TValue_t = nullptr;
    llvm::StructType* Value_t = nullptr;
    llvm::StructType* ConstantString_t = nullptr;
    llvm::Type* JClosure_t = nullptr;
    llvm::StructType* FunctionTree_t = nullptr;

    llvm::Type* lua_State_ptr_t = nullptr;
    llvm::Type* TValue_ptr_t = nullptr;
    llvm::Type* JClosure_ptr_t = nullptr;
    llvm::Type* FunctionTree_ptr_t = nullptr;

    llvm::FunctionType* lua_func_t = nullptr;
    llvm::Type* lua_func_ptr_t = nullptr;

    // lapi functions
    llvm::Function* lua_rawgeti_f = nullptr;
    llvm::Function* lua_pushinteger_f = nullptr;
    llvm::Function* lua_pushnumber_f = nullptr;
    llvm::Function* lua_call_f = nullptr;
    llvm::Function* lua_call_compiled_f = nullptr;
    llvm::Function* lua_tointeger_f = nullptr;
    llvm::Function* lua_tonumber_f = nullptr;
    llvm::Function* lua_settop_f = nullptr;
    llvm::Function* lua_pushboolean_f = nullptr;
    llvm::Function* lua_pushstring_f = nullptr;
    llvm::Function* lua_toboolean_f = nullptr;
    llvm::Function* lua_tolstring_f = nullptr;

    // lauxlib functions
    llvm::Function* luaL_checkudata_f = nullptr;

    // lua vm functions
    llvm::Function* vm_get_current_closure_f = nullptr;
    llvm::Function* vm_get_current_base_f = nullptr;
    llvm::Function* vm_get_current_constants_f = nullptr;
    llvm::Function* vm_get_type_f = nullptr;
    llvm::Function* vm_get_number_f = nullptr;
    llvm::Function* vm_set_number_f = nullptr;
    llvm::Function* vm_arith_f = nullptr;

    // entry point functions
    llvm::Function* module_entry_point_f = nullptr;
    llvm::Function* push_global_closure_f = nullptr;

    std::unordered_map<int, llvm::Function*> vm_num_f;
    std::unordered_map<int, TMS> vm_arith_tms_map;

    void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context);

    llvm::Value* buildPopValue(llvm::IRBuilder<>& builder, llvm::Value* lua_state_ir, const llvm::Type* type, int stackPos) const;
    void buildPushValue(llvm::IRBuilder<>& builder, llvm::Value* lua_state_ir, const llvm::Type* type, llvm::Value* value) const;

    OPFunctionVariant* getOpcodeVariant(int opcode, hint_t hint_mask);

private:
    std::unique_ptr<llvm::Module> m_lapiModule;

    // lua vm opcode functions
    OPFunction op_functions[NUM_OPCODES];

    void prepareVMOpcodes(llvm::LLVMContext& context);
    llvm::Type* getVarType(llvm::LLVMContext& context, val_t type, hint_t hints) const;
};

} // namespace as


#endif //LUA_IR_H
