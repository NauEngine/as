//
// Created by Alex Zelenshikov on 01.05.2024.
//

#ifndef LANGUAGE_SCRIPT_H
#define LANGUAGE_SCRIPT_H

#include <string>
#include <llvm/ExecutionEngine/Orc/LLJIT.h>

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

/**
 * Интерфейс для логики загрузки и материализации скриптового модуля
 */
struct ILanguageScript
{
    virtual ~ILanguageScript() = default;

    /**
     * Загрузить код скрипта из файла
     * @param filename - имя (и путь) до файла
     * @param context - LLVM Context
     */
    virtual void load(const std::string& filename, llvm::LLVMContext& context) = 0;

    /**
     * Получить интерфейс, который реализует скрипт из файла
     * @param filename - имя (и путь) до файла
     * @param cpp_parser - Parser для C++ кода
     */
    virtual std::shared_ptr<ScriptInterface> getInterface(const std::string& filename, CPPParser& cpp_paser) = 0;

    /**
     * Создать LLVM модуль
     * @param context - LLVM Context
     * @return Созданный модуль
     */
    virtual std::unique_ptr<llvm::Module> createModule(llvm::LLVMContext& context) = 0;

    /**
     * Скомпилировать модуль для скрипта и вернуть init-функцию для этого модуля
     * @param init_name - имя для init функции
     * @param module_name - уникальное имя для модуля
     * @param interface - интерфейс, который должен быть реализован этим модулем
     * @param module - LLVM Module, в рамках которого компилировать скрипт
     * @return LLVM функция для init-функции этого модуля
     */
    virtual llvm::Function* buildModule(const std::string& init_name,
        const std::string& module_name,
        const ScriptInterface& interface,
        llvm::Module& module) = 0;

    /**
     * Выполнить какие-либо действия, необходимые для материализации данного скриптового модуля. Обычно используется
     * для материализации вспомогательных объектов
     * @param jit - LLVM Jit
     * @param lib - LLVM Lib в рамках которой материализуется данный модуль
     * @param module - LLVM Module
     * @param context - LLVM Context
     */
    virtual void materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit,
                             llvm::orc::JITDylib& lib,
                             llvm::Module& module,
                             llvm::LLVMContext& context) = 0;
};

} // namespace as


#endif //LANGUAGE_SCRIPT_H
