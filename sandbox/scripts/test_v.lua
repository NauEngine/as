function a(a, b, c)
    if a then
        return b
    else
        return c
    end
end

function b(a)
    return a
end

function c(a)
    return a
end

function d()
    iface:a("Hello")
    print("PRINT: " .. iface:b(42.42))
end