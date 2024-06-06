//
// Created by Alex Zelenshikov on 01.05.2024.
//

#ifndef LANGUAGE_SCRIPT_H
#define LANGUAGE_SCRIPT_H

#include <string>

#include "cpp_interface_parser.h"

namespace llvm
{
    class Function;
    class FunctionType;
    class LLVMContext;
    class Module;

    namespace orc
    {
        class LLJIT;
    }
}

namespace as
{

struct ILanguageScript
{
    virtual ~ILanguageScript() = default;

    virtual void load(const std::string& filename) = 0;

    virtual std::string findHeader(const std::string& filename) = 0;

    virtual std::unique_ptr<llvm::Module> createModule(llvm::LLVMContext& context) = 0;

    virtual llvm::Function* buildModule(const std::string& init_name,
        const std::string& module_name,
        const ScriptInterface& interface,
        llvm::Module& module) = 0;

    virtual void materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit,
        llvm::Module& module,
        llvm::LLVMContext& context) = 0;
};

} // namespace as


#endif //LANGUAGE_SCRIPT_H
