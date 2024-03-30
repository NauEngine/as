//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_CORE_H
#define AS_PROTO_CORE_H

#include <map>

namespace llvm::orc
{
  class LLJIT;
}

namespace as
{
  class ILanguageProcessor;
  class IScriptModule;

  class Core
  {
  public:
    Core();
    ~Core();

    void RegisterLanguage(const std::string& language_name, std::unique_ptr<ILanguageProcessor> processor);
    std::shared_ptr<IScriptModule> RegisterScriptModule(const std::string& filename, const std::string& language_name);

    void Init();
    void Update();
  private:
    std::unordered_map<std::string, std::unique_ptr<ILanguageProcessor>> processors;

    std::unique_ptr<llvm::orc::LLJIT> jit;
  };

} // as

#endif //AS_PROTO_CORE_H
