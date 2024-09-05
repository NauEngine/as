//
// Created by Alex Zelenshikov on 22.05.2024.
//

#include "as/core/cpp_interface.h"
#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/languages/lua/lua_language.h"
#include "as/languages/lua/lua_language_runtime.h"

#include "benchmark_runner_luaas.h"

DEFINE_SCRIPT_INTERFACE(TestCase,
  virtual double test() = 0;
)

DEFINE_SCRIPT_INTERFACE(TestCalls,
  virtual double call_add(double a, double b) = 0;
  virtual bool call_not(bool a) = 0;
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

    m_core->registerLanguage("lua", std::make_shared<as::LuaLanguage>());
    m_core->registerRuntime(std::make_shared<as::LuaLanguageRuntime>());

    m_scriptModuleCase = m_core->newScriptModule<TestCase>(filename);
    m_testCase = m_scriptModuleCase->newInstance();
}

double BenchmarkRunnerLuaAs::run()
{
    return m_testCase->test();
}

void BenchmarkRunnerLuaAs::shutdown()
{
    if (m_testCase)
    {
        delete m_testCase;
        m_testCase = nullptr;
    }
    if (m_testCalls)
    {
        delete m_testCalls;
        m_testCalls = nullptr;
    }
    m_scriptModuleCase = nullptr;
    m_scriptModuleCalls = nullptr;
    m_core = nullptr;
}

void BenchmarkRunnerLuaAs::prepare_calls(const std::string& filename)
{
    m_core = std::make_shared<as::Core>();

    m_core->registerLanguage("lua", std::make_shared<as::LuaLanguage>());
    m_core->registerRuntime(std::make_shared<as::LuaLanguageRuntime>());

    m_scriptModuleCalls = m_core->newScriptModule<TestCalls>(filename);
    m_testCalls = m_scriptModuleCalls->newInstance();
}

double BenchmarkRunnerLuaAs::run_add(double a, double b)
{
    return m_testCalls->call_add(a, b);
}

bool BenchmarkRunnerLuaAs::run_not(bool a)
{
    return m_testCalls->call_not(a);
}

} // namespace as::benchmark
