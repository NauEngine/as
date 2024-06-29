Описание Архитектуры Agnostic Script
====================================

tl;dr;
------
Две основные идем скриптовой системы Agnostic Script - это представление
скриптовых модулей как обычных объектов C++, и использование инфраструктуры
[LLVM](https://llvm.org/) для поддержки различных языков программирования для
скриптов.

Представления скриптовых модулей как объектов С++ решает вопросы интеграции
с игровым движком и управлением времени жизни. Так же такой способ обеспечивает
быстродействие на уровне нативной реализации.

Благодаря использованию инфраструктуры LLVM решаются вопросы JIT компиляции
скриптов (во время разработки) и AOT компиляции сприптов (для релиза).

```c++
#include "as/core/core.h"
#include "as/languages/lua/lua_language.h"

// объявление интерфейса, который должен быть реализован в скриптовых можулях
DEFINE_SCRIPT_INTERFACE(TestScript,
    virtual int add(int a, int b) = 0;
)

int main()
{
    // создаем скриптовую систему, указываем корневую директорию со скриптами
    auto script_core = std::make_shared<as::Core>("../sandbox/scripts");

    // создаем и регистрируем поддержку языка Lua в скриптовой систему
    auto language = std::make_shared<as::LuaLanguage>();
    script_core->registerLanguage("lua", std::move(language));

    // создаем модуль на основе скрипта из файла test.lua
    auto module = script_core->newScriptModule<TestScript>("test.lua");

    // создаем экземпляр объекта на основе модуля
    auto instane = module->newInstance();

    // вызываем функцию у объекта
    assert(instane->add(10, 20) == 30);

    // You're breathtaking (c) Keanu Reeves
    return 0;
}
```

Основные части скриптовой системы
---------------------------------

Собственно у скриптовой системы две части *Core* и *CoreCompile*:

### Core



### CoreCompile


