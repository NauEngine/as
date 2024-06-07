//
// Created by Alex Zelenshikov on 09.05.2024.
//

#include "sq_language.h"

#include "as/core/ir.h"

#include "sq_ir.h"
#include "sq_language_script.h"

#include "squirrel/include/squirrel.h"
#include "squirrel/include/sqstdaux.h"


namespace
{

void printfunc(HSQUIRRELVM v,const SQChar *s,...)
{
    va_list vl;
    va_start(vl, s);
    vfprintf(stdout, s, vl);
    va_end(vl);
}

void errorfunc(HSQUIRRELVM v,const SQChar *s,...)
{
    va_list vl;
    va_start(vl, s);
    vfprintf(stderr, s, vl);
    va_end(vl);
}

}

namespace as
{
SquirrelLanguage::SquirrelLanguage()
{
    m_sq_vm = sq_open(STACK_SIZE);
    sqstd_seterrorhandlers(m_sq_vm);
    sq_setprintfunc(m_sq_vm, printfunc, errorfunc);
    sq_pushroottable(m_sq_vm);
}

SquirrelLanguage::~SquirrelLanguage()
{
    if (m_sq_vm)
    {
        sq_close(m_sq_vm);
        m_sq_vm = nullptr;
    }
}

void SquirrelLanguage::init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context)
{
    m_jit = std::move(jit);
    m_ts_context = std::move(ts_context);

    m_sq_ir = std::make_shared<SquirrelIR>();
    m_sq_ir->init(m_jit, m_ts_context, m_sq_vm);
}

std::shared_ptr<as::ILanguageScript> SquirrelLanguage::newScript()
{
    return std::make_shared<SquirrelLanguageScript>(m_sq_vm, m_sq_ir);
}

void SquirrelLanguage::registerInstance(void* instance, const std::string& instanceName, const std::shared_ptr<ScriptInterface>& interface)
{
    if (m_createdMetatables.find(interface->name) == m_createdMetatables.end())
    {
        createInterfaceMetatable(interface);
    }

    // Создаем новую таблицу для хранения экземпляра
    sq_newtable(m_sq_vm);

    // Сохраняем указатель на экземпляр в таблице под ключом "__instance"
    sq_pushstring(m_sq_vm, "__instance", -1);
    sq_pushuserpointer(m_sq_vm, instance);
    sq_newslot(m_sq_vm, -3, SQFalse);

    // Назначаем метатаблицу
    sq_pushstring(m_sq_vm, "__metatable", -1);
    sq_pushstring(m_sq_vm, interface->name.c_str(), -1);
    sq_get(m_sq_vm, -2);
    //sq_setmetatable(m_sq_vm, -2); TODO: ???

    // Сохраняем таблицу как глобальный объект
    sq_pushroottable(m_sq_vm);
    sq_pushstring(m_sq_vm, instanceName.c_str(), -1);
    sq_push(m_sq_vm, -3);
    sq_newslot(m_sq_vm, -3, SQFalse);

    // Убираем таблицу со стека
    sq_pop(m_sq_vm, 1);
}

void SquirrelLanguage::createInterfaceMetatable(const std::shared_ptr<ScriptInterface>& interface)
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
      decoratedNames[i] = std::format("__squirrel_{}_{}", interface->name, methodName);
      buildSqCFunction(context, module.get(), methodType, i, decoratedNames[i], type_name_var);
    }
  }

  if (auto error = m_jit->addIRModule(llvm::orc::ThreadSafeModule(std::move(module), m_ts_context)))
  {
    // TODO [AZ] Error handling
    return;
  }

  for (int i = 0; i < interface->methodNames.size(); ++i)
  {
    if (interface->methodTypes[i])
    {
      auto address = llvm::cantFail(m_jit->lookup(decoratedNames[i]));
      const auto func = address.toPtr<SQFUNCTION>();

      sq_pushroottable(m_sq_vm);

      sq_pushstring(m_sq_vm, interface->methodNames[i].c_str(), -1);
      sq_newclosure(m_sq_vm, func, 0);
      sq_newslot(m_sq_vm, -3, SQFalse);

      sq_pop(m_sq_vm, 1);
    }
  }

  m_createdMetatables.insert(interface->name);
}

void SquirrelLanguage::buildSqCFunction(
  llvm::LLVMContext& context,
  llvm::Module* module,
  llvm::FunctionType* methodType,
  int methodPosition,
  const std::string& methodName,
  llvm::Value* type_name_var
  ) const
{
  llvm::IRBuilder<> builder(context);
  llvm::Function* func = llvm::Function::Create(m_sq_ir->sq_func_t, llvm::Function::ExternalLinkage, methodName, module);
  llvm::BasicBlock* block = llvm::BasicBlock::Create(context, "entry", func);
  builder.SetInsertPoint(block);

  llvm::Constant* int32_1 = builder.getInt32(1);
  llvm::Type* opaquePtr_t = llvm::PointerType::get(context, 0);

  llvm::Value* squirrel_vm_var = func->getArg(0);

  llvm::Value* instancePtr = builder.CreateCall(m_sq_ir->sq_getinstanceup_f, {squirrel_vm_var, int32_1, type_name_var});
  llvm::Value* vtblPtr = builder.CreateLoad(opaquePtr_t, instancePtr);
  llvm::Value* vtbl = builder.CreateLoad(opaquePtr_t, vtblPtr);
  llvm::Value* methodPtr = builder.CreateGEP(opaquePtr_t, vtbl, {builder.getInt64(methodPosition)});
  llvm::Value* method = builder.CreateLoad(opaquePtr_t, methodPtr);

  std::vector<llvm::Value*> args(methodType->getNumParams());
  args[0] = vtblPtr;

  for (int i = 1; i < methodType->getNumParams(); ++i)
  {
    args[i] = m_sq_ir->buildPopValue(builder, squirrel_vm_var, methodType->getParamType(i), i + 1);
  }

  llvm::Value* callResult = builder.CreateCall(methodType, method, args);

  m_sq_ir->buildPushValue(builder, squirrel_vm_var, methodType->getReturnType(), callResult);

  llvm::Constant* result = builder.getInt32(methodType->getReturnType()->isVoidTy() ? 0 : 1);
  builder.CreateRet(result);
}


} //namespace as