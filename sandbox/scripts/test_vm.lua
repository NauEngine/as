
function closure_test(p)
    local t = 50
    print("TL: " .. t)
    return function()
        print("T: " .. t)
        print("P: " .. p)
        return t + p
    end -- 100 + p
end

function foo(a, b) -- 10, 20
    return closure_test(200)() -- 250
end

function bar(a)
    return 10 -- closure_test(100)() -- 150
end

