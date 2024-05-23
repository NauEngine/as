//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_CORE_H
#define AS_PROTO_CORE_H

#include <map>
#include <unordered_set>

#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"

#include "as.h"
#include "core_compile.h"
#include "cpp_interface.h"
#include "ir.h"


namespace llvm::orc
{
    class LLJIT;
}

namespace as
{
    struct ILanguage;
    struct ILanguageScript;
    template<typename Interface>
    class ScriptModule;
    class CPPParser;
    struct ScriptInterface;

    class Core
    {
    public:
        Core();
        ~Core();

        void registerLanguage(const std::string& language_name, const std::shared_ptr<ILanguage>& language);

        template<typename Interface>
        std::shared_ptr<ScriptModule<Interface>> newScriptModule(const std::string& filename,
            const std::string& language_name = "")
        {
            auto module_compile = m_compile.newScriptModule(getInterface<Interface>(), filename, language_name);
            return std::make_shared<ScriptModule<Interface>>(ir::safe_name(filename), module_compile, m_jit, m_compile.getContext());
        }

        template<typename Interface>
        [[nodiscard]]
        const ScriptInterface& getInterface() const
        {
            const char* source_code = getSourceCode<Interface>();
            const char* type_name = getTypeName<Interface>();
            return getInterface(type_name, source_code);
        }

        [[nodiscard]]
        const ScriptInterface& getInterface(const std::string& name, const std::string& source_code) const
        {
            return m_compile.getInterface(name, source_code);
        }

        template<typename Interface>
        void registerInstance(Interface* instance, const std::string& instance_name)
        {
            const char* source_code = getSourceCode<Interface>();
            const char* type_name = getTypeName<Interface>();
            registerInstance(instance, instance_name, type_name, source_code);
        }

    private:
        CoreCompile m_compile;
        std::shared_ptr<llvm::orc::LLJIT> m_jit;

        void registerInstance(void* instance,
            const std::string& instance_name,
            const std::string& type_name,
            const std::string& source_code) const;
    };

} // as

#endif //AS_PROTO_CORE_H
