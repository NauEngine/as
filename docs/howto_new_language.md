How To: Introducing A New Language
=============================================

This document describes the current approach to implementing support for scripting languages; however, during the development process, it became clear that it could be simplified and improved. Therefore, it is recommended to first look through [the document on the further development of the project](whats_next.md), perform the proposed refactoring there, and then rewrite this document :)

To add a scripting language support, three interfaces have to be implemented:

- `ILanguage` - the base interface. It is registered in the scripting system. One instance is created for the entire application.
- `ILanguageScript` - the interface for loading a module. One instance is created for each module of this language.
- `ILanguageRuntime` - the interface for storing the runtime for language support (various garbage collectors, some other common logic). It is not mandatory.

`ILanguage`
-----------

### `init`
Initialization of some common logic for supporting the compilation of a scripting language. Everything related to the materialization of modules for this language should be implemented in the runtime object. For AOT compilation, instances of `ILanguage` or `ILanguageScript` do not exist.

### `newScript`
Creation of a new instance of `ILanguageScript` with the logic for loading (compilation and materialization) the module of this language.

`ILanguageScript`
-----------------
This interface is responsible for loading the module, its compilation (for AOT and JIT compilation), as well as for materialization (only JIT).

During the compilation, the following functions are called one after the other: `load`, `createModule` and
`buildModule`.

### `load`
Load the script code from a file. Depending on the language compilation procedure, this function can perform everything from simply loading the file into a string (for subsequent compilation) to generating an LLVM module.

### `createModule`
Create an LLVM module instance for the given script module, In most cases, the following code is enough:
```cpp
return std::make_unique<llvm::Module>("is_module", context);
```

### `buildModule`
Compiles the module and retrieves the LLVM `init`-function for the module.
### `getInterface`
Retrieves the inteface that is implemented in the given file.

### `materialize`
Materializes the module. The function is used only in JIT mode.
