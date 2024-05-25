function test()
    local N = 4000
    local S = 1000

    local t = {}

    for i = 1, N do
        t[i] = {
            a = 0.0,
            b = 1.0,
            f = i * 0.25
        }
    end

    for j = 1, S-1 do
        for i = 1, N-1 do
            t[i].a = t[i].a + t[i].b * t[i].f
            t[i].b = t[i].b - t[i].a * t[i].f
        end
    end
end