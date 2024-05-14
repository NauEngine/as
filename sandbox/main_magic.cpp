#include <array>
#include <iostream>
#include <algorithm>
#include <string_view>

template <std::size_t N>
struct ConstexprString {
    std::array<char, N> data;

    constexpr explicit ConstexprString(const char(&str)[N]) {
        std::copy_n(str, N, data.begin());
    }

    [[nodiscard]] constexpr const char* c_str() const {
        return data.data();
    }

    [[nodiscard]] constexpr std::string_view str_view() const {
        return std::string_view(data.data(), N - 1);  // N-1 чтобы исключить null-терминатор
    }

    [[nodiscard]] constexpr std::size_t size() const {
        return N;
    }

    [[nodiscard]] constexpr bool operator==(const ConstexprString& other) const {
        return data == other.data;
    }
};

struct Foo {
    virtual int bar() = 0;
    virtual ~Foo() = default;
};

struct Foo_1 : Foo {
    int bar() override { return 100; }
};

struct Foo_2 : Foo {
    int bar() override { return 200; }
};

constexpr ConstexprString test_1_lua("../../sandbox/scripts/test_1.lua");
constexpr ConstexprString test_2_lua("../../sandbox/scripts/test_2.lua");

template <typename T, ConstexprString filename>
T* newInstanceImpl();

template <>
Foo* newInstanceImpl<Foo, test_1_lua>() {
    return new Foo_1();
}

template <>
Foo* newInstanceImpl<Foo, test_2_lua>() {
    return new Foo_2();
}

template <typename T, ConstexprString filename>
consteval T* createInstance() {
    return newInstanceImpl<T, filename>();
}

template <typename T>
T* newInstance(std::string_view filename) {
    if (filename == test_1_lua.str_view()) {
        return newInstanceImpl<T, test_1_lua>();
    } else if (filename == test_2_lua.str_view()) {
        return newInstanceImpl<T, test_2_lua>();
    } else {
        return nullptr;
    }
}

int main() {
    auto inst1 = newInstance<Foo>("../../sandbox/scripts/test_1.lua");
    auto inst2 = newInstance<Foo>("../../sandbox/scripts/test_2.lua");

    if (inst1) {
        std::cout << inst1->bar() << "\n";
    } else {
        std::cout << "inst1 is nullptr\n";
    }

    if (inst2) {
        std::cout << inst2->bar() << "\n";
    } else {
        std::cout << "inst2 is nullptr\n";
    }

    delete inst1;
    delete inst2;

    return 0;
}