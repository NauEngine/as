//
// Created by Alex Zelenshikov on 06.02.2024.
//

#ifndef AS_PROTO_CORE_H
#define AS_PROTO_CORE_H

#include <map>
#include <unordered_set>

#include "core_compile.h"
#include "cpp_interface.h"
#include "script_module.h"
#include "script_module_runtime.h"

namespace llvm::orc
{
    class LLJIT;
}

namespace as
{
struct ILanguageRuntime;
struct ILanguage;
struct ScriptInterface;

class Core
{
public:
    explicit Core(const std::string& base_path = "");
    ~Core();

    void registerLanguage(const std::string& language_name, const std::shared_ptr<ILanguage>& language)
    {
        m_compile.registerLanguage(language_name, language);
    }

    template<typename Interface>
    std::shared_ptr<ScriptModule<Interface>> newScriptModule(const std::string& filename,
        const std::string& language_name = "")
    {
        const auto cached_module = getCachedModule(filename);
        if (cached_module)
            return std::make_shared<ScriptModule<Interface>>(cached_module);

        const auto linked_module = getLinkedModule(filename);
        if (linked_module)
            return std::make_shared<ScriptModule<Interface>>(linked_module);

        // TODO [AZ] временно вставил разыменование
        assert(getInterface<Interface>());
        const auto compiled_module =  getCompiledModule(*getInterface<Interface>(), filename, language_name);
        if (!compiled_module)
            return nullptr;
        return std::make_shared<ScriptModule<Interface>>(compiled_module);
    }

    void registerInstance(const std::string& instance_name, void* instance);

    void registerRuntime(std::shared_ptr<ILanguageRuntime> runtime);

    void reload(const std::string& filename);

    void registerVTable(const char* name, ScriptModuleRuntime::FunctionPtr* vtable, int vtable_size);

    const void* requireRuntime(const char* name);

    const void* requireInstance(const char* name);

private:
    CoreCompile m_compile;
    std::unordered_map<std::string, void*> m_instances;
    std::unordered_map<std::string, std::shared_ptr<ILanguageRuntime>> m_runtimes;
    std::unordered_map<std::string, std::shared_ptr<ScriptModuleRuntime>> m_modules;

    template<typename Interface>
    const std::shared_ptr<ScriptInterface>& getInterface() const
    {
        const char* source_code = Interface::getSourceCode();
        return m_compile.getInterface(source_code);
    }

    std::shared_ptr<ScriptModuleRuntime> getCachedModule(const std::string& filename) const;
    std::shared_ptr<ScriptModuleRuntime> getLinkedModule(const std::string& filename);
    std::shared_ptr<ScriptModuleRuntime> getCompiledModule(const ScriptInterface& interface,
        const std::string& filename,
        const std::string& language_name);
};
} // as

#endif //AS_PROTO_CORE_H
