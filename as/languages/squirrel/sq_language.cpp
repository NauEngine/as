//
// Created by Alex Zelenshikov on 09.05.2024.
//

#include "sq_language.h"

#include "sq_ir.h"
#include "sq_language_script.h"

#include "squirrel/include/squirrel.h"
#include "squirrel/include/sqstdaux.h"


namespace
{

void printfunc(HSQUIRRELVM v,const SQChar *s,...)
{
    va_list vl;
    va_start(vl, s);
    vfprintf(stdout, s, vl);
    va_end(vl);
}

void errorfunc(HSQUIRRELVM v,const SQChar *s,...)
{
    va_list vl;
    va_start(vl, s);
    vfprintf(stderr, s, vl);
    va_end(vl);
}

}

namespace as
{
SquirrelLanguage::SquirrelLanguage()
{
    m_sq_vm = sq_open(STACK_SIZE);
    sqstd_seterrorhandlers(m_sq_vm);
    sq_setprintfunc(m_sq_vm, printfunc, errorfunc);
    sq_pushroottable(m_sq_vm);
}

SquirrelLanguage::~SquirrelLanguage()
{
    if (m_sq_vm)
    {
        sq_close(m_sq_vm);
        m_sq_vm = nullptr;
    }
}

void SquirrelLanguage::init(std::shared_ptr<llvm::orc::LLJIT> jit, llvm::orc::ThreadSafeContext ts_context)
{
  m_sq_ir = std::make_shared<SquirrelIR>();
  m_sq_ir->init(jit, ts_context, m_sq_vm);
}

std::shared_ptr<as::ILanguageScript> SquirrelLanguage::newScript()
{
    return std::make_shared<SquirrelLanguageScript>(m_sq_vm, m_sq_ir);
}

} //namespace as