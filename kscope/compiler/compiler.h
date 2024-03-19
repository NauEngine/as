//
// Created by Alex Zelenshikov on 20.11.2023.
//

#ifndef KALEIDOSCOPE_COMPILER_H
#define KALEIDOSCOPE_COMPILER_H

namespace llvm
{
  class Module;
}

namespace as
{

class Compiler
{
public:
  int compile(llvm::Module* module);
};

}


#endif //KALEIDOSCOPE_COMPILER_H
