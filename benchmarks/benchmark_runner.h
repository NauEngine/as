//
// Created by Alex Zelenshikov on 22.05.2024.
//

#pragma once

#include <string>
#include "../as/core/cpp_interface.h"

namespace as::benchmark
{

struct IBenchmarkRunner
{
    virtual ~IBenchmarkRunner() = default;

    virtual const char* title() = 0;
    virtual void prepare(const std::string& filename) = 0;
    virtual double run() = 0;
    virtual void shutdown() = 0;

    virtual void prepare_calls(const std::string& filename) = 0;
    virtual double run_add(double a, double b) = 0;
    virtual bool run_not(bool a) = 0;
};

}
