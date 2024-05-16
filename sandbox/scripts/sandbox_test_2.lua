
local t = 10;

function foo(a, b)
    t = t + 1;
    return a + b + t
end

function bar(a)
    t = t + 1;
    return a * 200 + t
end

