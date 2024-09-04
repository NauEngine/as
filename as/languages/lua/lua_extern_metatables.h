//
// Created by Alex Zelenshikov on 04.09.2024.
//

#ifndef LUA_METATABLES_H
#define LUA_METATABLES_H

#include <string>
#include <unordered_map>

namespace llvm
{
    class Constant;
    class Module;
}

namespace as
{

class LuaIR;
struct ScriptInterface;

class LuaExternMetatables
{
public:
    static llvm::GlobalVariable* buildIR(
        const std::unordered_map<std::string, std::shared_ptr<ScriptInterface>>& externalRequires,
        const std::shared_ptr<LuaIR>& lua_ir,
        llvm::Module& module);
private:
    static llvm::Constant* buildMetatableIR(
        const std::string& instanceName,
        const std::shared_ptr<ScriptInterface>& interface,
        const std::shared_ptr<LuaIR>& lua_ir,
        llvm::Module& module);

    static llvm::Function* buildLuaCFunction(
        llvm::FunctionType* methodType,
        int methodPosition,
        const std::string& methodName,
        llvm::Value* interface_name_var,
        const std::shared_ptr<LuaIR>& lua_ir,
        llvm::Module& module);

};

}


#endif //LUA_METATABLES_H
