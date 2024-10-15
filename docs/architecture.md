Architecture
====================================

tl;dr;
------

The two foundations of the Agnostic Script system are: representing script modules as regular C++ objects and using [LLVM](https://llvm.org/) infrastructure to support various programming languages for scripts.

Encapsulating script modules in C++ objects allows for their efficient integration with the game engine and
managing their lifecycle. This approach also provides performance that is comparable to that of the native implementation.

Making use of LLVM infrastructure helps achieve scripts JIT-compilation for development and their AOT-compilation for release versions.

```c++
#include "as/core/core.h"
#include "as/languages/lua/lua_language.h"

// Declare an interface that has to be implemented within scripting modules.
DEFINE_SCRIPT_INTERFACE(TestScript,
    virtual int add(int a, int b) = 0;
)

int main()
{
    // Create scripting system and setup a root directory containing the scripts.
    auto script_core = std::make_shared<as::Core>("../sandbox/scripts");

    // Add and register Lua as a language supported by the system.
    auto language = std::make_shared<as::LuaLanguage>();
    script_core->registerLanguage("lua", std::move(language));

    // Create a module from the script in test.lua.
    auto module = script_core->newScriptModule<TestScript>("test.lua");

    // Create an instance from the module
    auto instane = module->newInstance();

    // Calling object's member function.
    assert(instane->add(10, 20) == 30);

    // You're breathtaking (c) Keanu Reeves
    return 0;
}
```


Using Agnostic Script
---------------

### Key Concepts

#### Script Modules

In the scripting system, the main compilation unit is a module. Each module has to implement exactly one interface. For each module an implementation-dependent list of available methods is automatically generated. Then, bytecode for these methods is created with the LLVM framework. As a result, a virtual method table (VMT) for the module is constructed.

#### Operating Modes

The scripting system supports two operating modes:

- **JIT compilation**: script compilation at runtime.
- **AOT compilation**: script compilation during the project build stage.
JIT compilation is primarily used during development, allowing for dynamic script reloading. 
AOT compilation converts scripts into bytecode at the build stage, making it suitable for release versions of applications. Both modes can work simultaneously, which enables support for user extensions, for example.

#### `init` function

The `init` function is the entry point for the module. When called, it registers the module's VMT in the scripting system and links it to the runtime library. Also, it can perform any necessary module initialization logic.

#### Runtime library

Some languages might require additional logic, such as memory management. In such cases, a runtime library can be used. This library is registered in the scripting system and becomes available in the module's code.

### Workflow

Workflow is generally the same for both modes: JIT and AOT. It includes two main steps which are compiling the 
module into an intermediate representation (IR) and subsequent materialization.

Module reloading is supported in JIT mode. That is, each module is loaded into a separate library (LLVM JIT Library), which provides an opportunity for unloading and replacing the entire module without affecting other modules. After unloading, the module's code is recompiled and materialized.

When the `init` function is called, the existing virtual method table is replaced, letting already created objects to use the updated logic.

### Compilation

Successful compilation results in the `init` function binding the script module with the system.
Compilation includes several stages:
- Definition of the interface implemented by the module
- LLVM-module generation
- `init` function creation.

#### Interface definition

The interface implemented by the module is specified in code with special language constructs, for instance, comments.
The name of the file containing the interface declaration (`.h`) is included into the game code, ensuring its integration.

#### LLVM-module generation

IR code is generated for each function of the module. Additionally, IR code is created containing the declaration of a global variable that stores the virtual method table of the interface. At this stage, all necessary code for the module's operation is also generated, including global variables, links to the runtime library, initialization functions, and other elements.

#### `init` function generation

The init function links the module code to the scripting system; that is, it registers the virtual method table, 
retrieves access to runtime libraries, and calls initialization functions.

- For **JIT mode**: the function is declared as global so it can be called from the scripting system.
- For **AOT mode**: the function is declared as internal, and an additional `ctor` function is created. This function is called when the module is loaded and registers the `init` function. This ensures late binding of modules to runtime libraries. The module `init` function is called the first time an object of that module is created.

### Materialization

Materialization occurs only in JIT mode. At this stage, bytecode is generated for the current execution platform using LLVM tools, and the `init` function is called.

For AOT mode, instead of materialization, the pre-generated module is loaded.

Implementation details
-----------------

The script system consists of two components: `Core` and `CoreCompile`.

### `Core`

The system is responsible for encapsulating script modules in C++ objects. A `Core` component contains an instance of `CoreCompile` and methods for calling its functions.

The system creates object factories from the specified filename. Each factory stores a pointer to the VMT of methods described in the module and implementing the specified interface. These factories then create instances of objects that use the corresponding virtual method table.

To register the factory, each script module is associated with an `init` function, which registers the method table. 
The function also ensures the module integration with the runtime library that is required for supporting the specific language.

There are two ways to obtain the `init` function:

- **At runtime**: via CoreCompile, when the specified module is compiled and materialized using the LLVM infrastructure.
- **At compile time**: when each module has already been compiled into bytecode. In this case, a static initialization section is created that registers the module `init` function for the specific filename.

#### `Core` constructor
```c++
explicit Core(const std::string& base_path = "");
```

Creates a `Core` instance.
- `base_path` - root directory containing the scripts.

Since the filename is used to identify the module, it has to match for both JIT and AOT compilation. This allows for directory consistency for scripts during both JIT compilation at runtime and AOT compilation.

#### `newScriptModule`
```c++
template<typename Interface>
std::shared_ptr<ScriptModule<Interface>> newScriptModule(const std::string& filename,
    const std::string& language_name = "")
```

Creates a factory for script module objects.
- **`filename`** — script file name.
- **`language_name`** — module language. If not specified, the language is deduced from the file extension.
- **returns** a pointer to the constructed factory or `nullptr`, on factory creation failure for the given filename.
Factories are managed by `Core`.

Factory creation workflow:
1. **Caching factories**
Each created factory is cached. When a factory is requested, firstly, a suitable cached factory is searched.
2. **Cache search**
In case there is no suitable factory cached, a suitable `init` function that has been associated with the compiled module is searched.
3. **Module compilation**
In case a suitable `init` function has not been found, module compilation is dispatched via `CoreCompile`.
4. **Calling `init`**
The retrieved `init` function is called. At the same moment a VMT for the module is registered. Finally, a factory
is constructed and cached.

#### `registerLanguage`, `registerInstance`
```c++
template<typename Interface>
void registerLanguage(const std::string& language_name, const std::shared_ptr<ILanguage>& language)

void registerInstance(const std::string& instance_name, Interface* instance);
```
Proxy functions for calling the corresponding methods of the underlying `CoreCompile` object.

#### `registerRuntime`
```c++
void registerRuntime(std::shared_ptr<ILanguageRuntime> runtime);
```

Registers a runtime library for language support.
- **`runtime`** — library object

#### `reload`

```c++
void reload(const std::string& filename);
```

Reloads the specified module.
- **`filename`** - module file name

#### `registerVTable`, `requireRuntime`
```c++
void registerVTable(const char* name, ScriptModuleRuntime::FunctionPtr* vtable, int vtable_size);

const void* requireRuntime(const char* name);
```

Internal function for calling within module `init` functions.
`registerVTable` - registers (and updates) the module virtual table.
`requireRuntime` - retrieves a runtime library by its name.

In order to simplify function calling from modules wrapers (`extern "C"` functions) are used for call.

```c++
extern "C" void __asRegisterVTable(as::Core* core, const char* name, as::ScriptModuleRuntime::FunctionPtr* vtable, int vtable_size)
{
    core->registerVTable(name, vtable, vtable_size);
}

extern "C" const void* __asRequireRuntime(as::Core* core, const char* name)
{
    return core->requireRuntime(name);
}
```

### `ScriptModule<Interface>`

A wrapper around the script module. It is necessary for creating an object of a specified type with a virtual method table from the module.

#### `newInstance`
```c++
Interface* newInstance();
```

Function for creating an instance of the object.

### `CoreCompile`

The system is responsible for compiling and materializing modules. It is used both in JIT mode and AOT mode at compilation type.

#### `registerLanguage`
```c++
void registerLanguage(const std::string& language_name, std::shared_ptr<ILanguage> language);
```

Registers language support implementation.

#### `newScriptModule`
```c++
std::shared_ptr<ScriptModuleCompile> newScriptModule(const std::string& filename,
    const std::string& language_name = "");

std::shared_ptr<ScriptModuleCompile> newScriptModule(const ScriptInterface& interface,
    const std::string& filename,
    const std::string& language_name = "");
```

Create a wrapper around the script module for its compilation and materialization or for saving it as bytecode for the specified platform.

### `ScriptModuleCompile`

A wrapper around the script module during the compilation stage for integration with the LLVM infrastructure. It contains the necessary common logic for compiling and materializing the module.

#### `dump`
```c++
void dump(llvm::raw_ostream& stream) const;
```

Generates IR file for the specified module.

#### `materialize`
```c++
InitFunction materialize(std::shared_ptr<llvm::orc::LLJIT>& jit, llvm::orc::ThreadSafeContext ts_context);
```

Materializes module code and retrieves a pointer to its `init` function.