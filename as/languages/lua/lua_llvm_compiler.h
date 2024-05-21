
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

class LuaLLVMCompiler
{
public:
	explicit LuaLLVMCompiler();

	~LuaLLVMCompiler();

	void setStripCode(bool strip) { m_stripCode = strip; }
	void setDumpCompiled(bool dump) { m_dumpCompiled = dump; }

	void compile(
	    llvm::orc::ThreadSafeContext ts_context,
	    const std::shared_ptr<llvm::orc::LLJIT>& jit,
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
		int strip_ops = 0;

		llvm::Value* func_L = nullptr;
		llvm::CallInst* func_cl = nullptr;
		llvm::CallInst* func_k = nullptr;
	};

	bool m_stripCode = false;
	bool m_dumpCompiled = false;

	// opcode hints/values/blocks/need_block arrays used in compile() method.
	std::vector<hint_t> op_hints;
	std::vector<std::unique_ptr<OPValues>> op_values;
	std::vector<llvm::BasicBlock*> op_blocks;
	std::vector<bool> need_op_block;

	std::unordered_map<std::string, std::unordered_map<std::string, std::string>> function_aliases;

    llvm::Constant* findConstantInCodeAbove(llvm::LLVMContext& context, BuildContext& bcontext, int fromInstruction, int reg);
	void prepareOpcodeData(int code_len);
    llvm::Value* getProtoConstant(llvm::LLVMContext& context, TValue* constant);
    std::string generateFunctionName(Proto* p);
	void findBasicBlockPoints(llvm::LLVMContext& context, llvm::IRBuilder<>& builder, BuildContext& bcontext);
	void preCreateBasicBlocks(llvm::LLVMContext& context, llvm::Function* func, BuildContext& bcontext);

    std::vector<llvm::Value*> getOpCallArgs(
        llvm::LLVMContext& context,
        const vm_func_info* func_info,
        BuildContext& bcontext,
        int i);

    void сompileAllProtos(
        llvm::LLVMContext& context,
        const std::shared_ptr<LuaIR>& lua_ir,
        llvm::Module* module,
        const std::shared_ptr<LLVMOptimizer>& optimizer,
        lua_State* L,
        Proto* p,
        std::unordered_map<Proto*, std::string>& func_names);

	void сompileSingleProto(
		llvm::LLVMContext& context,
		const std::shared_ptr<LuaIR>& lua_ir,
		llvm::Module* module,
        const std::shared_ptr<LLVMOptimizer>& optimizer,
		lua_State* L,
		Proto* p,
		const std::string& func_name);
};

} // namespace as

#endif

