/*
** $Id: lua_bytecode_printer.cpp,v 1.55a 2006/05/31 13:30:05 lhf Exp $
** print bytecodes
** See Copyright Notice in lua.h
*/

#include <ctype.h>
#include <stdio.h>

#define LUA_CORE

extern "C"
{
#include "lua/ldebug.h"
#include "lua/lobject.h"
#include "lua/lopcodes.h"
}

#define Sizeof(x)	((int)sizeof(x))
#define VOID(p)		((const void*)(p))

namespace as
{

static void printString(const TString* ts)
{
    const char* s=getstr(ts);
    size_t i,n=ts->tsv.len;
    putchar('"');
    for (i=0; i<n; i++)
    {
        int c=s[i];
        switch (c)
        {
            case '"': printf("\\\""); break;
            case '\\': printf("\\\\"); break;
            case '\a': printf("\\a"); break;
            case '\b': printf("\\b"); break;
            case '\f': printf("\\f"); break;
            case '\n': printf("\\n"); break;
            case '\r': printf("\\r"); break;
            case '\t': printf("\\t"); break;
            case '\v': printf("\\v"); break;
            default:	if (isprint((unsigned char)c))
                putchar(c);
            else
                printf("\\%03u",(unsigned char)c);
        }
    }
    putchar('"');
}

static void printConstant(const Proto* f, int i)
{
    const TValue* o = &f->k[i];

    switch (ttype(o))
    {
        case LUA_TNIL:
            printf("nil");
            break;
        case LUA_TBOOLEAN:
            printf(bvalue(o) ? "true" : "false");
            break;
        case LUA_TNUMBER:
            printf(LUA_NUMBER_FMT, nvalue(o));
            break;
        case LUA_TSTRING:
            printString(rawtsvalue(o));
            break;
        default:				/* cannot happen */
            printf("? type=%d", ttype(o));
            break;
    }
}

static void printCode(const Proto* f)
{
    const Instruction* code = f->code;

    for (int pc = 0; pc < f->sizecode; ++pc)
    {
        Instruction i = code[pc];
        OpCode o = GET_OPCODE(i);

        const int a = GETARG_A(i);
        const int b = GETARG_B(i);
        const int c = GETARG_C(i);
        const int bx = GETARG_Bx(i);
        const int sbx = GETARG_sBx(i);
        const int line = getlinenum(f, pc);

        printf("%-4d", pc + 1);

        if (line > 0)
            printf("[%3d]", line);
        else
            printf("[-]");

        printf(" %-9s\t", luaP_opnames[o]);

        switch (getOpMode(o))
        {
            case iABC:
                printf("%d",a);
                if (getBMode(o) != OpArgN) printf("%4d",ISK(b) ? (-1-INDEXK(b)) : b);
                if (getCMode(o) != OpArgN) printf("%4d",ISK(c) ? (-1-INDEXK(c)) : c);
                break;
            case iABx:
                if (getBMode(o) == OpArgK) printf("%d%4d",a,-1-bx); else printf("%d%4d",a,bx);
                break;
            case iAsBx:
                if (o == OP_JMP) printf("%d",sbx); else printf("%d%4d",a,sbx);
                break;
        }

        switch (o)
        {
            case OP_LOADK:
                printf("\t; "); printConstant(f,bx);
            break;
            case OP_GETUPVAL:
            case OP_SETUPVAL:
                printf("\t; %s", (f->sizeupvalues>0) ? getstr(f->upvalues[b]) : "-");
            break;
            case OP_GETGLOBAL:
            case OP_SETGLOBAL:
                printf("\t; %s",svalue(&f->k[bx]));
            break;
            case OP_GETTABLE:
            case OP_SELF:
                if (ISK(c)) { printf("\t; "); printConstant(f,INDEXK(c)); }
            break;
            case OP_SETTABLE:
            case OP_ADD:
            case OP_SUB:
            case OP_MUL:
            case OP_DIV:
            case OP_POW:
            case OP_EQ:
            case OP_LT:
            case OP_LE:
             if (ISK(b) || ISK(c))
             {
                 printf("\t; ");
                 if (ISK(b)) printConstant(f,INDEXK(b)); else printf("-");
                 printf(" ");
                 if (ISK(c)) printConstant(f,INDEXK(c)); else printf("-");
             }
            break;
            case OP_JMP:
            case OP_FORLOOP:
            case OP_FORPREP:
             printf("\t; to %d", sbx + pc + 2);
            break;
            case OP_CLOSURE:
                printf("\t; %p", VOID(f->p[bx]));
            break;
            case OP_SETLIST:
                if (c==0) printf("\t; %d",(int)code[++pc]);
                else printf("\t; %d",c);
            break;
            default:
                break;
        }

        printf("\n");
    }
}

#define SS(x)	(x == 1) ? "" : "s"
#define S(x)	x, SS(x)

static void printHeader(const Proto* f)
{
    const char* s = getstr(f->source);
    if (*s=='@' || *s=='=')
        s++;
    else if (*s==LUA_SIGNATURE[0])
        s="(bstring)";
    else
        s="(string)";
    printf("\n%s <%s:%d,%d> (%d instruction%s, %d bytes at %p)\n",
        (f->linedefined==0)?"main":"function",s,
       f->linedefined,f->lastlinedefined,
       S(f->sizecode),f->sizecode*Sizeof(Instruction),VOID(f));
    printf("%d%s param%s, %d slot%s, %d upvalue%s, ",
       f->numparams,f->is_vararg?"+":"",SS(f->numparams),
       S(f->maxstacksize),S(f->nups));
    printf("%d local%s, %d constant%s, %d function%s\n",
       S(f->sizelocvars),S(f->sizek),S(f->sizep));
}

static void printConstants(const Proto* f)
{
    int n = f->sizek;
    printf("constants (%d) for %p:\n", n, VOID(f));

    for (int i = 0; i < n; ++i)
    {
        printf("%-4d\t", i + 1);
        printConstant(f, i);
        printf("\n");
    }
}

static void printLocals(const Proto* f)
{
    int n = f->sizelocvars;
    printf("locals (%d) for %p:\n", n, VOID(f));
    for (int i = 0; i < n; ++i)
    {
        printf("%-4d\t%-15s%-4d%d\n",
        i,getstr(f->locvars[i].varname), f->locvars[i].startpc + 1, f->locvars[i].endpc + 1);
    }
}

static void printUpvalues(const Proto* f)
{
    int i,n=f->sizeupvalues;
    printf("upvalues (%d) for %p:\n",n,VOID(f));
    if (f->upvalues==NULL) return;
    for (i=0; i<n; i++)
    {
        printf("%-4d%s\n",i,getstr(f->upvalues[i]));
    }
}

void printLuaFunction(const Proto* f, bool full)
{
    printHeader(f);
    printCode(f);

    if (full)
    {
        printConstants(f);
        printLocals(f);
        printUpvalues(f);
    }

    for (int i = 0; i < f->sizep; ++i)
    {
        printLuaFunction(f->p[i], full);
    }
}

} // namespace as
