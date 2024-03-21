
#ifndef LLVMCOMPILER_h
#define LLVMCOMPILER_h

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LLVMContext.h"

#include "VMModule.h"

//#include "lua_core.h"

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
		int code_len;
		int strip_ops = 0;

		llvm::Value* func_L = nullptr;
		llvm::CallInst* func_cl = nullptr;
		llvm::CallInst* func_k = nullptr;
	};

private:
	VMModule vm_module;
	llvm::orc::ThreadSafeModule ts_vm_module;
	llvm::orc::ThreadSafeContext ts_context;
	std::unique_ptr<llvm::orc::LLJIT> jit;

	bool strip_code;

	// count compiled opcodes.
	int* opcode_stats;

	// opcode hints/values/blocks/need_block arrays used in compile() method.
	std::vector<hint_t> op_hints;
	std::vector<std::unique_ptr<OPValues>> op_values;
	std::vector<llvm::BasicBlock*> op_blocks;
	std::vector<bool> need_op_block;

	std::unordered_map<Proto*, llvm::orc::ResourceTrackerSP> trackers;
	std::unordered_map<Proto*, std::unique_ptr<llvm::Module>> modules; // TODO make one module for parent proto
	std::unordered_map<Proto*, std::string> proto_ir_map;

	llvm::orc::ResourceTrackerSP vm_module_tracker;

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

	void CompileSingleProto(lua_State* L, Proto* p);

public:
	explicit LLVMCompiler(int useJIT);

	~LLVMCompiler();

	void SetStripCode(bool strip) { strip_code = strip; }
	void SetDumpCompiled(bool dump) { dump_compiled = dump; }

	VMModule& GetVMModule() { return vm_module; }

	std::unique_ptr<llvm::Module> LinkAllModulesIntoOne();


	llvm::Value* GetProtoConstant(TValue* constant);

  std::string GenerateModuleName(Proto* p);
	std::string GenerateFunctionName(Proto* p);

	const std::string& GetFunctionName(Proto* p) { return proto_ir_map[p]; }

	void Compile(lua_State* L, Proto* p);
	void Free(lua_State* L, Proto* p);
};

} // namespace as

#endif

