/*
** See Copyright Notice in lua.h
*/

#ifdef __cplusplus
extern "C" {
#endif

/*
 * lua_vm_ops.c -- Lua ops functions for use by LLVM IR gen.
 *
 * Most of this file was copied from Lua's lvm.c
 */

#include "lua_vm_ops.h"

#include "lua/ldebug.h"
#include "lua/ldo.h"
#include "lua/lfunc.h"
#include "lua/lgc.h"
#include "lua/lobject.h"
#include "lua/lopcodes.h"
#include "lua/lstate.h"
#include "lua/lstring.h"
#include "lua/ltable.h"
#include "lua/ltm.h"
#include "lua/lvm.h"
#include <stdio.h>
#include <string.h>
#include <assert.h>

//#include "llvm_compiler.h"

const VmFuncInfo vm_op_functions[] = {
  { OP_MOVE, HINT_NONE, VAR_T_VOID, "vm_OP_MOVE",
    {VAR_T_R_A, VAR_T_R_B, VAR_T_VOID},
  },
  { OP_LOADK, HINT_NONE, VAR_T_VOID, "vm_OP_LOADK",
    {VAR_T_R_A, VAR_T_CONST_Bx, VAR_T_VOID},
  },
  { OP_LOADBOOL, HINT_NONE, VAR_T_VOID, "vm_OP_LOADBOOL",
    {VAR_T_BASE, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_ARG_C, VAR_T_VOID},
  },
  { OP_LOADNIL, HINT_NONE, VAR_T_VOID, "vm_OP_LOADNIL",
    {VAR_T_BASE, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_VOID},
  },
  { OP_GETUPVAL, HINT_NONE, VAR_T_VOID, "vm_OP_GETUPVAL",
    {VAR_T_JCLOSURE, VAR_T_R_A, VAR_T_ARG_B, VAR_T_VOID},
  },
  { OP_GETGLOBAL, HINT_NONE, VAR_T_VOID, "vm_OP_GETGLOBAL",
    {VAR_T_LUA_STATE_PTR, VAR_T_K, VAR_T_JCLOSURE, VAR_T_ARG_A, VAR_T_ARG_Bx, VAR_T_VOID},
  },
  { OP_GETTABLE, HINT_NONE, VAR_T_VOID, "vm_OP_GETTABLE",
    {VAR_T_LUA_STATE_PTR, VAR_T_R_A, VAR_T_R_B, VAR_T_RK_C, VAR_T_VOID},
  },
  { OP_SETGLOBAL, HINT_NONE, VAR_T_VOID, "vm_OP_SETGLOBAL",
    {VAR_T_LUA_STATE_PTR, VAR_T_K, VAR_T_JCLOSURE, VAR_T_ARG_A, VAR_T_ARG_Bx, VAR_T_VOID},
  },
  { OP_SETUPVAL, HINT_NONE, VAR_T_VOID, "vm_OP_SETUPVAL",
    {VAR_T_LUA_STATE_PTR, VAR_T_JCLOSURE, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_VOID},
  },
  { OP_SETTABLE, HINT_NONE, VAR_T_VOID, "vm_OP_SETTABLE",
    {VAR_T_LUA_STATE_PTR, VAR_T_R_A, VAR_T_RK_B, VAR_T_RK_C, VAR_T_VOID},
  },
  { OP_NEWTABLE, HINT_NONE, VAR_T_VOID, "vm_OP_NEWTABLE",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_B_FB2INT, VAR_T_ARG_C_FB2INT, VAR_T_VOID},
  },
  { OP_SELF, HINT_NONE, VAR_T_VOID, "vm_OP_SELF",
    {VAR_T_LUA_STATE_PTR, VAR_T_K, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_ARG_C, VAR_T_VOID},
  },
  { OP_UNM, HINT_NONE, VAR_T_VOID, "vm_OP_UNM",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_VOID},
  },
  { OP_NOT, HINT_NONE, VAR_T_VOID, "vm_OP_NOT",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_VOID},
  },
  { OP_LEN, HINT_NONE, VAR_T_VOID, "vm_OP_LEN",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_VOID},
  },
  { OP_CONCAT, HINT_NONE, VAR_T_VOID, "vm_OP_CONCAT",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_ARG_C, VAR_T_VOID},
  },
  { OP_JMP, HINT_NONE, VAR_T_VOID, "vm_OP_JMP",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_sBx, VAR_T_VOID},
  },
  { OP_EQ, HINT_NONE, VAR_T_INT, "vm_OP_EQ",
    {VAR_T_LUA_STATE_PTR, VAR_T_K, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_ARG_C, VAR_T_VOID},
  },
  { OP_EQ, HINT_C_NUM_CONSTANT, VAR_T_INT, "vm_OP_EQ_NC",
    {VAR_T_LUA_STATE_PTR, VAR_T_K, VAR_T_ARG_B, VAR_T_ARG_C_NUM_CONSTANT, VAR_T_VOID},
  },
  { OP_EQ, HINT_C_NUM_CONSTANT|HINT_NOT, VAR_T_INT, "vm_OP_NOT_EQ_NC",
    {VAR_T_LUA_STATE_PTR, VAR_T_K, VAR_T_ARG_B, VAR_T_ARG_C_NUM_CONSTANT, VAR_T_VOID},
  },
  { OP_LT, HINT_NONE, VAR_T_INT, "vm_OP_LT",
    {VAR_T_LUA_STATE_PTR, VAR_T_K, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_ARG_C, VAR_T_VOID},
  },
  { OP_LE, HINT_NONE, VAR_T_INT, "vm_OP_LE",
    {VAR_T_LUA_STATE_PTR, VAR_T_K, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_ARG_C, VAR_T_VOID},
  },
  { OP_TEST, HINT_NONE, VAR_T_INT, "vm_OP_TEST",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_C, VAR_T_VOID},
  },
  { OP_TESTSET, HINT_NONE, VAR_T_INT, "vm_OP_TESTSET",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_ARG_C, VAR_T_VOID},
  },
  { OP_CALL, HINT_NONE, VAR_T_INT, "vm_OP_CALL",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_ARG_C, VAR_T_VOID},
  },
  { OP_TAILCALL, HINT_NONE, VAR_T_INT, "vm_OP_TAILCALL",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_VOID},
  },
  { OP_RETURN, HINT_NONE, VAR_T_INT, "vm_OP_RETURN",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_VOID},
  },
  { OP_FORLOOP, HINT_NONE, VAR_T_INT, "vm_OP_FORLOOP",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_sBx, VAR_T_VOID},
  },
  // OP_VALUE_1 - limit
  // OP_VALUE_2 - step
  { OP_FORLOOP, HINT_FOR_CONST, VAR_T_INT, "vm_OP_FORLOOP_CONST",
    {VAR_T_R_A, VAR_T_R_A_3, VAR_T_OP_VALUE_1, VAR_T_OP_VALUE_2, VAR_T_VOID},
  },
  { OP_FORPREP, HINT_NONE, VAR_T_VOID, "vm_OP_FORPREP",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_sBx, VAR_T_VOID},
  },
  // OP_VALUE_2 - step
  { OP_FORPREP, HINT_FOR_CONST, VAR_T_VOID, "vm_OP_FORPREP_CONST",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_sBx, VAR_T_OP_VALUE_2, VAR_T_VOID},
  },
  { OP_TFORLOOP, HINT_NONE, VAR_T_INT, "vm_OP_TFORLOOP",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_C, VAR_T_VOID},
  },
  { OP_SETLIST, HINT_NONE, VAR_T_VOID, "vm_OP_SETLIST",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_ARG_C_NEXT_INSTRUCTION, VAR_T_VOID},
  },
  { OP_CLOSE, HINT_NONE, VAR_T_VOID, "vm_OP_CLOSE",
    {VAR_T_LUA_STATE_PTR, VAR_T_ARG_A, VAR_T_VOID},
  },
  { OP_CLOSURE, HINT_NONE, VAR_T_VOID, "vm_OP_CLOSURE",
    {VAR_T_LUA_STATE_PTR, VAR_T_JCLOSURE, VAR_T_ARG_A, VAR_T_ARG_Bx, VAR_T_VOID},
  },
  { OP_VARARG, HINT_NONE, VAR_T_VOID, "vm_OP_VARARG",
    {VAR_T_LUA_STATE_PTR, VAR_T_JCLOSURE, VAR_T_ARG_A, VAR_T_ARG_B, VAR_T_VOID},
  },
  { -1, HINT_NONE, VAR_T_VOID, NULL, {VAR_T_VOID} }
};

int vm_OP_RETURN(lua_State *L, int a, int b) {
  TValue *base = L->base;
  TValue *ra = base + a;
  if (b != 0) L->top = ra+b-1;
  if (L->openupval) luaF_close(L, base);
  b = luaD_poscall(L, ra);
  return PCRC;
}

int vm_OP_TAILCALL(lua_State *L, int a, int b) {
  TValue *func = L->base + a;
  Closure *cl;
  CallInfo *ci;
  StkId st, cur_func;
  Proto *p;
  int aux;
  int tail_recur;

  if (b != 0) L->top = func+b;  /* else previous instruction set top */

  /* current function index */
  ci = L->ci;
  cur_func = ci->func;
  /* check for tail recursive call */
  if(gcvalue(func) == gcvalue(cur_func)) {
    cl = clvalue(func);
    p = cl->l.p;
    /* if is not a vararg function. */
    tail_recur = !p->is_vararg;
    L->savedpc = p->code;
  } else {
    tail_recur=0;
    ci->savedpc = L->savedpc;
    if (!ttisfunction(func)) /* `func' is not a function? */
      func = luaD_tryfuncTM(L, func);  /* check the `function' tag method */
    cl = clvalue(func);
#ifndef NDEBUG
    if(cl->l.cl_type == CLOSURE_C) { /* can't tailcall into C functions.  Causes problems with getfenv() */
      luaD_precall(L, func, LUA_MULTRET);
      vm_OP_RETURN(L, a, 0);
      return PCRC;
    }
#endif
  }

  /* clean up current frame to prepare to tailcall into next function. */
  if (L->openupval) luaF_close(L, ci->base);
  for (aux = 0; func+aux < L->top; aux++)  /* move frame down */
    setobjs2s(L, cur_func+aux, func+aux);
  L->top = cur_func+aux;
  /* JIT function calling it's self. */
  if(tail_recur) {
    for (st = L->top; st < ci->top; st++)
      setnilvalue(st);
    return PCRTAILRECUR;
  }
  L->base = cur_func; /* point base at new function to call.  This is needed by luaD_precall. */
  /* unwind stack back to luaD_precall */
  return PCRTAILCALL;
}

/*
 * Notes: split function into two copies, one with number checks + (init - step) + jmp,
 * and the other with the same number checks + slow error throwing code.
 */
void vm_OP_FORPREP_slow(lua_State *L, int a, int sbx) {
  TValue *base = L->base;
  TValue *ra = base + a;
  const TValue *init = ra;
  const TValue *plimit = ra+1;
  const TValue *pstep = ra+2;
  (void)sbx;
  if (!tonumber(init, ra))
    luaG_runerror(L, LUA_QL("for") " initial value must be a number");
  else if (!tonumber(plimit, ra+1))
    luaG_runerror(L, LUA_QL("for") " limit must be a number");
  else if (!tonumber(pstep, ra+2))
    luaG_runerror(L, LUA_QL("for") " step must be a number");
}

int vm_OP_TFORLOOP(lua_State *L, int a, int c) {
  TValue *base = L->base;
  TValue *ra = base + a;
  StkId cb = ra + 3;  /* call base */
  setobjs2s(L, cb+2, ra+2);
  setobjs2s(L, cb+1, ra+1);
  setobjs2s(L, cb, ra);
  L->top = cb+3;  /* func. + 2 args (state and index) */
  Protect(luaD_call(L, cb, c));
  L->top = L->ci->top;
  cb = base + a + 3;  /* previous call may change the stack */
  if (!ttisnil(cb)) {  /* continue loop? */
    setobjs2s(L, cb-1, cb);  /* save control variable */
    dojump(GETARG_sBx(*L->savedpc));
    return 1;
  }
  return 0;
}

void vm_OP_SETLIST(lua_State *L, int a, int b, int c) {
  TValue *base = L->base;
  TValue *ra = base + a;
  int last;
  Table *h;
  fixedstack(L);
  if (b == 0) {
    b = cast_int(L->top - ra) - 1;
    L->top = L->ci->top;
  }
  runtime_check(L, ttistable(ra));
  h = hvalue(ra);
  last = ((c-1)*LFIELDS_PER_FLUSH) + b;
  if (last > h->sizearray)  /* needs more space? */
    luaH_resizearray(L, h, last);  /* pre-alloc it at once */
  for (; b > 0; b--) {
    TValue *val = ra+b;
    setobj2t(L, luaH_setnum(L, h, last--), val);
    luaC_barriert(L, h, val);
  }
  unfixedstack(L);
}

    //	A Bx	Gbl[Kst(Bx)] := R(A)
void vm_OP_SETGLOBAL(lua_State *L, TValue *k, JClosure *cl, int a, int bx)
{
    TValue *base = L->base;
    TValue *ra = base + a;
    TValue g;
    sethvalue(L, &g, cl->env);
    lua_assert(ttisstring(k + bx));
    luaV_settable(L, &g, k + bx, ra);
}


/*	A Bx	R(A) := closure(KPROTO[Bx], R(A), ... ,R(A+n))	*/
void vm_OP_CLOSURE(lua_State *L, JClosure *cl, int a, int bx)
{
    TValue *base = L->base;
    TValue *ra = base + a;

    FunctionTree* child_func = cl->func->children + bx;
    const int nup = child_func->num_upvalues;
    fixedstack(L);
    Closure* ncl = luaF_newJclosure(L, nup, cl->env);
    setclvalue(L, ra, ncl);
    ncl->j.func = child_func;
    for (int j = 0; j < nup; ++j)
    {
        if (child_func->upvalue_types[j] == UPVAL_LOCAL)
            ncl->l.upvals[j] = cl->upvals[child_func->upvalue_indices[j]];
        else {
            ncl->l.upvals[j] = luaF_findupval(L, base + child_func->upvalue_indices[j]);
        }
    }
    if (cl->func->copy_closure[bx])
    {
        cl->func->closures[bx] = *ncl;
    }
    unfixedstack(L);
    luaC_checkGC(L);
}

void vm_OP_VARARG(lua_State *L, JClosure *cl, int a, int b) {
  TValue *base = L->base;
  TValue *ra = base + a;
  int j;
  CallInfo *ci = L->ci;
  int n = cast_int(ci->base - ci->func) - cl->func->numparams - 1;
  b -= 1;
  if (b == LUA_MULTRET) {
    Protect(luaD_checkstack(L, n));
    ra = base + a;  /* previous call may change the stack */
    b = n;
    L->top = ra + n;
  }
  for (j = 0; j < b; j++) {
    if (j < n) {
      setobjs2s(L, ra + j, ci->base - n + j);
    }
    else {
      setnilvalue(ra + j);
    }
  }
}

void prepare_strings(lua_State *L, FunctionTree* ftree)
{
    for (int i = 0; i < ftree->sizek; ++i)
    {
        if (ftree->k_strings->size > 0)
        {
            TValue* o = &ftree->k[i];
            setsvalue2n(L, o, luaS_newlstr(L, ftree->k_strings[i].string, ftree->k_strings[i].size));
        }
    }

    for (int i = 0; i < ftree->num_children; ++i)
    {
        prepare_strings(L, ftree->children + i);
    }
}

void module_entry_point(lua_State *L, FunctionTree* ftree_root)
{
    prepare_strings(L, ftree_root);

    Closure* closure = luaF_newJclosure(L, ftree_root->num_upvalues, hvalue(gt(L)));
    closure->j.func = ftree_root;
    for (int i = 0; i < ftree_root->num_upvalues; ++i)
    {
        closure->l.upvals[i] = luaF_newupval(L);
    }
    setclvalue(L, L->top, closure);
    incr_top(L);
    lua_call(L, 0, LUA_MULTRET);
}

void push_global_closure(lua_State *L, FunctionTree* ftree_root, int closure_id)
{
    Closure* cl = ftree_root->closures + closure_id;
    setclvalue(L, L->top, cl);
    incr_top(L);
}

#ifdef __cplusplus
}
#endif

