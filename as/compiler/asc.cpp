//
// Created by ivn on 19.05.2024.
//

#include <filesystem>
#include <fstream>

#include "as/core/core.h"
#include "as/core/core_compile.h"
#include "as/core/script_module.h"
#include "as/core/cpp_interface_parser.h"
#include "as/core/script_module_compile.h"

#include "as/languages/lua/lua_language.h"
#include "as/languages/squirrel/sq_language.h"
#include "as/languages/ivnscript/is_language.h"

#define PROGRAM_NAME "AScript Compiler"
#define PROGRAM_VERSION "0.0.1"

llvm::cl::OptionCategory CompilerOptions("Compiler Options");

llvm::cl::opt<std::string> inputFilename(llvm::cl::Positional, llvm::cl::desc("<input_filename>"), llvm::cl::Required, llvm::cl::value_desc("filename"), llvm::cl::cat(CompilerOptions));
llvm::cl::opt<std::string> headerFilename("h", llvm::cl::desc("Header filename"), llvm::cl::value_desc("filename"), llvm::cl::cat(CompilerOptions));
llvm::cl::opt<std::string> outputFilename("o", llvm::cl::desc("Output filename"), llvm::cl::value_desc("filename"), llvm::cl::cat(CompilerOptions));

static void printVersion(llvm::raw_ostream &out) {
    out << PROGRAM_NAME << " " << PROGRAM_VERSION << "\n";
    llvm::cl::PrintVersionMessage();
}

int main(int argc, char **argv)
{
    auto script_core = std::make_shared<as::CoreCompile>();
    auto lua_language = std::make_shared<as::LuaLanguage>();
    auto squirrel_language = std::make_shared<as::SquirrelLanguage>();
    auto ivnscript_language = std::make_shared<as::IvnScriptLanguage>();

    script_core->registerLanguage("lua", std::move(lua_language));
    script_core->registerLanguage("nut", std::move(squirrel_language));
    script_core->registerLanguage("is", std::move(ivnscript_language));

    llvm::cl::ParseCommandLineOptions(argc, argv, PROGRAM_NAME"\n");

    llvm::outs() << "Current dir: " << std::filesystem::current_path() << "\n";
    llvm::outs() << "Input file:  " << inputFilename << "\n";
    llvm::outs() << "Header file: " << headerFilename << "\n";
    llvm::outs() << "Output file: " << outputFilename << "\n";

    std::ifstream ifs(headerFilename);
    const std::string headerContent{ std::istreambuf_iterator<char>(ifs), std::istreambuf_iterator<char>() };

    auto interface = script_core->getInterface("TestScript", headerContent);
    auto module = script_core->newScriptModule(interface, inputFilename);
    module->dump(llvm::errs());

    return 0;
}
