//
// Created by Alex Zelenshikov on 22.05.2024.
//

#include "as/core/cpp_interface.h"
#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/languages/lua/lua_language.h"

#include "benchmark_runner_luaas.h"

DEFINE_SCRIPT_INTERFACE(TestCase,
struct TestCase
{
  virtual void test() = 0;
};
)

namespace as::benchmark
{

std::unique_ptr<IBenchmarkRunner> getRunnerLuaAs()
{
    return std::make_unique<BenchmarkRunnerLuaAs>();
}

void BenchmarkRunnerLuaAs::prepare(const std::string& filename)
{
    m_core = std::make_shared<as::Core>();
    auto lua_language = std::make_shared<as::LuaLanguage>();
    m_core->registerLanguage("lua", std::move(lua_language));

    m_scriptModule = m_core->newScriptModule<TestCase>(filename);
    m_testCase = m_scriptModule->newInstance();
}

void BenchmarkRunnerLuaAs::run()
{
    m_testCase->test();
}

void BenchmarkRunnerLuaAs::shutdown()
{
    delete m_testCase;
    m_scriptModule = nullptr;
    m_core = nullptr;
}
}