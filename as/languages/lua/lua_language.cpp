//
// Created by Alex Zelenshikov on 30.04.2024.
//

#include "llvm/IR/IRBuilder.h"

#include "as/core/cpp_interface_parser.h"
#include "as/core/ir.h"

#include "lua_ir.h"
#include "lua_language.h"
#include "lua_language_script.h"
#include "lua_llvm_compiler.h"

extern "C"
{
#include "lua/lauxlib.h"
#include "lua/lualib.h"
#include "lua/lstate.h"
}

namespace as
{

LuaLanguage::LuaLanguage()
{
    m_lua_state = luaL_newstate();
    luaL_openlibs(m_lua_state);
}

LuaLanguage::~LuaLanguage()
{
    if (m_lua_state)
    {
        lua_close(m_lua_state);
        m_lua_state = nullptr;
    }
}

void LuaLanguage::init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context)
{
    m_jit = std::move(jit);
    m_ts_context = std::move(ts_context);

    m_llvmCompiler = std::make_shared<LuaLLVMCompiler>();
    m_llvmCompiler->setDumpCompiled(false);

    m_lua_ir = std::make_shared<LuaIR>();
    m_lua_ir->init(m_jit, m_ts_context, m_lua_state);
}

std::shared_ptr<ILanguageScript> LuaLanguage::newScript()
{
  return std::make_shared<LuaLanguageScript>(m_lua_state, m_lua_ir, m_llvmCompiler, m_jit, m_ts_context);
}

void LuaLanguage::registerInstance(void* instance, const std::string& instanceName,
  const std::shared_ptr<ScriptInterface>& interface)
{
  if (!m_createdMetatables.contains(interface->name))
  {
    createInterfaceMetatable(interface);
  }

  void** udata = static_cast<void**>(lua_newuserdata(m_lua_state, sizeof(void*)));
  *udata = instance;

  luaL_getmetatable(m_lua_state, interface->name.c_str());
  lua_setmetatable(m_lua_state, -2);

  lua_setglobal(m_lua_state, instanceName.c_str());
}

void LuaLanguage::createInterfaceMetatable(const std::shared_ptr<ScriptInterface>& interface)
{
  llvm::LLVMContext& context = *m_ts_context.getContext();
  auto module_name = ir::native_interface_module_name(prefix(), interface->name);
  std::unique_ptr<llvm::Module> module = std::make_unique<llvm::Module>(module_name, context);

  auto var_name = ir::interface_name(interface->name);
  auto type_name_var = ir::buildGlobalString(context, module.get(), var_name, interface->name);

  std::vector<std::string> decoratedNames(interface->methodNames.size());
  int countPureMethods = 0;

  for (int i = 0; i < interface->methodNames.size(); ++i)
  {
    if (auto methodType = interface->methodTypes[i])
    {
      countPureMethods++;
      auto methodName = interface->methodNames[i];
      decoratedNames[i] = std::format("__lua_{}_{}", interface->name, methodName);
      buildLuaCFunction(context, module.get(), methodType, i, decoratedNames[i], type_name_var);
    }
  }

  //llvm::errs() << *module << "\n";

  if (auto error = m_jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(module), m_ts_context)))
  {
    // TODO [AZ] Error handling
    return;
  }

  std::vector<luaL_Reg> lua_methods(countPureMethods + 1);

  countPureMethods = 0;

  for (int i = 0; i < interface->methodNames.size(); ++i)
  {
    if (interface->methodTypes[i])
    {
      auto address = llvm::cantFail(m_jit->lookup(decoratedNames[i]));
      const auto func = address.toPtr<lua_CFunction>();

      // TODO [AZ] Dirties hack
      lua_methods[countPureMethods].name = interface->methodNames[i].c_str();
      lua_methods[countPureMethods].func = func;
      countPureMethods++;
    }
  }

  lua_methods[countPureMethods].name = NULL;
  lua_methods[countPureMethods].func = NULL;

  luaL_newmetatable(m_lua_state, interface->name.c_str());

  lua_pushvalue(m_lua_state, -1);
  lua_setfield(m_lua_state, -2, "__index");

  luaL_register(m_lua_state, NULL, &lua_methods[0]);

  m_createdMetatables.insert(interface->name);
}

void LuaLanguage::buildLuaCFunction(
  llvm::LLVMContext& context,
  llvm::Module* module,
  llvm::FunctionType* methodType,
  int methodPosition,
  const std::string& methodName,
  llvm::Value* type_name_var
  ) const
{
  llvm::IRBuilder<> builder(context);
  llvm::Function* func = llvm::Function::Create(m_lua_ir->lua_func_t, llvm::Function::ExternalLinkage, methodName, module);
  llvm::BasicBlock* block = llvm::BasicBlock::Create(context, "entry", func);
  builder.SetInsertPoint(block);

   llvm::Constant* int32_1 = builder.getInt32(1);
   llvm::Type* opaquePtr_t = llvm::PointerType::get(context, 0);

   llvm::Value* lua_state_var = func->getArg(0);

   llvm::Value* instancePtr = builder.CreateCall(m_lua_ir->luaL_checkudata_f, {lua_state_var, int32_1, type_name_var});
   llvm::Value* vtblPtr = builder.CreateLoad(opaquePtr_t, instancePtr);
   llvm::Value* vtbl = builder.CreateLoad(opaquePtr_t, vtblPtr);
   llvm::Value* methodPtr = builder.CreateGEP(opaquePtr_t, vtbl, {builder.getInt64(methodPosition)});
   llvm::Value* method = builder.CreateLoad(opaquePtr_t, methodPtr);

   std::vector<llvm::Value*> args(methodType->getNumParams());
   args[0] = vtblPtr;

   for (int i = 1; i < methodType->getNumParams(); ++i)
   {
     args[i] = m_lua_ir->buildPopValue(builder, lua_state_var, methodType->getParamType(i), i + 1);
   }

   llvm::Value* callResult = builder.CreateCall(methodType, method, args);

   m_lua_ir->buildPushValue(builder, lua_state_var, methodType->getReturnType(), callResult);

  llvm::Constant* result = builder.getInt32(methodType->getReturnType()->isVoidTy() ? 0 : 1);
  builder.CreateRet(result);
}


}
