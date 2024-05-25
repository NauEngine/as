
#define abs(x)   ((x >= 0) ? x : -x)

/* Check if k-th queen is attacked by any other prior queen.
  Return nonzero if configuration is OK, zero otherwise.
*/
//inline	--> not faster, klm, 24-Apr-2020

namespace as::benchmark
{
    int configOkay (int k, int a[]) {
        int z = a[k];

        for (int j=1; j<k; ++j) {
            int l = z - a[j];
            if (l == 0  ||  abs(l) == k - j) return 0;
        }
        return 1;
    }

    long solve (int N, int a[]) {  // return number of positions
        long cnt = 0;
        int k = a[1] = 1;
        int N2 = N;  //(N + 1) / 2;

        loop:
            if (configOkay(k,a)) {
                if (k < N)  { a[++k] = 1;  goto loop; }
                else ++cnt;
            }
        do
            if (a[k] < N)  { a[k] += 1;  goto loop; }
        while (--k > 1);
        a[1] += 1;
        if (a[1] > N2) return cnt;
        k = 2 ,  a[2] = 1;
        goto loop;
    }



    double test_NQueen()
    {
        const int startv = 1;
        const int endv = 12;

        int a[100];
        int sum = 0;

        for (int n = startv; n <= endv; ++n)
        {
            sum += solve(n,a);
        }

        return sum;
    }
}