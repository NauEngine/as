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

#define setobj_VM(obj1,obj2) *(obj1) = *(obj2)

//	A B	R(A) := R(B)
void vm_OP_MOVE(TValue *ra, TValue *rb)
{
  setobj_VM(ra, rb);
}

//	A Bx	R(A) := Kst(Bx)
void vm_OP_LOADK(TValue *var, TValue *value) {
  setobj_VM(var, value);
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

/*	A B	R(A) := UpValue[B]				*/
void vm_OP_GETUPVAL(JClosure *cl, TValue *ra, int b) {
  setobj_VM(ra, cl->upvals[b]->v);
}

/*	A Bx	R(A) := Gbl[Kst(Bx)]		*/
void vm_OP_GETGLOBAL(lua_State *L, TValue *k, JClosure *cl, int a, int bx) {
  TValue *base = L->base;
  TValue *ra = base + a;
  TValue *rb = k + bx;
  TValue g;
  sethvalue(L, &g, cl->env);
  lua_assert(ttisstring(rb));
  luaV_gettable(L, &g, rb, ra);
}

//	A B C	R(A) := R(B)[RK(C)]
void vm_OP_GETTABLE(lua_State *L, TValue* ra, TValue* rb, TValue* rc)
{
    if (rb->tt == LUA_TTABLE)
    {
        if (rc->tt == LUA_TNUMBER && (floor(rc->value.n) == rc->value.n))
        {
            const unsigned int key = (unsigned int)rc->value.n - 1;
            const Table *h = hvalue(rb);
            if (key < cast(unsigned int, h->sizearray))
            {
                setobj_VM(ra, &h->array[key]);
                return;
            }
        }

        if (rc->tt == LUA_TSTRING)
        {
            Table *h = hvalue(rb);
            setobj_VM(ra, luaH_getstr(h, rawtsvalue(rc)));
            return;
        }
    }

    luaV_gettable(L, rb, rc, ra);
}

// A B C	R(A)[RK(B)] := RK(C)
void vm_OP_SETTABLE(lua_State *L, TValue *ra, TValue *rb, TValue *rc)
{
    if (ra->tt == LUA_TTABLE)
    {
        if (rb->tt == LUA_TNUMBER && (floor(rb->value.n) == rb->value.n))
        {
            const unsigned int key = (unsigned int)rb->value.n - 1;
            Table *h = hvalue(ra);
            if (key < cast(unsigned int, h->sizearray))
            {
                TValue* oldval = &h->array[key];
                if (oldval->tt != LUA_TNIL)
                {
                    setobj_VM(oldval, rc);
                    return;
                }
            }
        }

        if (rc->tt == LUA_TSTRING)
        {
            Table *h = hvalue(rb);
            TValue* oldval = (TValue*)luaH_getstr(h, rawtsvalue(rc));
            if (oldval->tt != LUA_TNIL)
            {
                setobj_VM(oldval, ra);
                return;
            }
        }
    }

    luaV_settable(L, ra, rb, rc);
}

void vm_OP_SETUPVAL(lua_State *L, JClosure *cl, int a, int b) {
  TValue *base = L->base;
  TValue *ra = base + a;
  UpVal *uv = cl->upvals[b];
  setobj(L, uv->v, ra);
  luaC_barrier(L, uv, ra);
}

/*	A B C k	R[A] := {}					*/
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

int vm_OP_FORLOOP_CONST(TValue* ra, TValue* ra_3, lua_Number limit, lua_Number step) {
    lua_Number idx = luai_numadd(nvalue(ra), step); /* increment index */

    if ( luai_numlt(0, step) ? luai_numle(idx, limit) : luai_numle(limit, idx) )
    {
        setnvalue(ra, idx);  /* update internal index... */
        setnvalue(ra_3, idx);  /* ...and external index */
        return 1;
    }

    return 0;
}

void vm_OP_CLOSE(lua_State *L, int a) {
  luaF_close(L, L->base + a);
}

/*	A B C	R(A), ... ,R(A+C-2) := R(A)(R(A+1), ... ,R(A+B-1)) */
int vm_OP_CALL(lua_State *L, int a, int b, int c)
{
    TValue* base = L->base;
    TValue* ra = base + a;

    const int nresults = c - 1;
    if (b != 0) L->top = ra+b;  /* else previous instruction set top */
    const int ret = luaD_precall(L, ra, nresults);

    switch (ret)
    {
        case PCRC:
        {
            /* it was a C function (`precall' called it); adjust results */
            if (nresults >= 0)
                L->top = L->ci->top;
            break;
        }
        default:
        {
            /* TODO: fix yielding from C funtions, right now we can't resume a JIT with using COCO. */
            return PCRYIELD;
        }
    }
    return 0;
}

TValue *vm_get_current_base(lua_State *L)
{
    return L->base;
}

JClosure *vm_get_current_closure(lua_State *L) {
  return &clvalue(L->ci->func)->j;
}

TValue *vm_get_current_constants(JClosure *cl) {
  return cl->func->k;
}

int vm_get_type(TValue *value) {
   return value->tt;
}

lua_Number vm_get_number(TValue *value)
{
    return *(lua_Number*)value;
}

void vm_set_number(TValue *value, lua_Number num)
{
    *(lua_Number*)value = num;
    value->tt=LUA_TNUMBER;
}

#include "lua_module_entry.h"

// Special stub function to provide types in IR precompiles
struct FunctionTree* __stub_for_types(
    struct FunctionTree* ftree,
    struct ConstantString* constString,
    struct InstanceMetatable* m,
    struct InstanceMetatableList* ml)
{
    m->instance_name = NULL;
    ml->num_metatables = 0;

    if (constString->size > 0)
        return ftree->children;
    else
        return ftree->children + 1;
}

#ifdef __cplusplus
}
#endif

