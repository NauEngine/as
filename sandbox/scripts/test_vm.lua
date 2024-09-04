-- implements "test_vm.h"
-- require logger implements "logger.h"

function foo(a, b) -- 10, 20
    return a + b
end

function bar(a)
    logger:warn(10, 20)
    return a * 100
end



