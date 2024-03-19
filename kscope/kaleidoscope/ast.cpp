//
// Created by Alex Zelenshikov on 10.11.2023.
//
#include "llvm/ADT/APFloat.h"
#include "llvm/IR/Verifier.h"

#include "ast.h"
#include "interpreter.h"
#include "errors.h"

namespace kscope
{

llvm::Value* NumberExprAST::codegen(Interpreter& interpreter) {
  return llvm::ConstantFP::get(*interpreter.context, llvm::APFloat(value));
}

llvm::Value *VariableExprAST::codegen(Interpreter& interpreter) {
  // Look this variable up in the function.
  llvm::AllocaInst* instance = interpreter.named_values[name];
  if (!instance)
    return LogErrorV("Unknown variable name");

  // Load the value.
  return interpreter.builder->CreateLoad(instance->getAllocatedType(), instance, name.c_str());
}

llvm::Value *BinaryExprAST::codegen(Interpreter& interpreter) {
  // Special case '=' because we don't want to emit the LHS as an expression.
  if (op == '=')
  {
    // Assignment requires the LHS to be an identifier.
    // This assume we're building without RTTI because LLVM builds that way by
    // default.  If you build LLVM with RTTI this can be changed to a
    // dynamic_cast for automatic error checking.
    auto* lhse = dynamic_cast<VariableExprAST *>(lhs.get());
    if (!lhse)
      return LogErrorV("destination of '=' must be a variable");

    // Codegen the RHS.
    llvm::Value* value = rhs->codegen(interpreter);
    if (!value)
      return nullptr;

    // Look up the name.
    llvm::Value* variable = interpreter.named_values[lhse->getName()];
    if (!variable)
      return LogErrorV("Unknown variable name");

    interpreter.builder->CreateStore(value, variable);
    return value;
  }

  llvm::Value* l = lhs->codegen(interpreter);
  llvm::Value* r = rhs->codegen(interpreter);
  if (!l || !r)
    return nullptr;

  switch (op) {
    case '+':
      return interpreter.builder->CreateFAdd(l, r, "addtmp");
    case '-':
      return interpreter.builder->CreateFSub(l, r, "subtmp");
    case '*':
      return interpreter.builder->CreateFMul(l, r, "multmp");
    case '<':
      l = interpreter.builder->CreateFCmpULT(l, r, "cmptmp");
      // Convert bool 0/1 to double 0.0 or 1.0
      return interpreter.builder->CreateUIToFP(l, llvm::Type::getDoubleTy(*interpreter.context), "booltmp");
    default:
      break;
  }

  // If it wasn't a builtin binary operator, it must be a user defined one. Emit
  // a call to it.
  llvm::Function* function = interpreter.GetFunction(std::string("binary") + op);
  assert(function && "binary operator not found!");

  llvm::Value* operands[2] = {l, r};
  return interpreter.builder->CreateCall(function, operands, "binop");
}

llvm::Value *CallExprAST::codegen(Interpreter& interpreter) {
  // Look up the name in the global module table.
  llvm::Function *calleeF = interpreter.GetFunction(callee);
  if (!calleeF)
    return LogErrorV("Unknown function referenced");

  // If argument mismatch error.
  if (calleeF->arg_size() != args.size())
    return LogErrorV("Incorrect # arguments passed");

  std::vector<llvm::Value *> ArgsV;
  for (unsigned i = 0, e = args.size(); i != e; ++i)
  {
    ArgsV.push_back(args[i]->codegen(interpreter));
    if (!ArgsV.back())
      return nullptr;
  }

  return interpreter.builder->CreateCall(calleeF, ArgsV, "calltmp");
}

llvm::Function *PrototypeAST::codegen(Interpreter& interpreter) {
  llvm::Type* type_double = llvm::Type::getDoubleTy(*interpreter.context);

  // Make the function type:  double(double,double) etc.
  std::vector<llvm::Type*> args_double(args.size(), type_double);
  llvm::FunctionType* signature = llvm::FunctionType::get(type_double, args_double, false);

  llvm::Function* function = llvm::Function::Create(signature, llvm::Function::ExternalLinkage, name, interpreter.module.get());

  // Set names for all arguments.
  unsigned i = 0;
  for (auto& arg : function->args())
  {
    arg.setName(args[i++]);
  }

  return function;
}

llvm::Function *FunctionAST::codegen(Interpreter& interpreter) {
  // Transfer ownership of the prototype to the function_protos map, but keep a
  // reference to it for use below.
  auto &P = *proto;
  interpreter.function_protos[proto->getName()] = std::move(proto);
  llvm::Function* function = interpreter.GetFunction(P.getName());
  if (!function)
    return nullptr;

  // If this is an operator, install it.
  if (P.isBinaryOp())
    interpreter.binop_precedence[P.getOperatorName()] = P.getBinaryPrecedence();

  // Create a new basic block to start insertion into.
  llvm::BasicBlock* block = llvm::BasicBlock::Create(*interpreter.context, "entry", function);
  interpreter.builder->SetInsertPoint(block);

  // Record the function arguments in the named_values map.
  interpreter.named_values.clear();
  for (auto &arg : function->args())
  {
    llvm::AllocaInst* alloca = interpreter.CreateEntryBlockAlloca(function, arg.getName().str());

    // Store the initial value into the alloca.
    interpreter.builder->CreateStore(&arg, alloca);

    // Add arguments to variable symbol table.
    interpreter.named_values[std::string(arg.getName())] = alloca;
  }

  if (llvm::Value *RetVal = body->codegen(interpreter)) {
    // Finish off the function.
    interpreter.builder->CreateRet(RetVal);

    // Validate the generated code, checking for consistency.
    verifyFunction(*function);

    // Run the optimizer on the function.
    interpreter.TheFPM->run(*function, *interpreter.TheFAM);

    return function;
  }

  // Error reading body, remove function.
  function->eraseFromParent();
  return nullptr;
}

llvm::Value* IfExprAST::codegen(Interpreter& interpreter)
{
  llvm::Value* cond_value = cond_expr->codegen(interpreter);
  if (!cond_value)
    return nullptr;

  // Convert condition to a bool by comparing non-equal to 0.0.
  cond_value = interpreter.builder->CreateFCmpONE(
      cond_value, llvm::ConstantFP::get(*interpreter.context, llvm::APFloat(0.0)), "ifcond");

  llvm::Function* function = interpreter.builder->GetInsertBlock()->getParent();

  // Create blocks for the then and else cases.  Insert the 'then' block at the
  // end of the function.
  llvm::BasicBlock* then_block = llvm::BasicBlock::Create(*interpreter.context, "then", function);
  llvm::BasicBlock* else_block = llvm::BasicBlock::Create(*interpreter.context, "else");
  llvm::BasicBlock* merge_block = llvm::BasicBlock::Create(*interpreter.context, "ifcont");

  interpreter.builder->CreateCondBr(cond_value, then_block, else_block);

  // Emit then value.
  interpreter.builder->SetInsertPoint(then_block);

  llvm::Value* then_value = then_expr->codegen(interpreter);
  if (!then_value)
    return nullptr;

  interpreter.builder->CreateBr(merge_block);
  // Codegen of 'Then' can change the current block, update ThenBB for the PHI.
  then_block = interpreter.builder->GetInsertBlock();

  // Emit else block.
  function->insert(function->end(), else_block);
  interpreter.builder->SetInsertPoint(else_block);

  llvm::Value* else_value = else_expr->codegen(interpreter);
  if (!else_value)
    return nullptr;

  interpreter.builder->CreateBr(merge_block);
  // Codegen of 'Else' can change the current block, update ElseBB for the PHI.
  else_block = interpreter.builder->GetInsertBlock();

  // Emit merge block.
  function->insert(function->end(), merge_block);
  interpreter.builder->SetInsertPoint(merge_block);
  llvm::PHINode *PN = interpreter.builder->CreatePHI(llvm::Type::getDoubleTy(*interpreter.context), 2, "iftmp");

  PN->addIncoming(then_value, then_block);
  PN->addIncoming(else_value, else_block);
  return PN;
}

// Output for-loop as:
//   var = alloca double
//   ...
//   start = startexpr
//   store start -> var
//   goto loop
// loop:
//   ...
//   bodyexpr
//   ...
// loopend:
//   step = stepexpr
//   endcond = endexpr
//
//   curvar = load var
//   nextvar = curvar + step
//   store nextvar -> var
//   br endcond, loop, endloop
// outloop:
llvm::Value *ForExprAST::codegen(Interpreter& interpreter)
{
  llvm::Function* function = interpreter.builder->GetInsertBlock()->getParent();

  // Create an alloca for the variable in the entry block.
  llvm::AllocaInst* alloca = interpreter.CreateEntryBlockAlloca(function, var_name);

  // Emit the start code first, without 'variable' in scope.
  llvm::Value* start_value = start_expr->codegen(interpreter);
  if (!start_value)
    return nullptr;

  // Store the value into the alloca.
  interpreter.builder->CreateStore(start_value, alloca);

  // Make the new basic block for the loop header, inserting after current
  // block.
  llvm::BasicBlock* loop_block = llvm::BasicBlock::Create(*interpreter.context, "loop", function);

  // Insert an explicit fall through from the current block to the LoopBB.
  interpreter.builder->CreateBr(loop_block);

  // Start insertion in LoopBB.
  interpreter.builder->SetInsertPoint(loop_block);

  // Within the loop, the variable is defined equal to the PHI node.  If it
  // shadows an existing variable, we have to restore it, so save it now.
  llvm::AllocaInst* old_value = interpreter.named_values[var_name];
  interpreter.named_values[var_name] = alloca;

  // Emit the body of the loop.  This, like any other expr, can change the
  // current BB.  Note that we ignore the value computed by the body, but don't
  // allow an error.
  if (!body_expr->codegen(interpreter))
    return nullptr;

  // Emit the step value.
  llvm::Value* step_value = nullptr;
  if (step_expr) {
    step_value = step_expr->codegen(interpreter);
    if (!step_value)
      return nullptr;
  } else {
    // If not specified, use 1.0.
    step_value = llvm::ConstantFP::get(*interpreter.context, llvm::APFloat(1.0));
  }

  // Compute the end condition.
  llvm::Value* end_cond = end_expr->codegen(interpreter);
  if (!end_cond)
    return nullptr;

  // Reload, increment, and restore the alloca.  This handles the case where
  // the body of the loop mutates the variable.
  llvm::Value* curr_var = interpreter.builder->CreateLoad(alloca->getAllocatedType(), alloca, var_name.c_str());
  llvm::Value* next_var = interpreter.builder->CreateFAdd(curr_var, step_value, "nextvar");
  interpreter.builder->CreateStore(next_var, alloca);

  // Convert condition to a bool by comparing non-equal to 0.0.
  end_cond = interpreter.builder->CreateFCmpONE(
      end_cond, llvm::ConstantFP::get(*interpreter.context, llvm::APFloat(0.0)), "loopcond");

  // Create the "after loop" block and insert it.
  llvm::BasicBlock *AfterBB = llvm::BasicBlock::Create(*interpreter.context, "afterloop", function);

  // Insert the conditional branch into the end of LoopEndBB.
  interpreter.builder->CreateCondBr(end_cond, loop_block, AfterBB);

  // Any new code will be inserted in AfterBB.
  interpreter.builder->SetInsertPoint(AfterBB);

  // Restore the unshadowed variable.
  if (old_value)
    interpreter.named_values[var_name] = old_value;
  else
    interpreter.named_values.erase(var_name);

  // for expr always returns 0.0.
  return llvm::Constant::getNullValue(llvm::Type::getDoubleTy(*interpreter.context));
}

llvm::Value* UnaryExprAST::codegen(Interpreter& interpreter)
{
  llvm::Value* operand_value = operand->codegen(interpreter);
  if (!operand_value)
    return nullptr;

  llvm::Function *function = interpreter.GetFunction(std::string("unary") + opcode);
  if (!function)
    return LogErrorV("Unknown unary operator");

  return interpreter.builder->CreateCall(function, operand_value, "unop");
}

  llvm::Value *VarExprAST::codegen(Interpreter& interpreter)
  {
    std::vector<llvm::AllocaInst *> old_bindings;

    llvm::Function* function = interpreter.builder->GetInsertBlock()->getParent();

    // Register all variables and emit their initializer.
    for (unsigned i = 0, e = var_names.size(); i != e; ++i)
    {
      const std::string& var_name = var_names[i].first;
      ExprAST* init_expr = var_names[i].second.get();

      // Emit the initializer before adding the variable to scope, this prevents
      // the initializer from referencing the variable itself, and permits stuff
      // like this:
      //  var a = 1 in
      //    var a = a in ...   # refers to outer 'a'.
      llvm::Value* init_value;
      if (init_expr)
      {
        init_value = init_expr->codegen(interpreter);
        if (!init_value)
          return nullptr;
      }
      else
      { // If not specified, use 0.0.
        init_value = llvm::ConstantFP::get(*interpreter.context, llvm::APFloat(0.0));
      }

      llvm::AllocaInst* alloca = interpreter.CreateEntryBlockAlloca(function, var_name);
      interpreter.builder->CreateStore(init_value, alloca);

      // Remember the old variable binding so that we can restore the binding when
      // we unrecurse.
      old_bindings.push_back(interpreter.named_values[var_name]);

      // Remember this binding.
      interpreter.named_values[var_name] = alloca;
    }

    // Codegen the body, now that all vars are in scope.
    llvm::Value* body_value = body->codegen(interpreter);
    if (!body_value)
      return nullptr;

    // Pop all our variables from scope.
    for (unsigned i = 0, e = var_names.size(); i != e; ++i)
    {
      interpreter.named_values[var_names[i].first] = old_bindings[i];
    }

    // Return the body computation.
    return body_value;
  }

} // end kscope namespace
