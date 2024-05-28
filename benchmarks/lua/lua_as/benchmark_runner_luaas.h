//
// Created by Alex Zelenshikov on 22.05.2024.
//

#pragma once

#include <string>

#include "../../benchmark_runner.h"

struct TestCase;
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
private:
    TestCase* m_testCase = nullptr;
    std::shared_ptr<ScriptModule<TestCase>> m_scriptModule;
    std::shared_ptr<Core> m_core;
};

}
