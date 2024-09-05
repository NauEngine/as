//
// Created by Alex Zelenshikov on 09.05.2024.
//

#ifndef SQ_LANGUAGE_H
#define SQ_LANGUAGE_H

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "as/core/language.h"

#include "squirrel/include/squirrel.h"

struct SQVM;

namespace as
{

class SquirrelIR;

class SquirrelLanguage final : public ILanguage
{
public:
    constexpr static int STACK_SIZE = 1024;

    SquirrelLanguage();
    ~SquirrelLanguage() override;

    const char* prefix() override { return "squirrel"; }

    void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context) override;

    std::shared_ptr<ILanguageScript> newScript() override;

    // void registerInstance(
    //   void* instance,
    //   const std::string& instanceName,
    //   const std::shared_ptr<ScriptInterface>& scriptInterface) override;

private:
    SQVM* m_sq_vm = nullptr;
    std::shared_ptr<SquirrelIR> m_sq_ir;

    std::map<std::string, HSQOBJECT> m_createdMetatables;

    std::shared_ptr<llvm::orc::LLJIT> m_jit;
    llvm::orc::ThreadSafeContext m_ts_context;

  void buildSqCFunction(
    llvm::LLVMContext& context,
    llvm::Module* module,
    llvm::FunctionType* methodType,
    int methodPosition,
    const std::string& methodName,
    llvm::Value* type_name_var) const;

  void createInterfaceMetatable(const std::shared_ptr<ScriptInterface>& interface);
};

}

#endif //SQ_LANGUAGE_H
