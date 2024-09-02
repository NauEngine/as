//
// Created by Alex Zelenshikov on 27.08.2024.
//

#include <stdio.h>

#include "llvm/IR/IRBuilder.h"

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

llvm::Constant* wrapArrayIntoGlobal(
    llvm::Constant* array,
    const char* array_name,
    llvm::Module& module)
{
    auto& context = module.getContext();

    auto array_global = new llvm::GlobalVariable(module, array->getType(), false,
        llvm::GlobalValue::InternalLinkage, array, array_name);

    auto idx_list =
    {
        llvm::Constant::getNullValue(llvm::IntegerType::get(context, 32)),
        llvm::Constant::getNullValue(llvm::IntegerType::get(context, 32))
    };

    return llvm::ConstantExpr::getGetElementPtr(array->getType(), array_global, idx_list);

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

    return wrapArrayIntoGlobal(array_const, array_name, module);
}

llvm::Constant* buildFunctionTreeIR(
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
        child_array[i] = buildFunctionTreeIR(node->children[i], lua_ir, module);
    }

    // struct FunctionTree* children;  /* functions defined inside the function */
    const auto children_array_t = llvm::ArrayType::get(lua_ir->FunctionTree_t, node->num_children);
    const auto children_array_const = llvm::ConstantArray::get(children_array_t, child_array);
    ftree_fields.push_back(wrapArrayIntoGlobal(children_array_const, "__children__", module));

    // union Closure* closures;
    // We take LClosure here and its unsafe. But it has same size as union Closure
    const auto closure_array_t = llvm::ArrayType::get(lua_ir->JClosure_t, node->num_children);
    const auto closure_array_const = llvm::Constant::getNullValue(closure_array_t);
    ftree_fields.push_back(wrapArrayIntoGlobal(closure_array_const, "__closures__", module));

    // lu_byte *copy_closure;
    ftree_fields.push_back(buildIntConstantArray(node->copy_closure, 8, "__copy_closure__", module));

    // llvm::errs() << *lua_ir->FunctionTree_t;
    //
    // for (auto& it : ftree_fields)
    // {
    //     llvm::errs() << *it->getType() << ", ";
    // }

    return llvm::ConstantStruct::get(lua_ir->FunctionTree_t, ftree_fields);
}


} // namespace as
