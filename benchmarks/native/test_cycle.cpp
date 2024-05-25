//
// Created by Alex Zelenshikov on 25.05.2024.
//

namespace as::benchmark
{
    double test_Cycle()
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
}