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
#include "lua_ftree.h"

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

llvm::Constant* LuaLLVMCompiler::findConstantInCodeAbove(llvm::LLVMContext& context, BuildContext& bcontext, int fromInstruction, int reg)
{
    for (int i = 1; (fromInstruction - i) >= 0; ++i)
    {
        const int instructionSlot = fromInstruction - i;
        const Instruction insruction = bcontext.code[instructionSlot];
        const int opcode = GET_OPCODE(insruction);

        const int RA = GETARG_A(insruction);

        // check for jmp end-point.
        if (need_op_block[instructionSlot])
        {
            break;
        }

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
        // else if (opcode == OP_MOVE)
        // {
        //     const int RB = GETARG_B(insruction);
        //     return findConstantInCodeAbove(context, bcontext, instructionSlot, RB);
        // }
        else
        {
            break;
        }
    }

    return nullptr;
}

llvm::Constant* LuaLLVMCompiler::getConstantIfNumeric(llvm::LLVMContext& context, BuildContext& bcontext, int arg)
{
    TValue* luaConst = bcontext.k + INDEXK(arg);
    if (ttisnumber(luaConst))
    {
        const lua_Number number = nvalue(luaConst);
        return llvm::ConstantFP::get(context, llvm::APFloat(number));
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
			case OP_ADD: // R(A) := RK(B) + RK(C)
			case OP_SUB:
			case OP_MUL:
			case OP_DIV:
			case OP_MOD:
			case OP_POW:
			    {
		            const int R_OP[2] = {GETARG_B(instruction), GETARG_C(instruction)};
    		        auto opVals = std::make_unique<OPValues>(2);
                    int countConst = 0;
		            for (int op = 0; op < 2; ++op)
		            {
		                llvm::Constant* llvmConst = nullptr;
		                if (ISK(R_OP[op]))
		                {
		                    llvmConst = getConstantIfNumeric(context, bcontext, R_OP[op]);
		                }

		                if (llvmConst)
		                {
		                    countConst++;
		                }

		                opVals->set(op, llvmConst);
		            }

			        op_values[i] = std::move(opVals);

		            op_hints[i] |= HINT_NO_OPCODE_FUNC;
			        if (countConst == 2)
			        {
			            op_hints[i] |= HINT_NUMERIC_ARITH;
			        }
			    }
				break;
			default:
				break;
		}
		// update local variable type hints.
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
std::vector<llvm::Value*> LuaLLVMCompiler::getOpCallArgs(llvm::LLVMContext& context, const VmFuncInfo* func_info, BuildContext& bcontext, const int i)
{
	std::vector<llvm::Value*> args;

	const Instruction instruction = bcontext.code[i];
	const int opcode = GET_OPCODE(instruction);

	for (int x = 0; func_info->params[x] != VAR_T_VOID ; ++x)
	{
		llvm::Value* val = nullptr;

	    if (func_info->params[x] == VAR_T_FUNCITON_TREE)
	    {
	        int y = 9;
	    }

		switch(func_info->params[x])
		{
		    case VAR_T_R_A:
                val = bcontext.localVars[GETARG_A(instruction)];
		        break;
		    case VAR_T_R_A_3: // FORPREP special case
		        val = bcontext.localVars[GETARG_A(instruction) + 3];
	    	    break;
		    case VAR_T_R_B:
		        val = bcontext.localVars[GETARG_B(instruction)];
    		    break;
		    case VAR_T_RK_B:
		        {
		            const int argb = GETARG_B(instruction);
		            val = ISK(argb) ? bcontext.constants[INDEXK(argb)] : bcontext.localVars[argb];
		        }
		        break;
		    case VAR_T_RK_C:
		        {
		            const int argc = GETARG_C(instruction);
		            val = ISK(argc) ? bcontext.constants[INDEXK(argc)] : bcontext.localVars[argc];
		        }
		        break;
		    case VAR_T_CONST_Bx:
		        val = bcontext.constants[INDEXK(GETARG_Bx(instruction))];
    		    break;
		    case VAR_T_FUNCITON_TREE:
		        val = llvm::Constant::getNullValue(llvm::PointerType::get(context, 0));
		        break;
			case VAR_T_ARG_A:
				val = llvm::ConstantInt::get(context, llvm::APInt(32, GETARG_A(instruction)));
				break;
			case VAR_T_ARG_C:
				val = llvm::ConstantInt::get(context, llvm::APInt(32, GETARG_C(instruction)));
				break;
			case VAR_T_ARG_C_FB2INT:
				val = llvm::ConstantInt::get(context, llvm::APInt(32, luaO_fb2int(GETARG_C(instruction))));
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
			case VAR_T_LUA_STATE_PTR:
				val = bcontext.func_L;
				break;
		    case VAR_T_BASE:
		        val = bcontext.base;
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
		    case VAR_T_VOID:
		        fprintf(stderr, "Error: invalid value type!\n");
		        exit(1);
		    default:
				fprintf(stderr, "Error: not implemented!\n");
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

std::shared_ptr<FunctionTreeNode>  LuaLLVMCompiler::compile(
    llvm::LLVMContext& context,
    llvm::Module& module,
    const std::shared_ptr<LuaIR>& lua_ir,
    lua_State *L,
    Proto *proto)
{
    const auto optimizer = std::make_shared<LLVMOptimizer>(&module);
    auto ftree = buildFunctionTree(proto, lua_ir, module);

    сompileAllProtos(context, lua_ir, module, optimizer, L, ftree);

//    dumpFunctionTree(ftree, 0);

    return ftree;
}

void LuaLLVMCompiler::materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit,
    llvm::orc::JITDylib& lib,
    const std::unordered_map<Proto*, std::string>& func_names)
{
    for (auto [proto, func_name] : func_names)
    {
        auto func_addr = llvm::cantFail(jit->lookup(lib, func_name));
        proto->jit_func = func_addr.toPtr<lua_CFunction>();
    }
}

void LuaLLVMCompiler::сompileAllProtos(
    llvm::LLVMContext& context,
    const std::shared_ptr<LuaIR>& lua_ir,
    llvm::Module& module,
    const std::shared_ptr<LLVMOptimizer>& optimizer,
    lua_State* L,
    const std::shared_ptr<FunctionTreeNode>& node)
{
    сompileSingleProto(context, lua_ir, module, optimizer, L, node);

    for (int i = 0; i < node->num_children; ++i)
    {
        сompileAllProtos(context, lua_ir, module, optimizer, L, node->children[i]);
    }
}

void LuaLLVMCompiler::buildArithOp(
    llvm::LLVMContext& context,
    const BuildContext& bcontext,
    llvm::IRBuilder<>& builder,
    const std::shared_ptr<LuaIR>& lua_ir,
    llvm::Function* func,
    const int i)
{
    const Instruction instruction = bcontext.code[i];
    const int opcode = GET_OPCODE(instruction);

    llvm::Function* num_func = lua_ir->vm_num_f[opcode];
    const int RA = GETARG_A(instruction);
    const int RB = GETARG_B(instruction);
    const int RC = GETARG_C(instruction);

    if (op_values[i]->get(0) && op_values[i]->get(1))
    {
        llvm::Value* result = builder.CreateCall(num_func, {op_values[i]->get(0), op_values[i]->get(1)});
        builder.CreateCall(lua_ir->vm_set_number_f, {bcontext.localVars[RA], result});
        return;
    }

    llvm::BasicBlock* nanBlock = llvm::BasicBlock::Create(context, "nan_block", func);

    llvm::Value* args[2] = {op_values[i]->get(0), op_values[i]->get(1)};
    llvm::BasicBlock* numBlocks[2] = {nullptr, nullptr};
    int regs[2] = {RB, RC};

    for (int n = 0; n < 2; ++n)
    {
        if (args[n] == nullptr)
        {
            llvm::Value* type = builder.CreateCall(lua_ir->vm_get_type_f, {bcontext.localVars[regs[n]]}, "is_number");
            llvm::Value* is_number_bool = builder.CreateICmpEQ(type, llvm::ConstantInt::get(context, llvm::APInt(32, LUA_TNUMBER)));
            numBlocks[n] = llvm::BasicBlock::Create(context, "num_block", func);
            builder.CreateCondBr(is_number_bool, numBlocks[n], nanBlock);
            builder.SetInsertPoint(numBlocks[n]);
            args[n] = builder.CreateCall(lua_ir->vm_get_number_f, {bcontext.localVars[regs[n]]}, "num");
        }
    }

    llvm::Value* result = builder.CreateCall(num_func, {args[0], args[1]});
    builder.CreateCall(lua_ir->vm_set_number_f, {bcontext.localVars[RA], result});

    llvm::Constant* tms_code = llvm::ConstantInt::get(context, llvm::APInt(32, lua_ir->vm_arith_tms_map[opcode]));

    builder.SetInsertPoint(nanBlock);
    builder.CreateCall(lua_ir->vm_arith_f, {
        bcontext.func_L,
        bcontext.base,
        bcontext.func_k,
        bcontext.localVars[RA],
        llvm::ConstantInt::get(context, llvm::APInt(32, RB)),
        llvm::ConstantInt::get(context, llvm::APInt(32, RC)),
        tms_code});

    llvm::BasicBlock* nextBlock = llvm::BasicBlock::Create(context, "next_block", func);
    builder.CreateBr(nextBlock);

    for (int n = 1; n >= 0; --n)
    {
        if (numBlocks[n] != nullptr)
        {
            builder.SetInsertPoint(numBlocks[n]);
            builder.CreateBr(nextBlock);
            break;
        }
    }

    builder.SetInsertPoint(nextBlock);
}

void LuaLLVMCompiler::buildLocalVars(
    llvm::LLVMContext& context,
    BuildContext& bcontext,
    llvm::IRBuilder<>& builder,
    const std::shared_ptr<LuaIR>& lua_ir,
    const Proto* proto)
{
    bcontext.localVars.resize(proto->maxstacksize, nullptr);

    for (int i = 0; i < proto->maxstacksize; ++i)
    {
        const auto shift = llvm::ConstantInt::get(lua_ir->int64_t, llvm::APInt(64, i));

        if (i  < proto->sizelocvars)
        {
            const auto varName = getstr(proto->locvars[i].varname);
            bcontext.localVars[i] = builder.CreateGEP(lua_ir->TValue_t, bcontext.base, shift, varName);
        }
        else
        {
            bcontext.localVars[i] = builder.CreateGEP(lua_ir->TValue_t, bcontext.base, shift, "stack_var");
        }
    }
}

void LuaLLVMCompiler::buildConstants(
    llvm::LLVMContext& context,
    BuildContext& bcontext,
    llvm::IRBuilder<>& builder,
    const std::shared_ptr<LuaIR>& lua_ir,
    const Proto* proto)
{
    bcontext.constants.resize(proto->sizek, nullptr);

    for (int i = 0; i < proto->sizek; ++i)
    {
        const auto shift = llvm::ConstantInt::get(lua_ir->int64_t, llvm::APInt(64, i));
        const auto constName = std::format("const{}", i);
        bcontext.constants[i] = builder.CreateGEP(lua_ir->TValue_t, bcontext.func_k, shift, constName);
    }
}

void LuaLLVMCompiler::сompileSingleProto(
	llvm::LLVMContext& context,
	const std::shared_ptr<LuaIR>& lua_ir,
	llvm::Module& module,
    const std::shared_ptr<LLVMOptimizer>& optimizer,
    lua_State* L,
    const std::shared_ptr<FunctionTreeNode>& node)
{
	BuildContext bcontext;

	bcontext.code = node->proto->code;
	bcontext.k = node->proto->k;
	bcontext.code_len = node->proto->sizecode;

	llvm::BasicBlock *true_block = nullptr;
	llvm::BasicBlock *false_block = nullptr;
	llvm::BasicBlock *current_block = nullptr;
	llvm::Value* brcond = nullptr;

	llvm::IRBuilder builder(context);

	prepareOpcodeData(bcontext.code_len);

	// name arg1 = "L"
	bcontext.func_L = node->function->arg_begin();
	bcontext.func_L->setName("L");

	// entry block
	llvm::BasicBlock* entry_block = llvm::BasicBlock::Create(context,"entry", node->function);
	builder.SetInsertPoint(entry_block);

	// get LClosure & constants.
//  auto a = vm_module.func("vm_get_current_closure");
    bcontext.base = builder.CreateCall(lua_ir->vm_get_current_base_f, bcontext.func_L, "base");
	bcontext.func_cl = builder.CreateCall(lua_ir->vm_get_current_closure_f, bcontext.func_L);
	bcontext.func_k = builder.CreateCall(lua_ir->vm_get_current_constants_f, bcontext.func_cl);

    buildLocalVars(context, bcontext, builder, lua_ir, node->proto);
    buildConstants(context, bcontext, builder, lua_ir, node->proto);

	// find all jump/branch destinations and create a new basic block at that opcode.
	// also build hints for some opcodes.
	findBasicBlockPoints(context, builder, bcontext);

	// pre-create basic blocks.
	preCreateBasicBlocks(context, node->function, bcontext);

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
			continue;
		}

		int branch = i + 1;
		Instruction instruction = bcontext.code[i];
		int opcode = GET_OPCODE(instruction);

	    if (op_hints[i] & HINT_SKIP_OP)
	    {
	        continue;
	    }

		llvm::CallInst* call = nullptr;

	    if (!(op_hints[i] & HINT_NO_OPCODE_FUNC))
	    {
	        auto opfunc = lua_ir->getOpcodeVariant(opcode, op_hints[i]);

	        // setup arguments for opcode function.
	        auto func_info = opfunc->info;
	        if (func_info == nullptr)
	        {
	            fprintf(stderr, "Error missing vm_OP_* function for opcode: %d\n", opcode);
	            return;
	        }

	        auto args = getOpCallArgs(context, func_info, bcontext, i);
	        // create call to opcode function.
	        if (func_info->ret_type != VAR_T_VOID)
	        {
	            call = builder.CreateCall(opfunc->func, args, "retval");
	        }
	        else
	        {
	            call = builder.CreateCall(opfunc->func, args);
	        }
	    }

		// handle retval from opcode function.
		switch (opcode)
		{
			case OP_LOADBOOL:
				// check C operand if C!=0 then skip over the next op_block.
				if(GETARG_C(instruction) != 0) branch += 1;
				else branch = BRANCH_NONE;
				break;
		    case OP_ADD:
            case OP_SUB:
            case OP_MUL:
            case OP_DIV:
            case OP_MOD:
            case OP_POW:
		        {
		            buildArithOp(context, bcontext, builder, lua_ir, node->function, i);
    		        branch = BRANCH_NONE;
		        }
		        break;
			case OP_LOADK:
			case OP_LOADNIL:
			case OP_GETGLOBAL:
			case OP_GETTABLE:
			case OP_SETGLOBAL:
			case OP_SETTABLE:
			case OP_NEWTABLE:
			case OP_SELF:
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
			    int child_id = GETARG_Bx(instruction);

			    Proto *p2 = node->proto->p[child_id];
			    int nups = p2->nups;

			    fillUpValues(node, child_id, bcontext.code + i);

				i += nups;
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

    optimizer->inlineAll(node->function);
    //optimizer->runOptimizationPasses(func);
}

}	// namespace as
