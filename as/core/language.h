//
// Created by Alex Zelenshikov on 30.04.2024.
//

#ifndef LANGUAGE_H
#define LANGUAGE_H

#include <string>

namespace llvm
{
  class Function;
  class FunctionType;
  class LLVMContext;
  class Module;
}

namespace as
{

struct ScriptInterface;
struct ILanguageScript;

/***
* Основной интерфейс для поддержки скриптового языка. Создается один экземпляр на приложение. Регистрируется в Core
* и CoreCompile скриптовой системы. У модуля две освновные задачи:
* - быть фабрикой ILanguageScript, используемых для загрузки скриптовых модулей
* - обеспечивать доступ к внешним объектам из скриптовых модулей
*/
struct ILanguage
{
    virtual ~ILanguage() = default;

    virtual const char* prefix() = 0;

    /***
     * Инициализация логики поддержки скриптового языка.
     * @param jit - LLVM JIT, общий для приложения
     * @param context - LLVM Context, общий для приложения
     */
    virtual void init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext context) = 0;

    /***
     * Регистрация внешнего объекта.
     * @param instance - указатель на объект
     * @param instanceName - имя, под которым зарегистрировать этот объект
     * @param cppInterface - интерфейс этого объекта
     */
    virtual void registerInstance(
        void* instance,
        const std::string& instanceName,
        const std::shared_ptr<ScriptInterface>& cppInterface) = 0;

    /***
     * Создать экземпляр ILanguageScript для загрузки скриптового модуля
     * @return Возвращает новый экземпляр ILanguageScript, который будет использоваться для загрузки скриптового модуля
     */
    virtual std::shared_ptr<ILanguageScript> newScript() = 0;
};

} // namespace as


#endif //LANGUAGE_H
