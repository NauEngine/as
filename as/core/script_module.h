//
// Created by Alex Zelenshikov on 21.03.2024.
//

#ifndef AS_PROTO_SCRIPT_MODULE_H
#define AS_PROTO_SCRIPT_MODULE_H

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/ExecutionEngine/Orc/Shared/ExecutorAddress.h"

#include "cpp_interface.h"

namespace llvm
{
  class StructType;
  class Module;
}

namespace as
{

class ScriptModuleVTable
{
public:
  explicit ScriptModuleVTable(
    const std::string& safe_name,
    std::shared_ptr<ScriptModuleCompile> module,
    std::shared_ptr<llvm::orc::LLJIT> jit,
    llvm::orc::ThreadSafeContext ts_context);

  void* newInstance();

private:
  std::shared_ptr<ScriptModuleCompile> m_module;
  llvm::orc::ExecutorAddr m_vtable;

  llvm::orc::ExecutorAddr getVTableAddr(const std::string& safe_name,
      std::unique_ptr<llvm::Module> module,
      std::shared_ptr<llvm::orc::LLJIT> jit,
      llvm::orc::ThreadSafeContext ts_context);
};

template<typename Interface> class ScriptModule
{
public:
  explicit ScriptModule(const std::string& safe_name,
    std::shared_ptr<ScriptModuleCompile> module,
    std::shared_ptr<llvm::orc::LLJIT> jit,
    llvm::orc::ThreadSafeContext ts_context):

    m_vtable(safe_name,
      std::move(module),
      std::move(jit),
      std::move(ts_context))
  {}

  Interface* newInstance()
  {
    return static_cast<Interface*>(m_vtable.newInstance());
  }

private:
  ScriptModuleVTable m_vtable;
};

} // as

#endif //AS_PROTO_SCRIPT_MODULE_H
