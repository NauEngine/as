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

struct ILanguageScript;
struct ILanguage;

struct ScriptInterface;

class ScriptModuleImpl
{
public:
  explicit ScriptModuleImpl(
    const std::string& filename,
    std::shared_ptr<ILanguageScript> language_script,
    std::shared_ptr<ScriptInterface> interface,
    std::shared_ptr<llvm::orc::LLJIT> jit,
    llvm::orc::ThreadSafeContext ts_context);

  void* newInstance();
  void dump(llvm::raw_fd_ostream& stream);

private:
  std::string m_safe_name;
  std::shared_ptr<ILanguageScript> m_language_script;
  std::shared_ptr<ScriptInterface> m_interface;

  std::shared_ptr<llvm::orc::LLJIT> m_jit;
  llvm::orc::ThreadSafeContext m_ts_context;

  std::unique_ptr<llvm::Module> m_module;
  std::string m_vtable_name;

  llvm::orc::ExecutorAddr getVTableAddr();
  void compile();
};

template<typename Interface> class ScriptModule
{
public:
  explicit ScriptModule(
    const std::string& filename,
    std::shared_ptr<ILanguageScript> language_script,
    std::shared_ptr<ScriptInterface> interface,
    std::shared_ptr<llvm::orc::LLJIT> jit,
    llvm::orc::ThreadSafeContext ts_context):

    impl(filename,
      std::move(language_script),
      std::move(interface),
      std::move(jit),
      std::move(ts_context))
  {}

  Interface* newInstance()
  {
    return static_cast<Interface*>(impl.newInstance());
  }

  void dump(llvm::raw_fd_ostream& stream)
  {
      impl.dump(stream);
  }

private:
  ScriptModuleImpl impl;
};

} // as

#endif //AS_PROTO_SCRIPT_MODULE_H
