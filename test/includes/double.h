#pragma once

DEFINE_SCRIPT_INTERFACE(DoubleScript,
    virtual double pass(double arg) = 0;
    virtual double mul(double arg1, double arg2) = 0;
    virtual double add(double arg1, double arg2, double arg3) = 0;
)
