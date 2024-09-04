//
// Created by Alex Zelenshikov on 01.05.2024.
//

#ifndef LUA_LANGUAGE_SCRIPT_H
#define LUA_LANGUAGE_SCRIPT_H

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "as/core/language_script.h"

struct lua_State;
struct Proto;

namespace as::orc
{
    class LLJIT;
}

namespace as
{

class LuaIR;
class LuaLLVMCompiler;
struct FunctionTreeNode;

class LuaLanguageScript final : public ILanguageScript
{
public:
    explicit LuaLanguageScript(
        lua_State* state,
        const std::shared_ptr<LuaIR>& lua_ir,
        const std::shared_ptr<LuaLLVMCompiler>& llvmCompiler);
    ~LuaLanguageScript() override;

    void load(const std::string& filename, llvm::LLVMContext& context) override;

    std::shared_ptr<ScriptInterface> getInterface(const std::string& filename, CPPParser& cpp_paser) override;

    std::unordered_map<std::string, std::shared_ptr<ScriptInterface>>
        getRequires(const std::string& filename, CPPParser& cpp_paser) override;

    std::unique_ptr<llvm::Module> createModule(llvm::LLVMContext& context) override;

    llvm::Function* buildModule(const std::string& init_name,
        const std::string& module_name,
        const ScriptInterface& interface,
        const std::unordered_map<std::string, std::shared_ptr<ScriptInterface>>& externalRequires,
        llvm::Module& module) override;

    void materialize(
            const std::shared_ptr<llvm::orc::LLJIT>& jit,
            llvm::orc::JITDylib& lib,
            llvm::Module& module, llvm::LLVMContext& context) override;

private:
    bool m_dumpCompiled = true;
    lua_State* m_lua_state = nullptr;

    std::string m_filename;

    const std::shared_ptr<LuaIR>& m_lua_ir;
    std::shared_ptr<LuaLLVMCompiler> m_llvmCompiler;
    std::shared_ptr<FunctionTreeNode> m_functionTree;

    llvm::GlobalVariable* m_luaStateGlobalVar = nullptr;
    llvm::Value* m_ftreeRootGlobal = nullptr;
    llvm::Value* m_metatablesListGlobal = nullptr;

    void loadLua(const std::string& filename, lua_State* luaState, llvm::LLVMContext& context);

    llvm::Function* buildCustomInitFunction(llvm::Module& module);

    llvm::Function* buildFunction(const std::string& bare_name,
            llvm::FunctionType* signature,
            llvm::Module& module,
            llvm::LLVMContext& context);
};

} //namespace as



#endif //LUA_LANGUAGE_SCRIPT_H
