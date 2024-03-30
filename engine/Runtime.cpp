//
// Created by Alex Zelenshikov on 06.02.2024.
//
#include <iostream>
#include <chrono>
#include <thread>

#include "as/core/core.h"
#include "Runtime.h"
#include "Logger.h"

namespace engine
{
  Runtime::Runtime() :
    script_core(std::make_shared<as::Core>()),
    logger(std::make_shared<Logger>())
  {

  }

  Runtime::~Runtime() = default;

  void Runtime::Init()
  {
    std::cout << "Runtime started!" << std::endl;
    script_core->Init();
  }

  void Runtime::Run()
  {
    bool do_exit = false;

    while(!do_exit)
    {
      std::this_thread::sleep_for(std::chrono::milliseconds(100));
      script_core->Update();
    }
  }
} // engine