//
// Created by Alex Zelenshikov on 09.05.2024.
//

#ifndef SQ_IR_H
#define SQ_IR_H

#include "llvm/ExecutionEngine/Orc/LLJIT.h"

struct SQVM;

namespace llvm
{
class LLVMContext;
}

namespace as
{

class SquirrelIR
{
public:
    constexpr static const char* SQUIRREL_VM_GLOBAL_VAR = "__sq_vm__";

    // IR types
    llvm::Type* int32_t = nullptr;
    llvm::Type* int64_t = nullptr;
    llvm::Type* float_t = nullptr;
    llvm::Type* double_t = nullptr;
    llvm::Type* void_t = nullptr;
    llvm::Type* bool_t = nullptr;
    llvm::Type* char_ptr_t = nullptr;

    llvm::Type* sq_vm_t = nullptr;
    llvm::Type* sq_vm_ptr_t = nullptr;
    llvm::Type* sq_object_t = nullptr;
    llvm::Type* sq_object_ptr_t = nullptr;

    llvm::FunctionType* sq_func_t = nullptr;
    llvm::Type* sq_func_ptr_t = nullptr;

    llvm::Function* sq_pushobject_f = nullptr;
    llvm::Function* sq_pushroottable_f = nullptr;
    llvm::Function* sq_pushinteger_f = nullptr;
    llvm::Function* sq_pushfloat_f = nullptr;
    llvm::Function* sq_call_f = nullptr;
    llvm::Function* sq_getinteger_f = nullptr;
    llvm::Function* sq_getfloat_f = nullptr;
    llvm::Function* sq_pushbool_f = nullptr;
    llvm::Function* sq_getbool_f = nullptr;
    llvm::Function* sq_pushstring_f = nullptr;
    llvm::Function* sq_getstring_f = nullptr;
    llvm::Function* sq_getinstanceup_f = nullptr;
    llvm::Function* sq_gettop_f = nullptr;
    llvm::Function* sq_get_f = nullptr;
    llvm::Function* sq_pop_f = nullptr;
    llvm::Function* sq_gettype_f = nullptr;
    llvm::Function* sq_newtable_f = nullptr;
    llvm::Function* sq_pushnull_f = nullptr;
    llvm::Function* sq_next_f = nullptr;
    llvm::Function* sq_getsize_f = nullptr;
    llvm::Function* sq_getdelegate_f = nullptr;
    llvm::Function* sq_getuserpointer_f = nullptr;
    llvm::Function* sq_throwerror_f = nullptr;

    llvm::Function* sq_pushobject_apapter_f = nullptr;

    void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context, SQVM* sq_vm);

    llvm::Value* buildPopValue(llvm::IRBuilder<>& builder, llvm::Value* sq_vm_var, const llvm::Type* type, int stackPos) const;
    void buildPushValue(llvm::IRBuilder<>& builder, llvm::Value* sq_vm_var, const llvm::Type* type, llvm::Value* value) const;

private:
    std::unique_ptr<llvm::Module> m_api_module;
};

} // namespace as


#endif //SQ_IR_H
