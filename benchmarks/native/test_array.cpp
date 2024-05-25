//
// Created by Alex Zelenshikov on 25.05.2024.
//

namespace as::benchmark
{
    double test_Array()
    {
        const int N = 4000;
        const int S = 1000;

        struct T {
            double a, b, f;
        };

        int i, j;
        T t[N];

        for(i=0; i<N; i++)
        {
            t[i].a = 0;
            t[i].b = 1;
            t[i].f = i * 0.25;
        };

        double sum = 0.0;

        for(j=0; j<S; j++) {
            for(i=0; i<N; i++) {
                t[i].a += t[i].b * t[i].f;
                t[i].b -= t[i].a * t[i].f;
                sum += 1.0;
            }
        }

        return sum;
    }
}
