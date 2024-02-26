//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_LANGUAGEPROCESSOR_H
#define AS_PROTO_LANGUAGEPROCESSOR_H

#include <string>

namespace as
{
  class ILanguageProcessor
  {
  public:
    virtual ~ILanguageProcessor() = default;

    virtual void RegisterScriptFile(const std::string& filename) = 0;
    virtual void Update() = 0;
  };
} // namespace as

#endif //AS_PROTO_LANGUAGEPROCESSOR_H
