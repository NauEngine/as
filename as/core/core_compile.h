//
// Created by ivn on 21.05.2024.
//

#pragma once

#include <string>
#include <unordered_map>

#include "llvm/ExecutionEngine/Orc/ThreadSafeModule.h"

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
    CoreCompile(bool add_init);
    ~CoreCompile();

    void registerLanguage(const std::string& language_name, std::shared_ptr<ILanguage> language);

    [[nodiscard]]
    std::shared_ptr<ScriptModuleCompile> newScriptModule(const ScriptInterface& interface, const std::string& filename,
        const std::string& language_name = "");

    [[nodiscard]]
    std::shared_ptr<ILanguageScript> loadScript(const std::string& filename, const std::string& language_name) const;

    [[nodiscard]]
    const ScriptInterface& getInterface(const std::string& name, const std::string& source_code) const;

    [[nodiscard]]
    std::shared_ptr<ScriptInterface> getInterfacePtr(const std::string& name, const std::string& source_code) const;

    [[nodiscard]]
    ILanguage* getLanguage(const std::string& language_name) const;

    [[nodiscard]]
    const std::unordered_map<std::string, std::shared_ptr<ILanguage>>& getLanguages() const;

    [[nodiscard]]
    llvm::orc::ThreadSafeContext getContext() const;
private:
    std::unordered_map<std::string, std::shared_ptr<ILanguage>> m_languages;
    std::unique_ptr<CPPParser> m_cpp_parser;
    llvm::orc::ThreadSafeContext m_ts_context;
    bool m_add_init;
};

} // as
