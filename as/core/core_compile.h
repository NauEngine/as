//
// Created by ivn on 21.05.2024.
//

#pragma once

#include <string>
#include <unordered_map>
#include <filesystem>

#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"

namespace as
{
struct ILanguage;
struct ILanguageScript;
class ScriptModuleCompile;
class CPPParser;
struct ScriptInterface;

class CoreCompile
{
public:
    CoreCompile(const std::string& base_path, bool add_init);
    ~CoreCompile();

    void registerLanguage(const std::string& language_name, std::shared_ptr<ILanguage> language);

    void registerInstance(void* instance, const std::string& instance_name, const std::shared_ptr<ScriptInterface>& interface);

    std::shared_ptr<ScriptModuleCompile> newScriptModule(const std::string& filename,
        const std::string& language_name = "");

    std::shared_ptr<ScriptModuleCompile> newScriptModule(const ScriptInterface& interface, const std::string& filename,
        const std::string& language_name = "");

    const std::shared_ptr<ScriptInterface>& getInterface(const std::string& source_code) const;

    const std::unordered_map<std::string, std::shared_ptr<ILanguage>>& getLanguages() const;

    llvm::orc::ThreadSafeContext getContext() const
    {
        return m_ts_context;
    }

    std::shared_ptr<llvm::orc::LLJIT>& getJit()
    {
        return m_jit;
    }

private:
    std::unordered_map<std::string, std::shared_ptr<ILanguage>> m_languages;
    std::unordered_map<std::string, std::shared_ptr<ScriptModuleCompile>> m_modules;
    std::unique_ptr<CPPParser> m_cpp_parser;
    llvm::orc::ThreadSafeContext m_ts_context;
    std::shared_ptr<llvm::orc::LLJIT> m_jit;
    std::filesystem::path m_base_path;
    bool m_add_init;

    [[nodiscard]]
    ILanguage* getLanguage(const std::string& language_name) const;

    std::shared_ptr<ScriptModuleCompile> createScriptModule(const std::string& export_name,
        const ScriptInterface& interface,
        std::shared_ptr<ILanguageScript> language_script);
};

} // as
