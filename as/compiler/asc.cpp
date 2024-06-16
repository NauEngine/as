//
// Created by ivn on 19.05.2024.
//

#include <filesystem>
#include <fstream>

#include "llvm/Support/ToolOutputFile.h"

#include "as/core/core.h"
#include "as/core/core_compile.h"
#include "as/core/script_module.h"
#include "as/core/cpp_interface_parser.h"
#include "as/core/script_module_compile.h"

#include "as/languages/lua/lua_language.h"
#include "as/languages/squirrel/sq_language.h"
#include "as/languages/ivnscript/is_language.h"
#include "as/languages/cpp/cpp_language.h"

#define PROGRAM_NAME "AScript Compiler"
#define PROGRAM_VERSION "0.0.1"

llvm::cl::OptionCategory CompilerOptions("Compiler Options");

llvm::cl::opt<std::string> inputFilename(llvm::cl::Positional, llvm::cl::desc("<input_filename>"), llvm::cl::Required, llvm::cl::value_desc("filename"), llvm::cl::cat(CompilerOptions));
llvm::cl::opt<std::string> outputFilename("o", llvm::cl::desc("Output filename"), llvm::cl::value_desc("filename"), llvm::cl::cat(CompilerOptions));

static void printVersion(llvm::raw_ostream &out) {
    out << PROGRAM_NAME << " " << PROGRAM_VERSION << "\n";
    llvm::cl::PrintVersionMessage();
}

static void dumpFile(as::ScriptModuleCompile* module, const std::string& filename)
{
    if (filename.empty())
    {
        module->dump(llvm::outs());
    }
    else
    {
        std::error_code ec;
        const llvm::sys::fs::OpenFlags flags = llvm::sys::fs::OF_TextWithCRLF;
        const auto fout = std::make_unique<llvm::ToolOutputFile>(filename, ec, flags);
        if (ec)
        {
            llvm::errs() << "Cannot create file" << "\n";
            return;
        }

        llvm::outs() << "Compile module to " << filename << "\n";
        module->dump(fout->os());
        fout->keep();
    }
}

int main(int argc, char **argv)
{
    auto script_core = std::make_shared<as::CoreCompile>("", true);
    auto lua_language = std::make_shared<as::LuaLanguage>();
    auto squirrel_language = std::make_shared<as::SquirrelLanguage>();
    auto ivnscript_language = std::make_shared<as::IvnScriptLanguage>();
    auto cpp_language = std::make_shared<as::CppLanguage>();

    script_core->registerLanguage("lua", std::move(lua_language));
    script_core->registerLanguage("nut", std::move(squirrel_language));
    script_core->registerLanguage("is", std::move(ivnscript_language));
    script_core->registerLanguage("cpp", std::move(cpp_language));

    llvm::cl::ParseCommandLineOptions(argc, argv, PROGRAM_NAME"\n");

    const auto module = script_core->newScriptModule(inputFilename);

    dumpFile(module.get(), outputFilename.getValue());

    return 0;
}
