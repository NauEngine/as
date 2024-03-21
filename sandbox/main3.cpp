//
// Created by Alex Zelenshikov on 21.03.2024.
//
#include <tuple>
#include <functional>

struct TestAppObject
{
  int TestMethod (char, short, int, long, long long)
  { return 0; }
};

template <typename T>
struct MemberFuncArgs;

template <typename RT, typename Owner, typename ... Args>
struct MemberFuncArgs<RT(Owner::*)(Args...)>
{
  static constexpr std::size_t ArgCount = sizeof...(Args);

  using ReturnType  = RT;
  using InArgsTuple = std::tuple<Args...>;
};

int main()
{
  using MFA  = MemberFuncArgs<decltype(&TestAppObject::TestMethod)>;
  using FunT = decltype([]<std::size_t ... Is>(std::index_sequence<Is...>)
      -> std::function<void(TestAppObject*,
                            typename std::tuple_element<Is, MFA::InArgsTuple>::type ...)>
  { return {}; }
      (std::make_index_sequence<MFA::ArgCount>{}));

  FunT func = &TestAppObject::TestMethod;

}