//
// Created by ivn on 23.05.2024.
//

#pragma once

namespace as {

class ScriptModuleRuntime {
public:
    explicit ScriptModuleRuntime(void* vtable):
        m_vtable(vtable)
    {}

    void* newInstance() const;

private:
    void* m_vtable;
};

} // as
