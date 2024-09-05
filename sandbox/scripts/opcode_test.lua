-- implements "opcode_test.h"

function test_OP_LOADBOOL(a, b)
    if a < b then
    	print("test_OP_LOADBOOL: true")
    else
        print("test_OP_LOADBOOL: false")
    end
end

function test_OP_LOADNIL()
    local a, b, c, d, e = nil, nil, 10
    print("test_OP_LOADNIL: " .. tostring(a))
    print("test_OP_LOADNIL: " .. tostring(b))
    print("test_OP_LOADNIL: " .. tostring(c))
    print("test_OP_LOADNIL: " .. tostring(d))
    print("test_OP_LOADNIL: " .. tostring(e))
end

local value1 = 10
function test_OP_SETUPVAL()
    print("test_OP_SETUPVAL: " .. tostring(value1))
    value1 = 100
    print("test_OP_SETUPVAL: " .. tostring(value1))
end

function run_all()
    test_OP_LOADBOOL(10, 20) -- true
    test_OP_LOADBOOL(10, 5) -- false
    print("")
    test_OP_LOADNIL()
    print("")
    test_OP_SETUPVAL()
end