function sum_all_args(...)
    local arg_count = select("#", ...)

    local sum = 0;
    for i = 1, arg_count do
        print(arg_count)
        print(i .. ": " .. tostring(select(i, ...)))
        print(sum)
        sum = sum + select(i, ...)
    end

    return sum
end

function inner(m)
    return function(a)
        return a * m
    end
end

function foo(a, b)
    local f = inner(100)
    return a + f(b) + sum_all_args(1,2,3,4,5,6);
end