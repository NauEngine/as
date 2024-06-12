//
// Created by ivn on 23.05.2024.
//

#include "script_module_runtime.h"

namespace as {
struct ScriptObject
{
    void* m_vtable;
    explicit ScriptObject(void* vtable): m_vtable(vtable) { }
};

ScriptModuleRuntime::ScriptModuleRuntime(FunctionPtr* vtable, int vtable_size) :
    m_vtable(nullptr),
    m_vtable_size(0)
{
    replaceVtable(vtable, vtable_size);
}

ScriptModuleRuntime::~ScriptModuleRuntime()
{
    replaceVtable(nullptr, 0);
}

void ScriptModuleRuntime::replaceVtable(FunctionPtr* vtable, int vtable_size)
{
    if (m_vtable && vtable_size != m_vtable_size)
    {
        delete[] m_vtable;
        m_vtable = nullptr;
        m_vtable_size = 0;
    }

    if (!m_vtable && vtable)
    {
        m_vtable = new FunctionPtr[vtable_size];
        m_vtable_size = vtable_size;
    }

    if (vtable)
    {
        auto dest = m_vtable;
        for (int i = 0; i < vtable_size; ++i)
        {
            *(dest++) = *(vtable++);
        }
    }
}

void* ScriptModuleRuntime::newInstance() const
{
    return new ScriptObject(m_vtable);
}
} // as