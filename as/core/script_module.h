//
// Created by Alex Zelenshikov on 21.03.2024.
//

#ifndef AS_PROTO_SCRIPT_MODULE_H
#define AS_PROTO_SCRIPT_MODULE_H

namespace as
{

template<typename T>
concept HasNewInstance = requires(const T v)
{
    { v.newInstance() } -> std::same_as<void*>;
};

template<typename Interface, HasNewInstance Module>
class ScriptModule
{
public:
    explicit ScriptModule(std::shared_ptr<Module> module):
        m_module(std::move(module))
    {
    }

    Interface* newInstance()
    {
        return static_cast<Interface*>(m_module->newInstance());
    }

private:
    std::shared_ptr<Module> m_module;
};

} // as

#endif //AS_PROTO_SCRIPT_MODULE_H
