//
// Created by Alex Zelenshikov on 27.08.2024.
//

#ifndef LUA_FTREE_H
#define LUA_FTREE_H

#include <vector>

namespace llvm
{
    class Function;
    class Module;
}

namespace as
{

class LuaIR;

struct FunctionTreeNode
{
    llvm::Function* function;
    std::string function_name;

    Proto* proto;

    int num_upvalues;
    std::vector<unsigned char> upvalue_types;
    std::vector<int> upvalue_indices;

    int num_children;
    std::vector<std::shared_ptr<FunctionTreeNode>> children;

    // Map from global function name to its index in children
    std::unordered_map<std::string, int> global_func_map;
    std::vector<unsigned char> copy_closure;
};

std::shared_ptr<FunctionTreeNode> buildFunctionTree(
    Proto* proto,
    const std::shared_ptr<LuaIR>& lua_ir,
    llvm::Module& module);

std::string generateFunctionName(const Proto *p);

void fillUpValues(
        const std::shared_ptr<FunctionTreeNode>& parent,
        int child_id,
        Instruction* code);

llvm::Constant* buildFunctionTreeIR(
    const std::shared_ptr<FunctionTreeNode>& node,
    const std::shared_ptr<LuaIR>& lua_ir,
    llvm::Module& module);


} // namespace as


#endif //LUA_FTREE_H
