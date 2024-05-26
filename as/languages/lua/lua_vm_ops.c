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
//#include <stdio.h>
//#include <assert.h>

#define setobj_VM(obj1,obj2) \
{ const TValue *o2=(obj2); TValue *o1=(obj1); \
o1->value = o2->value; o1->tt=o2->tt; }

void vm_OP_MOVE(TValue *base, int a, int b) {
  setobj_VM(base + a, base + b);
}

void vm_OP_LOADK(TValue *base, TValue *k, int a, int bx) {
  setobj_VM(base + a, k + bx);
}

void vm_OP_LOADK_N(TValue *base, int a, lua_Number nb) {
  setnvalue(base + a, nb);
}

void vm_OP_LOADBOOL(TValue *base, int a, int b, int c) {
  TValue *ra = base + a;
  setbvalue(ra, b);
}

void vm_OP_LOADNIL(TValue *base, int a, int b) {
  TValue *ra = base + a;
  TValue *rb = base + b;
  do {
    setnilvalue(rb--);
  } while (rb >= ra);
}

void vm_OP_GETUPVAL(lua_State *L, LClosure *cl, int a, int b) {
  TValue *base = L->base;
  TValue *ra = base + a;
  setobj2s(L, ra, cl->upvals[b]->v);
}

void vm_OP_GETGLOBAL(lua_State *L, TValue *k, LClosure *cl, int a, int bx) {
  TValue *base = L->base;
  TValue *ra = base + a;
  TValue *rb = k + bx;
  TValue g;
  sethvalue(L, &g, cl->env);
  lua_assert(ttisstring(rb));
  luaV_gettable(L, &g, rb, ra);
}

void vm_OP_GETTABLE(lua_State *L, TValue *k, int a, int b, int c) {
  TValue *base = L->base;
  TValue *ra = base + a;
  luaV_gettable(L, base + b, RK(c), ra);
}

void vm_OP_SETGLOBAL(lua_State *L, TValue *k, LClosure *cl, int a, int bx) {
  TValue *base = L->base;
  TValue *ra = base + a;
  TValue g;
  sethvalue(L, &g, cl->env);
  lua_assert(ttisstring(k + bx));
  luaV_settable(L, &g, k + bx, ra);
}

void vm_OP_SETUPVAL(lua_State *L, LClosure *cl, int a, int b) {
  TValue *base = L->base;
  TValue *ra = base + a;
  UpVal *uv = cl->upvals[b];
  setobj(L, uv->v, ra);
  luaC_barrier(L, uv, ra);
}

void vm_OP_SETTABLE(lua_State *L, TValue *k, int a, int b, int c) {
  TValue *base = L->base;
  TValue *ra = base + a;
  luaV_settable(L, ra, RK(b), RK(c));
}

void vm_OP_NEWTABLE(lua_State *L, int a, int b_fb2int, int c_fb2int) {
  Table *h;
  h = luaH_new(L, b_fb2int, c_fb2int);
  sethvalue(L, L->base + a, h);
  luaC_checkGC(L);
}

void vm_OP_SELF(lua_State *L, TValue *k, int a, int b, int c) {
  TValue *base = L->base;
  TValue *ra = base + a;
  StkId rb = base + b;
  setobjs2s(L, ra+1, rb);
  luaV_gettable(L, rb, RK(c), ra);
}

lua_Number vm_NUM_ADD(lua_Number a, lua_Number b) { return luai_numadd(a, b); }
lua_Number vm_NUM_SUB(lua_Number a, lua_Number b) { return luai_numsub(a, b); }
lua_Number vm_NUM_MUL(lua_Number a, lua_Number b) { return luai_nummul(a, b); }
lua_Number vm_NUM_DIV(lua_Number a, lua_Number b) { return luai_numdiv(a, b); }
lua_Number vm_NUM_MOD(lua_Number a, lua_Number b) { return luai_nummod(a, b); }
lua_Number vm_NUM_POW(lua_Number a, lua_Number b) { return luai_numpow(a, b); }

void vm_arith(lua_State *L, TValue* base, TValue* k, TValue* ra, int b, int c, TMS op)
{
    TValue* rb = RKB(b);
    TValue* rc = RKC(c);
    luaV_arith(L, ra, rb, rc, op);
}

void vm_OP_UNM(lua_State *L, int a, int b) {
  TValue *base = L->base;
  TValue *ra = base + a;
  TValue *rb = base + b;
  if (ttisnumber(rb)) {
    lua_Number nb = nvalue(rb);
    setnvalue(ra, luai_numunm(nb));
  }
  else {
    luaV_arith(L, ra, rb, rb, TM_UNM);
  }
}

void vm_OP_NOT(lua_State *L, int a, int b) {
  TValue *base = L->base;
  TValue *ra = base + a;
  int res = l_isfalse(base + b);  /* next assignment may change this value */
  setbvalue(ra, res);
}

void vm_OP_LEN(lua_State *L, int a, int b) {
  TValue *base = L->base;
  TValue *ra = base + a;
  const TValue *rb = base + b;
  switch (ttype(rb)) {
    case LUA_TTABLE: {
      setnvalue(ra, cast_num(luaH_getn(hvalue(rb))));
      break;
    }
    case LUA_TSTRING: {
      setnvalue(ra, cast_num(tsvalue(rb)->len));
      break;
    }
    default: {  /* try metamethod */
      ptrdiff_t br = savestack(L, rb);
      if (!luaV_call_binTM(L, rb, luaO_nilobject, ra, TM_LEN))
        luaG_typeerror(L, restorestack(L, br), "get length of");
    }
  }
}

void vm_OP_CONCAT(lua_State *L, int a, int b, int c) {
  TValue *base;
  luaV_concat(L, c-b+1, c); luaC_checkGC(L);
  base = L->base;
  setobjs2s(L, base + a, base + b);
}

void vm_OP_JMP(lua_State *L, int sbx) {
}

int vm_OP_EQ(lua_State *L, TValue *k, int a, int b, int c) {
  TValue *base = L->base;
  int ret;
  TValue *rb = RK(b);
  TValue *rc = RK(c);
  ret = (equalobj(L, rb, rc) == a);
  return ret;
}

int vm_OP_EQ_NC(lua_State *L, TValue *k, int b, lua_Number nc) {
  TValue *base = L->base;
  int ret;
  TValue *rb = RK(b);
  if (ttisnumber(rb)) {
    ret = !luai_numeq(nvalue(rb), nc);
    return ret;
  }
  return 1;
}

int vm_OP_NOT_EQ_NC(lua_State *L, TValue *k, int b, lua_Number nc) {
  TValue *base = L->base;
  int ret;
  TValue *rb = RK(b);
  if (ttisnumber(rb)) {
    ret = luai_numeq(nvalue(rb), nc);
    return ret;
  }
  return 0;
}

int vm_OP_LT(lua_State *L, TValue *k, int a, int b, int c) {
  TValue *base = L->base;
  int ret;
  ret = (luaV_lessthan(L, RK(b), RK(c)) == a);
  return ret;
}

int vm_OP_LE(lua_State *L, TValue *k, int a, int b, int c) {
  TValue *base = L->base;
  int ret;
  ret = (luaV_lessequal(L, RK(b), RK(c)) == a);
  return ret;
}

int vm_OP_TEST(lua_State *L, int a, int c) {
  TValue *ra = L->base + a;
  if (l_isfalse(ra) != c) {
    return 1;
  }
  return 0;
}

int vm_OP_TESTSET(lua_State *L, int a, int b, int c) {
  TValue *base = L->base;
  TValue *ra = base + a;
  TValue *rb = base + b;
  if (l_isfalse(rb) != c) {
    setobjs2s(L, ra, rb);
    return 1;
  }
  return 0;
}

/*
 * Generic number FORPREP
 *
 * Test if init/plimit/pstep are numbers, fallback to slower FORPREP
 * if one ore more of then are not numbers.
 *
 */
void vm_OP_FORPREP(lua_State *L, int a, int sbx)
{
    TValue *ra = L->base + a;
    const TValue *init = ra;
    const TValue *plimit = ra+1;
    const TValue *pstep = ra+2;
    int valid = 1;
    valid &= ttisnumber(init);
    valid &= ttisnumber(plimit);
    valid &= ttisnumber(pstep);
    if (!valid)
    {
        vm_OP_FORPREP_slow(L,a,sbx);
    }
    // subtract pstep from init.
    setnvalue(ra, luai_numsub(nvalue(init), nvalue(pstep)));
}

void vm_OP_FORPREP_CONST(lua_State *L, int a, int sbx, lua_Number step)
{
    TValue *ra = L->base + a;
    setnvalue(ra, luai_numsub(nvalue(ra), step));
}

int vm_OP_FORLOOP(lua_State *L, int a, int sbx)
{
  TValue *ra = L->base + a;
  lua_Number step = nvalue(ra + 2);
  lua_Number idx = luai_numadd(nvalue(ra), step); /* increment index */
  lua_Number limit = nvalue(ra + 1);
  if (luai_numlt(0, step) ? luai_numle(idx, limit)
                          : luai_numle(limit, idx)) {
    setnvalue(ra, idx);  /* update internal index... */
    setnvalue(ra + 3, idx);  /* ...and external index */
    return 1;
  }
  return 0;
}

int vm_OP_FORLOOP_CONST(lua_State *L, int a, int sbx, lua_Number limit, lua_Number step) {
    TValue *ra = L->base + a;
    lua_Number idx = luai_numadd(nvalue(ra), step); /* increment index */

    if ( luai_numlt(0, step) ? luai_numle(idx, limit) : luai_numle(limit, idx) )
    {
        setnvalue(ra, idx);  /* update internal index... */
        setnvalue(ra + 3, idx);  /* ...and external index */
        return 1;
    }

    return 0;
}

void vm_OP_CLOSE(lua_State *L, int a) {
  luaF_close(L, L->base + a);
}

TValue *vm_get_current_base(lua_State *L)
{
    return L->base;
}

LClosure *vm_get_current_closure(lua_State *L) {
  return &clvalue(L->ci->func)->l;
}

TValue *vm_get_current_constants(LClosure *cl) {
  return cl->p->k;
}

int vm_is_number(TValue *value) {
   return ttisnumber(value);
}

lua_Number vm_get_number(TValue *value)
{
    return nvalue(value);
}

void vm_set_number(TValue *value, lua_Number num)
{
    setnvalue(value, num);
}

#ifdef __cplusplus
}
#endif

