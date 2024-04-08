
local counter_1 = 0
local counter_2 = 100

function update_1()
    print("Info from lua N1 " .. counter_1)
    counter_1 = counter_1 + 1
end

function update_2()
    print("Info from lua N2 " .. counter_2)
    counter_2 = counter_2 + 1
end

print("Global print")

