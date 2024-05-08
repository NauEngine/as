//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_CORE_H
#define AS_PROTO_CORE_H

#include <map>
#include <unordered_set>

#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"

#include "as.h"

namespace llvm::orc
{
  class LLJIT;
}

namespace as
{
  struct ILanguage;
  class ScriptModule;
  class CPPParser;

  class Core
  {
  public:
    Core();
    ~Core();

    void registerLanguage(const std::string& language_name, std::shared_ptr<ILanguage> language);
    std::shared_ptr<ScriptModule> newScriptModule(const std::string& language, const std::string& filename);

  private:
    std::unordered_map<std::string, std::shared_ptr<ILanguage>> m_languages;
    std::shared_ptr<llvm::orc::LLJIT> m_jit;
    llvm::orc::ThreadSafeContext m_ts_context;
    std::shared_ptr<CPPParser> m_cpp_interface_parser;

    std::unordered_map<std::string, ScriptId> m_script_ids;
    ScriptId m_next_script_id;

    ScriptId getScriptId(const std::string& path);
  };

} // as

#endif //AS_PROTO_CORE_H
