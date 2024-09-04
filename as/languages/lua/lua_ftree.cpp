//
// Created by Alex Zelenshikov on 27.08.2024.
//

#include <stdio.h>

#include "llvm/IR/IRBuilder.h"

#include "as/core/core_utils.h"
#include "as/core/ir.h"

#include "lua_ir.h"

extern "C"
{
#include "lua/ldebug.h"
#include "lua/lobject.h"
#include "lua/lopcodes.h"
}

#include "lua_ftree.h"


namespace as
{

std::string generateFunctionName(const Proto *p)
{
    std::string filename = getstr(p->source);

    std::string name = utils::generateModuleName(filename);

    char name_buf[128];
    snprintf(name_buf, 128, "_%d_%d", p->linedefined, p->lastlinedefined);
    name += name_buf;

    char name_buf_2[128];
    memset(name_buf_2, 0, 128);
    luaO_chunkid(name_buf_2, getstr(p->source), 128);

    return name;
}


std::shared_ptr<FunctionTreeNode> buildFunctionTree(
    Proto* proto,
    const std::shared_ptr<LuaIR>& lua_ir,
    llvm::Module& module)
{
    const auto node = std::make_shared<FunctionTreeNode>();

    node->proto = proto;
    node->function_name = generateFunctionName(proto);
    node->function = llvm::Function::Create(lua_ir->lua_func_t, llvm::Function::InternalLinkage, node->function_name, module);

    node->num_children = proto->sizep;
    node->children.resize(node->num_children);
    node->copy_closure.resize(node->num_children, false);

    for (int i = 0; i < proto->sizep; ++i)
    {
        node->children[i] = buildFunctionTree(proto->p[i], lua_ir, module);
    }

    return node;
}

void fillUpValues(
    const std::shared_ptr<FunctionTreeNode>& parent,
    int child_id,
    Instruction* code)
{
    const Proto* child_proto = parent->proto->p[child_id];
    const int num_upvalues = child_proto->nups;

    const auto child = parent->children[child_id];

    child->num_upvalues = num_upvalues;
    child->upvalue_types.resize(num_upvalues);
    child->upvalue_indices.resize(num_upvalues);

    code++;

    for (int i = 0; i < num_upvalues; ++i, ++code)
    {
        if (GET_OPCODE(*code) == OP_GETUPVAL)
        {
            child->upvalue_types[i] = UPVAL_INHERITED;
            child->upvalue_indices[i] = GETARG_B(*code);
        }
        else
        {
            lua_assert(GET_OPCODE(*code) == OP_MOVE);

            child->upvalue_types[i] = UPVAL_LOCAL;
            child->upvalue_indices[i] = GETARG_B(*code);
        }
    }

    // if next opcode SETGLOBAL we have global function here, so save its name/index value
    if (GET_OPCODE(*code) == OP_SETGLOBAL)
    {
        const int bx = GETARG_Bx(*code);
        const std::string func_name = svalue(&parent->proto->k[bx]);
        parent->global_func_map[func_name] = child_id;
        parent->copy_closure[child_id] = true;
    }
}

template <typename T>
llvm::Constant* buildIntConstantArray(
    const std::vector<T>& array,
    int bitsize,
    const char* array_name,
    llvm::Module& module)
{
    auto& context = module.getContext();

    std::vector<llvm::Constant *> array_of_const;
    array_of_const.resize(array.size());

    for (int i = 0; i < array.size(); ++i)
    {
        array_of_const[i] = llvm::ConstantInt::get(context, llvm::APInt(bitsize, array[i]));
    }

    auto array_type = llvm::ArrayType::get(llvm::IntegerType::get(context, bitsize), array.size());
    auto array_const = llvm::ConstantArray::get(array_type, array_of_const);

    return ir::wrapArrayIntoGlobal(array_const, array_name, module);
}

unsigned getMaxValueSize(
    const llvm::Module& module,
    const std::shared_ptr<LuaIR>& lua_ir)
{
    auto& dataLayout = module.getDataLayout();

    const unsigned double_size = dataLayout.getTypeStoreSize(lua_ir->double_t);
    const unsigned int_size = dataLayout.getTypeStoreSize(lua_ir->int32_t);
    const unsigned ptr_size = dataLayout.getPointerSize();

    return std::max(double_size, std::max(ptr_size, int_size));
}

llvm::Constant* buildKArray(
    const Proto* proto,
    const std::shared_ptr<LuaIR>& lua_ir,
    llvm::Module& module)
{
    auto& context = module.getContext();

    std::vector<llvm::Constant*> array;

    for (int i = 0; i < proto->sizek; ++i)
    {
        const TValue* tval = &(proto->k[i]);

        const auto pointer_value = reinterpret_cast<uint64_t>(tval->value.p);
        llvm::Constant* value_int_const = llvm::ConstantInt::get(lua_ir->int64_t, pointer_value);
        llvm::Constant* value_const = llvm::ConstantExpr::getIntToPtr(value_int_const, lua_ir->char_ptr_t);

        auto value_struct_const = llvm::ConstantStruct::get(lua_ir->Value_t, {value_const});
        auto value_type_const = llvm::ConstantInt::get(context, llvm::APInt(32, tval->tt));
        auto tvalue_const = llvm::ConstantStruct::get(lua_ir->TValue_t, {value_struct_const, value_type_const});
        array.push_back(tvalue_const);
    }

    const auto array_type = llvm::ArrayType::get(lua_ir->TValue_t, array.size());
    const auto array_const = llvm::ConstantArray::get(array_type, array);

    return ir::wrapArrayIntoGlobal(array_const, "__k__", module);
}

llvm::Constant* buildStringArray(
    const Proto* proto,
    const std::shared_ptr<LuaIR>& lua_ir,
    llvm::Module& module)
{
    auto& context = module.getContext();

    std::vector<llvm::Constant*> array;

    for (int i = 0; i < proto->sizek; ++i)
    {
        const TValue* tval = &(proto->k[i]);
        llvm::Constant* value_const;

        if (ttype(tval) == LUA_TSTRING)
        {
            const auto string_const = ir::buildString(module, ".str", svalue(tval));
            const auto length_const = llvm::ConstantInt::get(context, llvm::APInt(32, tsvalue(tval)->len));
            value_const = llvm::ConstantStruct::get(lua_ir->ConstantString_t, {length_const, string_const});
        }
        else
        {
            llvm::Constant* opaque_null_ptr = llvm::ConstantPointerNull::get(lua_ir->char_ptr_t);
            const auto length_const = llvm::ConstantInt::get(context, llvm::APInt(32, 0));
            value_const = llvm::ConstantStruct::get(lua_ir->ConstantString_t, {length_const, opaque_null_ptr});
        }

        array.push_back(value_const);
    }

    const auto array_type = llvm::ArrayType::get(lua_ir->ConstantString_t, array.size());
    const auto array_const = llvm::ConstantArray::get(array_type, array);

    return ir::wrapArrayIntoGlobal(array_const, "__strings__", module);
}

llvm::Constant* buildFunctionTreeIRInner(
    const std::shared_ptr<FunctionTreeNode>& node,
    const std::shared_ptr<LuaIR>& lua_ir,
    llvm::Module& module)
{
    auto& context = module.getContext();

    std::vector<llvm::Constant*> ftree_fields;

    // lua_CFunction func;
    ftree_fields.push_back(node->function);

    // lu_byte numparams;
    ftree_fields.push_back(llvm::ConstantInt::get(context, llvm::APInt(8, node->proto->numparams)));
    // lu_byte is_vararg;
    ftree_fields.push_back(llvm::ConstantInt::get(context, llvm::APInt(8, node->proto->is_vararg)));
    // lu_byte maxstacksize;
    ftree_fields.push_back(llvm::ConstantInt::get(context, llvm::APInt(8, node->proto->maxstacksize)));

    // lu_byte num_upvalues;
    ftree_fields.push_back(llvm::ConstantInt::get(context, llvm::APInt(8, node->num_upvalues)));

    // lu_byte *upvalue_types; // 0 - local, 1 - inherit upvalue
    ftree_fields.push_back(buildIntConstantArray(node->upvalue_types, 8, "__upvalue_types__", module));
    // int *upvalue_indices;
    ftree_fields.push_back(buildIntConstantArray(node->upvalue_indices, 32, "__upvalue_indices__", module));

    // int num_children;
    ftree_fields.push_back(llvm::ConstantInt::get(context, llvm::APInt(32, node->num_children)));

    // struct FunctionTree* children;
    std::vector<llvm::Constant *> child_array;
    child_array.resize(node->num_children);

    for (int i = 0; i < node->num_children; ++i)
    {
        child_array[i] = buildFunctionTreeIRInner(node->children[i], lua_ir, module);
    }

    // struct FunctionTree* children;  /* functions defined inside the function */
    const auto children_array_t = llvm::ArrayType::get(lua_ir->FunctionTree_t, node->num_children);
    const auto children_array_const = llvm::ConstantArray::get(children_array_t, child_array);
    ftree_fields.push_back(ir::wrapArrayIntoGlobal(children_array_const, "__children__", module));

    // union Closure* closures;
    // We take LClosure here and its unsafe. But it has same size as union Closure
    const auto closure_array_t = llvm::ArrayType::get(lua_ir->JClosure_ptr_t, node->num_children);
    const auto closure_array_const = llvm::Constant::getNullValue(closure_array_t);
    ftree_fields.push_back(ir::wrapArrayIntoGlobal(closure_array_const, "__closures__", module));

    // lu_byte *copy_closure;
    ftree_fields.push_back(buildIntConstantArray(node->copy_closure, 8, "__copy_closure__", module));

    // int sizek;
    ftree_fields.push_back(llvm::ConstantInt::get(context, llvm::APInt(32, node->proto->sizek)));

    // TValue* k;
    ftree_fields.push_back(buildKArray(node->proto, lua_ir, module));

    // ConstantString* k_strings;
    ftree_fields.push_back(buildStringArray(node->proto, lua_ir, module));

    // llvm::errs() << *lua_ir->FunctionTree_t;
    //
    // for (auto& it : ftree_fields)
    // {
    //     llvm::errs() << *it->getType() << ", ";
    // }

    return llvm::ConstantStruct::get(lua_ir->FunctionTree_t, ftree_fields);
}

llvm::Value* buildFunctionTreeIR(
        const std::shared_ptr<FunctionTreeNode>& node,
        const std::shared_ptr<LuaIR>& lua_ir,
        llvm::Module& module)
{
    auto const_value = buildFunctionTreeIRInner(node, lua_ir, module);
    return new llvm::GlobalVariable(module, lua_ir->FunctionTree_t, false,
         llvm::GlobalValue::InternalLinkage, const_value, "__func_tree__");
}

} // namespace as
