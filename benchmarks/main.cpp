//
// Created by Alex Zelenshikov on 21.05.2024.
//

#include <string>
#include <chrono>
#include <iostream>

#include "lua/lua_as/runner.h"
#include "lua/lua_classic//runner.h"
#include "lua/lua_jit/runner.h"

typedef void (*RunScript)(const std::string& filename);

int main()
{
    std::string scripts[] = {
        "../../benchmarks/lua/scripts/test_1.lua",
    };

   std::unique_ptr<as::benchmark::IBenchmarkRunner> runners[] = {
        std::move(as::benchmark::getRunnerLuaAs()),
        std::move(as::benchmark::getRunnerLuaClassic()),
        std::move(as::benchmark::getRunnerLuaJit()),
    };

    for (const auto& filename : scripts)
    {
        for (const auto& runner : runners)
        {
            runner->prepare(filename);
            auto start = std::chrono::high_resolution_clock::now();
            runner->run();
            auto end = std::chrono::high_resolution_clock::now();
            runner->shutdown();

            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
            std::cout << std::format("({}) Time taken: {} microseconds\n", runner->title(), duration.count());
        }
    }

    return 0;
}