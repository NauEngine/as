-- implements "test_script.h"
-- require logger implements "logger.h"

function foo(a, b)
    logger:warn(100, 200)
    logger:debug(100, 200)
    return a + b
end

function bar(a)
    return a * 100
end

