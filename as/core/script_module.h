//
// Created by Alex Zelenshikov on 21.03.2024.
//

#ifndef AS_PROTO_SCRIPT_MODULE_H
#define AS_PROTO_SCRIPT_MODULE_H

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/ExecutionEngine/Orc/Shared/ExecutorAddress.h"

#include "cpp_interface.h"

namespace llvm
{
    class StructType;
    class Module;
}

namespace as
{

struct ScriptObject
{
    void* vtable;
    explicit ScriptObject(void* vtable): vtable(vtable) { }
};

template<typename Interface>
class ScriptModule
{
public:
    explicit ScriptModule(std::shared_ptr<ScriptModuleCompile> module,
        llvm::orc::ExecutorAddr vtable):
            m_vtable(vtable),
            m_module(std::move(module))
    {
    }

    Interface* newInstance()
    {
        return static_cast<Interface*>(static_cast<void*>(new ScriptObject(m_vtable.toPtr<void*>())));
    }

private:
    std::shared_ptr<ScriptModuleCompile> m_module;
    llvm::orc::ExecutorAddr m_vtable;
};

} // as

#endif //AS_PROTO_SCRIPT_MODULE_H
