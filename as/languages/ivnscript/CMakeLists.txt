add_library(IvnScriptIntegration STATIC
        is_language.h
        is_language.cpp
        is_language_script.h
        is_language_script.cpp

        script/error.cpp
        script/error.h
        script/executor.cpp
        script/executor.h
        script/expression.cpp
        script/expression.h
        script/interpreter.cpp
        script/interpreter.h
        script/module.cpp
        script/module.h
        script/parser.cpp
        script/parser.h
        script/tokenizer.cpp
        script/tokenizer.h
        is_language_runtime.cpp
        is_language_runtime.h
)

target_include_directories(IvnScriptIntegration PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")

target_link_libraries(IvnScriptIntegration AScript)
