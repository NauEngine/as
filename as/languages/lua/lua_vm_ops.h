
#ifndef lua_vm_ops_h
#define lua_vm_ops_h

#ifdef __cplusplus
extern "C" {
#endif

#include "lua_core.h"
#include "lua/lobject.h"
#include "lua/ltm.h"

typedef struct {
  TValue *k;
  LClosure *cl;
} func_state;

#if defined(__x86_64__)
typedef long lua_Long;
#else
typedef long long lua_Long;
#endif

typedef unsigned int hint_t;
#define HINT_NONE				0
#define HINT_C_NUM_CONSTANT		(1<<0)
#define HINT_Bx_NUM_CONSTANT	(1<<1)
#define HINT_NOT				(1<<2)
#define HINT_FOR_CONST			(1<<3)
#define HINT_SKIP_OP			(1<<4)
#define HINT_MINI_VM			(1<<5)
#define HINT_NO_SUB				(1<<6)
#define HINT_NO_OPCODE_FUNC		(1<<7)
#define HINT_NUMERIC_ARITH		(1<<7)

typedef enum {
	VAR_T_VOID = 0,
	VAR_T_INT,
	VAR_T_ARG_A,
	VAR_T_ARG_B,
	VAR_T_ARG_BK,
	VAR_T_ARG_B_FB2INT,
	VAR_T_ARG_Bx,
	VAR_T_ARG_sBx,
	VAR_T_ARG_C,
	VAR_T_ARG_C_NUM_CONSTANT,
	VAR_T_ARG_C_NEXT_INSTRUCTION,
	VAR_T_ARG_C_FB2INT,
	VAR_T_LUA_STATE_PTR,
	VAR_T_BASE,
	VAR_T_K,
	VAR_T_OP_VALUE_0,
	VAR_T_OP_VALUE_1,
	VAR_T_OP_VALUE_2,

	VAR_T_R_A,
	VAR_T_R_A_3, // special case of FORPREP
	VAR_T_R_B,
	VAR_T_RK_B,
	VAR_T_RK_C,
	VAR_T_CONST_Bx,

	VAR_T_JCLOSURE,
} val_t;

typedef struct
{
	int opcode; /* Lua opcode */
	hint_t hint; /* Specialized version. [0=generic] */
	val_t ret_type; /* return type */
	const char *name; /* function name */
	val_t params[10]; /* an 'VOID' type ends the parameter list */
} VmFuncInfo;

extern const VmFuncInfo vm_op_functions[];

extern void vm_OP_MOVE(TValue *ra, TValue *rb);

extern void vm_OP_LOADK(TValue *var, TValue *value);

extern void vm_OP_LOADBOOL(TValue *base, int a, int b, int c);

extern void vm_OP_LOADNIL(TValue *base, int a, int b);

extern void vm_OP_GETUPVAL(JClosure *cl, TValue *ra, int b);

extern void vm_OP_GETGLOBAL(lua_State *L, TValue *k, JClosure *cl, int a, int bx);

extern void vm_OP_GETTABLE(lua_State *L, TValue* ra, TValue* rb, TValue* rc);

extern void vm_OP_SETGLOBAL(lua_State *L, TValue *k, JClosure *cl, int a, int bx);

extern void vm_OP_SETUPVAL(lua_State *L, JClosure *cl, int a, int b);

extern void vm_OP_SETTABLE(lua_State *L, TValue *ra, TValue *rb, TValue *rc);

extern void vm_OP_NEWTABLE(lua_State *L, int a, int b, int c);

extern void vm_OP_SELF(lua_State *L, TValue *k, int a, int b, int c);

extern void vm_OP_UNM(lua_State *L, int a, int b);

extern void vm_OP_NOT(lua_State *L, int a, int b);

extern void vm_OP_LEN(lua_State *L, int a, int b);

extern void vm_OP_CONCAT(lua_State *L, int a, int b, int c);

extern void vm_OP_JMP(lua_State *L, int sbx);

extern int vm_OP_EQ(lua_State *L, TValue *k, int a, int b, int c);
extern int vm_OP_EQ_NC(lua_State *L, TValue *k, int b, lua_Number nc);
extern int vm_OP_NOT_EQ_NC(lua_State *L, TValue *k, int b, lua_Number nc);

extern int vm_OP_LT(lua_State *L, TValue *k, int a, int b, int c);

extern int vm_OP_LE(lua_State *L, TValue *k, int a, int b, int c);

extern int vm_OP_TEST(lua_State *L, int a, int c);

extern int vm_OP_TESTSET(lua_State *L, int a, int b, int c);

extern int vm_OP_CALL(lua_State *L, int a, int b, int c);

extern int vm_OP_RETURN(lua_State *L, int a, int b);

extern int vm_OP_TAILCALL(lua_State *L, int a, int b);

extern int vm_OP_FORLOOP(lua_State *L, int a, int sbx);
extern int vm_OP_FORLOOP_CONST(TValue* ra, TValue* ra_3, lua_Number limit, lua_Number step);

extern void vm_OP_FORPREP(lua_State *L, int a, int sbx);
extern void vm_OP_FORPREP_CONST(lua_State *L, int a, int sbx, lua_Number step);
extern void vm_OP_FORPREP_slow(lua_State *L, int a, int sbx);

extern int vm_OP_TFORLOOP(lua_State *L, int a, int c);

extern void vm_OP_SETLIST(lua_State *L, int a, int b, int c);

extern void vm_OP_CLOSE(lua_State *L, int a);

extern void vm_OP_CLOSURE(lua_State *L, JClosure *cl, int a, int bx);

extern void vm_OP_VARARG(lua_State *L, JClosure *cl, int a, int b);

extern lua_Number vm_NUM_ADD(lua_Number a, lua_Number b);
extern lua_Number vm_NUM_SUB(lua_Number a, lua_Number b);
extern lua_Number vm_NUM_MUL(lua_Number a, lua_Number b);
extern lua_Number vm_NUM_DIV(lua_Number a, lua_Number b);
extern lua_Number vm_NUM_MOD(lua_Number a, lua_Number b);
extern lua_Number vm_NUM_POW(lua_Number a, lua_Number b);

extern void vm_arith(lua_State *L, TValue* base, TValue* k, TValue* ra, int b, int c, TMS op);

extern JClosure *vm_get_current_closure(lua_State *L);
extern TValue *vm_get_current_base(lua_State *L);
extern TValue *vm_get_current_constants(JClosure *cl);

extern int vm_get_type(TValue *value);

extern lua_Number vm_get_number(TValue *value);
extern void vm_set_number(TValue *value, lua_Number num);

extern void module_entry_point(lua_State *L, FunctionTree* ftree_root);
extern void push_global_closure(lua_State *L, FunctionTree* ftree_root, int closure_id);

/*
** some macros for common tasks in `vm_OP_*' functions.
*/

#define runtime_check(L, c) { if (!(c)) return; }

#define RA(i) (base+GETARG_A(i))
/* to be used after possible stack reallocation */
#define RB(i) check_exp(getBMode(GET_OPCODE(i)) == OpArgR, base+GETARG_B(i))
#define RC(i) check_exp(getCMode(GET_OPCODE(i)) == OpArgR, base+GETARG_C(i))
#define RKB(i)  check_exp(getBMode(GET_OPCODE(i)) == OpArgK, \
  ISK(GETARG_B(i)) ? k+INDEXK(GETARG_B(i)) : base+GETARG_B(i))
#define RKC(i)  check_exp(getCMode(GET_OPCODE(i)) == OpArgK, \
  ISK(GETARG_C(i)) ? k+INDEXK(GETARG_C(i)) : base+GETARG_C(i))
#define KBx(i)  check_exp(getBMode(GET_OPCODE(i)) == OpArgK, k+GETARG_Bx(i))

#define RK(arg)  (ISK(arg) ? k+INDEXK(arg) : base+arg)

#define dojump(i)  {luai_threadyield(L);}
#define skip_op()


#define Protect(x)  { {x;}; base = L->base; }

#ifdef __cplusplus
}
#endif

#endif

