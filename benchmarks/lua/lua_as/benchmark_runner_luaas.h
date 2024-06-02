//
// Created by Alex Zelenshikov on 22.05.2024.
//

#pragma once

#include <string>

#include "../../benchmark_runner.h"

struct TestCase;
struct TestCalls;
struct Core;
template <typename T> struct ScriptModule;

namespace as::benchmark
{

struct BenchmarkRunnerLuaAs final : IBenchmarkRunner
{
    ~BenchmarkRunnerLuaAs() override = default;

    const char* title() override { return "lua as"; }
    void prepare(const std::string& filename) override;
    double run() override;
    void shutdown() override;

    void prepare_calls(const std::string& filename) override;
    double run_add(double a, double b) override;
    bool run_not(bool a) override;
private:
    TestCase* m_testCase = nullptr;
    TestCalls* m_testCalls = nullptr;

    std::shared_ptr<ScriptModule<TestCase>> m_scriptModuleCase;
    std::shared_ptr<ScriptModule<TestCalls>> m_scriptModuleCalls;
    std::shared_ptr<Core> m_core;
};

}
