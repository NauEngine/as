//
// Created by Alex Zelenshikov on 02.05.2024.
//

#include "llvm/IR/IRBuilder.h"

#include "as/core/core_utils.h"
#include "bc/lapi_bc.h"

#include "lua_ir.h"

extern "C"
{
#include "lua/lua.h"
#include "lua/lstate.h"
}

namespace as
{

void LuaIR::init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context, lua_State*& lua_state)
{
  llvm::LLVMContext& context = *ts_context.getContext();
  // init lapi bc
  module_lapi = utils::LoadEmbeddedBitcode(context, "lapi_bc", lapi_bc, sizeof(lapi_bc));
  llvm::errs() << *module_lapi;

  // parse types & functions
  int8_t = llvm::Type::getInt8Ty(context);
  int16_t = llvm::Type::getInt16Ty(context);
  int32_t = llvm::Type::getInt32Ty(context);
  int64_t = llvm::Type::getInt64Ty(context);
  void_t = llvm::Type::getVoidTy(context);
  double_t = llvm::Type::getDoubleTy(context);

  lua_State_t = llvm::StructType::getTypeByName(context, "struct.lua_State");
  lua_State_ptr_t = llvm::PointerType::getUnqual(lua_State_t);

  lua_rawgeti_f = module_lapi->getFunction("lua_rawgeti");
  lua_pushinteger_f = module_lapi->getFunction("lua_pushinteger");
  lua_pushnumber_f = module_lapi->getFunction("lua_pushnumber");
  lua_call_f = module_lapi->getFunction("lua_call");
  lua_tointeger_f = module_lapi->getFunction("lua_tointeger");
  lua_tonumber_f = module_lapi->getFunction("lua_tonumber");
  lua_settop_f = module_lapi->getFunction("lua_settop");

  // bound lua_State to global var
  // TODO [AZ] handle errors

  auto error = jit->getMainJITDylib().define(llvm::orc::absoluteSymbols({
    {
      jit->mangleAndIntern(LUA_STATE_GLOBAL_VAR),
      { llvm::orc::ExecutorAddr::fromPtr(&lua_state), llvm::JITSymbolFlags::Exported }
    }
  }));

  if (error)
  {
    llvm::errs() << error;
  }
}

void LuaIR::call_test(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context,
  const std::string& mod)
{
  llvm::LLVMContext& context = *ts_context.getContext();

  auto module = std::make_unique<llvm::Module>(LUA_MAIN_IR_MODULE + mod, context);

  llvm::IRBuilder<> builder(context);
  llvm::Type* int32_t = llvm::Type::getInt32Ty(context);

  llvm::Value* glob_var = new llvm::GlobalVariable(*module, lua_State_ptr_t, false, llvm::GlobalValue::ExternalLinkage,
                                                    nullptr, // external
                                                    LUA_STATE_GLOBAL_VAR);

  llvm::FunctionType* func_type = llvm::FunctionType::get(int32_t, false);
  llvm::Function* func = llvm::Function::Create(func_type, llvm::Function::ExternalLinkage, "foo" + mod, module.get());

  llvm::BasicBlock* block = llvm::BasicBlock::Create(context, "entry", func);
  builder.SetInsertPoint(block);

  llvm::Value* struct_ptr = builder.CreateLoad(lua_State_ptr_t, glob_var);
  llvm::Value* stacksize_field_ptr = builder.CreateStructGEP(lua_State_t, struct_ptr, 13);
  llvm::Value* value = builder.CreateLoad(int32_t, stacksize_field_ptr);

  builder.CreateRet(value);

  llvm::errs() << *module;

  // TODO [AZ] do failsafe
  llvm::cantFail(jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(module), ts_context)));

  auto sym = llvm::cantFail(jit->lookup("foo" + mod));

  auto func_call =  sym.toPtr<int(*)()>();

  llvm::errs() << "Result: " << func_call() << "\n";
  llvm::errs() << "Result: " << func_call() << "\n";
  llvm::errs() << "Result: " << func_call() << "\n";
}

} // namespace as
