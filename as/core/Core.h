//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_CORE_H
#define AS_PROTO_CORE_H

#include <map>

namespace as
{
  class ILanguageProcessor;

  class Core
  {
  public:
    Core();
    ~Core();

    void RegisterLanguage(const std::string& language_name, std::unique_ptr<ILanguageProcessor> processor);
    void RegisterScriptFile(const std::string& filename, const std::string& language_name);

    void Init();
    void Update();
  private:
    std::unordered_map<std::string, std::unique_ptr<ILanguageProcessor>> processors;
  };

} // as

#endif //AS_PROTO_CORE_H
