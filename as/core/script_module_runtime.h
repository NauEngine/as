//
// Created by ivn on 23.05.2024.
//

#pragma once

namespace as {

class ScriptModuleRuntime {
public:
    typedef void (*FunctionPtr)();

    explicit ScriptModuleRuntime(FunctionPtr* vtable, int vtable_size);

    ~ScriptModuleRuntime();

    void replaceVtable(FunctionPtr* vtable, int vtable_size);

    void* newInstance() const;

private:
    FunctionPtr* m_vtable;
    int m_vtable_size;
};

} // as
