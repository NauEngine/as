//
// Created by ivn on 28.05.2024.
//

#include "llvm/Support/SourceMgr.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/IR/OwningOpRef.h"
#include "mlir/IR/BuiltinOps.h"
#include "tsc/include/TypeScript/DataStructs.h"

#include "ts_language_script.h"

#include <TypeScript/MLIRGen.h>
#include <llvm/ExecutionEngine/Orc/Core.h>
#include <llvm/IR/Module.h>
#include <llvm/TargetParser/Host.h>
#include <llvm/TargetParser/Triple.h>

CompileOptions prepareOptions()
{
    auto moduleTargetTriple = llvm::sys::getDefaultTargetTriple();

    auto TheTriple = llvm::Triple(moduleTargetTriple);

    CompileOptions compileOptions;
    compileOptions.isJit = false;
    compileOptions.disableGC = true;
    compileOptions.enableBuiltins = false;
    compileOptions.noDefaultLib = true;
    compileOptions.disableWarnings = false;
    compileOptions.exportOpt = ExportsNotSet;
    compileOptions.generateDebugInfo = true;
    compileOptions.lldbDebugInfo = true;
    compileOptions.moduleTargetTriple = moduleTargetTriple;
    compileOptions.isWindows = TheTriple.isKnownWindowsMSVCEnvironment();
    compileOptions.isWasm = TheTriple.getArch() == llvm::Triple::wasm64 || TheTriple.getArch() == llvm::Triple::wasm32;
    compileOptions.sizeBits = 32;
    if (
        TheTriple.getArch() == llvm::Triple::UnknownArch
        || TheTriple.getArch() == llvm::Triple::aarch64        // AArch64 (little endian): aarch64
        || TheTriple.getArch() == llvm::Triple::aarch64_be     // AArch64 (big endian): aarch64_be
        || TheTriple.getArch() == llvm::Triple::aarch64_32     // AArch64 (little endian) ILP32: aarch64_32
        || TheTriple.getArch() == llvm::Triple::bpfel          // eBPF or extended BPF or 64-bit BPF (little endian)
        || TheTriple.getArch() == llvm::Triple::bpfeb          // eBPF or extended BPF or 64-bit BPF (big endian)
        || TheTriple.getArch() == llvm::Triple::loongarch64    // LoongArch (64-bit): loongarch64
        || TheTriple.getArch() == llvm::Triple::mips64         // MIPS64: mips64, mips64r6, mipsn32, mipsn32r6
        || TheTriple.getArch() == llvm::Triple::mips64el       // MIPS64EL: mips64el, mips64r6el, mipsn32el, mipsn32r6el
        || TheTriple.getArch() == llvm::Triple::ppc64          // PPC64: powerpc64, ppu
        || TheTriple.getArch() == llvm::Triple::ppc64le        // PPC64LE: powerpc64le
        || TheTriple.getArch() == llvm::Triple::riscv64        // RISC-V (64-bit): riscv64
        || TheTriple.getArch() == llvm::Triple::x86_64         // X86-64: amd64, x86_64
        || TheTriple.getArch() == llvm::Triple::nvptx64        // NVPTX: 64-bit
        || TheTriple.getArch() == llvm::Triple::le64           // le64: generic little-endian 64-bit CPU (PNaCl)
        || TheTriple.getArch() == llvm::Triple::amdil64        // AMDIL with 64-bit pointers
        || TheTriple.getArch() == llvm::Triple::hsail64        // AMD HSAIL with 64-bit pointers
        || TheTriple.getArch() == llvm::Triple::spir64         // SPIR: standard portable IR for OpenCL 64-bit version
        || TheTriple.getArch() == llvm::Triple::spirv64        // SPIR-V with 64-bit pointers
        || TheTriple.getArch() == llvm::Triple::wasm64         // WebAssembly with 64-bit pointers
        || TheTriple.getArch() == llvm::Triple::renderscript64 // 64-bit RenderScript
    ) {
        compileOptions.sizeBits = 64;
    }

    return compileOptions;
}

namespace as {
TypeScriptLanguageScript::TypeScriptLanguageScript(mlir::MLIRContext& context):
    m_context(context)
{
}

void TypeScriptLanguageScript::load(const std::string& filename, llvm::LLVMContext& context)
{
    llvm::SourceMgr source_mgr;
    auto compile_options = prepareOptions();
    auto file_err = llvm::MemoryBuffer::getFileOrSTDIN(filename);

    source_mgr.AddNewSourceBuffer(std::move(*file_err), llvm::SMLoc());

    m_module = typescript::mlirGenFromSource(m_context, filename, source_mgr, compile_options);
}

std::unique_ptr<llvm::Module> TypeScriptLanguageScript::createModule(
        llvm::LLVMContext& context)
{
    return std::make_unique<llvm::Module>("ts_module", context);
}

llvm::Function* TypeScriptLanguageScript::buildModule(const std::string& init_name,
    const std::string& module_name,
    const ScriptInterface& interface,
    llvm::Module& module)
{
    return nullptr;
}

void TypeScriptLanguageScript::materialize(const std::shared_ptr<llvm::orc::LLJIT>& jit,
                                           llvm::orc::JITDylib& lib,
                                           llvm::Module& module, llvm::LLVMContext& context)
{
}
} // as