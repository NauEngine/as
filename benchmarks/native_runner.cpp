//
// Created by Alex Zelenshikov on 25.05.2024.
//

#include <unordered_map>

#include "native_runner.h"

namespace
{

double cycle_Test()
{
    double sum = 0.0;

    for (int i = 1; i <= 10000; ++i)
    {
        sum += 1.0;
        sum *= 2.0;
        sum -= 15.0;

    }

    return sum;
}

std::unordered_map<std::string, as::benchmark::TestFunc> testFunctions =
{
    {"../../benchmarks/lua/scripts/test_1.lua", cycle_Test}
};

}

namespace as::benchmark
{

void NativeBenchmarkRunnner::prepare(const std::string& filename)
{
    m_testFunction = testFunctions[filename];
}

void NativeBenchmarkRunnner::run()
{
    m_testFunction();
}

void NativeBenchmarkRunnner::shutdown()
{

}

} // namespace as::benchmark
