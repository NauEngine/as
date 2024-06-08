//
// Created by Alex Zelenshikov on 17.05.2024.
//

int llvm_precall_jit (lua_State *L, StkId func, int nresults) {
  Closure *cl;
  ptrdiff_t funcr;
  CallInfo *ci;
  StkId st, base;
  Proto *p;

  funcr = savestack(L, func);
  cl = clvalue(func);
  p = cl->l.p;
  luaD_checkstack(L, p->maxstacksize);
  func = restorestack(L, funcr);
  base = func + 1;
  if (L->top > base + p->numparams)
    L->top = base + p->numparams;
  ci = L->ci;  /* now `enter' new function */
  ci->func = func;
  L->base = ci->base = base;
  ci->top = L->base + p->maxstacksize;
  lua_assert(ci->top <= L->stack_last);
  L->savedpc = p->code;  /* starting point */
  ci->nresults = nresults;
  for (st = L->top; st < ci->top; st++)
    setnilvalue(st);
  L->top = ci->top;
  return (p->jit_func)(L); /* do the actual call */
}

int llvm_precall_jit_vararg (lua_State *L, StkId func, int nresults) {
  Closure *cl;
  ptrdiff_t funcr;
  CallInfo *ci;
  StkId st, base;
  Proto *p;
  int nargs;

  funcr = savestack(L, func);
  cl = clvalue(func);
  p = cl->l.p;
  luaD_checkstack(L, p->maxstacksize);
  func = restorestack(L, funcr);
  nargs = cast_int(L->top - func) - 1;
  base = adjust_varargs(L, p, nargs);
  func = restorestack(L, funcr);  /* previous call may change the stack */
  ci = L->ci;  /* now `enter' new function */
  ci->func = func;
  L->base = ci->base = base;
  ci->top = L->base + p->maxstacksize;
  lua_assert(ci->top <= L->stack_last);
  L->savedpc = p->code;  /* starting point */
  ci->nresults = nresults;
  for (st = L->top; st < ci->top; st++)
    setnilvalue(st);
  L->top = ci->top;
  return (p->jit_func)(L); /* do the actual call */
}

int llvm_precall_lua (lua_State *L, StkId func, int nresults) {
  Closure *cl;
  Proto *p;

  cl = clvalue(func);
  p = cl->l.p;
  /* check if Function needs to be compiled. */
  if(p->jit_func != NULL) {
    if (!p->is_vararg) {  /* no varargs? */
      cl->l.precall = llvm_precall_jit;
      return llvm_precall_jit(L, func, nresults);
    } else {
      cl->l.precall = llvm_precall_jit_vararg;
      return llvm_precall_jit_vararg(L, func, nresults);
    }
  }
  /* function didn't compile, fall-back to lua interpreter */
  cl->l.precall = luaD_precall_lua;
  return luaD_precall_lua(L, func, nresults);
}
