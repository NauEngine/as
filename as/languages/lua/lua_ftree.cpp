//
// Created by Alex Zelenshikov on 27.08.2024.
//

#include <stdio.h>

#include "as/core/core_utils.h"

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
    }
}


template <typename T>
    llvm::Constant* buildIntConstantArray(
        const std::vector<T>& array,
        int bitsize,
        llvm::LLVMContext& context)
{
    std::vector<llvm::Constant *> const_array;
    const_array.resize(array.size());

    for (int i = 0; i < array.size(); ++i)
    {
        const_array[i] = llvm::ConstantInt::get(context, llvm::APInt(bitsize, array[i]));
    }

    auto array_type = llvm::ArrayType::get(llvm::IntegerType::get(context, bitsize), array.size());
    return llvm::ConstantArray::get(array_type, const_array);
}

llvm::Constant* buildFunctionTreeIR(
    const std::shared_ptr<FunctionTreeNode>& node,
    const std::shared_ptr<LuaIR>& lua_ir,
    llvm::LLVMContext& context)
{
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
    ftree_fields.push_back(buildIntConstantArray(node->upvalue_types, 8, context));
    // int *upvalue_indices;
    ftree_fields.push_back(buildIntConstantArray(node->upvalue_indices, 32, context));

    // int num_children;
    ftree_fields.push_back(llvm::ConstantInt::get(context, llvm::APInt(8, node->num_children)));

    // struct FunctionTree* children;
    std::vector<llvm::Constant *> child_array;
    child_array.resize(node->num_children);

    for (int i = 0; i < node->num_children; ++i)
    {
        child_array[i] = buildFunctionTreeIR(node->children[i], lua_ir, context);
    }

    const auto children_array_type = llvm::ArrayType::get(lua_ir->FunctionTree_t, node->num_children);
    ftree_fields.push_back(llvm::ConstantArray::get(children_array_type, child_array));

    return llvm::ConstantStruct::get(lua_ir->FunctionTree_t, ftree_fields);
}


} // namespace as
