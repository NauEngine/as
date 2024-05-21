
function foo(a, b)
    local from = 1
    local count = 10
    local a = 1
    local b = 3
    local sum = 0;
    for i = from, count + a + b do
        sum = sum + i
        print(sum)
    end
    return sum
end



