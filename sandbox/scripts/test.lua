
local counter_1 = 0
local counter_2 = 100

function update_1()
    print("Info from lua N1 " .. counter_1)
    counter_1 = counter_1 + 1
end

function update_2(num)
    print("Info from lua N2 " .. counter_1 .. "  [" .. num .. "]")
    counter_1 = counter_1 + 1
end

print("Global print")

