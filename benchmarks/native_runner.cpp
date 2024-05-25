//
// Created by Alex Zelenshikov on 25.05.2024.
//

#include <unordered_map>

#include "native_runner.h"
#include "native/native_tests.h"

namespace as::benchmark
{

std::unordered_map<std::string, as::benchmark::TestFunc> testFunctions =
{
    {"../../benchmarks/lua/scripts/test_cycle.lua", test_Cycle},
    {"../../benchmarks/lua/scripts/test_array.lua", test_Array},
    {"../../benchmarks/lua/scripts/test_nqueen.lua", test_NQueen},
};


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
