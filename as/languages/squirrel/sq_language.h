//
// Created by Alex Zelenshikov on 09.05.2024.
//

#ifndef SQ_LANGUAGE_H
#define SQ_LANGUAGE_H

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "as/core/language.h"

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

    void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context) override;

    std::shared_ptr<ILanguageScript> newScript() override;

    void registerInstance(
      void* instance,
      const std::string& instanceName,
      const std::shared_ptr<ScriptInterface>& cppInterface) override {}

private:
    SQVM* m_sq_vm = nullptr;
    std::shared_ptr<SquirrelIR> m_sq_ir;
};

}

#endif //SQ_LANGUAGE_H
