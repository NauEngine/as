//===- KaleidoscopeJIT.h - A simple JIT for Kaleidoscope --------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Contains a simple JIT definition for use in the kaleidoscope tutorials.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_EXECUTIONENGINE_ORC_KALEIDOSCOPEJIT_H
#define LLVM_EXECUTIONENGINE_ORC_KALEIDOSCOPEJIT_H

#include "llvm/ADT/StringRef.h"
#include "llvm/ExecutionEngine/JITSymbol.h"
#include "llvm/ExecutionEngine/Orc/CompileUtils.h"
#include "llvm/ExecutionEngine/Orc/Core.h"
#include "llvm/ExecutionEngine/Orc/ExecutionUtils.h"
#include "llvm/ExecutionEngine/Orc/ExecutorProcessControl.h"
#include "llvm/ExecutionEngine/Orc/IRCompileLayer.h"
#include "llvm/ExecutionEngine/Orc/JITTargetMachineBuilder.h"
#include "llvm/ExecutionEngine/Orc/CompileOnDemandLayer.h"
#include "llvm/ExecutionEngine/Orc/RTDyldObjectLinkingLayer.h"
#include "llvm/ExecutionEngine/Orc/IRTransformLayer.h"
#include "llvm/ExecutionEngine/Orc/EPCIndirectionUtils.h"
#include "llvm/ExecutionEngine/Orc/Shared/ExecutorSymbolDef.h"
#include "llvm/ExecutionEngine/SectionMemoryManager.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/LLVMContext.h"
#include <memory>

namespace as {

  class JIT {
  public:
    JIT(std::unique_ptr<llvm::orc::ExecutionSession> es,
        std::unique_ptr<llvm::orc::EPCIndirectionUtils> epciu,
        llvm::orc::JITTargetMachineBuilder jtmb,
        llvm::DataLayout dl);
    ~JIT();

    static llvm::Expected<std::unique_ptr<JIT>> Create();

    const llvm::DataLayout& GetDataLayout() const { return data_layout; }
    llvm::orc::JITDylib& GetMainJITDylib() { return main_jd; }

    llvm::Error AddModule(llvm::orc::ThreadSafeModule tsm, llvm::orc::ResourceTrackerSP rt = nullptr);
    llvm::Expected<llvm::orc::ExecutorSymbolDef> Lookup(llvm::StringRef name);

  private:
    std::unique_ptr<llvm::orc::ExecutionSession> execution_session;
    std::unique_ptr<llvm::orc::EPCIndirectionUtils> epc_inderection_utils;

    llvm::DataLayout data_layout;
    llvm::orc::MangleAndInterner mangle;

    llvm::orc::RTDyldObjectLinkingLayer object_layer;
    llvm::orc::IRCompileLayer compile_layer;
    llvm::orc::IRTransformLayer optimize_layer;
    llvm::orc::CompileOnDemandLayer cod_layer;

    llvm::orc::JITDylib& main_jd;

    static void HandleLazyCallThroughError();
    static llvm::Expected<llvm::orc::ThreadSafeModule> OptimizeModule(
        llvm::orc::ThreadSafeModule tsm, const
        llvm::orc::MaterializationResponsibility& r);

  };

} // end namespace as

#endif // LLVM_EXECUTIONENGINE_ORC_KALEIDOSCOPEJIT_H
