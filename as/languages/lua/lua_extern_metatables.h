//
// Created by Alex Zelenshikov on 04.09.2024.
//

#ifndef LUA_METATABLES_H
#define LUA_METATABLES_H

namespace llvm
{
    class Constant;
    class Module;
}

class LuaIR;

namespace as
{

class LuaExternMetatables
{
    llvm::Constant* buildIR();
};

// llvm::Constant* buildFunctionTreeIR(
//     const std::shared_ptr<LuaIR>& lua_ir,
//     llvm::Module& module);


}


#endif //LUA_METATABLES_H
