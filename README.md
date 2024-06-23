as_proto
========

Getting Started
---------------

### Пререквизиты
- `cmake`, `ninja`, какой-нибудь C++ компилятор
- `LLVM 17.0.6`. Для macOS, arm64 поддерживается скачиванием собранных бинарных файлов

Переменная окружения `LLVM_ROOT_DIR` должна указывать на директорию, в которой содержатся собранные бинарные файлы LLVM
версии 17.0.6 (в этой директории должны быть директории `bin`, `include`, `lib` и другие). Если эта переменная не
указана, то при выполнении `cmake` собранные бинарные файлы будут скачаны. Однако на текущий момент скачивание
поддерживается только для macOS, arm64

```shell
git clone git@github.com:NauEngine/as_proto.git
cd as_proto
```

#### Сборка из командной строки
```shell
cmake -DCMAKE_BUILD_TYPE=Debug -G Ninja -S . -B ./build
cmake --build ./build --target AScriptTest -j 8
./build/test/AScriptTest
```

#### Сборка из CLion
Просто открыть проект с CLion и прописать переменную окружения `LLVM_ROOT_DIR`
