//
// Created by Alex Zelenshikov on 21.03.2024.
//

#ifndef AS_PROTO_SCRIPT_MODULE_H
#define AS_PROTO_SCRIPT_MODULE_H
#include "script_module_runtime.h"

namespace as
{

template<typename Interface>
class ScriptModule
{
public:
    explicit ScriptModule(std::shared_ptr<ScriptModuleRuntime> module):
        m_module(std::move(module))
    {
    }

    Interface* newInstance()
    {
        return static_cast<Interface*>(m_module->newInstance());
    }

private:
    std::shared_ptr<ScriptModuleRuntime> m_module;
};

} // as

#endif //AS_PROTO_SCRIPT_MODULE_H
