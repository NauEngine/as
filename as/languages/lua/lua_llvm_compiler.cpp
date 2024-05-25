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
#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Support/Timer.h"
#include "llvm/Support/CommandLine.h"
#include <cstdio>
#include <string>
#include <vector>
#include <math.h>

#include "lua_llvm_compiler.h"
#include "lua_ir.h"
#include "lua_core.h"

#include "as/core/core_utils.h"
#include "as/core/llvm_optimizer.h"

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

#define BRANCH_COND -1
#define BRANCH_NONE -2

//===----------------------------------------------------------------------===//
// Lua bytecode to LLVM IR compiler
//===----------------------------------------------------------------------===//

namespace as
{

llvm::Value* LuaLLVMCompiler::getProtoConstant(llvm::LLVMContext& context, TValue *constant)
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

LuaLLVMCompiler::LuaLLVMCompiler()
{

}

LuaLLVMCompiler::~LuaLLVMCompiler()
{

}

void LuaLLVMCompiler::prepareOpcodeData(int codeLen)
{
	op_hints.resize(codeLen);
	op_values.resize(codeLen);
	op_blocks.resize(codeLen);
	need_op_block.resize(codeLen);

	for (int i = 0; i < codeLen; ++i)
	{
		op_hints[i] = HINT_NONE;
		op_values[i] = nullptr;
		op_blocks[i] = nullptr;
		need_op_block[i] = false;
	}
}

std::string LuaLLVMCompiler::generateFunctionName(Proto *p)
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

llvm::Constant* LuaLLVMCompiler::findConstantInCodeAbove(llvm::LLVMContext& context, BuildContext& bcontext, int fromInstruction, int reg)
{
    bool no_jmp_end_point = true;

    for (int i = 1; (fromInstruction - i) >= 0 && no_jmp_end_point; ++i)
    {
        const int instructionSlot = fromInstruction - i;
        const Instruction insruction = bcontext.code[instructionSlot];
        const int opcode = GET_OPCODE(insruction);

        const int RA = GETARG_A(insruction);

        // check for jmp end-point.
        no_jmp_end_point = !(need_op_block[instructionSlot]);

        if (RA != reg)
        {
            continue;
        }

        if (opcode == OP_LOADK)
        {
            const TValue* luaConst = bcontext.k + GETARG_Bx(insruction);
            if (ttisnumber(luaConst))
            {
                const lua_Number number = nvalue(luaConst);
                return llvm::ConstantFP::get(context, llvm::APFloat(number));
            }
        }
        else if (opcode == OP_MOVE)
        {
            const int RB = GETARG_B(insruction);
            return findConstantInCodeAbove(context, bcontext, instructionSlot, RB);
        }
    }

    return nullptr;
}


void LuaLLVMCompiler::findBasicBlockPoints(llvm::LLVMContext& context, llvm::IRBuilder<>& builder, BuildContext& bcontext)
{
	int mini_op_repeat=0;

	for (int i = 0; i < bcontext.code_len; ++i)
	{
		Instruction instruction = bcontext.code[i];
		const int opcode = GET_OPCODE(instruction);
		// combine simple ops into one function call.

	    if (is_mini_vm_op(opcode))
	    {
			mini_op_repeat++;
		}
	    else
	    {
			if (mini_op_repeat >= 3 && OptLevel > 1)
			{
				op_hints[i - mini_op_repeat] |= HINT_MINI_VM;
			}

			mini_op_repeat = 0;
		}

		switch (opcode)
		{
			case OP_LOADBOOL:
				{
					int branch = i + 1;
					// check C operand if C!=0 then skip over the next op_block.
					if(GETARG_C(instruction) != 0)
						++branch;
					need_op_block[branch] = true;
				}
				break;
			case OP_LOADK:
			    {
			        // check if arg Bx is a number constant.
			        TValue *rb = bcontext.k + INDEXK(GETARG_Bx(instruction));
			        if(ttisnumber(rb)) op_hints[i] |= HINT_Bx_NUM_CONSTANT;
			    }
				break;
			case OP_JMP:
				{
					// always branch to the offset stored in operand sBx
					int branch = i + 1 + GETARG_sBx(instruction);
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
			case OP_TEST:
			case OP_TESTSET:
			case OP_TFORLOOP:
				{
					const int branch = ++i + 1;
					instruction = bcontext.code[i];
					need_op_block[branch + GETARG_sBx(instruction)] = true; /* inline JMP op. */
					need_op_block[branch] = true;
				}
				break;
			case OP_FORLOOP:
				{
					int branch = i + 1;
					need_op_block[branch] = true;
					branch += GETARG_sBx(instruction);
					need_op_block[branch] = true;
				}
				break;
			case OP_FORPREP:
				{
					const int branch = i + 1 + GETARG_sBx(instruction);
					need_op_block[branch] = true;
					need_op_block[branch + 1] = true;

			        // find three args of OP_FORPREP
			        const int RA = GETARG_A(instruction);
			        auto opVals = std::make_unique<OPValues>(4);
			        bool allConstants = true;

			        for (int r = 0; r < 3; ++r)
			        {
			            const auto llvmConst = findConstantInCodeAbove(context, bcontext, i, RA + r);
			            opVals->set(r, llvmConst);
			            allConstants &= (llvmConst != nullptr);
			        }

			        opVals->set(3, builder.CreateAlloca(llvm::Type::getDoubleTy(context), nullptr, "for_idx"));

			        if (allConstants)
			        {
			            op_hints[branch] = HINT_FOR_CONST;
			        }

					op_values[branch] = std::move(opVals);
				}
				break;
			case OP_SETLIST:
				// if C == 0, then next code value is count value.
				if(GETARG_C(instruction) == 0) {
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
				if(ISK(GETARG_C(instruction))) {
					TValue *rc = bcontext.k + INDEXK(GETARG_C(instruction));
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

void LuaLLVMCompiler::preCreateBasicBlocks(llvm::LLVMContext& context, llvm::Function* func, BuildContext& bcontext)
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
std::vector<llvm::Value*> LuaLLVMCompiler::getOpCallArgs(llvm::LLVMContext& context, const vm_func_info* func_info, BuildContext& bcontext, const int i)
{
	std::vector<llvm::Value*> args;

	const Instruction instruction = bcontext.code[i];
	const int opcode = GET_OPCODE(instruction);

	for (int x = 0; func_info->params[x] != VAR_T_VOID ; ++x)
	{
		llvm::Value* val = nullptr;

		switch(func_info->params[x])
		{
			case VAR_T_ARG_A:
				val = llvm::ConstantInt::get(context, llvm::APInt(32, GETARG_A(instruction)));
				break;
			case VAR_T_ARG_C:
				val = llvm::ConstantInt::get(context, llvm::APInt(32, GETARG_C(instruction)));
				break;
			case VAR_T_ARG_C_FB2INT:
				val = llvm::ConstantInt::get(context, llvm::APInt(32, luaO_fb2int(GETARG_C(instruction))));
				break;
			case VAR_T_ARG_Bx_NUM_CONSTANT:
				val = getProtoConstant(context, bcontext.k + INDEXK(GETARG_Bx(instruction)));
				break;
			case VAR_T_ARG_C_NUM_CONSTANT:
				val = getProtoConstant(context, bcontext.k + INDEXK(GETARG_C(instruction)));
				break;
			case VAR_T_ARG_C_NEXT_INSTRUCTION: {
				int c = GETARG_C(instruction);
				// if C == 0, then next code value is used as ARG_C.
				if (c == 0)
				{
					if ((i+1) < bcontext.code_len)
					{
						c = bcontext.code[i + 1];
						if(m_stripCode) bcontext.strip_ops++;
					}
				}
				val = llvm::ConstantInt::get(context, llvm::APInt(32,c));
				break;
			}
			case VAR_T_ARG_B:
				val = llvm::ConstantInt::get(context, llvm::APInt(32, GETARG_B(instruction)));
				break;
			case VAR_T_ARG_B_FB2INT:
				val = llvm::ConstantInt::get(context, llvm::APInt(32, luaO_fb2int(GETARG_B(instruction))));
				break;
			case VAR_T_ARG_Bx:
				val = llvm::ConstantInt::get(context, llvm::APInt(32, GETARG_Bx(instruction)));
				break;
			case VAR_T_ARG_sBx:
				val = llvm::ConstantInt::get(context, llvm::APInt(32, GETARG_sBx(instruction)));
				break;
			case VAR_T_PC_OFFSET:
				val = llvm::ConstantInt::get(context, llvm::APInt(32,i + 1 - bcontext.strip_ops));
				break;
			case VAR_T_INSTRUCTION:
				val = llvm::ConstantInt::get(context, llvm::APInt(32,instruction));
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
				if(op_values[i]) val = op_values[i]->get(0);
				break;
			case VAR_T_OP_VALUE_1:
				if(op_values[i]) val = op_values[i]->get(1);
				break;
			case VAR_T_OP_VALUE_2:
				if(op_values[i]) val = op_values[i]->get(2);
				break;
			default:
				fprintf(stderr, "Error: not implemented!\n");
				exit(1);
			case VAR_T_VOID:
				fprintf(stderr, "Error: invalid value type!\n");
				exit(1);
		}

		if (val == nullptr)
		{
			fprintf(stderr, "Error: Missing parameter '%d' for this opcode(%d) function=%s!\n", x,
							opcode, func_info->name);
			exit(1);
		}

		args.push_back(val);
	}

	return args;
}

void LuaLLVMCompiler::compile(
    llvm::orc::ThreadSafeContext ts_context,
    const std::shared_ptr<llvm::orc::LLJIT>& jit,
    const std::shared_ptr<LuaIR>& lua_ir,
    lua_State *L,
    Proto *p)
{
    llvm::LLVMContext& context = *ts_context.getContext();
	auto module_name = utils::generateModuleName(getstr(p->source));
	auto module = std::make_unique<llvm::Module>(module_name, context);

    auto optimizer = std::make_shared<LLVMOptimizer>(module.get());

    std::unordered_map<Proto*, std::string> func_names;

    сompileAllProtos(context, lua_ir, module.get(), optimizer, L, p, func_names);

	if (m_dumpCompiled)
	{
		llvm::errs() << *module;
	}

    llvm::cantFail(jit->addIRModule({std::move(module), ts_context}));

    for (auto [proto, func_name] : func_names)
    {
        auto func_addr = llvm::cantFail(jit->lookup(func_name));
        proto->jit_func = func_addr.toPtr<lua_CFunction>();
    }
}

void LuaLLVMCompiler::сompileAllProtos(
    llvm::LLVMContext& context,
    const std::shared_ptr<LuaIR>& lua_ir,
    llvm::Module* module,
    const std::shared_ptr<LLVMOptimizer>& optimizer,
    lua_State* L,
    Proto* p,
    std::unordered_map<Proto*, std::string>& func_names)
{
    const auto func_name = generateFunctionName(p);
    func_names[p] = func_name;
    сompileSingleProto(context, lua_ir, module, optimizer, L, p, func_name);

    for (int i = 0; i < p->sizep; ++i)
    {
        сompileAllProtos(context, lua_ir, module, optimizer, L, p->p[i], func_names);
    }
}


void LuaLLVMCompiler::сompileSingleProto(
	llvm::LLVMContext& context,
	const std::shared_ptr<LuaIR>& lua_ir,
	llvm::Module* module,
    const std::shared_ptr<LLVMOptimizer>& optimizer,
    lua_State* L,
	Proto* p,
	const std::string& func_name)
{
	BuildContext bcontext;

	bcontext.code = p->code;
	bcontext.k = p->k;
	bcontext.code_len = p->sizecode;

	llvm::BasicBlock *true_block = nullptr;
	llvm::BasicBlock *false_block = nullptr;
	llvm::BasicBlock *current_block = nullptr;
	llvm::Value* brcond = nullptr;

	llvm::IRBuilder builder(context);

	prepareOpcodeData(bcontext.code_len);

	llvm::Function* func = llvm::Function::Create(lua_ir->lua_func_t, llvm::Function::ExternalLinkage, func_name, module);
	// name arg1 = "L"
	bcontext.func_L = func->arg_begin();
	bcontext.func_L->setName("L");

	// entry block
	llvm::BasicBlock* entry_block = llvm::BasicBlock::Create(context,"entry", func);
	builder.SetInsertPoint(entry_block);

	// get LClosure & constants.
//  auto a = vm_module.func("vm_get_current_closure");
	bcontext.func_cl = builder.CreateCall(lua_ir->vm_get_current_closure_f, bcontext.func_L);
	bcontext.func_k = builder.CreateCall(lua_ir->vm_get_current_constants_f, bcontext.func_cl);

	// find all jump/branch destinations and create a new basic block at that opcode.
	// also build hints for some opcodes.
	findBasicBlockPoints(context, builder, bcontext);

	// pre-create basic blocks.
	preCreateBasicBlocks(context, func, bcontext);

	// branch "entry" to first block.
	if (need_op_block[0])
	{
		builder.CreateBr(op_blocks[0]);
	}
    else
    {
		current_block = entry_block;
	}

	// gen op calls.
	for (int i = 0; i < bcontext.code_len; ++i)
	{
		if (op_blocks[i] != nullptr)
		{
			if (current_block)
			{
				// add branch to new block.
				builder.CreateBr(op_blocks[i]);
			}
			builder.SetInsertPoint(op_blocks[i]);
			current_block = op_blocks[i];
		}

		// skip dead unreachable code.
		if (current_block == nullptr)
		{
			if (m_stripCode) bcontext.strip_ops++;
			continue;
		}

		int branch = i + 1;
		Instruction instruction = bcontext.code[i];
		int opcode = GET_OPCODE(instruction);
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
                builder.CreateCall(lua_ir->vm_mini_vm_f, {
                    bcontext.func_L,
                    bcontext.func_cl,
                    llvm::ConstantInt::get(context, llvm::APInt(32,op_count)),
                    llvm::ConstantInt::get(context, llvm::APInt(32,i - bcontext.strip_ops))
                });

				if(m_stripCode && bcontext.strip_ops > 0) {
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

		auto opfunc = lua_ir->getOpcodeVariant(opcode, op_hints[i]);

		if (op_hints[i] & HINT_SKIP_OP)
		{
			if (m_stripCode) bcontext.strip_ops++;
			continue;
		}

		if (m_stripCode)
		{
			// strip all opcodes.
			bcontext.strip_ops++;
			if (bcontext.strip_ops > 0 && bcontext.strip_ops < (i+1))
			{
				// move opcodes we want to keep to new position.
				bcontext.code[(i+1) - bcontext.strip_ops] = instruction;
			}
		}

		// setup arguments for opcode function.
		auto func_info = opfunc->info;
		if (func_info == nullptr)
		{
			fprintf(stderr, "Error missing vm_OP_* function for opcode: %d\n", opcode);
			return;
		}

		auto args = getOpCallArgs(context, func_info, bcontext, i);
		llvm::CallInst* call = nullptr;
		// create call to opcode function.
		if (func_info->ret_type != VAR_T_VOID)
		{
			call = builder.CreateCall(opfunc->func, args, "retval");
		}
		else
		{
			call = builder.CreateCall(opfunc->func, args);
		}

		// handle retval from opcode function.
		switch (opcode) {
			case OP_LOADBOOL:
				// check C operand if C!=0 then skip over the next op_block.
				if(GETARG_C(instruction) != 0) branch += 1;
				else branch = BRANCH_NONE;
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
				branch = BRANCH_NONE;
				break;
			case OP_CLOSE:
			case OP_SETUPVAL:
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
				branch += GETARG_sBx(instruction);
				// call vm_OP_JMP just in case luai_threadyield is defined.
				break;
			case OP_EQ:
			case OP_LT:
			case OP_LE:
			case OP_TEST:
			case OP_TESTSET:
			case OP_TFORLOOP:
				brcond=call;
				brcond=builder.CreateICmpNE(brcond, llvm::ConstantInt::get(context, llvm::APInt(32, 0)), "brcond");
				false_block=op_blocks[branch+1];
				/* inlined JMP op. */
				branch = ++i + 1;
				if(m_stripCode) {
					bcontext.strip_ops++;
					if (bcontext.strip_ops > 0 && bcontext.strip_ops < (i+1))
					{
						// move opcodes we want to keep to new position.
						bcontext.code[(i+1) - bcontext.strip_ops] = bcontext.code[i];
					}
				}
				instruction = bcontext.code[i];
				branch += GETARG_sBx(instruction);
				true_block = op_blocks[branch];
				branch = BRANCH_COND; // do conditional branch
				break;
			case OP_FORLOOP: {
				brcond = builder.CreateICmpNE(call, llvm::ConstantInt::get(context, llvm::APInt(32, 0)), "brcond");
				true_block = op_blocks[branch + GETARG_sBx(instruction)];
				false_block = op_blocks[branch];
				branch = BRANCH_COND; // do conditional branch

				break;
			}
			case OP_FORPREP: {
				llvm::Function* get_func = lua_ir->vm_get_number_f;
				llvm::Value *idx_var,*init;
				llvm::CallInst *call2;

				op_blocks[i] = current_block;
				branch += GETARG_sBx(instruction);
				break;
			}
			case OP_SETLIST:
				// if C == 0, then next code value is used as ARG_C.
				if(GETARG_C(instruction) == 0) {
					i++;
				}
				branch = BRANCH_NONE;
				break;
			case OP_CLOSURE: {
				Proto *p2 = p->p[GETARG_Bx(instruction)];
				int nups = p2->nups;
				if(m_stripCode && bcontext.strip_ops > 0) {
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
	if (m_stripCode && bcontext.strip_ops > 0)
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

    optimizer->inlineAll(func);
    optimizer->runOptimizationPasses(func);
}

}	// namespace as
