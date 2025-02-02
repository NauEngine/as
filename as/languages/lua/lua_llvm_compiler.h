
#ifndef LLVMCOMPILER_h
#define LLVMCOMPILER_h

#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LLVMContext.h"

#ifdef __cplusplus
extern "C" {
#endif

#include "lua_vm_ops.h"

#ifdef __cplusplus
}
#endif

namespace llvm
{
    class ExecutionEngine;
    class Timer;
    namespace orc
    {
        class LLJIT;
    }
}

namespace as
{

class LuaIR;
class LLVMOptimizer;
struct FunctionTreeNode;

class LuaLLVMCompiler
{
public:
	LuaLLVMCompiler() = default;
	~LuaLLVMCompiler() = default;

	std::shared_ptr<FunctionTreeNode> compile(
	    llvm::LLVMContext& context,
	    llvm::Module& module,
	    const std::shared_ptr<LuaIR>& lua_ir,
	    lua_State* L,
	    Proto* p);

private:
	class OPValues
	{
	private:
		std::vector<llvm::Value*> values;

	public:
		explicit OPValues(int len)
		{
			values.resize(len, nullptr);
		}

		void set(int idx, llvm::Value* val)
		{
			assert(idx >= 0 && idx < values.size());
			values[idx] = val;
		}

		llvm::Value* get(int idx)
		{
			assert(idx >= 0 && idx < values.size());
			return values[idx];
		}
	};

	struct BuildContext
	{
		Instruction* code = nullptr;
		TValue* k = nullptr;
		int code_len = 0;

		llvm::Value* func_L = nullptr;
	    llvm::Value* base = nullptr;
		llvm::CallInst* func_cl = nullptr;
		llvm::CallInst* func_k = nullptr;

	    std::vector<llvm::Value*> localVars;
	    std::vector<llvm::Value*> constants;
	};

	// opcode hints/values/blocks/need_block arrays used in compile() method.
	std::vector<hint_t> op_hints;
	std::vector<std::unique_ptr<OPValues>> op_values;
	std::vector<llvm::BasicBlock*> op_blocks;
	std::vector<bool> need_op_block;

	std::unordered_map<std::string, std::unordered_map<std::string, std::string>> function_aliases;

    llvm::Constant* findConstantInCodeAbove(llvm::LLVMContext& context, BuildContext& bcontext, int fromInstruction, int reg);
    static llvm::Constant* getConstantIfNumeric(llvm::LLVMContext& context, BuildContext& bcontext, int arg);

	void prepareOpcodeData(int code_len);
    llvm::Value* getProtoConstant(llvm::LLVMContext& context, TValue* constant);
	void findBasicBlockPoints(llvm::LLVMContext& context, llvm::IRBuilder<>& builder, BuildContext& bcontext);
	void preCreateBasicBlocks(llvm::LLVMContext& context, llvm::Function* func, BuildContext& bcontext);

    static void buildLocalVars(
        llvm::LLVMContext& context,
        BuildContext& bcontext,
        llvm::IRBuilder<>& builder,
        const std::shared_ptr<LuaIR>& lua_ir,
        const Proto* proto);

    static void buildConstants(
        llvm::LLVMContext& context,
        BuildContext& bcontext,
        llvm::IRBuilder<>& builder,
        const std::shared_ptr<LuaIR>& lua_ir,
        const Proto* proto);

    void buildArithOp(
        llvm::LLVMContext& context,
        const BuildContext& bcontext,
        llvm::IRBuilder<>& builder,
        const std::shared_ptr<LuaIR>& lua_ir,
        llvm::Function* func,
        int i);

    std::vector<llvm::Value*> getOpCallArgs(
        llvm::LLVMContext& context,
        const VmFuncInfo* func_info,
        BuildContext& bcontext,
        int i);

    void сompileAllProtos(
        llvm::LLVMContext& context,
        const std::shared_ptr<LuaIR>& lua_ir,
        llvm::Module& module,
        const std::shared_ptr<LLVMOptimizer>& optimizer,
        lua_State* L,
        const std::shared_ptr<FunctionTreeNode>& node);

	void сompileSingleProto(
		llvm::LLVMContext& context,
		const std::shared_ptr<LuaIR>& lua_ir,
		llvm::Module& module,
        const std::shared_ptr<LLVMOptimizer>& optimizer,
        lua_State* L,
        const std::shared_ptr<FunctionTreeNode>& node);
};

} // namespace as

#endif

