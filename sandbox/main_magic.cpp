#include <array>
#include <iostream>
#include <algorithm>
#include <string_view>

template <std::size_t N>
struct ScriptPath {
    std::array<char, N> data;

    constexpr explicit ScriptPath(const char(&str)[N]) {
        std::copy_n(str, N, data.begin());
    }
};

struct Foo {
    virtual int bar() = 0;
    virtual ~Foo() = default;
};

struct Foo_1 final : Foo {
    int bar() override { return 100; }
};

struct Foo_2 final : Foo {
    int bar() override { return 200; }
};

constexpr ScriptPath test_1_lua("../../sandbox/scripts/test_cycle.lua");
constexpr ScriptPath test_2_lua("../../sandbox/scripts/test_2.lua");

template <typename T, ScriptPath filename>
T* newInstance();

template <>
Foo* newInstance<Foo, test_1_lua>() {
    return new Foo_1();
}

template <>
Foo* newInstance<Foo, test_2_lua>() {
    return new Foo_2();
}


int main() {
    const auto inst1 = newInstance<Foo, ScriptPath("../../sandbox/scripts/test_1.lua")>();
    const auto inst2 = newInstance<Foo, ScriptPath("../../sandbox/scripts/test_2.lua")>();

    std::cout << inst1->bar() << "\n";
    std::cout << inst2->bar() << "\n";

    delete inst1;
    delete inst2;

    return 0;
}