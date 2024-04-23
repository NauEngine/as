add_executable(SandboxIvn
        main.cpp
        script/tokenizer.cpp
        script/tokenizer.h
        script/parser.cpp
        script/parser.h
        script/module.cpp
        script/module.h
        script/expression.h
        script/expression.cpp
        script/interpreter.cpp
        script/interpreter.h
        script/error.cpp
        script/error.h
        script/executor.cpp
        script/executor.h
)

target_link_libraries(SandboxIvn ${llvm_libs})
