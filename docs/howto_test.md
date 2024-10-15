How To: Testing
==============================

In order to create tests for a language support implementation, the following steps should be followed:
- Define a subclass of `FeaturesTestFixture`
- Implement 3 abstract methods:
    ```c++
    const char* getLanguageName() const override { /* ... */ }
    std::shared_ptr<as::ILanguage> createLanguage() const override { /* ... */ }
    std::shared_ptr<as::ILanguageRuntime> createRuntime() const override { /* ... */ }
    ```
- Using the respective language, write code samples for each virtual test function in `FeaturesTestFixture`. 
Then, override each test function so that it would return the corresponding code sample (a pointer to a null-terminated
string). It is acceptable if some of these functions are not supported by the language or not required for the test. In such case, these functions are not to be overridden (and no code samples are necessary).
- Call the supplied test functions


Code samples
----------------------------

### `getSimpleScript42()`
`SimpleScript` interface implementation, `foo` function returns `42`.
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
`SimpleScript` interface implementation, `foo` function returns `4242`.
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
`SimpleScript` interface implementation. `foo` function firstly calls `set` method of an external object implementing 
`SetGetScript` interface and passes value `42` to it. Secondly, it calls `get` method and returns the resulted value.
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
`SimpleScript` interface implementation. `pass` function returns the parameter, `mul` function returns a product of the parameters, `add` function returns a sum of the parameters.
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
`DoubleScript` interface implementation. `pass` function returns the parameter, `mul` function returns a product of the parameters, `add` function returns a sum of the parameters.
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
`SetGetScript` interface implementation. `set` function sets a global variable, `get` function retrieves its value.
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


Tests for the supported functionality
----------------------------------

### `SimpleTest`
Checks whether the script gets compiled. `getSimpleScript42()` script implementation is required.
```c++
TEST_F(LuaLanguageTest, SimpleTest)
{
    doSimpleTest();
}
```

### `IntegerTest`
Checks whether passing an `int` value to a function is supported. `getIntegerScript()` script implementation is required.
```c++
TEST_F(LuaLanguageTest, IntegerTest)
{
    doIntegerTest();
}
```

### `DoubleTest`
Checks whether passing an `double` value to a function is supported. `getDoubleScript()` script implementation is required.
`double` interpretation by the tested script should be passed to `doDoubleTest` function.
The options are:`TreatDouble::AsDouble`, `TreatDouble::AsFloat` and `TreatDouble::AsInteger`.
```c++
TEST_F(LuaLanguageTest, DoubleTest)
{
    doDoubleTest(TreatDouble::AsDouble);
}
```

### `ExternalObjTest`
Checks whether access to external objects is supported. `getSimpleExternalScript()` script implementation is required.
```c++
TEST_F(LuaLanguageTest, ExternalObjTest)
{
    doExternalObjTest();
}
```

### `GlobalVarTest`
Checks whether global variables are supported. `getSetGetGlobalScript()` script implementation is required.
```c++
TEST_F(LuaLanguageTest, GlobalVarTest)
{
    doGlobalVarTest();
}
```

### `ModulesTest`
Checks whether multiple implementations of a single interface are supported. `getSimpleScript42()` and
`getSimpleScript4242()` script implementations are required.
```c++
TEST_F(LuaLanguageTest, ModulesTest)
{
    doModulesTest();
}
```

### `HotReloadTest`
Checks whether script overloading is supported. `getSimpleScript42()` and `getSimpleScript4242()` script implementations are required.
```c++
TEST_F(LuaLanguageTest, HotReloadTest)
{
    doHotReloadTest();
}
```

### `CompileStaticInitTest`
Checks whether a script gets compiled into IR code. Also checks whether a static constructor calling the `init` function gets registered. Also checks whether a VMT get registered by `init` function. `getSimpleScript42()` script implementation is required.
```c++
TEST_F(LuaLanguageTest, CompileStaticInitTest)
{
    doCompileStaticInitTest();
}
```

### `CompileLinkTest`
Checks whether the generated IR code can be loaded without using the language implementation. This implicitly confirms that AOT compilation is supported for the given language. The test logic is as follows:
- A compiler with the language support is created.
- The script is compiled into IR code.
A script system with support for _only_ the language's IR code is created.
- The runtime for the language is registered in the script system (if available).
- The module is materialized and executed.

`getSimpleScript42()` script implementation is required.

```c++
TEST_F(CppLanguageTest, CompileLinkTest)
{
    doCompileLinkTest();
}
```


### `CompileDebugInfoTest`
Checks that the generated IR code contains debug information. `getSimpleScript42()` script implementation is required. A regex for searching the `foo` function by its name should be passed to the function.
```c++
TEST_F(CppLanguageTest, CompileDebugInfoTest)
{
    doCompileDebugInfoTest("@[_\\w]+3foo[_\\w]+");
}
```