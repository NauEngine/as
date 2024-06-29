Тестирование реализации языков
==============================

Для создания тестов для реализации языка, надо сделать следующее:
- Создать наследника класса `FeaturesTestFixture`
- Реализовать три обязательных метода:
    ```c++
    const char* getLanguageName() const override { /* ... */ }
    std::shared_ptr<as::ILanguage> createLanguage() const override { /* ... */ }
    std::shared_ptr<as::ILanguageRuntime> createRuntime() const override { /* ... */ }
    ```
- Подготовить варианты кода на данном языке, и переопределить методы для получения этого кода. Вполне нормальная
ситуация, когда в языке не поддерживаются весь функицонал. Для таких случаев код определять не надо, и тесты тоже не
надо вызывать
- Вызвать тесты на поддерживаемый функционал


Варианты кода для реализации
----------------------------

### `getSimpleScript42()`
Реализация интерфейса `SimpleScript`, функция `foo` возвращает `42`.
```c++
static const char* CODE_SIMPLE_42 = R"(
-- implements "simple.h"

function foo()
    return 42
end
)";

const char* getSimpleScript42() const override { return CODE_SIMPLE_42; }
```

### `getSimpleScript4242()`
Реализация интерфейса `SimpleScript`, функция `foo` возвращает `4242`.
```c++
static const char* CODE_SIMPLE_42 = R"(
-- implements "simple.h"

function foo()
    return 4242
end
)";

const char* getSimpleScript4242() const override { return CODE_SIMPLE_4242; }
```

### `getSimpleExternalScript()`
Реализация интерфейса `SimpleScript`, функция `foo` сначала вызывает метод `set` с параметром `42` у внешнего объекта
`external`, который реализует интерфейс `SetGetScript`, потом вызывает метод `get` и возвращает полученный результат
```c++
static const char* CODE_SIMPLE_EXTERNAL = R"(
-- implements "simple.h"

function foo()
    external:set(42)
    return external:get()
end
)";

const char* getSimpleExternalScript() const override { return CODE_SIMPLE_EXTERNAL; }
```

### `getIntegerScript()`
Реализация интерфейса `IntegerScript`. Функция `pass` возвращает переданный параметр, функция `mul` возвращает 
произведение переданных параметров. Функция `add` возвращает сумма переданных параметров
```c++
static const char* CODE_INTEGER = R"(
-- implements "integer.h"

function pass(a)
    return a
end

function mul(a, b)
    return a * b
end

function add(a, b, c)
    return a + b + c
end
)";

const char* getIntegerScript() const override { return CODE_INTEGER; }
```

### `getDoubleScript()`
Реализация интерфейса `DoubleScript`. Функция `pass` возвращает переданный параметр, функция `mul` возвращает
произведение переданных параметров. Функция `add` возвращает сумма переданных параметров
```c++
static const char* CODE_DOUBLE = R"(
-- implements "double.h"

function pass(a)
    return a
end

function mul(a, b)
    return a * b
end

function add(a, b, c)
    return a + b + c
end
)";

const char* getDoubleScript() const override { return CODE_DOUBLE; }
```

### `getSetGetGlobalScript()`
Реализация интерфейса `SetGetScript`. Функция `set` устанавливает глобальную переменную, функция `get` возвращает
значение глобальной переменной
```c++
static const char* CODE_SET_GET_GLOBAL = R"(
-- implements "set_get.h"

value = 0;

function set(v)
    value = v
end

function get()
    return value
end
)";

const char* getSetGetGlobalScript() const override { return CODE_SET_GET_GLOBAL; }
```


Тесты на поддерживаемый функционал
----------------------------------

### `SimpleTest`
Проверка что скрипт вообще компилируется. Требует наличие скрипта `getSimpleScript42()`
```c++
TEST_F(LuaLanguageTest, SimpleTest)
{
    doSimpleTest();
}
```

### `IntegerTest`
Проверка что поддерживается передача значения типа `int`. Требует наличие скрипта `getIntegerScript()`
```c++
TEST_F(LuaLanguageTest, IntegerTest)
{
    doIntegerTest();
}
```

### `DoubleTest`
Проверка что поддерживается передача значения типа `double`. Требует наличие скрипта `getDobuleScript()`. В качестве
параметра в функцию `doDoubleTest` передается как трактуется `double` в реализации данного скрипта. Возможны следующие
варианты: `TreatDouble::AsDouble` - как `double`, `TreatDouble::AsFloat` - как `float` и `TreatDouble::AsInteger` - как
`int`
```c++
TEST_F(LuaLanguageTest, DoubleTest)
{
    doDoubleTest(TreatDouble::AsDouble);
}
```

### `ExternalObjTest`
Проверка что поддерживается доступ к внешним объектам. Требует наличие скрипта `getSimpleExternalScript()`
```c++
TEST_F(LuaLanguageTest, ExternalObjTest)
{
    doExternalObjTest();
}
```

### `GlobalVarTest`
Проверка что поддерживаются глобальные переменные на все инстансы скрипта. Требует наличие скрипта `getSetGetGlobalScript()`
```c++
TEST_F(LuaLanguageTest, GlobalVarTest)
{
    doGlobalVarTest();
}
```

### `ModulesTest`
Проверка что может быть несколько реализаций одного интерфейса. Требует наличие скриптов `getSimpleScript42()` и
`getSimpleScript4242()`
```c++
TEST_F(LuaLanguageTest, ModulesTest)
{
    doModulesTest();
}
```

### `HotReloadTest`
Проверка что работает перезагрузка скрипта. Требует наличие скриптов `getSimpleScript42()` и `getSimpleScript4242()`
```c++
TEST_F(LuaLanguageTest, HotReloadTest)
{
    doHotReloadTest();
}
```

### `CompileStaticInitTest`
Проверка что скрипт компилируется в IR код. Проверяется что регистрируется статический конструктор, в котором
вызывается функция регистрации `init`, а также что в `init` вызывается регистрация vtable. Требует наличие скрипта
`getSimpleScript42()`
```c++
TEST_F(LuaLanguageTest, CompileStaticInitTest)
{
    doCompileStaticInitTest();
}
```

### `CompileLinkTest`
Проверка что сгенерированный IR код может быть загружен без использования реализации языка. Таким образом опосредованно
проверяется что для данного языка поддерживается AOT компиляция. Логика теста следующая:
- Создается компилятор, с поддержкой языка
- Скрипт компилируется в IR код
- Создается скриптовая система с поддержкой _только_ IR языка
- В скриптовой системе регистрируется runtime для языка (если есть)
- Модуль материализуется и выполняется

Требует наличие скрипта `getSimpleScript42()`.

```c++
TEST_F(CppLanguageTest, CompileLinkTest)
{
    doCompileLinkTest();
}
```


### `CompileDebugInfoTest`
Проверка что в сгенерированном IR коде есть отладочная информация. Требует наличие скрипта `getSimpleScript42()`. В
качестве параметра в функцию `doCompileDebugInfoTest` передается регулярное выражения для поиска функции `foo` по имени
```c++
TEST_F(CppLanguageTest, CompileDebugInfoTest)
{
    doCompileDebugInfoTest("@[_\\w]+3foo[_\\w]+");
}
```