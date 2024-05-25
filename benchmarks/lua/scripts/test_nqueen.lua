-- Check if k-th queen is attacked by any other prior queen.
function configOkay (k, a)
    local z = a[k]
    local kmj
    local l

    for j=1, k-1 do
        l = z - a[j]
        kmj = k - j
        if (l == 0  or  l == kmj  or  -l == kmj) then
            return false
        end
    end
    return true
end

function solve (N, a)   -- return number of positions
    local cnt = 0
    local k = 1
    local N2 = N  --(N + 1) / 2;
    local flag
    a[1] = 1

    while true do
        flag = 0
        if (configOkay(k,a)) then
            if (k < N) then
                k = k + 1;  a[k] = 1; flag = 1
            else
                cnt = cnt + 1; flag = 0
            end
        end
        if (flag == 0) then
            flag = 0
            repeat
                if (a[k] < N) then
                    a[k] = a[k] + 1;  flag = 1; break;
                end
                k = k - 1
            until (k <= 1)
            if (flag == 0) then
                a[1] = a[1] + 1
                if (a[1] > N2) then return cnt; end
                k = 2;  a[2] = 1;
            end
        end
    end
end

function test()
    local a = {}

    local startv = 1
    local endv = 12
    local sum = 0

    for n = startv, endv do
	    sum = sum + solve(n,a)
    end

    return sum
end