//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_RUNTIME_H
#define AS_PROTO_RUNTIME_H

#include <memory>


namespace as
{
  class Core;
}

namespace engine
{
  class Logger;

  class Runtime
  {
  public:
    Runtime();
    ~Runtime();

    std::shared_ptr<as::Core> GetScriptCore() { return script_core; }

    void Init();
    void Run();
  private:
    std::shared_ptr<as::Core> script_core;
    std::shared_ptr<Logger> logger;
  };

} // engine

#endif //AS_PROTO_RUNTIME_H
