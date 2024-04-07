//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_CORE_H
#define AS_PROTO_CORE_H

#include <map>
#include <unordered_set>

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

    void registerLanguage(const std::string& language_name, std::unique_ptr<ILanguageProcessor> processor);
    std::shared_ptr<IScriptModule> registerScriptModule(const std::string& filename, const std::string& language_name);

    // TODO temporary function until reimport is not implemented
    void loadModulesIntoJit();

    void Init();
    void Update();
  private:
    std::unordered_map<std::string, std::unique_ptr<ILanguageProcessor>> processors;

    std::shared_ptr<llvm::orc::LLJIT> jit;
  };

} // as

#endif //AS_PROTO_CORE_H
