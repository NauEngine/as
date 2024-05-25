
function test()
    local sum = 0
    for i = 1, 100000 do
    	sum = sum + 1
    	sum = sum * 2
    	sum = sum - 15
    end
end
