
local counter = 0

function update()
    print("Info from lua " .. counter)
    counter = counter + 1
end

function update()
    print("Info from lua " .. counter)
    counter = counter + 1
end

local function test()
    print("test 1")
end

local function test()
    print("test 2")
end

print("Global print")
--_G["test"]()
test()

