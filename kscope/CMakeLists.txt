add_executable(REPL
        main.cpp
        bindings.cpp
        kaleidoscope/ast.cpp
        kaleidoscope/ast.h
        kaleidoscope/interpreter.cpp
        kaleidoscope/interpreter.h
        kaleidoscope/errors.h
        kaleidoscope/errors.cpp
        kaleidoscope/parser_loop.cpp
        kaleidoscope/parser_loop.h
        compiler/compiler.cpp
        compiler/compiler.h
        compiler/jit.cpp
)

target_link_libraries(REPL ${llvm_libs})
