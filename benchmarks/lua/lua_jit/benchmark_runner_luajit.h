//
// Created by Alex Zelenshikov on 22.05.2024.
//

#pragma once

#include "../../benchmark_runner.h"

namespace as::benchmark
{

struct BenchmarkRunnerLuaJit final : IBenchmarkRunner
{
    ~BenchmarkRunnerLuaJit() override = default;

    const char* title() override { return "LuaJit"; }
    void prepare(const std::string& filename) override;
    void run() override;
    void shutdown() override;
};

}
