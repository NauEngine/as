//
// Created by Alex Zelenshikov on 06.02.2024.
//
#include <iostream>
#include "Logger.h"

namespace engine
{
  void Logger::info(const std::string& msg)
  {
    std::cout << "I: " << msg << std::endl;
  }

  void Logger::debug(const std::string& msg)
  {
    std::cout << "D: " << msg << std::endl;
  }
} // engine