//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_LUALANGUAGEPROCESSOR_H
#define AS_PROTO_LUALANGUAGEPROCESSOR_H

#include "as/core/LanguageProcessor.h"

namespace as
{

  class LuaLanguageProcessor : public ILanguageProcessor
  {
  public:
    LuaLanguageProcessor() = default;

    void RegisterScriptFile(const std::string& filename) override;
    void Update() override;
  };

} // as

#endif //AS_PROTO_LUALANGUAGEPROCESSOR_H
