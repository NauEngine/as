//
// Created by Alex Zelenshikov on 15.05.2024.
//

extern "C"
{
#include <lua/lua.h>
#include <lua/lapi.h>
#include <lua/lauxlib.h>
#include <lua/lualib.h>
}

#include <iostream>

// Структура A
struct A {
    int a;
    A(int a) : a(a) {}

    int foo(int b) { return a + b; }
    int bar(int c) { return a * c; }
};

// Функция для вызова метода foo
static int A_foo(lua_State *L) {
    A* obj = *(A**)luaL_checkudata(L, 1, "A_Meta");
    int b = luaL_checkinteger(L, 2);
    lua_pushinteger(L, obj->foo(b));
    return 1;
}

// Функция для вызова метода bar
static int A_bar(lua_State *L) {
    A* obj = *(A**)luaL_checkudata(L, 1, "A_Meta");
    int c = luaL_checkinteger(L, 2);
    lua_pushinteger(L, obj->bar(c));
    return 1;
}

// Функция для установки глобальной переменной в Lua
void set_global_A(lua_State *L, A* obj, const char* name) {
    A** udata = (A**)lua_newuserdata(L, sizeof(A*));
    *udata = obj;

    luaL_getmetatable(L, "A_Meta");
    lua_setmetatable(L, -2);

    lua_setglobal(L, name);
}

// Регистрация методов A
static const luaL_Reg A_methods[] = {
    {"foo", A_foo},
    {"bar", A_bar},
    {NULL, NULL}
};

// Функция для регистрации типа A и его методов в Lua
extern "C" int luaopen_A(lua_State *L) {
    luaL_newmetatable(L, "A_Meta");

    // Установим метатаблицу
    lua_pushstring(L, "__index");
    lua_pushvalue(L, -2);
    lua_settable(L, -3);

    // Зарегистрируем методы
    luaL_register(L, NULL, A_methods);

    return 1;
}

int main() {
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);
    luaopen_A(L); // Регистрируем тип A в Lua

    // Создаем экземпляр A в C++
    A* instance = new A(5);

    // Устанавливаем глобальную переменную instance в Lua
    set_global_A(L, instance, "instance");

    // Выполняем Lua скрипт
    const char* lua_script = R"(
        print(instance:foo(10)) -- Ожидаемый вывод: 15
        print(instance:bar(2))  -- Ожидаемый вывод: 10
    )";

    if (luaL_dostring(L, lua_script)) {
        std::cerr << "Ошибка: " << lua_tostring(L, -1) << std::endl;
        lua_pop(L, 1);
    }

    lua_close(L);
    delete instance;
    return 0;
}