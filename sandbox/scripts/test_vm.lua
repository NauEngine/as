
local x = 11
y = 21

function closure_test(p)
    local t = 100
    return function() return t + p end
end

function test()
    return 10, 20
end

function foo(a, b)
    local func = closure_test(100)
    return func(100) + x + y + a + b
end

function bar(a)
    local t1, t2 = test()
    return a * 100 + y + t1 + t2
end



