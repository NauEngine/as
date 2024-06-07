/*
function a(a, b, c) {
    if (a) {
        return b;
    } else {
        return c;
    }
}

function b(a) {
    return a;
}

function c(a) {
    return a;
}

function d() {
    iface.a("Hello");
    print("PRINT: " + iface.b(42.42));
}

function e(a) {
    print("e.a: " + a.tostring() + "\n");
    //printGlobals();
    iface.c(42);
}
*/

class intface {
    function a(a) {
        print("intface.a: " + a + "\n")
    }
}

function f(a) {
    print("f.a: " + a + "\n");
    //printGlobals();
    intface.a("Test");
    //iface.a("Test");
}

// ----------

function printGlobals() {
    print("\nGLOBALS:\n");
    local root = getroottable();
    foreach (key, value in root) {
        local typeStr = typeof value;
        print("  " + typeStr + ": " + key + "\n");
    }
    print("\n");
}