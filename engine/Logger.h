//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_LOGGER_H
#define AS_PROTO_LOGGER_H

#include <string>

namespace engine
{

  class Logger
  {
    void info(const std::string& msg);
    void debug(const std::string& msg);
  };

} // engine

#endif //AS_PROTO_LOGGER_H
