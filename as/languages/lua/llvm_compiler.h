
#ifndef LLVMCOMPILER_h
#define LLVMCOMPILER_h

#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LLVMContext.h"

#include "base_lua_module.h"

#ifdef __cplusplus
extern "C" {
#endif

#include "lua/lobject.h"
#include "lua_vm_ops.h"

#ifdef __cplusplus
}
#endif

namespace llvm {
class ExecutionEngine;
class Timer;
  namespace legacy {
    class FunctionPassManager;
  }
}

namespace as
{

class VMModuleForwardDecl;

class LLVMCompiler
{
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

private:
	bool strip_code = false;

	// count compiled opcodes.
	int opcode_stats[NUM_OPCODES];

	// opcode hints/values/blocks/need_block arrays used in compile() method.
	std::vector<hint_t> op_hints;
	std::vector<std::unique_ptr<OPValues>> op_values;
	std::vector<llvm::BasicBlock*> op_blocks;
	std::vector<bool> need_op_block;

	std::unordered_map<std::string, std::unordered_map<std::string, std::string>> function_aliases;

	// Options
	bool dump_compiled = false;

	// resize the opcode hint data arrays.
	void ResizeOpcodeData(int code_len);

	// reset/clear the opcode hint data arrays.
	void ClearOpcodeData(int code_len);

	void FindBasicBlockPoints(llvm::LLVMContext& context, llvm::IRBuilder<>& builder, BuildContext& bcontext);

	void PreCreateBasicBlocks(llvm::LLVMContext& context, llvm::Function* func, BuildContext& bcontext);

	std::vector<llvm::Value*>
	GetOpCallArgs(llvm::LLVMContext& context, const vm_func_info* func_info, BuildContext& bcontext, int i);

	void InsertDebugCalls(VMModuleForwardDecl* decl, llvm::LLVMContext& context, llvm::IRBuilder<>& builder,
												BuildContext& bcontext, int i);

	void CompileSingleProto(llvm::LLVMContext& context, BaseLuaModule& vm_module, llvm::Module* module, VMModuleForwardDecl* decl, lua_State* L, Proto* p);

public:
	explicit LLVMCompiler();

	~LLVMCompiler();

	void SetStripCode(bool strip) { strip_code = strip; }
	void SetDumpCompiled(bool dump) { dump_compiled = dump; }

	llvm::Expected<std::string> getFunctionName(const std::string& filename, const std::string& name);

	llvm::Value* GetProtoConstant(llvm::LLVMContext& context, TValue* constant);

	std::string GenerateFunctionName(Proto* p);

	std::unique_ptr<llvm::Module> Compile(llvm::LLVMContext& context, BaseLuaModule& vm_module, lua_State* L, Proto* p);
};

} // namespace as

#endif

