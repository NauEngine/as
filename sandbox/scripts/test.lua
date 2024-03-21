
local counter = 0

function update()
    print("Info from lua " .. counter)
    counter = counter + 1
end

print("Global print")