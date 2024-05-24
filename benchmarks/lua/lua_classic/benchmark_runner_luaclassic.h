//
// Created by Alex Zelenshikov on 22.05.2024.
//

#pragma once

#include "../../benchmark_runner.h"

namespace as::benchmark
{

struct BenchmarkRunnerLuaClassic final : IBenchmarkRunner
{
    ~BenchmarkRunnerLuaClassic() override = default;

    const char* title() override { return "Lua"; }
    void prepare(const std::string& filename) override;
    void run() override;
    void shutdown() override;
};

}
