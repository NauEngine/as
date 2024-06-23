//
// Created by ivn on 23.06.2024.
//
#include <gtest/gtest.h>
#include <gmock/gmock-function-mocker.h>
#include <gmock/gmock-nice-strict.h>

#include "as/core/core.h"
#include "as/core/core_compile.h"
#include "as/core/ir.h"

#include "as/core/language.h"
#include "as/core/language_runtime.h"
#include "as/core/language_script.h"
#include "includes/set_get.h"
#include "includes/simple.h"

extern "C" const void* __asRequireRuntime(as::Core* core, const char* name);
extern "C" const void* __asRegisterVTable(as::Core* core, const char* name, as::ScriptModuleRuntime::FunctionPtr* vtable, int vtable_size);

typedef void (*InitFunction)(as::Core* core);
extern "C" void __asRegisterInit(const char* name, InitFunction ptr);

class MockRuntime : public as::ILanguageRuntime
{
public:
    MOCK_METHOD(const char*, name, (), (override));
    MOCK_METHOD(const void*, ptr, (), (override));
};

static int g_foo_count = 0;
static int g_foo_value = 0;

static int foo()
{
    g_foo_count++;
    return g_foo_value;
}

static void resetFoo(int value)
{
    g_foo_count = 0;
    g_foo_value = value;
}

static int g_foo2_count = 0;
static int g_foo2_value = 0;

static int foo2()
{
    g_foo2_count++;
    return g_foo2_value;
}

static void resetFoo2(int value)
{
    g_foo2_count = 0;
    g_foo2_value = value;
}

static void initFoo(as::Core* core)
{
    as::ScriptModuleRuntime::FunctionPtr vtable[] = { (as::ScriptModuleRuntime::FunctionPtr)((void*)&foo) };
    core->registerVTable(as::ir::safe_name("foo").c_str(), vtable, 1);
}

TEST(CoreTest, RequireUnregistredTest)
{
    as::Core core;

    EXPECT_EQ(__asRequireRuntime(&core, "foo"), nullptr);
}

TEST(CoreTest, RegisterRuntimeTest)
{
    as::Core core;
    auto runtime = std::make_shared<testing::StrictMock<MockRuntime>>();

    EXPECT_CALL(*runtime, name()).WillOnce(testing::Return("foo"));

    core.registerRuntime(runtime);
}

TEST(CoreTest, RequireRuntimeTest)
{
    as::Core core;
    auto runtime = std::make_shared<testing::StrictMock<MockRuntime>>();
    auto obj = std::make_shared<int>();

    EXPECT_CALL(*runtime, name()).WillOnce(testing::Return("foo"));
    EXPECT_CALL(*runtime, ptr()).WillOnce(testing::Return(obj.get()));

    core.registerRuntime(runtime);
    EXPECT_EQ(__asRequireRuntime(&core, "foo"), obj.get());
}

TEST(CoreTest, RegisterVTableTest)
{
    resetFoo(42);
    as::Core core;

    __asRegisterInit(as::ir::safe_name("foo").c_str(), &initFoo);

    auto module = core.newScriptModule<SimpleScript>("foo");
    auto instance = module->newInstance();

    EXPECT_EQ(instance->foo(), 42);
    EXPECT_EQ(g_foo_count, 1);
}

TEST(CoreTest, HotReloadVTableTest)
{
    resetFoo(42);
    resetFoo2(4242);
    as::Core core;

    __asRegisterInit(as::ir::safe_name("foo").c_str(), &initFoo);

    auto module = core.newScriptModule<SimpleScript>("foo");
    auto instance = module->newInstance();

    EXPECT_EQ(instance->foo(), 42);
    EXPECT_EQ(g_foo_count, 1);

    as::ScriptModuleRuntime::FunctionPtr vtable2[] = { (as::ScriptModuleRuntime::FunctionPtr)((void*)&foo2) };
    core.registerVTable(as::ir::safe_name("foo").c_str(), vtable2, 1);

    EXPECT_EQ(instance->foo(), 4242);
    EXPECT_EQ(g_foo_count, 1);
    EXPECT_EQ(g_foo2_count, 1);
}
