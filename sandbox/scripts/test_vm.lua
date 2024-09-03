local x = 10
local z = 1
local ss = 50
y = 21

function closure_test(p)
    local t = 100
    return function() return t + p + ss end
end

function test()
    return 10, 20
end

function foo(a, b) -- 10, 20
    local func = closure_test(100)
    return func() + x + y + z + a + b
end

function bar(a)
    local t1, t2 = test()
    return a * 100 + y + t1 + t2
end

