//
// Created by Alex Zelenshikov on 21.05.2024.
//

#include <string>
#include <chrono>
#include <iostream>

#include "lua/lua_5_4_6//runner.h"
#include "lua/lua_as/runner.h"
#include "lua/lua_jit/runner.h"

#include "native_runner.h"

typedef void (*RunScript)(const std::string& filename);

int main()
{
    std::tuple<std::string, std::string> script_tests[] = {
        {"cycle", "../../benchmarks/lua/scripts/test_cycle.lua"},
        {"array", "../../benchmarks/lua/scripts/test_array.lua"},
        {"n queen", "../../benchmarks/lua/scripts/test_nqueen.lua"},
        {"life", "../../benchmarks/lua/scripts/test_life.lua"},
    };

    std::string title = std::format("| {:<10}|", "title");

    std::unique_ptr<as::benchmark::IBenchmarkRunner> runners[] = {
        std::move(std::make_unique<as::benchmark::NativeBenchmarkRunnner>()),std::move(as::benchmark::getRunnerLuaAs()),
        std::move(as::benchmark::getRunnerLuaClassic()),
        std::move(as::benchmark::getRunnerLuaJit()),
    };

    for (const auto& runner : runners)
    {
        title += std::format(" {:<20}|", runner->title());
    }

    std::cout << std::endl << "All measurements are presented in milliseconds:" << std::endl;
    std::string delimeter;
    for (int i = 0; i < title.length(); ++i)
    {
        delimeter += "_";
    }
    delimeter += "\n";

    std::cout << delimeter << title << std::endl << delimeter;

    for (const auto& test : script_tests)
    {
        std::cout << std::format("| {:<10}|", std::get<0>(test));

        for (const auto& runner : runners)
        {
            runner->prepare(std::get<1>(test));

            auto start = std::chrono::high_resolution_clock::now();
            auto result = runner->run();
            auto end = std::chrono::high_resolution_clock::now();

            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
            auto duration_ms = (double)duration.count() / 1000.0;
            std::cout << std::format(" {:<8.2f}{:>12.2f}|", duration_ms, result);

            runner->shutdown();
        }

        std::cout << std::endl;
    }

    std::cout << delimeter << std::endl;

    return 0;
}