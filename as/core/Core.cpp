//
// Created by Alex Zelenshikov on 06.02.2024.
//

#include <iostream>
#include "Core.h"
#include "LanguageProcessor.h"

namespace as
{
  Core::Core() = default;
  Core::~Core() = default;

  void Core::RegisterLanguage(const std::string& language_name, std::unique_ptr<ILanguageProcessor> processor)
  {
    processors[language_name] = std::move(processor);
  }

  void Core::RegisterScriptFile(const std::string& filename, const std::string& language_name)
  {
    // TODO make error handling
    processors[language_name]->RegisterScriptFile(filename);
  }

  void Core::Init()
  {
    std::cout << "Script Core started!" << std::endl;
  }

  void Core::Update()
  {
    std::cout << "Script Core Update" << std::endl;

    for (auto& [name, processor] : processors)
    {
      processor->Update();
    }
  }
} // as