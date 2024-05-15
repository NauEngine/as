//
// Created by Alex Zelenshikov on 09.05.2024.
//

#ifndef SQ_LANGUAGE_SCRIPT_H
#define SQ_LANGUAGE_SCRIPT_H

#include <unordered_map>
#include "squirrel/include/squirrel.h"
#include "as/core/language_script.h"

namespace llvm
{
    class Value;

    namespace orc
    {
        class LLJIT;
    }
}

namespace as
{

class SquirrelIR;

class SquirrelLanguageScript final : public ILanguageScript
{
public:
    explicit SquirrelLanguageScript(SQVM* vm, const std::shared_ptr<SquirrelIR>& sq_ir);
    ~SquirrelLanguageScript() override;

    void load(const std::string& filename) override;

    void prepareModule(llvm::LLVMContext& context, llvm::Module* module) override;

    llvm::Function* buildFunction(
        const std::string& bare_name,
        llvm::FunctionType* signature,
        llvm::LLVMContext& context,
        llvm::Module* module) override;

    void executeModule(
        const std::shared_ptr<llvm::orc::LLJIT>& jit,
        llvm::LLVMContext& context,
        llvm::Module* module) override;

private:
    SQVM* m_sq_vm = nullptr;
    const std::shared_ptr<SquirrelIR>& m_sq_ir;

    std::unique_ptr<SQObject> m_script_func;
    std::vector<std::pair<std::string, std::unique_ptr<SQObject>>> m_funcs;
    // std::unordered_map<std::string, std::unique_ptr<SQObject>> m_funcs;

    llvm::Value* m_sq_vm_extern = nullptr;
    std::string safeModuleName;

    llvm::Value* buildGlobalVarForSQClosure(
        const std::string& bare_name,
        llvm::LLVMContext& context,
        llvm::Module* module);
};

} // namespace as

#endif //SQ_LANGUAGE_SCRIPT_H
