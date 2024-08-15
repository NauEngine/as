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
    print("PRINT: " + iface.b());
}

function e(a) {
    print("e.a: " + a.tostring() + "\n");
}

function f(a) {
    //printGlobals();
    printObjectMethods(iface, "iface");
    printObjectMethods(yaiface, "yaiface");

    //callMethodA();
    callMethodC();
}

// ----------

function callMethodA() {
    iface.a("Hello from Squirrel");
}

function callMethodC() {
    print("callMethodC()\n");
    iface.a("Hello");
    iface.c(123, 123.123, "HELLO");
    print("D: " + iface.d("This is Sparta!!!") + "\n");
    print("E: " + iface.e(1.2, 2.3) + "\n");
    print("F: " + iface.f("Hello, ", "Vovumba!") + "\n");
    yaiface.a();
}

function printGlobals() {
    print("\nGLOBALS:\n");
    local root = getroottable();
    foreach (key, value in root) {
        local typeStr = typeof value;
        print("  " + typeStr + ": " + key + "\n");
    }
    print("\n");
}

function printClassMethods() {
    local function iterateTable(tbl) {
        foreach (key, value in tbl) {
            local typeStr = typeof value;
            print("  " + typeStr + ": " + key + "\n");
        }
    }

    print("\niface methods:\n");
    iterateTable(iface);

    local delegate = iface.getdelegate();
    if (delegate) {
        print("  (from delegate)\n");
        iterateTable(delegate);
    }
    print("\n");
}

function printObjectMethods(obj, objName) {
    function iterateTable(tbl) {
        foreach (key, value in tbl) {
            local typeStr = typeof value;
            print("  " + typeStr + ": " + key + "\n");
        }
    }

    print("\n" + objName + " methods and properties:\n");
    iterateTable(obj);

    if (typeof obj.getdelegate == "function") {
        local delegate = obj.getdelegate();
        if (delegate) {
            print("  (from delegate)\n");
            iterateTable(delegate);
        }
    }
    print("\n");
}
