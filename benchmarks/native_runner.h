//
// Created by Alex Zelenshikov on 25.05.2024.
//

#pragma once

#include "benchmark_runner.h"

namespace as::benchmark
{

typedef double (*TestFunc)();

struct NativeBenchmarkRunnner final : IBenchmarkRunner
{
    ~NativeBenchmarkRunnner() override = default;

    const char* title() override { return "native"; }
    void prepare(const std::string& filename) override;
    double run() override;
    void shutdown() override;

    void prepare_calls(const std::string& filename) override {}
    double run_add(double a, double b) override { return 0; }
    bool run_not(bool a) override { return true; }
private:
    TestFunc m_testFunction = nullptr;
};

}
