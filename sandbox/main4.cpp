#include <iostream>
#include <set>

constexpr int sum(std::convertible_to<int> auto ...i)
{
  return (0 + ... + i);
}

template<int ...N>
struct Nested
{
  static constexpr int nested_sum(auto ...v)
  {
    return sum(sum(N..., v)...);
  }
};

template <typename ...T>
struct Counter
{
  static constexpr std::size_t value = sizeof...(T);
};


template<std::convertible_to<std::string> ...T>
auto make_prefixer(T&& ...args)
{
  using namespace std::string_literals;
  return [...p = std::string(std::forward<T>(args))](const std::string& msg)
  {
    return ((p + ": "s + msg + "\n"s) + ...);
  };
}

template<char ...Cs>
struct string_holder
{
  static constexpr std::size_t len = sizeof...(Cs);
  static constexpr char value[] = { Cs..., '\0' };
  constexpr operator const char *() const { return value; }
  constexpr operator std::string() const { return { value, len }; }
};

template<size_t N, char...Cs>
consteval auto index_string()
{
  if constexpr (N < 10)
  {
    return string_holder<'0' + N, Cs...>{};
  }
  else
  {
    return index_string<N / 10, (N % 10) + '0', Cs...>();
  }
}

template<char ...Out>
consteval auto add_commas(string_holder<>, string_holder<Out...> out)
{
  return out;
}

template<char In0, char ...InRest, char ...Out>
consteval auto add_commas(string_holder<In0, InRest...>, string_holder<Out...> = {})
{
  if constexpr (sizeof...(InRest) % 3 == 0 && sizeof...(InRest) > 0)
    return add_commas(string_holder<InRest...>{},
                      string_holder<Out..., In0, ','>{});
  else
    return add_commas(string_holder<InRest...>{},
                      string_holder<Out..., In0>{});
}

template<typename T, typename ...E>
void multi_insert(T &t, E&&...e)
{
  // unary right fold over comma
  (void(t.insert(std::forward<E>(e))), ...);
}

auto tuple_mult(auto scalar, auto tpl)
{
  return std::apply([&scalar]<typename ...T>(T...t) {
    return std::tuple(T(scalar * t)...);
  }, tpl);
}

template<typename T>
auto tuple_add(const T& a, const T& b)
{
  return [&a, &b]<std::size_t ...I>(std::index_sequence<I...>) {
    return std::tuple(get<I>(a) + get<I>(b)...);
  }(std::make_index_sequence<std::tuple_size_v<T>>{});
}

template<typename T> using tuple_ptrs =
    decltype(std::apply([](auto ...t) { return std::tuple(&t...); },
                        std::declval<T>()));

template<typename ...Lambdas>
struct multilambda : Lambdas... {
  using Lambdas::operator()...;
};
template<typename ...Lambdas>
multilambda(Lambdas...) -> multilambda<Lambdas...>;


int main()
{
  std::cout << Nested<1, 2>::nested_sum(100, 200) << std::endl;
  std::cout << Nested<2, 7>::nested_sum(200, 200) << std::endl;
  std::cout << Counter<int, double, Nested<1>>::value << std::endl;

  std::cout << index_string<101>() << std::endl;
  std::cout << add_commas(index_string<10000000000>()) << std::endl;

  std::set<std::string> a;

  using namespace std::string_literals;
  multi_insert(a, "dsd", "asdad"s);

  auto t = std::tuple(1, 2U, 4.0);
  t = tuple_add(t, tuple_mult(10, t));
  std::cout << get<0>(t) << " "
            << get<1>(t) << " "
            << get<2>(t) << std::endl;

  using namespace std::string_literals;
  std::tuple t2 (1, true, "hello"s, 3.0);
  constexpr multilambda action
  {
      [](int i) { std::cout << "int: " << i << std::endl; },
      [](double d) { std::cout << "double: " << d << std::endl; },
      [](bool b) { std::cout << (b ? "yes\n" : "no\n"); },
      [](const std::string& s) { std::cout << s.size() << " bytes\n"; },
  };
  apply([action](auto ...v) {
    (action(v), ...);  // unary right fold
  }, t2);
}