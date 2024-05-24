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

void* ScriptModuleRuntime::newInstance() const
{
    if (m_vtable)
        return static_cast<void*>(new ScriptObject(m_vtable));

    return static_cast<void*>(new ScriptObject(m_jit_vtable.toPtr<void*>()));
}
} // as