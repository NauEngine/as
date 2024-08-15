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

    const char* title() override { return "luajit 2.1"; }
    void prepare(const std::string& filename) override;
    double run() override;
    void shutdown() override;

    void prepare_calls(const std::string& filename) override;
    double run_add(double a, double b) override;
    bool run_not(bool a) override;
};

}
