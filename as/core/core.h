//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_CORE_H
#define AS_PROTO_CORE_H

#include <map>
#include <unordered_set>

#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"

namespace llvm::orc
{
  class LLJIT;
}

namespace as
{
  struct ILanguage;
  class LanguageProcessor;
  class ScriptModule;
  class CPPParser;

  class Core
  {
  public:
    Core();
    ~Core();

    void registerLanguage(const std::string& language_name, std::unique_ptr<ILanguage> language);
    std::shared_ptr<ScriptModule> newScriptModule(const std::string& language);

  private:
    std::unordered_map<std::string, std::shared_ptr<LanguageProcessor>> processors;
    std::shared_ptr<llvm::orc::LLJIT> jit;
    llvm::orc::ThreadSafeContext ts_context;
    std::shared_ptr<CPPParser> cpp_interface_parser;
  };

} // as

#endif //AS_PROTO_CORE_H
