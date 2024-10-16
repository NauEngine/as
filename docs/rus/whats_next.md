What's next?
===================

Refactoring
-----------

### Decoupling `Core` и `CoreCompile`

The `CoreCompile` object acts as the link to the LLVM infrastructure. AOT-compiled module support is implemented in `Core`. If `Core` and `CoreCompile` are split into two separate libraries, only the `Core` library will be necessary for release, which will significantly reduce the build size.

To achieve this, the following steps are proposed:

- Create an interface for `CoreCompile`, likely with just a single function, `newScriptModule`.
- In the `Core` constructor, pass a reference (`shared_ptr`) to this interface. If JIT compilation is not supported, pass nullptr.
- In the `Core` implementation, remove methods that call `CoreCompile` methods. Now, external code creates `CoreCompile` and registers the necessary language implementations.
- Split `Core` and `CoreCompile` into two libraries (`as` and `as_compile`), where only the latter will depend on LLVM.

### Simplifying `ILanguage` and `ILanguageScript` interfaces

At this point, it has been concluded that a single interface with `compile` and `materialize` functions is sufficient:
```c++
std::unique_ptr<llvm::Module> compile(const std::string& filename /* ... */) const;
void materialize(/* jit, lib, etc ... */) const;
```

Many functions in the current implementation were an attempt to extract common code into internal classes of the script system. However, in practice, different languages require different integration points. A more appropriate approach is to move the shared code into a library, allowing various implementations to utilize it.

Additionally, interfaces were created to store functionality required for interacting with the runtime of a specific scripting language. However, this approach does not support AOT compilation, which led to the creation of a separate `ILanguageRuntime` interface.

The following steps need to be taken:

- Ensure that all implementations have switched to using `ILanguageRuntime`.
- `ScriptModuleCompile` will call the `compile` and `materialize` functions.

###  Unified method for obtaining script module interface 
In the current implementation, the interface for a script module can be obtained in two ways:

- From the script file itself (during AOT compilation or reloading).
- From templates (during the first JIT compilation).
It is proposed to stop using the interface from templates for implementing script modules. Instead, it should only be used for type checking if such an interface already exists.

This change would simplify the logic and improve type safety in the code.

### Using external objects

Currently, support for external objects is implemented only for the Lua language. To support external objects, it is necessary to register the interface and a pointer to the object at the level of each language implementation. However, this is not supported in AOT compilation mode, as there is no language implementation in this mode.

The following approach is proposed:

- Each script can specify that it expects an external object with a given name which implements a specified interface.
- Based on such a declaration, IR code can be generated in order to call methods of the external object.
- Instances of external objects can be obtained in the `init` function of the module, ensuring late binding.

This mechanism could also potentially be used for runtime objects of languages.

Improving functionality
--------------------

### Hot reload on various platforms

Hot reloading of files should become a part of the functionality of `CoreCompile`. This functionality is applicable only in JIT compilation mode, and `CoreCompile` works directly with files.

Given that the implementation of file system change tracking depends on the platform, the implementation specific to a concrete platform should be regarded as a strategy. The correct strategy will be selected during compilation or execution.

### Support for loading multiple files for a single script module

One script module that provides functionality in the project may depend on other "internal" script modules. When loading the "main" module, `CoreCompile` has to be informed of the names of all loaded modules so that when these files change, they are reloaded.

In the future, the logic for file handling should be transferred to `CoreCompile`, and the language support implementations will work exclusively with the content.

### Type checking during JIT compilation and reloading

During JIT compilation (both at the initial compilation and during reloading), we have the required module interface. On the other hand, we have the interface implemented by the module. These interfaces should match, and they can be checked for compatibility.

### Using modules as external objects

A module can register itself as an external object with a specified name, allowing any other scripts, regardless of their language, to utilize the logic of that module. This will likely serve as a foundation for supporting ECS architecture.