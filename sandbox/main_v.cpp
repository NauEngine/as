#include <iostream>
#include <filesystem>

#include "as/core/core.h"
#include "as/core/script_module.h"
#include "as/core/cpp_interface_parser.h"

#include "as/languages/lua/lua_language.h"
#include "as/languages/squirrel/sq_language.h"

DEFINE_SCRIPT_INTERFACE(TestScript,
struct TestScript
{
  virtual const char* a(bool a, const char* b, const char* c) = 0;
  virtual int32_t b(int64_t a) = 0;
  virtual float c(double a) = 0;
  virtual void d() = 0;
  virtual void e(int32_t a) = 0;
  virtual void f(const char* a) = 0;
};
)

DEFINE_SCRIPT_INTERFACE(TestInterface,
struct TestInterface
{
  virtual void a(const char* a) = 0;
  virtual const char* b() = 0;
  virtual void c(int32_t a, float b, const char* c) = 0;
  virtual int64_t d(const char* a) = 0;
  virtual double e(float a, float b) = 0;
  virtual const char* f(const char *a, const char* b) = 0;
};
)

struct TestInterfaceImpl : TestInterface
{
  void a(const char* a) override
  {
    std::cout << "TestInterface.a(" << a << ") -> void" << std::endl;
  }

  const char* b() override
  {
    const char* result = "TestInterface";
    std::cout << "TestInterface.b() -> " << result << std::endl;
    return result;
  }

  void c(int32_t a, float b, const char* c) override
  {
    std::cout << "TestInterface.c(" << a << ", " << b << ", '" << c << "') -> void" << std::endl;
  }

  int64_t d(const char* a) override
  {
    int64_t result = strlen(a);
    std::cout << "TestInterface.d('" << a << "') -> " << result << std::endl;
    return result;
  }

  double e(float a, float b) override
  {
    double result = a + b;
    std::cout << "TestInterface.e(" << a << ", " << b << ") -> " << result << std::endl;
    return result;
  }

  const char* f(const char *a, const char* b) override
  {
    char* result = (char*)malloc(strlen(a) + strlen(b) + 1);
    strcpy(result, a);
    strcat(result, b);
    std::cout << "TestInterface.f('" << a << "', '" << b << "') -> " << result << std::endl;
    return result;
  }
};

DEFINE_SCRIPT_INTERFACE(YetAnotherTestInterface,
struct YetAnotherTestInterface
{
  virtual void a() = 0;
};
)

struct YetAnotherTestInterfaceImpl : YetAnotherTestInterface
{
  void a() override
  {
    std::cout << "YetAnotherTestInterface.a() -> void" << std::endl;
  }
};

void check_lua(const std::shared_ptr<as::Core>& script_core) {
  auto lua_language = std::make_shared<as::LuaLanguage>();
  script_core->registerLanguage("lua", std::move(lua_language));

  TestInterfaceImpl iface;
  script_core->registerInstance<TestInterface>(&iface, "iface");

  std::shared_ptr<as::ScriptModule<TestScript>> script_module;
  script_module = script_core->newScriptModule<TestScript>("./sandbox/scripts/test_v.lua", "lua");

  TestScript* instance;
  instance = script_module->newInstance();
  
  //std::cout << "a: " << instance->a(true, "true", "false") << std::endl;
  //std::cout << "b: " << instance->b(10) << std::endl;
  //std::cout << "b: " << instance->b(-10000000000) << std::endl;
  //std::cout << "b: " << instance->b(9223372036854775807) << std::endl;
  //std::cout << "c: " << instance->c(10.0) << std::endl;
  //std::cout << "c: " << instance->c(-123456789.123456789) << std::endl;
  //std::cout << "c: " << instance->c(3.4028235e40) << std::endl;

  //instance->d();

  instance = nullptr;
  script_module = nullptr;
  lua_language = nullptr;
}

void check_squirrel(const std::shared_ptr<as::Core>& script_core) {
  auto squirrel_language = std::make_shared<as::SquirrelLanguage>();
  script_core->registerLanguage("sq", std::move(squirrel_language));

  TestInterfaceImpl iface;
  script_core->registerInstance<TestInterface>(&iface, "iface");

  YetAnotherTestInterfaceImpl yaiface;
  script_core->registerInstance<YetAnotherTestInterface>(&yaiface, "yaiface");

  std::shared_ptr<as::ScriptModule<TestScript>> script_module;
  script_module = script_core->newScriptModule<TestScript>("./sandbox/scripts/test_v.nut", "sq");

  TestScript* instance;
  instance = script_module->newInstance();

  std::cout << "a: " << instance->a(false, "true", "false") << std::endl;
  std::cout << "b: " << instance->b(10) << std::endl;
  std::cout << "b: " << instance->b(-10000000000) << std::endl;
  std::cout << "b: " << instance->b(9223372036854775807) << std::endl;
  std::cout << "c: " << instance->c(10.0) << std::endl;
  std::cout << "c: " << instance->c(-123456789.123456789) << std::endl;
  std::cout << "c: " << instance->c(3.4028235e40) << std::endl;
  instance->e(-1);
  instance->f("Test");

  squirrel_language = nullptr;
}

int main() {
  std::cout << "PWD: " << std::filesystem::current_path() << std::endl << std::endl;
  
  auto script_core = std::make_shared<as::Core>();
  
  //check_lua(script_core);
  check_squirrel(script_core);
  
  script_core = nullptr;

  std::cout << "Over and out!" << std::endl;

  return 0;
}

/*

// Отладочная печать стека
void printStackContent(HSQUIRRELVM v, const std::string& message) {
    SQInteger top = sq_gettop(v);
    llvm::outs() << message << " Stack top: " << top << "\n";
    for (SQInteger i = -1; i >= -top; --i) {
        SQObjectType type = sq_gettype(v, i);
        const SQChar* typeName;
        SQUserPointer ptr = nullptr;
        SQObject obj;
        sq_getstackobj(v, i, &obj);
        SQInteger size = sq_getsize(v, i);
        
        switch (type) {
            case OT_NULL: typeName = "OT_NULL"; break;
            case OT_INTEGER: typeName = "OT_INTEGER"; break;
            case OT_FLOAT: typeName = "OT_FLOAT"; break;
            case OT_STRING: typeName = "OT_STRING"; break;
            case OT_TABLE: typeName = "OT_TABLE"; break;
            case OT_ARRAY: typeName = "OT_ARRAY"; break;
            case OT_USERDATA: typeName = "OT_USERDATA"; break;
            case OT_CLOSURE: typeName = "OT_CLOSURE"; break;
            case OT_NATIVECLOSURE: typeName = "OT_NATIVECLOSURE"; break;
            case OT_GENERATOR: typeName = "OT_GENERATOR"; break;
            case OT_USERPOINTER: typeName = "OT_USERPOINTER"; break;
            case OT_THREAD: typeName = "OT_THREAD"; break;
            case OT_FUNCPROTO: typeName = "OT_FUNCPROTO"; break;
            case OT_CLASS: typeName = "OT_CLASS"; break;
            case OT_INSTANCE: typeName = "OT_INSTANCE"; break;
            case OT_WEAKREF: typeName = "OT_WEAKREF"; break;
            case OT_OUTER: typeName = "OT_OUTER"; break;
            default: typeName = "UNKNOWN"; break;
        }

        //const SQChar* address = (const SQChar*)sq_getuserpointer(v, i);
        llvm::outs() << "  Stack [" << i << "], Type: " << type << " (" << typeName << "), Size: " << size << "\n";

        if (type == OT_TABLE || type == OT_CLASS) {
            sq_pushnull(v); // Пушим null (начинаем итерацию с самого начала)
            while (SQ_SUCCEEDED(sq_next(v, i))) {
                const SQChar* key;
                sq_getstring(v, -2, &key);
                llvm::outs() << "    Key: " << key << ", Value: [complex type]\n";
                sq_pop(v, 2); // Удаляем ключ и значение, но оставляем итератор
            }
            sq_pop(v, 1); // Удаляем итератор
        }
        
        // Вывод дополнительной информации в зависимости от типа
        switch (type) {
            case OT_INTEGER: {
                SQInteger val;
                if (SQ_SUCCEEDED(sq_getinteger(v, i, &val))) {
                    llvm::outs() << "    Value: " << val << "\n";
                }
                break;
            }
            case OT_FLOAT: {
                SQFloat val;
                if (SQ_SUCCEEDED(sq_getfloat(v, i, &val))) {
                    llvm::outs() << "    Value: " << val << "\n";
                }
                break;
            }
            case OT_STRING: {
                const SQChar* val;
                if (SQ_SUCCEEDED(sq_getstring(v, i, &val))) {
                    llvm::outs() << "    Value: " << val << "\n";
                }
                break;
            }
            case OT_USERPOINTER: {
                SQUserPointer val;
                if (SQ_SUCCEEDED(sq_getuserpointer(v, i, &val))) {
                    llvm::outs() << "    UserPointer: " << val << "\n";
                }
                break;
            }
            case OT_TABLE:
            case OT_CLASS:
            case OT_INSTANCE:
            case OT_ARRAY:
            case OT_CLOSURE:
            case OT_NATIVECLOSURE:
            case OT_USERDATA: {
                // Вывод информации о типе объекта и его содержимом
                sq_pushnull(v);  // Начинаем итерацию с нулевого ключа
                llvm::outs() << "    Keys: [";
                while (SQ_SUCCEEDED(sq_next(v, i))) {
                    const SQChar* key;
                    if (SQ_SUCCEEDED(sq_getstring(v, -2, &key))) {
                        switch (sq_gettype(v, -1)) {
                            case OT_STRING: {
                                const SQChar* value;
                                if (SQ_SUCCEEDED(sq_getstring(v, -1, &value))) {
                                    llvm::outs() << key << ",";
                                }
                                break;
                            }
                            case OT_INTEGER: {
                                SQInteger value;
                                if (SQ_SUCCEEDED(sq_getinteger(v, -1, &value))) {
                                    llvm::outs() << key << ",";
                                }
                                break;
                            }
                            case OT_FLOAT: {
                                SQFloat value;
                                if (SQ_SUCCEEDED(sq_getfloat(v, -1, &value))) {
                                    llvm::outs() << key << ",";
                                }
                                break;
                            }
                            default: {
                                llvm::outs() << key << ",";
                                break;
                            }
                        }
                    }
                    sq_pop(v, 2); // Убираем ключ и значение, оставляем только таблицу
                }
                llvm::outs() << "]\n";
                sq_pop(v, 1); // Убираем таблицу со стека
                break;
            }
            default:
                break;
        }
    }
}

*/

/*

void printMetatable(HSQUIRRELVM v, HSQOBJECT metatable) {
    //sq_pushobject(v, metatable);
    sq_pushnull(v); // Начинаем итерировать с первого ключа
    while (SQ_SUCCEEDED(sq_next(v, -2))) {
        const SQChar* key;
        sq_getstring(v, -2, &key); // Получаем ключ
        SQObjectType valueType = sq_gettype(v, -1); // Получаем тип значения

        llvm::outs() << "Metatable entry - Key: " << key << ", Type: " << valueType << "\n";

        sq_pop(v, 2); // Убираем значение и ключ, оставляем только таблицу
    }
    sq_pop(v, 1); // Убираем таблицу
}

*/

/*

// Создание тестовой таблицы с методами в C++, а не в LLVM IR
void SquirrelLanguage::createSimpleMetatable(const std::shared_ptr<ScriptInterface>& interface) {
    sq_newtable(m_sq_vm); // Создаем простую таблицу метатаблицы  
    llvm::outs() << "Simple metatable created for interface '" << interface->name << "'.\n";

    sq_pushstring(m_sq_vm, "a", -1);
    sq_newclosure(m_sq_vm, [](HSQUIRRELVM v) -> SQInteger {
        SQInteger myInt;
        if (SQ_FAILED(sq_getinteger(v, 1, &myInt))) {
            return sq_throwerror(v, "Failed to get integer parameter.");
        }
        llvm::outs() << "Anonymous function 'a' called with parameter: " << myInt << "\n";
        return 0;
    }, 0);
    sq_newslot(m_sq_vm, -3, SQFalse);


    sq_pushstring(m_sq_vm, "c", -1);
    sq_newclosure(m_sq_vm, [](HSQUIRRELVM v) -> SQInteger {
        const SQChar *myString;
        if (SQ_FAILED(sq_getstring(v, -1, &myString))) {
            return sq_throwerror(v, "Failed to get string parameter.");
        }
        SQFloat myFloat;
        if (SQ_FAILED(sq_getfloat(v, -2, &myFloat))) {
            return sq_throwerror(v, "Failed to get float parameter.");
        }
        SQInteger myInt;
        if (SQ_FAILED(sq_getinteger(v, -3, &myInt))) {
            return sq_throwerror(v, "Failed to get integer parameter.");
        }
        llvm::outs() << "Anonymous function 'c' called with parameter:\n"
            << "  a: " << myInt << ", "
            << "  b: " << myFloat << ", "
            << "  c: '" << myString << "'\n";
        
        sq_pushstring(v, _SC("__instance"), -1);
        if (SQ_SUCCEEDED(sq_get(v, 1))) {
            if (sq_gettype(v, -1) == OT_USERPOINTER) {
                void* userPointer;
                if (SQ_SUCCEEDED(sq_getuserpointer(v, -1, &userPointer))) {
                    llvm::outs() << "User pointer: " << reinterpret_cast<void*>(userPointer) << "\n";

                    // Структура и реализация интерфейса, который должен быть в instance
                    struct TestInterface {
                        virtual void a(const char* a) = 0;
                        virtual void c(int32_t a, float b, const char* c) = 0;
                    };

                    struct TestInterfaceImpl : TestInterface {
                        void a(const char* a) override {
                            std::cout << "TestInterface.a: " << a << std::endl;
                        }

                        void c(int32_t a, float b, const char* c) override {
                            std::cout << "TestInterface.c: " << a << ", " << b << ", " << c << std::endl;
                        }
                    };

                    TestInterface* instance = static_cast<TestInterface*>(userPointer);
                    instance->c(42, 3.14, "Another test");
                } else {
                    llvm::outs() << "Failed to get user pointer\n";
                }
            } else {
                llvm::outs() << "The value associated with __instance is not a user pointer\n";
            }
            sq_pop(v, 1);
        } else {
            llvm::outs() << "Failed to get the value associated with __instance\n";
        }

        return 0;
    }, 0);
    sq_newslot(m_sq_vm, -3, SQFalse);

    // Сохраняем метатаблицу как HSQOBJECT
    HSQOBJECT metatable;
    sq_getstackobj(m_sq_vm, -1, &metatable);
    sq_addref(m_sq_vm, &metatable);
    m_createdMetatables[interface->name] = metatable;

    sq_pop(m_sq_vm, 1); // Убираем таблицу метатаблицы со стека
}

*/

/*

// Сохранение модуля для отладки
std::string moduleStr;
llvm::raw_string_ostream moduleStream(moduleStr);
module->print(moduleStream, nullptr);
moduleStream.flush();
llvm::outs() << "LLVM IR Module:\n" << moduleStr << "\n";

*/

/*

// DEBUG: Добавляем вызов функции вывода в пустышку
llvm::FunctionType* printfType = llvm::FunctionType::get(builder.getInt32Ty(), builder.getInt8PtrTy(), true);
llvm::FunctionCallee printfFunc = module->getOrInsertFunction("printf", printfType);

auto printPointer = [&](const std::string& msg, llvm::Value* ptr) {
  llvm::Value* formatStr = builder.CreateGlobalStringPtr(msg + ": %p\n");
  builder.CreateCall(printfFunc, {formatStr, ptr});
};

auto printMessage = [&](const std::string& msg) {
  llvm::Value* formatStr = builder.CreateGlobalStringPtr(msg + "\n");
  builder.CreateCall(printfFunc, {formatStr});
};

auto printValueAsInt = [&](const std::string& msg, llvm::Value* value) {
  llvm::Value* formatStr = builder.CreateGlobalStringPtr(msg + ": %d\n");
  builder.CreateCall(printfFunc, {formatStr, value});
};

auto printValueAsFloat = [&](const std::string& msg, llvm::Value* value) {
  llvm::Value* formatStr = builder.CreateGlobalStringPtr(msg + ": %f\n");
  builder.CreateCall(printfFunc, {formatStr, value});
};

auto printValueAsString = [&](const std::string& msg, llvm::Value* value) {
  llvm::Value* formatStr = builder.CreateGlobalStringPtr(msg + ": %s\n");
  builder.CreateCall(printfFunc, {formatStr, value});
};
// DEBUG

*/
