Agnostic Scripting Project
========

Getting Started
---------------

### Prerequisites
- `cmake`, `ninja`, any C++ compiler
- `LLVM 17.0.6`. For macOS and arm64, if it is not supplied, the pre-built binaries are downloaded automatically.

The environment variable `LLVM_ROOT_DIR` should be set to the directory where the LLVM 17.0.6 binaries are located 
(this directory should contain `bin`, `include`, `lib`, and other directories). 
In case the variable is not set, the binaries are downloaded during the `cmake` run.
However, currently, downloading is only supported for macOS, arm64.

```shell
git clone git@github.com:NauEngine/as_proto.git
cd as_proto
```

#### Build from command line
```shell
cmake -DCMAKE_BUILD_TYPE=Debug -G Ninja -S . -B ./build
cmake --build ./build --target AScriptTest -j 8
./build/test/AScriptTest
```

#### Build with CLion
Simply open the project with CLion and set `LLVM_ROOT_DIR` environment variable.


### Debugging

Debug Info support is enabled in the JIT, and according to information on the internet, 
GDB and LLDB debuggers support Debug Info in JITed code.

In macOS and LLDB JITed code debugging is disabled by default, and it has to be enabled manually. You can enable it 
by adding a file `~/.lldbinit` with the following content:
```
settings set plugin.jit-loader.gdb.enable on
```
As a result, the debugging will be functioning both in CLion (in macOS CLion uses embedded LLDB by default) and in LLDB.

Reference
------------
- [Coding Style Guide](./docs/coding_style_guide.md)
- [Architecture](./docs/architecture.md)
- [How To: Testing](./docs/howto_test.md)
- [How To: Introducing A New Language](./docs/howto_new_language.md)
- [What's Next](./docs/whats_next.md)
