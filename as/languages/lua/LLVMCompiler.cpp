/*
  Copyright (c) 2009 Robert G. Jakabosky
  
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
  
  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.
  
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.

  MIT License: http://www.opensource.org/licenses/mit-license.php
*/

#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Target/TargetOptions.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Support/Timer.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Linker/Linker.h"
#include <cstdio>
#include <string>
#include <vector>
#include <math.h>

#include "LLVMCompiler.h"
#include "VMModule.h"

#ifdef __cplusplus
extern "C" {
#endif
#include "lua/lopcodes.h"
#include "lua/lobject.h"
#include "lua/lstate.h"
#include "lua/ldo.h"
#include "lua/lmem.h"
#include "lua/lcoco.h"
#ifdef __cplusplus
}
#endif

/*
 * Using lazing compilation requires large 512K c-stacks for each coroutine.
 */
static unsigned int OptLevel = 3;

static llvm::cl::opt<bool> Fast("fast",
                   llvm::cl::desc("Generate code quickly, "
                            "potentially sacrificing code quality"),
                   llvm::cl::init(false));

static llvm::cl::opt<bool> OpCodeStats("opcode-stats",
                   llvm::cl::desc("Generate stats on compiled Lua opcodes."),
                   llvm::cl::init(false));

static llvm::cl::opt<bool> RunOpCodeStats("runtime-opcode-stats",
                   llvm::cl::desc("Generate stats on executed Lua opcodes."),
                   llvm::cl::init(false));

static llvm::cl::opt<bool> PrintRunOpCodes("print-runtime-opcodes",
                   llvm::cl::desc("Print each opcode before executing it."),
                   llvm::cl::init(false));

static llvm::cl::opt<bool> CompileLargeFunctions("compile-large-functions",
                   llvm::cl::desc("Compile all Lua functions even really large functions."),
                   llvm::cl::init(false));

static llvm::cl::opt<int> MaxFunctionSize("max-func-size",
                   llvm::cl::desc("Functions larger then this will not be compiled."),
                   llvm::cl::value_desc("int"),
                   llvm::cl::init(200));

static llvm::cl::opt<bool> DontInlineOpcodes("do-not-inline-opcodes",
                   llvm::cl::desc("Turn off inlining of opcode functions."),
                   llvm::cl::init(false));

static llvm::cl::opt<bool> VerifyFunctions("verify-functions",
                   llvm::cl::desc("Verify each compiled function."),
                   llvm::cl::init(false));

static llvm::cl::opt<bool> DebugOpCodes("g",
                   llvm::cl::desc("Allow debugging of Lua code."),
                   llvm::cl::init(false));

static llvm::cl::opt<bool> DisableOpt("O0",
                   llvm::cl::desc("Disable optimizations."),
                   llvm::cl::init(false));

static llvm::cl::opt<bool> OptLevelO1("O1",
                   llvm::cl::desc("Optimization level 1."),
                   llvm::cl::init(false));

static llvm::cl::opt<bool> OptLevelO2("O2",
                   llvm::cl::desc("Optimization level 2."),
                   llvm::cl::init(false));

static llvm::cl::opt<bool> OptLevelO3("O3",
                   llvm::cl::desc("Optimization level 3."),
                   llvm::cl::init(false));


#define BRANCH_COND -1
#define BRANCH_NONE -2

//===----------------------------------------------------------------------===//
// Lua bytecode to LLVM IR compiler
//===----------------------------------------------------------------------===//

namespace as
{

llvm::Value* LLVMCompiler::GetProtoConstant(llvm::LLVMContext& context, TValue *constant)
{
	llvm::Value* val = nullptr;
	switch(ttype(constant))
	{
	case LUA_TBOOLEAN:
		val = llvm::ConstantInt::get(context, llvm::APInt(sizeof(LUA_NUMBER), !l_isfalse(constant)));
		break;
	case LUA_TNUMBER:
		val = llvm::ConstantFP::get(context, llvm::APFloat(nvalue(constant)));
		break;
	case LUA_TSTRING:
		break;
	case LUA_TNIL:
	default:
		break;
	}

	return val;
}

LLVMCompiler::LLVMCompiler()
{
	if (OpCodeStats)
  {
		opcode_stats = new int[NUM_OPCODES];
		for(int i = 0; i < NUM_OPCODES; i++) {
			opcode_stats[i] = 0;
		}
	}

	if (RunOpCodeStats)
	{
		for (int i = 0; i < NUM_OPCODES; i++)
		{
			vm_op_run_count[i] = 0;
		}
	}
}

void print_opcode_stats(int *stats, const char *stats_name) {
	int order[NUM_OPCODES];
	int max=0;
	int width=1;
	for(int opcode = 0; opcode < NUM_OPCODES; opcode++) {
		order[opcode] = opcode;
		if(max < stats[opcode]) max = stats[opcode];
		for(int n = 0; n < opcode; n++) {
			if(stats[opcode] >= stats[order[n]]) {
				// insert here.
				memmove(&order[n + 1], &order[n], (opcode - n) * sizeof(int));
				order[n] = opcode;
				break;
			}
		}
	}
	// calc width.
	while(max >= 10) { width++; max /= 10; }
	// sort by count.
	fprintf(stderr, "===================== %s =======================\n", stats_name);
	int opcode;
	for(int i = 0; i < NUM_OPCODES; i++) {
		opcode = order[i];
		if(stats[opcode] == 0) continue;
		fprintf(stderr, "%*d: %s(%d)\n", width, stats[opcode], luaP_opnames[opcode], opcode);
	}
}

LLVMCompiler::~LLVMCompiler() {
	std::string error;
	// print opcode stats.
	if (OpCodeStats)
	{
		print_opcode_stats(opcode_stats, "Compiled OpCode counts");
		delete opcode_stats;
	}
	if (RunOpCodeStats)
	{
		print_opcode_stats(vm_op_run_count, "Compiled OpCode counts");
	}
}

void LLVMCompiler::ResizeOpcodeData(int code_len)
{
	op_hints.resize(code_len);
	op_values.resize(code_len);
	op_blocks.resize(code_len);
	need_op_block.resize(code_len);

	ClearOpcodeData(code_len);
}

void LLVMCompiler::ClearOpcodeData(int code_len) {
	for(int i = 0; i < code_len; i++) {
		op_hints[i] = HINT_NONE;
		op_values[i] = nullptr;
		op_blocks[i] = nullptr;
		need_op_block[i] = false;
	}
}

std::string LLVMCompiler::GenerateModuleName(Proto *p)
{
  std::string name = getstr(p->source);

  if(name.size() > 32) {
    name = name.substr(0,32);
  }
  // replace non-alphanum characters with '_'
  for(size_t n = 0; n < name.size(); n++) {
    char c = name[n];
    if((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9')) {
      continue;
    }
    if(c == '\n' || c == '\r') {
      name = name.substr(0,n);
      break;
    }
    name[n] = '_';
  }

  return name;
}

std::string LLVMCompiler::GenerateFunctionName(Proto *p)
{
  std::string name = GenerateModuleName(p);

  char name_buf[128];
  snprintf(name_buf,128,"_%d_%d",p->linedefined, p->lastlinedefined);
  name += name_buf;

  return name;
}

void LLVMCompiler::FindBasicBlockPoints(llvm::LLVMContext& context, llvm::IRBuilder<>& builder, BuildContext& bcontext)
{
	int mini_op_repeat=0;

	for(int i = 0; i < bcontext.code_len; ++i)
	{
		Instruction op_intr = bcontext.code[i];
		int opcode = GET_OPCODE(op_intr);
		// combine simple ops into one function call.
		if(is_mini_vm_op(opcode)) {
			mini_op_repeat++;
		} else {
			if(mini_op_repeat >= 3 && OptLevel > 1) {
				op_hints[i - mini_op_repeat] |= HINT_MINI_VM;
			}
			mini_op_repeat = 0;
		}
		switch (opcode) {
			case OP_LOADBOOL:
				{
					int branch = i + 1;
					// check C operand if C!=0 then skip over the next op_block.
					if(GETARG_C(op_intr) != 0)
						++branch;
					need_op_block[branch] = true;
				}
				break;
			case OP_LOADK: {
				// check if arg Bx is a number constant.
				TValue *rb = bcontext.k + INDEXK(GETARG_Bx(op_intr));
				if(ttisnumber(rb)) op_hints[i] |= HINT_Bx_NUM_CONSTANT;
				break;
			}
			case OP_JMP:
				{
					// always branch to the offset stored in operand sBx
					int branch = i + 1 + GETARG_sBx(op_intr);
					need_op_block[branch] = true;
				}
				break;
			case OP_TAILCALL:
				{
					int branch = i + 1;
					need_op_block[0] = true; /* branch to start of function if this is a recursive tail-call. */
					need_op_block[branch] = true; /* branch to return instruction if not recursive. */
				}
				break;
			case OP_EQ:
			case OP_LT:
			case OP_LE:
				// check if arg C is a number constant.
				if(ISK(GETARG_C(op_intr))) {
					TValue *rc = bcontext.k + INDEXK(GETARG_C(op_intr));
					if(ttisnumber(rc)) op_hints[i] |= HINT_C_NUM_CONSTANT;
				}
				if(GETARG_A(op_intr) == 1) {
					op_hints[i] |= HINT_NOT;
				}
				// fall-through
			case OP_TEST:
			case OP_TESTSET:
			case OP_TFORLOOP:
				{
					int branch = ++i + 1;
					op_intr = bcontext.code[i];
					need_op_block[branch + GETARG_sBx(op_intr)] = true; /* inline JMP op. */
					need_op_block[branch] = true;
				}
				break;
			case OP_FORLOOP:
				{
					int branch = i + 1;
					need_op_block[branch] = true;
					branch += GETARG_sBx(op_intr);
					need_op_block[branch] = true;
				}
				break;
			case OP_FORPREP:
				{
					int branch = i + 1 + GETARG_sBx(op_intr);
					need_op_block[branch] = true;
					need_op_block[branch + 1] = true;
					// test if init/plimit/pstep are number constants.
					if (OptLevel > 1 && i >= 3) {
						lua_Number nums[3];
						bool found_val[3] = { false, false , false };
						bool is_const_num[3] = { false, false, false };
						bool all_longs=true;
						int found=0;
						auto vals = std::make_unique<OPValues>(4);
						int forprep_ra = GETARG_A(op_intr);
						bool no_jmp_end_point = true; // don't process ops after finding a jmp end point.
						// find & load constants for init/plimit/pstep
						for (int x = 1; x < 6 && found < 3 && no_jmp_end_point; ++x) {
							const TValue *tmp;
							Instruction op_intr2;
							int ra;

							if((i - x) < 0) break;
							op_intr2 = bcontext.code[i - x];
							// get 'a' register.
							ra = GETARG_A(op_intr2);
							ra -= forprep_ra;
							// check for jmp end-point.
							no_jmp_end_point = !(need_op_block[i - x]);
							// check that the 'a' register is for one of the value we are interested in.
							if(ra < 0 || ra > 2) continue;
							// only process this opcode if we haven't seen this value before.
							if(found_val[ra]) continue;
							found_val[ra] = true;
							found++;
							if(GET_OPCODE(op_intr2) == OP_LOADK) {
								tmp = bcontext.k + GETARG_Bx(op_intr2);
								if(ttisnumber(tmp)) {
									lua_Number num=nvalue(tmp);
									nums[ra] = num;
									// test if number is a whole number
									all_longs &= (floor(num) == num);
									vals->set(ra,llvm::ConstantFP::get(context, llvm::APFloat(num)));
									is_const_num[ra] = true;
									op_hints[i - x] |= HINT_SKIP_OP;
									continue;
								}
							}
							all_longs = false;
						}
						all_longs &= (found == 3);
						// create for_idx OP_FORPREP will inialize it.
						op_hints[branch] = HINT_FOR_N_N_N;
						if(all_longs) {
							vals->set(3, builder.CreateAlloca(llvm::Type::getInt64Ty(context), 0, "for_idx"));
							op_hints[branch] |= HINT_USE_LONG;
						} else {
							vals->set(3, builder.CreateAlloca(llvm::Type::getDoubleTy(context), 0, "for_idx"));
						}
						// check if step, init, limit are constants
						if(is_const_num[2]) {
							// step is a constant
							if(is_const_num[0]) {
								// init & step are constants.
								if(is_const_num[1]) {
									// all are constants.
									op_hints[i] = HINT_FOR_N_N_N;
								} else {
									// limit is variable.
									op_hints[i] = HINT_FOR_N_M_N;
								}
								op_values[i] = std::make_unique<OPValues>(3);
								op_values[i]->set(0, vals->get(0));
								op_values[i]->set(2, vals->get(2));
							} else if(is_const_num[1]) {
								// init is variable, limit & step are constants.
								op_hints[i] = HINT_FOR_M_N_N;
								op_values[i] = std::make_unique<OPValues>(3);
								op_values[i]->set(1, vals->get(1));
								op_values[i]->set(2, vals->get(2));
							}
							// check the direct of step.
							if(nums[2] > 0) {
								op_hints[branch] |= HINT_UP;
							} else {
								op_hints[branch] |= HINT_DOWN;
							}
						}
						if(op_hints[i] == HINT_NONE) {
							// don't skip LOADK ops, since we are not inlining them.
							for(int x=i-3; x < i; x++) {
								if(op_hints[x] & HINT_SKIP_OP) op_hints[x] &= ~(HINT_SKIP_OP);
							}
						}
						if(all_longs) {
							for(int x = 0; x < 3; ++x) {
								vals->set(x,llvm::ConstantInt::get(context, llvm::APInt(64,(lua_Long)nums[x])));
							}
						}
						// make sure OP_FORPREP doesn't subtract 'step' from 'init'
						op_values[branch] = std::move(vals);
						op_hints[i] |= HINT_NO_SUB;
					}
				}
				break;
			case OP_SETLIST:
				// if C == 0, then next code value is count value.
				if(GETARG_C(op_intr) == 0) {
					i++;
				}
				break;
			case OP_ADD:
			case OP_SUB:
			case OP_MUL:
			case OP_DIV:
			case OP_MOD:
			case OP_POW:
				// check if arg C is a number constant.
				if(ISK(GETARG_C(op_intr))) {
					TValue *rc = bcontext.k + INDEXK(GETARG_C(op_intr));
					if(ttisnumber(rc)) op_hints[i] |= HINT_C_NUM_CONSTANT;
				}
				break;
			default:
				break;
		}
		// update local variable type hints.
		//vm_op_hint_locals(locals, p->maxstacksize, k, op_intr);
	}
}

void LLVMCompiler::PreCreateBasicBlocks(llvm::LLVMContext& context, llvm::Function* func, BuildContext& bcontext)
{
	for (int i = 0; i < bcontext.code_len; ++i)
	{
		if (need_op_block[i])
		{
			Instruction op_intr = bcontext.code[i];
			int opcode = GET_OPCODE(op_intr);
			char name_buf[128];
			snprintf(name_buf, 128, "op_block_%s_%d", luaP_opnames[opcode], i);
			op_blocks[i] = llvm::BasicBlock::Create(context, name_buf, func);
		}
		else
		{
			op_blocks[i] = nullptr;
		}
	}
}

// i - code instruction id
std::vector<llvm::Value*> LLVMCompiler::GetOpCallArgs(llvm::LLVMContext& context, const vm_func_info* func_info,
																											BuildContext& bcontext, int i)
{
	std::vector<llvm::Value*> args;

	Instruction op_intr = bcontext.code[i];
	int opcode = GET_OPCODE(op_intr);

	for (int x = 0; func_info->params[x] != VAR_T_VOID ; ++x)
	{
		llvm::Value* val = nullptr;

		switch(func_info->params[x])
		{
			case VAR_T_ARG_A:
				val = llvm::ConstantInt::get(context, llvm::APInt(32,GETARG_A(op_intr)));
				break;
			case VAR_T_ARG_C:
				val = llvm::ConstantInt::get(context, llvm::APInt(32,GETARG_C(op_intr)));
				break;
			case VAR_T_ARG_C_FB2INT:
				val = llvm::ConstantInt::get(context, llvm::APInt(32,luaO_fb2int(GETARG_C(op_intr))));
				break;
			case VAR_T_ARG_Bx_NUM_CONSTANT:
				val = GetProtoConstant(context, bcontext.k + INDEXK(GETARG_Bx(op_intr)));
				break;
			case VAR_T_ARG_C_NUM_CONSTANT:
				val = GetProtoConstant(context, bcontext.k + INDEXK(GETARG_C(op_intr)));
				break;
			case VAR_T_ARG_C_NEXT_INSTRUCTION: {
				int c = GETARG_C(op_intr);
				// if C == 0, then next code value is used as ARG_C.
				if (c == 0)
				{
					if ((i+1) < bcontext.code_len)
					{
						c = bcontext.code[i + 1];
						if(strip_code) bcontext.strip_ops++;
					}
				}
				val = llvm::ConstantInt::get(context, llvm::APInt(32,c));
				break;
			}
			case VAR_T_ARG_B:
				val = llvm::ConstantInt::get(context, llvm::APInt(32,GETARG_B(op_intr)));
				break;
			case VAR_T_ARG_B_FB2INT:
				val = llvm::ConstantInt::get(context, llvm::APInt(32, luaO_fb2int(GETARG_B(op_intr))));
				break;
			case VAR_T_ARG_Bx:
				val = llvm::ConstantInt::get(context, llvm::APInt(32,GETARG_Bx(op_intr)));
				break;
			case VAR_T_ARG_sBx:
				val = llvm::ConstantInt::get(context, llvm::APInt(32,GETARG_sBx(op_intr)));
				break;
			case VAR_T_PC_OFFSET:
				val = llvm::ConstantInt::get(context, llvm::APInt(32,i + 1 - bcontext.strip_ops));
				break;
			case VAR_T_INSTRUCTION:
				val = llvm::ConstantInt::get(context, llvm::APInt(32,op_intr));
				break;
			case VAR_T_NEXT_INSTRUCTION:
				val = llvm::ConstantInt::get(context, llvm::APInt(32, bcontext.code[i+1]));
				break;
			case VAR_T_LUA_STATE_PTR:
				val = bcontext.func_L;
				break;
			case VAR_T_K:
				val = bcontext.func_k;
				break;
			case VAR_T_CL:
				val = bcontext.func_cl;
				break;
			case VAR_T_OP_VALUE_0:
				if(op_values[i] != NULL) val = op_values[i]->get(0);
				break;
			case VAR_T_OP_VALUE_1:
				if(op_values[i] != NULL) val = op_values[i]->get(1);
				break;
			case VAR_T_OP_VALUE_2:
				if(op_values[i] != NULL) val = op_values[i]->get(2);
				break;
			default:
				fprintf(stderr, "Error: not implemented!\n");
				exit(1);
			case VAR_T_VOID:
				fprintf(stderr, "Error: invalid value type!\n");
				exit(1);
		}

		if(val == NULL) {
			fprintf(stderr, "Error: Missing parameter '%d' for this opcode(%d) function=%s!\n", x,
							opcode, func_info->name);
			exit(1);
		}
		args.push_back(val);
	}

	return args;
}

void LLVMCompiler::InsertDebugCalls(VMModuleForwardDecl* decl, llvm::LLVMContext& context, llvm::IRBuilder<>& builder, BuildContext& bcontext, int i)
{
	//fprintf(stderr, "%d: '%s' (%d) = 0x%08X, hint=0x%X\n", i, luaP_opnames[opcode], opcode, op_intr, op_hints[i]);
	//fprintf(stderr, "%d: func: '%s', func hints=0x%X\n", i, opfunc->info->name,opfunc->info->hint);

	Instruction op_intr = bcontext.code[i];

	if(PrintRunOpCodes) {
		builder.CreateCall(decl->func("vm_print_OP"), {bcontext.func_L, bcontext.func_cl,
																											 llvm::ConstantInt::get(context, llvm::APInt(32, op_intr)),
																											 llvm::ConstantInt::get(context, llvm::APInt(32, i))});
	}

	if(RunOpCodeStats)
	{
		builder.CreateCall(decl->func("vm_count_OP"), llvm::ConstantInt::get(context, llvm::APInt(32, op_intr)));
	}

	if(DebugOpCodes)
	{
		/* vm_next_OP function is used to call count/line debug hooks. */
		builder.CreateCall(decl->func("vm_next_OP"), {bcontext.func_L, bcontext.func_cl, llvm::ConstantInt::get(context, llvm::APInt(32, i))});
	}
}

std::unique_ptr<llvm::Module> LLVMCompiler::Compile(llvm::LLVMContext& context, VMModule& vm_module, lua_State *L, Proto *p)
{
	auto func_name = GenerateModuleName(p);
	auto module = std::make_unique<llvm::Module>(func_name, context);
	auto decl = vm_module.PrepareForwardDeclarations(module.get());

  CompileSingleProto(context, vm_module, module.get(), decl.get(), L, p);

	for (int i = 0; i < p->sizep; ++i)
	{
		Compile(context, vm_module, L, p->p[i]);
	}

	if (dump_compiled)
	{
		llvm::errs() << *module;
	}

	return std::move(module);
}

void LLVMCompiler::CompileSingleProto(llvm::LLVMContext& context, VMModule& vm_module, llvm::Module* module, VMModuleForwardDecl* decl, lua_State* L, Proto* p)
{
	BuildContext bcontext;

	bcontext.code = p->code;
	bcontext.k = p->k;
	bcontext.code_len = p->sizecode;

	llvm::BasicBlock *true_block = nullptr;
	llvm::BasicBlock *false_block = nullptr;
	llvm::BasicBlock *current_block = nullptr;
	llvm::Value* brcond = nullptr;
	std::vector<llvm::CallInst *> inlineList;
	bool inline_call = false;

	llvm::IRBuilder builder(context);

#ifndef COCO_DISABLE
	// Don't run the JIT from a coroutine.
	if(!luaCOCO_mainthread(L)) {
		return;
	}
#endif

	ResizeOpcodeData(bcontext.code_len);


  auto func_name = GenerateFunctionName(p);

  llvm::Function* func = llvm::Function::Create(vm_module.t_lua_func, llvm::Function::ExternalLinkage, func_name, module);
	// name arg1 = "L"
	bcontext.func_L = func->arg_begin();
	bcontext.func_L->setName("L");

	// entry block
	llvm::BasicBlock* entry_block = llvm::BasicBlock::Create(context,"entry", func);
	builder.SetInsertPoint(entry_block);

	// get LClosure & constants.
//  auto a = vm_module.func("vm_get_current_closure");
	auto a = decl->func("vm_get_current_closure");
	bcontext.func_cl = builder.CreateCall(a, bcontext.func_L);
	bcontext.func_k = builder.CreateCall(decl->func("vm_get_current_constants"), bcontext.func_cl);

	inlineList.push_back(bcontext.func_cl);
	inlineList.push_back(bcontext.func_k);

	// find all jump/branch destinations and create a new basic block at that opcode.
	// also build hints for some opcodes.
	FindBasicBlockPoints(context, builder, bcontext);

	// pre-create basic blocks.
	PreCreateBasicBlocks(context, func, bcontext);

	// branch "entry" to first block.
	if(need_op_block[0]) {
		builder.CreateBr(op_blocks[0]);
	} else {
		current_block = entry_block;
	}

	// gen op calls.
	for (int i = 0; i < bcontext.code_len; ++i)
	{
		if (op_blocks[i] != nullptr)
		{
			if(current_block) {
				// add branch to new block.
				builder.CreateBr(op_blocks[i]);
			}
			builder.SetInsertPoint(op_blocks[i]);
			current_block = op_blocks[i];
		}

		// skip dead unreachable code.
		if (current_block == nullptr) {
			if (strip_code) bcontext.strip_ops++;
			continue;
		}

		int branch = i + 1;
		Instruction op_intr = bcontext.code[i];
		int opcode = GET_OPCODE(op_intr);
		// combined multiple simple ops into one call.
		if(op_hints[i] & HINT_MINI_VM) {
			int op_count = 1;
			// count mini ops and check for any branch end-points.
			while(is_mini_vm_op(GET_OPCODE(bcontext.code[i + op_count])) &&
					(op_hints[i + op_count] & HINT_SKIP_OP) == 0) {
				// branch end-point in middle of mini ops block.
				if(need_op_block[i + op_count]) {
					op_hints[i + op_count] |= HINT_MINI_VM; // mark start of new mini vm ops.
					break;
				}
				op_count++;
			}
			if(op_count >= 3) {
				// large block of mini ops add function call to vm_mini_vm()
        builder.CreateCall(decl->func("vm_mini_vm"), {
						bcontext.func_L, bcontext.func_cl,
            llvm::ConstantInt::get(context, llvm::APInt(32,op_count)),
            llvm::ConstantInt::get(context, llvm::APInt(32,i - bcontext.strip_ops))
        });
				if(strip_code && bcontext.strip_ops > 0) {
					while(op_count > 0) {
						bcontext.code[i - bcontext.strip_ops] = bcontext.code[i];
						i++;
						op_count--;
					}
				} else {
					i += op_count;
				}
				i--;
				continue;
			} else {
				// mini ops block too small.
				op_hints[i] &= ~(HINT_MINI_VM);
			}
		}

		auto opfunc = decl->op_func(opcode, op_hints[i]);

		if (OpCodeStats)
		{
			opcode_stats[opcode]++;
		}

		InsertDebugCalls(decl, context, builder, bcontext, i);

		if (op_hints[i] & HINT_SKIP_OP)
		{
			if (strip_code) bcontext.strip_ops++;
			continue;
		}

		if (strip_code)
		{
			// strip all opcodes.
			bcontext.strip_ops++;
			if (bcontext.strip_ops > 0 && bcontext.strip_ops < (i+1))
			{
				// move opcodes we want to keep to new position.
				bcontext.code[(i+1) - bcontext.strip_ops] = op_intr;
			}
		}
		// setup arguments for opcode function.
		auto func_info = opfunc->info;
		if (func_info == nullptr)
		{
			fprintf(stderr, "Error missing vm_OP_* function for opcode: %d\n", opcode);
			return;
		}

		// special handling of OP_FORLOOP
		if (opcode == OP_FORLOOP)
		{
			llvm::BasicBlock *loop_test;
			llvm::BasicBlock *prep_block;
			llvm::BasicBlock *incr_block;
			llvm::Value *init,*step,*idx_var,*cur_idx,*next_idx;
			llvm::PHINode *PN;

			OPValues* vals = op_values[i].get();
			if (vals != nullptr)
			{
				// get init value from forprep block
				init = vals->get(0);
				// get for loop 'idx' variable.
				step = vals->get(2);
				idx_var = vals->get(3);

				assert(idx_var != nullptr);
				incr_block = current_block;
				// init->getType() is not an error here. Since we need same type as init for phi node
				cur_idx = builder.CreateLoad(init->getType(), idx_var);
				if(op_hints[i] & HINT_USE_LONG) {
					next_idx = builder.CreateAdd(cur_idx, step, "next_idx");
				} else {
					next_idx = builder.CreateFAdd(cur_idx, step, "next_idx");
				}
				builder.CreateStore(next_idx, idx_var); // store 'for_init' value.
				// create extra BasicBlock for vm_OP_FORLOOP_*
        char name_buf[128];
				snprintf(name_buf,128,"op_block_%s_%d_loop_test",luaP_opnames[opcode],i);
				loop_test = llvm::BasicBlock::Create(context, name_buf, func);
				// create unconditional jmp from current block to loop test block
				builder.CreateBr(loop_test);
				// create unconditional jmp from forprep block to loop test block
				prep_block = op_blocks[branch + GETARG_sBx(op_intr) - 1];
				builder.SetInsertPoint(prep_block);
				builder.CreateBr(loop_test);
				// set current_block to loop_test block
				current_block = loop_test;
				builder.SetInsertPoint(current_block);
				// Emit merge block
				if(op_hints[i] & HINT_USE_LONG) {
					PN = builder.CreatePHI(vm_module.t_int64, 2, "idx");
				} else {
					PN = builder.CreatePHI(vm_module.t_double, 2, "idx");
				}
				PN->addIncoming(init, prep_block);
				PN->addIncoming(next_idx, incr_block);
				vals->set(0, PN);
			}
		}

		auto args = GetOpCallArgs(context, func_info, bcontext, i);
		llvm::CallInst* call = nullptr;
		// create call to opcode function.
		if(func_info->ret_type != VAR_T_VOID)
		{
			call = builder.CreateCall(opfunc->func, args, "retval");
		}
		else
		{
			call = builder.CreateCall(opfunc->func, args);
		}

		inline_call = false;
		// handle retval from opcode function.
		switch (opcode) {
			case OP_LOADBOOL:
				// check C operand if C!=0 then skip over the next op_block.
				if(GETARG_C(op_intr) != 0) branch += 1;
				else branch = BRANCH_NONE;
				inline_call = true;
				break;
			case OP_LOADK:
			case OP_LOADNIL:
			case OP_GETGLOBAL:
			case OP_GETTABLE:
			case OP_SETGLOBAL:
			case OP_SETTABLE:
			case OP_NEWTABLE:
			case OP_SELF:
			case OP_ADD:
			case OP_SUB:
			case OP_MUL:
			case OP_DIV:
			case OP_MOD:
			case OP_POW:
			case OP_UNM:
			case OP_NOT:
			case OP_LEN:
			case OP_CONCAT:
			case OP_GETUPVAL:
			case OP_MOVE:
				inline_call = true;
				branch = BRANCH_NONE;
				break;
			case OP_CLOSE:
			case OP_SETUPVAL:
				inline_call = false;
				branch = BRANCH_NONE;
				break;
			case OP_VARARG:
			case OP_CALL:
				branch = BRANCH_NONE;
				break;
			case OP_TAILCALL:
				//call->setTailCall(true);
				brcond=call;
				brcond=builder.CreateICmpNE(brcond,
																		llvm::ConstantInt::get(context, llvm::APInt(32, PCRTAILRECUR)), "brcond");
				i++; // skip return opcode.
				false_block = op_blocks[0]; // branch to start of function if this is a recursive tail-call.
				true_block = op_blocks[i]; // branch to return instruction if not recursive.
				builder.CreateCondBr(brcond, true_block, false_block);
				builder.SetInsertPoint(op_blocks[i]);
				builder.CreateRet(call);
				current_block = NULL; // have terminator
				branch = BRANCH_NONE;
				break;
			case OP_JMP:
				// always branch to the offset stored in operand sBx
				branch += GETARG_sBx(op_intr);
				// call vm_OP_JMP just in case luai_threadyield is defined.
				inline_call = true;
				break;
			case OP_EQ:
			case OP_LT:
			case OP_LE:
			case OP_TEST:
			case OP_TESTSET:
				inline_call = true;
			case OP_TFORLOOP:
				brcond=call;
				brcond=builder.CreateICmpNE(brcond, llvm::ConstantInt::get(context, llvm::APInt(32, 0)), "brcond");
				false_block=op_blocks[branch+1];
				/* inlined JMP op. */
				branch = ++i + 1;
				if(strip_code) {
					bcontext.strip_ops++;
					if (bcontext.strip_ops > 0 && bcontext.strip_ops < (i+1))
					{
						// move opcodes we want to keep to new position.
						bcontext.code[(i+1) - bcontext.strip_ops] = bcontext.code[i];
					}
				}
				op_intr = bcontext.code[i];
				branch += GETARG_sBx(op_intr);
				true_block = op_blocks[branch];
				branch = BRANCH_COND; // do conditional branch
				break;
			case OP_FORLOOP: {
				llvm::Function* set_func = decl->func("vm_set_number");
				llvm::CallInst* call2;

				inline_call = true;
				brcond = call;
				brcond = builder.CreateICmpNE(brcond, llvm::ConstantInt::get(context, llvm::APInt(32, 0)), "brcond");
				true_block = op_blocks[branch + GETARG_sBx(op_intr)];
				false_block = op_blocks[branch];
				branch = BRANCH_COND; // do conditional branch

				// update external index if needed.
				OPValues* vals = op_values[i].get();

				if (vals != nullptr)
				{
					llvm::BasicBlock *idx_block;
					if(op_hints[i] & HINT_USE_LONG) {
						set_func = decl->func("vm_set_long");
					}
					// create extra BasicBlock
          char name_buf[128];
					snprintf(name_buf,128,"op_block_%s_%d_set_for_idx",luaP_opnames[opcode],i);
					idx_block = llvm::BasicBlock::Create(context, name_buf, func);
					builder.SetInsertPoint(idx_block);
					// copy idx value to Lua-stack.
					call2=builder.CreateCall(set_func, {bcontext.func_L,
																							llvm::ConstantInt::get(context, llvm::APInt(32,(GETARG_A(op_intr) + 3))), vals->get(0)});
					inlineList.push_back(call2);
					// create jmp to true_block
					builder.CreateBr(true_block);
					true_block = idx_block;
					builder.SetInsertPoint(current_block);
				}
				break;
			}
			case OP_FORPREP: {
				llvm::Function* get_func = decl->func("vm_get_number");
				llvm::Value *idx_var,*init;
				llvm::CallInst *call2;

				//inline_call = true;
				op_blocks[i] = current_block;
				branch += GETARG_sBx(op_intr);
				OPValues* vals = op_values[branch].get();
				// if no saved value, then use slow method.
				if(vals == NULL) break;
				if(op_hints[branch] & HINT_USE_LONG)
				{
					get_func = decl->func("vm_get_long");
				}
				// get non-constant init from Lua stack.
				if (vals->get(0) == nullptr)
				{
					call2 = builder.CreateCall(get_func, {bcontext.func_L,
																							llvm::ConstantInt::get(context, llvm::APInt(32,(GETARG_A(op_intr) + 0)))}, "for_init");
					inlineList.push_back(call2);
					vals->set(0, call2);
				}
				init = vals->get(0);
				// get non-constant limit from Lua stack.
				if (vals->get(1) == nullptr)
				{
					call2 = builder.CreateCall(get_func, {bcontext.func_L,
																							llvm::ConstantInt::get(context, llvm::APInt(32,(GETARG_A(op_intr) + 1)))}, "for_limit");
					inlineList.push_back(call2);
					vals->set(1, call2);
				}
				// get non-constant step from Lua stack.
				if (vals->get(2) == nullptr)
				{
					call2 = builder.CreateCall(get_func, {bcontext.func_L,
																							llvm::ConstantInt::get(context, llvm::APInt(32,(GETARG_A(op_intr) + 2)))}, "for_step");
					inlineList.push_back(call2);
					vals->set(2, call2);
				}
				// get for loop 'idx' variable.
				assert(vals->get(3) != nullptr);
				idx_var = vals->get(3);
				builder.CreateStore(init, idx_var); // store 'for_init' value.
				vals->set(0, init);
				current_block = nullptr; // have terminator
				branch = BRANCH_NONE;
				break;
			}
			case OP_SETLIST:
				// if C == 0, then next code value is used as ARG_C.
				if(GETARG_C(op_intr) == 0) {
					i++;
				}
				branch = BRANCH_NONE;
				break;
			case OP_CLOSURE: {
				Proto *p2 = p->p[GETARG_Bx(op_intr)];
				int nups = p2->nups;
				if(strip_code && bcontext.strip_ops > 0) {
					while(nups > 0) {
						i++;
						bcontext.code[i - bcontext.strip_ops] = bcontext.code[i];
						nups--;
					}
				} else {
					i += nups;
				}
				branch = BRANCH_NONE;
				break;
			}
			case OP_RETURN: {
				call->setTailCall(true);
				builder.CreateRet(call);
				branch = BRANCH_NONE;
				current_block = NULL; // have terminator
				break;
			}
			default:
				fprintf(stderr, "Bad opcode: opcode=%d\n", opcode);
				break;
		}

		if(OptLevel > 0 && inline_call && !DontInlineOpcodes) {
			inlineList.push_back(call);
		}

		// branch to next block.
		if (branch >= 0 && branch < bcontext.code_len)
		{
			builder.CreateBr(op_blocks[branch]);
			current_block = nullptr; // have terminator
		} else if(branch == BRANCH_COND) {
			builder.CreateCondBr(brcond, true_block, false_block);
			current_block = nullptr; // have terminator
		}
	}

	// strip Lua bytecode and debug info.
	if (strip_code && bcontext.strip_ops > 0)
	{
		bcontext.code_len -= bcontext.strip_ops;
		luaM_reallocvector(L, p->code, p->sizecode, bcontext.code_len, Instruction);
		p->sizecode = bcontext.code_len;
		luaM_reallocvector(L, p->lineinfo, p->sizelineinfo, 0, int);
		p->sizelineinfo = 0;
		luaM_reallocvector(L, p->locvars, p->sizelocvars, 0, LocVar);
		p->sizelocvars = 0;
		luaM_reallocvector(L, p->upvalues, p->sizeupvalues, 0, TString *);
		p->sizeupvalues = 0;
	}

	// only run function inliner & optimization passes on same functions.
	if (OptLevel > 0 && !DontInlineOpcodes)
  {
		llvm::InlineFunctionInfo IFI;
		for (std::vector<llvm::CallInst *>::iterator I=inlineList.begin(); I != inlineList.end() ; I++)
    {
			llvm::InlineFunction(**I, IFI);
		}
	}
}

}	// namespace as
