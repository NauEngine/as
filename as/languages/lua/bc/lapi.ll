; ModuleID = '/Users/alexzelenshikov/Work/NAU_ENGINE/as_proto/cmake-build-debug_withdebugllvm/as/languages/lua/lapi.bc'
source_filename = "lua/lapi.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

%struct.lua_TValue = type { %union.Value, i32 }
%union.Value = type { ptr }
%struct.lua_State = type { ptr, i8, i8, i8, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i16, i8, i8, i32, i32, ptr, %struct.lua_TValue, %struct.lua_TValue, ptr, ptr, ptr, i64 }
%struct.CallInfo = type { ptr, ptr, ptr, ptr, i32, i32 }
%struct.global_State = type { %struct.stringtable, ptr, ptr, i8, i8, i8, i32, ptr, ptr, ptr, ptr, ptr, ptr, %struct.Mbuffer, i64, i64, i64, i64, i64, i32, i32, ptr, %struct.lua_TValue, ptr, %struct.UpVal, [9 x ptr], [17 x ptr] }
%struct.stringtable = type { ptr, i32, i32 }
%struct.Mbuffer = type { ptr, i64, i64 }
%struct.UpVal = type { ptr, i8, i8, ptr, %union.anon }
%union.anon = type { %struct.lua_TValue }
%struct.CClosure = type { ptr, i8, i8, i8, i8, ptr, ptr, ptr, ptr, [1 x %struct.lua_TValue] }
%struct.GCheader = type { ptr, i8, i8 }
%struct.anon.0 = type { ptr, i8, i8, i8, i32, i64 }
%union.TString = type { %struct.anon.0 }
%struct.anon.1 = type { ptr, i8, i8, ptr, ptr, i64 }
%union.Udata = type { %struct.anon.1 }
%union.anon.2 = type { ptr }
%struct.Table = type { ptr, i8, i8, i8, i8, ptr, ptr, ptr, ptr, ptr, i32 }
%struct.CallS = type { ptr, i32 }
%struct.CCallS = type { ptr, ptr }
%struct.Zio = type { i64, ptr, ptr, ptr, ptr }
%struct.LClosure = type { ptr, i8, i8, i8, i8, ptr, ptr, ptr, ptr, [1 x ptr] }
%struct.Proto = type { ptr, i8, i8, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i32, i32, i32, i32, i32, i32, ptr, i8, i8, i8, i8 }

@lua_ident = constant [141 x i8] c"$Lua: Lua 5.1.4 Copyright (C) 1994-2008 Lua.org, PUC-Rio $\0A$Authors: R. Ierusalimschy, L. H. de Figueiredo & W. Celes $\0A$URL: www.lua.org $\0A\00", align 1
@.str = private unnamed_addr constant [23 x i8] c"no calling environment\00", align 1
@luaO_nilobject_ = external constant %struct.lua_TValue, align 8
@.str.1 = private unnamed_addr constant [9 x i8] c"no value\00", align 1
@luaT_typenames = external constant [0 x ptr], align 8
@.str.2 = private unnamed_addr constant [2 x i8] c"?\00", align 1
@.str.3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaA_pushobject(ptr noundef %L, ptr noundef %o) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %o.addr = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %o1 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %o, ptr %o.addr, align 8
  %0 = load ptr, ptr %o.addr, align 8
  store ptr %0, ptr %o2, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %1, i32 0, i32 4
  %2 = load ptr, ptr %top, align 8
  store ptr %2, ptr %o1, align 8
  %3 = load ptr, ptr %o1, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %3, i32 0, i32 0
  %4 = load ptr, ptr %o2, align 8
  %value1 = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value, ptr align 8 %value1, i64 8, i1 false)
  %5 = load ptr, ptr %o2, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %5, i32 0, i32 1
  %6 = load i32, ptr %tt, align 8
  %7 = load ptr, ptr %o1, align 8
  %tt2 = getelementptr inbounds %struct.lua_TValue, ptr %7, i32 0, i32 1
  store i32 %6, ptr %tt2, align 8
  %8 = load ptr, ptr %L.addr, align 8
  %9 = load ptr, ptr %L.addr, align 8
  %top3 = getelementptr inbounds %struct.lua_State, ptr %9, i32 0, i32 4
  %10 = load ptr, ptr %top3, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 1
  store ptr %incdec.ptr, ptr %top3, align 8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_checkstack(ptr noundef %L, i32 noundef %size) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %res = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store i32 %size, ptr %size.addr, align 4
  store i32 1, ptr %res, align 4
  %0 = load i32, ptr %size.addr, align 4
  %cmp = icmp sgt i32 %0, 8000
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %1, i32 0, i32 4
  %2 = load ptr, ptr %top, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %base = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 5
  %4 = load ptr, ptr %base, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %4 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 16
  %5 = load i32, ptr %size.addr, align 4
  %conv = sext i32 %5 to i64
  %add = add nsw i64 %sub.ptr.div, %conv
  %cmp1 = icmp sgt i64 %add, 8000
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 0, ptr %res, align 4
  br label %if.end27

if.else:                                          ; preds = %lor.lhs.false
  %6 = load i32, ptr %size.addr, align 4
  %cmp3 = icmp sgt i32 %6, 0
  br i1 %cmp3, label %if.then5, label %if.end26

if.then5:                                         ; preds = %if.else
  %7 = load ptr, ptr %L.addr, align 8
  %stack_last = getelementptr inbounds %struct.lua_State, ptr %7, i32 0, i32 9
  %8 = load ptr, ptr %stack_last, align 8
  %9 = load ptr, ptr %L.addr, align 8
  %top6 = getelementptr inbounds %struct.lua_State, ptr %9, i32 0, i32 4
  %10 = load ptr, ptr %top6, align 8
  %sub.ptr.lhs.cast7 = ptrtoint ptr %8 to i64
  %sub.ptr.rhs.cast8 = ptrtoint ptr %10 to i64
  %sub.ptr.sub9 = sub i64 %sub.ptr.lhs.cast7, %sub.ptr.rhs.cast8
  %11 = load i32, ptr %size.addr, align 4
  %mul = mul nsw i32 %11, 16
  %conv10 = sext i32 %mul to i64
  %cmp11 = icmp sle i64 %sub.ptr.sub9, %conv10
  br i1 %cmp11, label %if.then13, label %if.else14

if.then13:                                        ; preds = %if.then5
  %12 = load ptr, ptr %L.addr, align 8
  %13 = load i32, ptr %size.addr, align 4
  call void @luaD_growstack(ptr noundef %12, i32 noundef %13)
  br label %if.end

if.else14:                                        ; preds = %if.then5
  br label %if.end

if.end:                                           ; preds = %if.else14, %if.then13
  %14 = load ptr, ptr %L.addr, align 8
  %ci = getelementptr inbounds %struct.lua_State, ptr %14, i32 0, i32 7
  %15 = load ptr, ptr %ci, align 8
  %top15 = getelementptr inbounds %struct.CallInfo, ptr %15, i32 0, i32 2
  %16 = load ptr, ptr %top15, align 8
  %17 = load ptr, ptr %L.addr, align 8
  %top16 = getelementptr inbounds %struct.lua_State, ptr %17, i32 0, i32 4
  %18 = load ptr, ptr %top16, align 8
  %19 = load i32, ptr %size.addr, align 4
  %idx.ext = sext i32 %19 to i64
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %18, i64 %idx.ext
  %cmp17 = icmp ult ptr %16, %add.ptr
  br i1 %cmp17, label %if.then19, label %if.end25

if.then19:                                        ; preds = %if.end
  %20 = load ptr, ptr %L.addr, align 8
  %top20 = getelementptr inbounds %struct.lua_State, ptr %20, i32 0, i32 4
  %21 = load ptr, ptr %top20, align 8
  %22 = load i32, ptr %size.addr, align 4
  %idx.ext21 = sext i32 %22 to i64
  %add.ptr22 = getelementptr inbounds %struct.lua_TValue, ptr %21, i64 %idx.ext21
  %23 = load ptr, ptr %L.addr, align 8
  %ci23 = getelementptr inbounds %struct.lua_State, ptr %23, i32 0, i32 7
  %24 = load ptr, ptr %ci23, align 8
  %top24 = getelementptr inbounds %struct.CallInfo, ptr %24, i32 0, i32 2
  store ptr %add.ptr22, ptr %top24, align 8
  br label %if.end25

if.end25:                                         ; preds = %if.then19, %if.end
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.else
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.then
  %25 = load i32, ptr %res, align 4
  ret i32 %25
}

declare void @luaD_growstack(ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_xmove(ptr noundef %from, ptr noundef %to, i32 noundef %n) #0 {
entry:
  %from.addr = alloca ptr, align 8
  %to.addr = alloca ptr, align 8
  %n.addr = alloca i32, align 4
  %f = alloca ptr, align 8
  %t = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %o1 = alloca ptr, align 8
  store ptr %from, ptr %from.addr, align 8
  store ptr %to, ptr %to.addr, align 8
  store i32 %n, ptr %n.addr, align 4
  %0 = load ptr, ptr %from.addr, align 8
  %1 = load ptr, ptr %to.addr, align 8
  %cmp = icmp eq ptr %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %from.addr, align 8
  %3 = load ptr, ptr %from.addr, align 8
  %4 = load ptr, ptr %from.addr, align 8
  %5 = load ptr, ptr %from.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %5, i32 0, i32 4
  %6 = load ptr, ptr %top, align 8
  store ptr %6, ptr %f, align 8
  %7 = load ptr, ptr %to.addr, align 8
  %top1 = getelementptr inbounds %struct.lua_State, ptr %7, i32 0, i32 4
  %8 = load ptr, ptr %top1, align 8
  %9 = load i32, ptr %n.addr, align 4
  %idx.ext = sext i32 %9 to i64
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %8, i64 %idx.ext
  %10 = load ptr, ptr %to.addr, align 8
  %top2 = getelementptr inbounds %struct.lua_State, ptr %10, i32 0, i32 4
  store ptr %add.ptr, ptr %top2, align 8
  store ptr %add.ptr, ptr %t, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %11 = load i32, ptr %n.addr, align 4
  %dec = add nsw i32 %11, -1
  store i32 %dec, ptr %n.addr, align 4
  %cmp3 = icmp sge i32 %dec, 0
  br i1 %cmp3, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %12 = load ptr, ptr %f, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %12, i32 -1
  store ptr %incdec.ptr, ptr %f, align 8
  store ptr %incdec.ptr, ptr %o2, align 8
  %13 = load ptr, ptr %t, align 8
  %incdec.ptr4 = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 -1
  store ptr %incdec.ptr4, ptr %t, align 8
  store ptr %incdec.ptr4, ptr %o1, align 8
  %14 = load ptr, ptr %o1, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 0
  %15 = load ptr, ptr %o2, align 8
  %value5 = getelementptr inbounds %struct.lua_TValue, ptr %15, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value, ptr align 8 %value5, i64 8, i1 false)
  %16 = load ptr, ptr %o2, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %16, i32 0, i32 1
  %17 = load i32, ptr %tt, align 8
  %18 = load ptr, ptr %o1, align 8
  %tt6 = getelementptr inbounds %struct.lua_TValue, ptr %18, i32 0, i32 1
  store i32 %17, ptr %tt6, align 8
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %19 = load ptr, ptr %f, align 8
  %20 = load ptr, ptr %from.addr, align 8
  %top7 = getelementptr inbounds %struct.lua_State, ptr %20, i32 0, i32 4
  store ptr %19, ptr %top7, align 8
  br label %return

return:                                           ; preds = %while.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_atpanic(ptr noundef %L, ptr noundef %panicf) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %panicf.addr = alloca ptr, align 8
  %old = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %panicf, ptr %panicf.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %0, i32 0, i32 6
  %1 = load ptr, ptr %l_G, align 8
  %panic = getelementptr inbounds %struct.global_State, ptr %1, i32 0, i32 21
  %2 = load ptr, ptr %panic, align 8
  store ptr %2, ptr %old, align 8
  %3 = load ptr, ptr %panicf.addr, align 8
  %4 = load ptr, ptr %L.addr, align 8
  %l_G1 = getelementptr inbounds %struct.lua_State, ptr %4, i32 0, i32 6
  %5 = load ptr, ptr %l_G1, align 8
  %panic2 = getelementptr inbounds %struct.global_State, ptr %5, i32 0, i32 21
  store ptr %3, ptr %panic2, align 8
  %6 = load ptr, ptr %old, align 8
  ret ptr %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_newthread(ptr noundef %L) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %L1 = alloca ptr, align 8
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %0, i32 0, i32 6
  %1 = load ptr, ptr %l_G, align 8
  %totalbytes = getelementptr inbounds %struct.global_State, ptr %1, i32 0, i32 15
  %2 = load i64, ptr %totalbytes, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %l_G1 = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 6
  %4 = load ptr, ptr %l_G1, align 8
  %GCthreshold = getelementptr inbounds %struct.global_State, ptr %4, i32 0, i32 14
  %5 = load i64, ptr %GCthreshold, align 8
  %cmp = icmp uge i64 %2, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load ptr, ptr %L.addr, align 8
  call void @luaC_step(ptr noundef %6)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load ptr, ptr %L.addr, align 8
  %call = call ptr @luaE_newthread(ptr noundef %7)
  store ptr %call, ptr %L1, align 8
  %8 = load ptr, ptr %L1, align 8
  store ptr %8, ptr %i_x, align 8
  %9 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %9, i32 0, i32 4
  %10 = load ptr, ptr %top, align 8
  store ptr %10, ptr %i_o, align 8
  %11 = load ptr, ptr %i_x, align 8
  %12 = load ptr, ptr %i_o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %12, i32 0, i32 0
  store ptr %11, ptr %value, align 8
  %13 = load ptr, ptr %i_o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 1
  store i32 8, ptr %tt, align 8
  %14 = load ptr, ptr %L.addr, align 8
  %15 = load ptr, ptr %L.addr, align 8
  %top2 = getelementptr inbounds %struct.lua_State, ptr %15, i32 0, i32 4
  %16 = load ptr, ptr %top2, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %16, i32 1
  store ptr %incdec.ptr, ptr %top2, align 8
  %17 = load ptr, ptr %L1, align 8
  %arrayidx = getelementptr inbounds ptr, ptr %17, i64 -1
  store ptr null, ptr %arrayidx, align 8
  %18 = load ptr, ptr %L1, align 8
  ret ptr %18
}

declare void @luaC_step(ptr noundef) #2

declare ptr @luaE_newthread(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_gettop(ptr noundef %L) #0 {
entry:
  %L.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %0, i32 0, i32 4
  %1 = load ptr, ptr %top, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %base = getelementptr inbounds %struct.lua_State, ptr %2, i32 0, i32 5
  %3 = load ptr, ptr %base, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %3 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 16
  %conv = trunc i64 %sub.ptr.div to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_settop(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load i32, ptr %idx.addr, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %L.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %2 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %2, i32 0, i32 4
  %3 = load ptr, ptr %top, align 8
  %4 = load ptr, ptr %L.addr, align 8
  %base = getelementptr inbounds %struct.lua_State, ptr %4, i32 0, i32 5
  %5 = load ptr, ptr %base, align 8
  %6 = load i32, ptr %idx.addr, align 4
  %idx.ext = sext i32 %6 to i64
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %5, i64 %idx.ext
  %cmp1 = icmp ult ptr %3, %add.ptr
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load ptr, ptr %L.addr, align 8
  %top2 = getelementptr inbounds %struct.lua_State, ptr %7, i32 0, i32 4
  %8 = load ptr, ptr %top2, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %8, i32 1
  store ptr %incdec.ptr, ptr %top2, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %8, i32 0, i32 1
  store i32 0, ptr %tt, align 8
  br label %while.cond, !llvm.loop !8

while.end:                                        ; preds = %while.cond
  %9 = load ptr, ptr %L.addr, align 8
  %base3 = getelementptr inbounds %struct.lua_State, ptr %9, i32 0, i32 5
  %10 = load ptr, ptr %base3, align 8
  %11 = load i32, ptr %idx.addr, align 4
  %idx.ext4 = sext i32 %11 to i64
  %add.ptr5 = getelementptr inbounds %struct.lua_TValue, ptr %10, i64 %idx.ext4
  %12 = load ptr, ptr %L.addr, align 8
  %top6 = getelementptr inbounds %struct.lua_State, ptr %12, i32 0, i32 4
  store ptr %add.ptr5, ptr %top6, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %13 = load ptr, ptr %L.addr, align 8
  %14 = load i32, ptr %idx.addr, align 4
  %add = add nsw i32 %14, 1
  %15 = load ptr, ptr %L.addr, align 8
  %top7 = getelementptr inbounds %struct.lua_State, ptr %15, i32 0, i32 4
  %16 = load ptr, ptr %top7, align 8
  %idx.ext8 = sext i32 %add to i64
  %add.ptr9 = getelementptr inbounds %struct.lua_TValue, ptr %16, i64 %idx.ext8
  store ptr %add.ptr9, ptr %top7, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %while.end
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_remove(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %p = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %o1 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %p, align 8
  %2 = load ptr, ptr %L.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %3 = load ptr, ptr %p, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %3, i32 1
  store ptr %incdec.ptr, ptr %p, align 8
  %4 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %4, i32 0, i32 4
  %5 = load ptr, ptr %top, align 8
  %cmp = icmp ult ptr %incdec.ptr, %5
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %6 = load ptr, ptr %p, align 8
  store ptr %6, ptr %o2, align 8
  %7 = load ptr, ptr %p, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %7, i64 -1
  store ptr %add.ptr, ptr %o1, align 8
  %8 = load ptr, ptr %o1, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %8, i32 0, i32 0
  %9 = load ptr, ptr %o2, align 8
  %value1 = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value, ptr align 8 %value1, i64 8, i1 false)
  %10 = load ptr, ptr %o2, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 0, i32 1
  %11 = load i32, ptr %tt, align 8
  %12 = load ptr, ptr %o1, align 8
  %tt2 = getelementptr inbounds %struct.lua_TValue, ptr %12, i32 0, i32 1
  store i32 %11, ptr %tt2, align 8
  br label %while.cond, !llvm.loop !9

while.end:                                        ; preds = %while.cond
  %13 = load ptr, ptr %L.addr, align 8
  %top3 = getelementptr inbounds %struct.lua_State, ptr %13, i32 0, i32 4
  %14 = load ptr, ptr %top3, align 8
  %incdec.ptr4 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 -1
  store ptr %incdec.ptr4, ptr %top3, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @index2adr(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %retval = alloca ptr, align 8
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  %func = alloca ptr, align 8
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  %func16 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load i32, ptr %idx.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else3

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %L.addr, align 8
  %base = getelementptr inbounds %struct.lua_State, ptr %1, i32 0, i32 5
  %2 = load ptr, ptr %base, align 8
  %3 = load i32, ptr %idx.addr, align 4
  %sub = sub nsw i32 %3, 1
  %idx.ext = sext i32 %sub to i64
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %2, i64 %idx.ext
  store ptr %add.ptr, ptr %o, align 8
  %4 = load ptr, ptr %L.addr, align 8
  %5 = load ptr, ptr %o, align 8
  %6 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %6, i32 0, i32 4
  %7 = load ptr, ptr %top, align 8
  %cmp1 = icmp uge ptr %5, %7
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  store ptr @luaO_nilobject_, ptr %retval, align 8
  br label %return

if.else:                                          ; preds = %if.then
  %8 = load ptr, ptr %o, align 8
  store ptr %8, ptr %retval, align 8
  br label %return

if.else3:                                         ; preds = %entry
  %9 = load i32, ptr %idx.addr, align 4
  %cmp4 = icmp sgt i32 %9, -10000
  br i1 %cmp4, label %if.then5, label %if.else9

if.then5:                                         ; preds = %if.else3
  %10 = load ptr, ptr %L.addr, align 8
  %11 = load ptr, ptr %L.addr, align 8
  %top6 = getelementptr inbounds %struct.lua_State, ptr %11, i32 0, i32 4
  %12 = load ptr, ptr %top6, align 8
  %13 = load i32, ptr %idx.addr, align 4
  %idx.ext7 = sext i32 %13 to i64
  %add.ptr8 = getelementptr inbounds %struct.lua_TValue, ptr %12, i64 %idx.ext7
  store ptr %add.ptr8, ptr %retval, align 8
  br label %return

if.else9:                                         ; preds = %if.else3
  %14 = load i32, ptr %idx.addr, align 4
  switch i32 %14, label %sw.default [
    i32 -10000, label %sw.bb
    i32 -10001, label %sw.bb10
    i32 -10002, label %sw.bb15
  ]

sw.bb:                                            ; preds = %if.else9
  %15 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %15, i32 0, i32 6
  %16 = load ptr, ptr %l_G, align 8
  %l_registry = getelementptr inbounds %struct.global_State, ptr %16, i32 0, i32 22
  store ptr %l_registry, ptr %retval, align 8
  br label %return

sw.bb10:                                          ; preds = %if.else9
  %17 = load ptr, ptr %L.addr, align 8
  %ci = getelementptr inbounds %struct.lua_State, ptr %17, i32 0, i32 7
  %18 = load ptr, ptr %ci, align 8
  %func11 = getelementptr inbounds %struct.CallInfo, ptr %18, i32 0, i32 1
  %19 = load ptr, ptr %func11, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %19, i32 0, i32 0
  %20 = load ptr, ptr %value, align 8
  store ptr %20, ptr %func, align 8
  %21 = load ptr, ptr %func, align 8
  %env = getelementptr inbounds %struct.CClosure, ptr %21, i32 0, i32 6
  %22 = load ptr, ptr %env, align 8
  store ptr %22, ptr %i_x, align 8
  %23 = load ptr, ptr %L.addr, align 8
  %env12 = getelementptr inbounds %struct.lua_State, ptr %23, i32 0, i32 22
  store ptr %env12, ptr %i_o, align 8
  %24 = load ptr, ptr %i_x, align 8
  %25 = load ptr, ptr %i_o, align 8
  %value13 = getelementptr inbounds %struct.lua_TValue, ptr %25, i32 0, i32 0
  store ptr %24, ptr %value13, align 8
  %26 = load ptr, ptr %i_o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %26, i32 0, i32 1
  store i32 5, ptr %tt, align 8
  %27 = load ptr, ptr %L.addr, align 8
  %env14 = getelementptr inbounds %struct.lua_State, ptr %27, i32 0, i32 22
  store ptr %env14, ptr %retval, align 8
  br label %return

sw.bb15:                                          ; preds = %if.else9
  %28 = load ptr, ptr %L.addr, align 8
  %l_gt = getelementptr inbounds %struct.lua_State, ptr %28, i32 0, i32 21
  store ptr %l_gt, ptr %retval, align 8
  br label %return

sw.default:                                       ; preds = %if.else9
  %29 = load ptr, ptr %L.addr, align 8
  %ci17 = getelementptr inbounds %struct.lua_State, ptr %29, i32 0, i32 7
  %30 = load ptr, ptr %ci17, align 8
  %func18 = getelementptr inbounds %struct.CallInfo, ptr %30, i32 0, i32 1
  %31 = load ptr, ptr %func18, align 8
  %value19 = getelementptr inbounds %struct.lua_TValue, ptr %31, i32 0, i32 0
  %32 = load ptr, ptr %value19, align 8
  store ptr %32, ptr %func16, align 8
  %33 = load i32, ptr %idx.addr, align 4
  %sub20 = sub nsw i32 -10002, %33
  store i32 %sub20, ptr %idx.addr, align 4
  %34 = load i32, ptr %idx.addr, align 4
  %35 = load ptr, ptr %func16, align 8
  %nupvalues = getelementptr inbounds %struct.CClosure, ptr %35, i32 0, i32 4
  %36 = load i8, ptr %nupvalues, align 1
  %conv = zext i8 %36 to i32
  %cmp21 = icmp sle i32 %34, %conv
  br i1 %cmp21, label %cond.true, label %cond.false

cond.true:                                        ; preds = %sw.default
  %37 = load ptr, ptr %func16, align 8
  %upvalue = getelementptr inbounds %struct.CClosure, ptr %37, i32 0, i32 9
  %38 = load i32, ptr %idx.addr, align 4
  %sub23 = sub nsw i32 %38, 1
  %idxprom = sext i32 %sub23 to i64
  %arrayidx = getelementptr inbounds [1 x %struct.lua_TValue], ptr %upvalue, i64 0, i64 %idxprom
  br label %cond.end

cond.false:                                       ; preds = %sw.default
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi ptr [ %arrayidx, %cond.true ], [ @luaO_nilobject_, %cond.false ]
  store ptr %cond, ptr %retval, align 8
  br label %return

return:                                           ; preds = %cond.end, %sw.bb15, %sw.bb10, %sw.bb, %if.then5, %if.else, %if.then2
  %39 = load ptr, ptr %retval, align 8
  ret ptr %39
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_insert(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %p = alloca ptr, align 8
  %q = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %o1 = alloca ptr, align 8
  %o23 = alloca ptr, align 8
  %o15 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %p, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 4
  %4 = load ptr, ptr %top, align 8
  store ptr %4, ptr %q, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load ptr, ptr %q, align 8
  %6 = load ptr, ptr %p, align 8
  %cmp = icmp ugt ptr %5, %6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load ptr, ptr %q, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %7, i64 -1
  store ptr %add.ptr, ptr %o2, align 8
  %8 = load ptr, ptr %q, align 8
  store ptr %8, ptr %o1, align 8
  %9 = load ptr, ptr %o1, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 0, i32 0
  %10 = load ptr, ptr %o2, align 8
  %value1 = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value, ptr align 8 %value1, i64 8, i1 false)
  %11 = load ptr, ptr %o2, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %11, i32 0, i32 1
  %12 = load i32, ptr %tt, align 8
  %13 = load ptr, ptr %o1, align 8
  %tt2 = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 1
  store i32 %12, ptr %tt2, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load ptr, ptr %q, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 -1
  store ptr %incdec.ptr, ptr %q, align 8
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %for.cond
  %15 = load ptr, ptr %L.addr, align 8
  %top4 = getelementptr inbounds %struct.lua_State, ptr %15, i32 0, i32 4
  %16 = load ptr, ptr %top4, align 8
  store ptr %16, ptr %o23, align 8
  %17 = load ptr, ptr %p, align 8
  store ptr %17, ptr %o15, align 8
  %18 = load ptr, ptr %o15, align 8
  %value6 = getelementptr inbounds %struct.lua_TValue, ptr %18, i32 0, i32 0
  %19 = load ptr, ptr %o23, align 8
  %value7 = getelementptr inbounds %struct.lua_TValue, ptr %19, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value6, ptr align 8 %value7, i64 8, i1 false)
  %20 = load ptr, ptr %o23, align 8
  %tt8 = getelementptr inbounds %struct.lua_TValue, ptr %20, i32 0, i32 1
  %21 = load i32, ptr %tt8, align 8
  %22 = load ptr, ptr %o15, align 8
  %tt9 = getelementptr inbounds %struct.lua_TValue, ptr %22, i32 0, i32 1
  store i32 %21, ptr %tt9, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_replace(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  %func = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %o1 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load i32, ptr %idx.addr, align 4
  %cmp = icmp eq i32 %0, -10001
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load ptr, ptr %L.addr, align 8
  %ci = getelementptr inbounds %struct.lua_State, ptr %1, i32 0, i32 7
  %2 = load ptr, ptr %ci, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %base_ci = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 12
  %4 = load ptr, ptr %base_ci, align 8
  %cmp1 = icmp eq ptr %2, %4
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = load ptr, ptr %L.addr, align 8
  call void (ptr, ptr, ...) @luaG_runerror(ptr noundef %5, ptr noundef @.str)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %6 = load ptr, ptr %L.addr, align 8
  %7 = load ptr, ptr %L.addr, align 8
  %8 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %7, i32 noundef %8)
  store ptr %call, ptr %o, align 8
  %9 = load ptr, ptr %L.addr, align 8
  %10 = load i32, ptr %idx.addr, align 4
  %cmp2 = icmp eq i32 %10, -10001
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %11 = load ptr, ptr %L.addr, align 8
  %ci4 = getelementptr inbounds %struct.lua_State, ptr %11, i32 0, i32 7
  %12 = load ptr, ptr %ci4, align 8
  %func5 = getelementptr inbounds %struct.CallInfo, ptr %12, i32 0, i32 1
  %13 = load ptr, ptr %func5, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 0
  %14 = load ptr, ptr %value, align 8
  store ptr %14, ptr %func, align 8
  %15 = load ptr, ptr %L.addr, align 8
  %16 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %16, i32 0, i32 4
  %17 = load ptr, ptr %top, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %17, i64 -1
  %value6 = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr, i32 0, i32 0
  %18 = load ptr, ptr %value6, align 8
  %19 = load ptr, ptr %func, align 8
  %env = getelementptr inbounds %struct.CClosure, ptr %19, i32 0, i32 6
  store ptr %18, ptr %env, align 8
  %20 = load ptr, ptr %L.addr, align 8
  %top7 = getelementptr inbounds %struct.lua_State, ptr %20, i32 0, i32 4
  %21 = load ptr, ptr %top7, align 8
  %add.ptr8 = getelementptr inbounds %struct.lua_TValue, ptr %21, i64 -1
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr8, i32 0, i32 1
  %22 = load i32, ptr %tt, align 8
  %cmp9 = icmp sge i32 %22, 4
  br i1 %cmp9, label %land.lhs.true10, label %if.end23

land.lhs.true10:                                  ; preds = %if.then3
  %23 = load ptr, ptr %L.addr, align 8
  %top11 = getelementptr inbounds %struct.lua_State, ptr %23, i32 0, i32 4
  %24 = load ptr, ptr %top11, align 8
  %add.ptr12 = getelementptr inbounds %struct.lua_TValue, ptr %24, i64 -1
  %value13 = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr12, i32 0, i32 0
  %25 = load ptr, ptr %value13, align 8
  %marked = getelementptr inbounds %struct.GCheader, ptr %25, i32 0, i32 2
  %26 = load i8, ptr %marked, align 1
  %conv = zext i8 %26 to i32
  %and = and i32 %conv, 3
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true14, label %if.end23

land.lhs.true14:                                  ; preds = %land.lhs.true10
  %27 = load ptr, ptr %func, align 8
  %marked15 = getelementptr inbounds %struct.GCheader, ptr %27, i32 0, i32 2
  %28 = load i8, ptr %marked15, align 1
  %conv16 = zext i8 %28 to i32
  %and17 = and i32 %conv16, 4
  %tobool18 = icmp ne i32 %and17, 0
  br i1 %tobool18, label %if.then19, label %if.end23

if.then19:                                        ; preds = %land.lhs.true14
  %29 = load ptr, ptr %L.addr, align 8
  %30 = load ptr, ptr %func, align 8
  %31 = load ptr, ptr %L.addr, align 8
  %top20 = getelementptr inbounds %struct.lua_State, ptr %31, i32 0, i32 4
  %32 = load ptr, ptr %top20, align 8
  %add.ptr21 = getelementptr inbounds %struct.lua_TValue, ptr %32, i64 -1
  %value22 = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr21, i32 0, i32 0
  %33 = load ptr, ptr %value22, align 8
  call void @luaC_barrierf(ptr noundef %29, ptr noundef %30, ptr noundef %33)
  br label %if.end23

if.end23:                                         ; preds = %if.then19, %land.lhs.true14, %land.lhs.true10, %if.then3
  br label %if.end63

if.else:                                          ; preds = %if.end
  %34 = load ptr, ptr %L.addr, align 8
  %top24 = getelementptr inbounds %struct.lua_State, ptr %34, i32 0, i32 4
  %35 = load ptr, ptr %top24, align 8
  %add.ptr25 = getelementptr inbounds %struct.lua_TValue, ptr %35, i64 -1
  store ptr %add.ptr25, ptr %o2, align 8
  %36 = load ptr, ptr %o, align 8
  store ptr %36, ptr %o1, align 8
  %37 = load ptr, ptr %o1, align 8
  %value26 = getelementptr inbounds %struct.lua_TValue, ptr %37, i32 0, i32 0
  %38 = load ptr, ptr %o2, align 8
  %value27 = getelementptr inbounds %struct.lua_TValue, ptr %38, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value26, ptr align 8 %value27, i64 8, i1 false)
  %39 = load ptr, ptr %o2, align 8
  %tt28 = getelementptr inbounds %struct.lua_TValue, ptr %39, i32 0, i32 1
  %40 = load i32, ptr %tt28, align 8
  %41 = load ptr, ptr %o1, align 8
  %tt29 = getelementptr inbounds %struct.lua_TValue, ptr %41, i32 0, i32 1
  store i32 %40, ptr %tt29, align 8
  %42 = load i32, ptr %idx.addr, align 4
  %cmp30 = icmp slt i32 %42, -10002
  br i1 %cmp30, label %if.then32, label %if.end62

if.then32:                                        ; preds = %if.else
  %43 = load ptr, ptr %L.addr, align 8
  %top33 = getelementptr inbounds %struct.lua_State, ptr %43, i32 0, i32 4
  %44 = load ptr, ptr %top33, align 8
  %add.ptr34 = getelementptr inbounds %struct.lua_TValue, ptr %44, i64 -1
  %tt35 = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr34, i32 0, i32 1
  %45 = load i32, ptr %tt35, align 8
  %cmp36 = icmp sge i32 %45, 4
  br i1 %cmp36, label %land.lhs.true38, label %if.end61

land.lhs.true38:                                  ; preds = %if.then32
  %46 = load ptr, ptr %L.addr, align 8
  %top39 = getelementptr inbounds %struct.lua_State, ptr %46, i32 0, i32 4
  %47 = load ptr, ptr %top39, align 8
  %add.ptr40 = getelementptr inbounds %struct.lua_TValue, ptr %47, i64 -1
  %value41 = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr40, i32 0, i32 0
  %48 = load ptr, ptr %value41, align 8
  %marked42 = getelementptr inbounds %struct.GCheader, ptr %48, i32 0, i32 2
  %49 = load i8, ptr %marked42, align 1
  %conv43 = zext i8 %49 to i32
  %and44 = and i32 %conv43, 3
  %tobool45 = icmp ne i32 %and44, 0
  br i1 %tobool45, label %land.lhs.true46, label %if.end61

land.lhs.true46:                                  ; preds = %land.lhs.true38
  %50 = load ptr, ptr %L.addr, align 8
  %ci47 = getelementptr inbounds %struct.lua_State, ptr %50, i32 0, i32 7
  %51 = load ptr, ptr %ci47, align 8
  %func48 = getelementptr inbounds %struct.CallInfo, ptr %51, i32 0, i32 1
  %52 = load ptr, ptr %func48, align 8
  %value49 = getelementptr inbounds %struct.lua_TValue, ptr %52, i32 0, i32 0
  %53 = load ptr, ptr %value49, align 8
  %marked50 = getelementptr inbounds %struct.GCheader, ptr %53, i32 0, i32 2
  %54 = load i8, ptr %marked50, align 1
  %conv51 = zext i8 %54 to i32
  %and52 = and i32 %conv51, 4
  %tobool53 = icmp ne i32 %and52, 0
  br i1 %tobool53, label %if.then54, label %if.end61

if.then54:                                        ; preds = %land.lhs.true46
  %55 = load ptr, ptr %L.addr, align 8
  %56 = load ptr, ptr %L.addr, align 8
  %ci55 = getelementptr inbounds %struct.lua_State, ptr %56, i32 0, i32 7
  %57 = load ptr, ptr %ci55, align 8
  %func56 = getelementptr inbounds %struct.CallInfo, ptr %57, i32 0, i32 1
  %58 = load ptr, ptr %func56, align 8
  %value57 = getelementptr inbounds %struct.lua_TValue, ptr %58, i32 0, i32 0
  %59 = load ptr, ptr %value57, align 8
  %60 = load ptr, ptr %L.addr, align 8
  %top58 = getelementptr inbounds %struct.lua_State, ptr %60, i32 0, i32 4
  %61 = load ptr, ptr %top58, align 8
  %add.ptr59 = getelementptr inbounds %struct.lua_TValue, ptr %61, i64 -1
  %value60 = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr59, i32 0, i32 0
  %62 = load ptr, ptr %value60, align 8
  call void @luaC_barrierf(ptr noundef %55, ptr noundef %59, ptr noundef %62)
  br label %if.end61

if.end61:                                         ; preds = %if.then54, %land.lhs.true46, %land.lhs.true38, %if.then32
  br label %if.end62

if.end62:                                         ; preds = %if.end61, %if.else
  br label %if.end63

if.end63:                                         ; preds = %if.end62, %if.end23
  %63 = load ptr, ptr %L.addr, align 8
  %top64 = getelementptr inbounds %struct.lua_State, ptr %63, i32 0, i32 4
  %64 = load ptr, ptr %top64, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %64, i32 -1
  store ptr %incdec.ptr, ptr %top64, align 8
  ret void
}

declare void @luaG_runerror(ptr noundef, ptr noundef, ...) #2

declare void @luaC_barrierf(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushvalue(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %o2 = alloca ptr, align 8
  %o1 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o2, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %2, i32 0, i32 4
  %3 = load ptr, ptr %top, align 8
  store ptr %3, ptr %o1, align 8
  %4 = load ptr, ptr %o1, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 0
  %5 = load ptr, ptr %o2, align 8
  %value1 = getelementptr inbounds %struct.lua_TValue, ptr %5, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value, ptr align 8 %value1, i64 8, i1 false)
  %6 = load ptr, ptr %o2, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %6, i32 0, i32 1
  %7 = load i32, ptr %tt, align 8
  %8 = load ptr, ptr %o1, align 8
  %tt2 = getelementptr inbounds %struct.lua_TValue, ptr %8, i32 0, i32 1
  store i32 %7, ptr %tt2, align 8
  %9 = load ptr, ptr %L.addr, align 8
  %10 = load ptr, ptr %L.addr, align 8
  %top3 = getelementptr inbounds %struct.lua_State, ptr %10, i32 0, i32 4
  %11 = load ptr, ptr %top3, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %11, i32 1
  store ptr %incdec.ptr, ptr %top3, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_type(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %cmp = icmp eq ptr %2, @luaO_nilobject_
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %3, i32 0, i32 1
  %4 = load i32, ptr %tt, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -1, %cond.true ], [ %4, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_typename(ptr noundef %L, i32 noundef %t) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %t.addr = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store i32 %t, ptr %t.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %t.addr, align 4
  %cmp = icmp eq i32 %1, -1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, ptr %t.addr, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [0 x ptr], ptr @luaT_typenames, i64 0, i64 %idxprom
  %3 = load ptr, ptr %arrayidx, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi ptr [ @.str.1, %cond.true ], [ %3, %cond.false ]
  ret ptr %cond
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_iscfunction(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %2, i32 0, i32 1
  %3 = load i32, ptr %tt, align 8
  %cmp = icmp eq i32 %3, 6
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 0
  %5 = load ptr, ptr %value, align 8
  %isC = getelementptr inbounds %struct.CClosure, ptr %5, i32 0, i32 3
  %6 = load i8, ptr %isC, align 2
  %conv = zext i8 %6 to i32
  %tobool = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %7 = phi i1 [ false, %entry ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %7 to i32
  ret i32 %land.ext
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_isnumber(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %n = alloca %struct.lua_TValue, align 8
  %o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %2, i32 0, i32 1
  %3 = load i32, ptr %tt, align 8
  %cmp = icmp eq i32 %3, 3
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %call1 = call ptr @luaV_tonumber(ptr noundef %4, ptr noundef %n)
  store ptr %call1, ptr %o, align 8
  %cmp2 = icmp ne ptr %call1, null
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %5 = phi i1 [ true, %entry ], [ %cmp2, %lor.rhs ]
  %lor.ext = zext i1 %5 to i32
  ret i32 %lor.ext
}

declare ptr @luaV_tonumber(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_isstring(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %t = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call i32 @lua_type(ptr noundef %0, i32 noundef %1)
  store i32 %call, ptr %t, align 4
  %2 = load i32, ptr %t, align 4
  %cmp = icmp eq i32 %2, 4
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %3 = load i32, ptr %t, align 4
  %cmp1 = icmp eq i32 %3, 3
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %4 = phi i1 [ true, %entry ], [ %cmp1, %lor.rhs ]
  %lor.ext = zext i1 %4 to i32
  ret i32 %lor.ext
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_isuserdata(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %2, i32 0, i32 1
  %3 = load i32, ptr %tt, align 8
  %cmp = icmp eq i32 %3, 7
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %tt1 = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 1
  %5 = load i32, ptr %tt1, align 8
  %cmp2 = icmp eq i32 %5, 2
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %6 = phi i1 [ true, %entry ], [ %cmp2, %lor.rhs ]
  %lor.ext = zext i1 %6 to i32
  ret i32 %lor.ext
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_rawequal(ptr noundef %L, i32 noundef %index1, i32 noundef %index2) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %index1.addr = alloca i32, align 4
  %index2.addr = alloca i32, align 4
  %o1 = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %index1, ptr %index1.addr, align 4
  store i32 %index2, ptr %index2.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %index1.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o1, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load i32, ptr %index2.addr, align 4
  %call1 = call ptr @index2adr(ptr noundef %2, i32 noundef %3)
  store ptr %call1, ptr %o2, align 8
  %4 = load ptr, ptr %o1, align 8
  %cmp = icmp eq ptr %4, @luaO_nilobject_
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %5 = load ptr, ptr %o2, align 8
  %cmp2 = icmp eq ptr %5, @luaO_nilobject_
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %6 = load ptr, ptr %o1, align 8
  %7 = load ptr, ptr %o2, align 8
  %call3 = call i32 @luaO_rawequalObj(ptr noundef %6, ptr noundef %7)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %call3, %cond.false ]
  ret i32 %cond
}

declare i32 @luaO_rawequalObj(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_equal(ptr noundef %L, i32 noundef %index1, i32 noundef %index2) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %index1.addr = alloca i32, align 4
  %index2.addr = alloca i32, align 4
  %o1 = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store i32 %index1, ptr %index1.addr, align 4
  store i32 %index2, ptr %index2.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %index1.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o1, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load i32, ptr %index2.addr, align 4
  %call1 = call ptr @index2adr(ptr noundef %2, i32 noundef %3)
  store ptr %call1, ptr %o2, align 8
  %4 = load ptr, ptr %o1, align 8
  %cmp = icmp eq ptr %4, @luaO_nilobject_
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %5 = load ptr, ptr %o2, align 8
  %cmp2 = icmp eq ptr %5, @luaO_nilobject_
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %6 = load ptr, ptr %o1, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %6, i32 0, i32 1
  %7 = load i32, ptr %tt, align 8
  %8 = load ptr, ptr %o2, align 8
  %tt3 = getelementptr inbounds %struct.lua_TValue, ptr %8, i32 0, i32 1
  %9 = load i32, ptr %tt3, align 8
  %cmp4 = icmp eq i32 %7, %9
  br i1 %cmp4, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %cond.false
  %10 = load ptr, ptr %L.addr, align 8
  %11 = load ptr, ptr %o1, align 8
  %12 = load ptr, ptr %o2, align 8
  %call5 = call i32 @luaV_equalval(ptr noundef %10, ptr noundef %11, ptr noundef %12)
  %tobool = icmp ne i32 %call5, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %cond.false
  %13 = phi i1 [ false, %cond.false ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %13 to i32
  br label %cond.end

cond.end:                                         ; preds = %land.end, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %land.ext, %land.end ]
  store i32 %cond, ptr %i, align 4
  %14 = load i32, ptr %i, align 4
  ret i32 %14
}

declare i32 @luaV_equalval(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_lessthan(ptr noundef %L, i32 noundef %index1, i32 noundef %index2) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %index1.addr = alloca i32, align 4
  %index2.addr = alloca i32, align 4
  %o1 = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store i32 %index1, ptr %index1.addr, align 4
  store i32 %index2, ptr %index2.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %index1.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o1, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load i32, ptr %index2.addr, align 4
  %call1 = call ptr @index2adr(ptr noundef %2, i32 noundef %3)
  store ptr %call1, ptr %o2, align 8
  %4 = load ptr, ptr %o1, align 8
  %cmp = icmp eq ptr %4, @luaO_nilobject_
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %5 = load ptr, ptr %o2, align 8
  %cmp2 = icmp eq ptr %5, @luaO_nilobject_
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %6 = load ptr, ptr %L.addr, align 8
  %7 = load ptr, ptr %o1, align 8
  %8 = load ptr, ptr %o2, align 8
  %call3 = call i32 @luaV_lessthan(ptr noundef %6, ptr noundef %7, ptr noundef %8)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %call3, %cond.false ]
  store i32 %cond, ptr %i, align 4
  %9 = load i32, ptr %i, align 4
  ret i32 %9
}

declare i32 @luaV_lessthan(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define double @lua_tonumber(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %retval = alloca double, align 8
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %n = alloca %struct.lua_TValue, align 8
  %o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %2, i32 0, i32 1
  %3 = load i32, ptr %tt, align 8
  %cmp = icmp eq i32 %3, 3
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %call1 = call ptr @luaV_tonumber(ptr noundef %4, ptr noundef %n)
  store ptr %call1, ptr %o, align 8
  %cmp2 = icmp ne ptr %call1, null
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %5 = load ptr, ptr %o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %5, i32 0, i32 0
  %6 = load double, ptr %value, align 8
  store double %6, ptr %retval, align 8
  br label %return

if.else:                                          ; preds = %lor.lhs.false
  store double 0.000000e+00, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.else, %if.then
  %7 = load double, ptr %retval, align 8
  ret double %7
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @lua_tointeger(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %retval = alloca i64, align 8
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %n = alloca %struct.lua_TValue, align 8
  %o = alloca ptr, align 8
  %res = alloca i64, align 8
  %num = alloca double, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %2, i32 0, i32 1
  %3 = load i32, ptr %tt, align 8
  %cmp = icmp eq i32 %3, 3
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %call1 = call ptr @luaV_tonumber(ptr noundef %4, ptr noundef %n)
  store ptr %call1, ptr %o, align 8
  %cmp2 = icmp ne ptr %call1, null
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %5 = load ptr, ptr %o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %5, i32 0, i32 0
  %6 = load double, ptr %value, align 8
  store double %6, ptr %num, align 8
  %7 = load double, ptr %num, align 8
  %conv = fptosi double %7 to i64
  store i64 %conv, ptr %res, align 8
  %8 = load i64, ptr %res, align 8
  store i64 %8, ptr %retval, align 8
  br label %return

if.else:                                          ; preds = %lor.lhs.false
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.else, %if.then
  %9 = load i64, ptr %retval, align 8
  ret i64 %9
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_toboolean(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %2, i32 0, i32 1
  %3 = load i32, ptr %tt, align 8
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %tt1 = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 1
  %5 = load i32, ptr %tt1, align 8
  %cmp2 = icmp eq i32 %5, 1
  br i1 %cmp2, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %6 = load ptr, ptr %o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %6, i32 0, i32 0
  %7 = load i32, ptr %value, align 8
  %cmp3 = icmp eq i32 %7, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %8 = phi i1 [ false, %lor.rhs ], [ %cmp3, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %entry
  %9 = phi i1 [ true, %entry ], [ %8, %land.end ]
  %lnot = xor i1 %9, true
  %lnot.ext = zext i1 %lnot to i32
  ret i32 %lnot.ext
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_tolstring(ptr noundef %L, i32 noundef %idx, ptr noundef %len) #0 {
entry:
  %retval = alloca ptr, align 8
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %len.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  store ptr %len, ptr %len.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %2, i32 0, i32 1
  %3 = load i32, ptr %tt, align 8
  %cmp = icmp eq i32 %3, 4
  br i1 %cmp, label %if.end11, label %if.then

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %L.addr, align 8
  %5 = load ptr, ptr %o, align 8
  %call1 = call i32 @luaV_tostring(ptr noundef %4, ptr noundef %5)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.end5, label %if.then2

if.then2:                                         ; preds = %if.then
  %6 = load ptr, ptr %len.addr, align 8
  %cmp3 = icmp ne ptr %6, null
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then2
  %7 = load ptr, ptr %len.addr, align 8
  store i64 0, ptr %7, align 8
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then2
  store ptr null, ptr %retval, align 8
  br label %return

if.end5:                                          ; preds = %if.then
  %8 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %8, i32 0, i32 6
  %9 = load ptr, ptr %l_G, align 8
  %totalbytes = getelementptr inbounds %struct.global_State, ptr %9, i32 0, i32 15
  %10 = load i64, ptr %totalbytes, align 8
  %11 = load ptr, ptr %L.addr, align 8
  %l_G6 = getelementptr inbounds %struct.lua_State, ptr %11, i32 0, i32 6
  %12 = load ptr, ptr %l_G6, align 8
  %GCthreshold = getelementptr inbounds %struct.global_State, ptr %12, i32 0, i32 14
  %13 = load i64, ptr %GCthreshold, align 8
  %cmp7 = icmp uge i64 %10, %13
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end5
  %14 = load ptr, ptr %L.addr, align 8
  call void @luaC_step(ptr noundef %14)
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end5
  %15 = load ptr, ptr %L.addr, align 8
  %16 = load i32, ptr %idx.addr, align 4
  %call10 = call ptr @index2adr(ptr noundef %15, i32 noundef %16)
  store ptr %call10, ptr %o, align 8
  br label %if.end11

if.end11:                                         ; preds = %if.end9, %entry
  %17 = load ptr, ptr %len.addr, align 8
  %cmp12 = icmp ne ptr %17, null
  br i1 %cmp12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end11
  %18 = load ptr, ptr %o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %18, i32 0, i32 0
  %19 = load ptr, ptr %value, align 8
  %len14 = getelementptr inbounds %struct.anon.0, ptr %19, i32 0, i32 5
  %20 = load i64, ptr %len14, align 8
  %21 = load ptr, ptr %len.addr, align 8
  store i64 %20, ptr %21, align 8
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.end11
  %22 = load ptr, ptr %o, align 8
  %value16 = getelementptr inbounds %struct.lua_TValue, ptr %22, i32 0, i32 0
  %23 = load ptr, ptr %value16, align 8
  %add.ptr = getelementptr inbounds %union.TString, ptr %23, i64 1
  store ptr %add.ptr, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end15, %if.end
  %24 = load ptr, ptr %retval, align 8
  ret ptr %24
}

declare i32 @luaV_tostring(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @lua_objlen(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %retval = alloca i64, align 8
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  %l = alloca i64, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %2, i32 0, i32 1
  %3 = load i32, ptr %tt, align 8
  switch i32 %3, label %sw.default [
    i32 4, label %sw.bb
    i32 7, label %sw.bb1
    i32 5, label %sw.bb4
    i32 3, label %sw.bb7
  ]

sw.bb:                                            ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 0
  %5 = load ptr, ptr %value, align 8
  %len = getelementptr inbounds %struct.anon.0, ptr %5, i32 0, i32 5
  %6 = load i64, ptr %len, align 8
  store i64 %6, ptr %retval, align 8
  br label %return

sw.bb1:                                           ; preds = %entry
  %7 = load ptr, ptr %o, align 8
  %value2 = getelementptr inbounds %struct.lua_TValue, ptr %7, i32 0, i32 0
  %8 = load ptr, ptr %value2, align 8
  %len3 = getelementptr inbounds %struct.anon.1, ptr %8, i32 0, i32 5
  %9 = load i64, ptr %len3, align 8
  store i64 %9, ptr %retval, align 8
  br label %return

sw.bb4:                                           ; preds = %entry
  %10 = load ptr, ptr %o, align 8
  %value5 = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 0, i32 0
  %11 = load ptr, ptr %value5, align 8
  %call6 = call i32 @luaH_getn(ptr noundef %11)
  %conv = sext i32 %call6 to i64
  store i64 %conv, ptr %retval, align 8
  br label %return

sw.bb7:                                           ; preds = %entry
  %12 = load ptr, ptr %L.addr, align 8
  %13 = load ptr, ptr %o, align 8
  %call8 = call i32 @luaV_tostring(ptr noundef %12, ptr noundef %13)
  %tobool = icmp ne i32 %call8, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %sw.bb7
  %14 = load ptr, ptr %o, align 8
  %value9 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 0
  %15 = load ptr, ptr %value9, align 8
  %len10 = getelementptr inbounds %struct.anon.0, ptr %15, i32 0, i32 5
  %16 = load i64, ptr %len10, align 8
  br label %cond.end

cond.false:                                       ; preds = %sw.bb7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %16, %cond.true ], [ 0, %cond.false ]
  store i64 %cond, ptr %l, align 8
  %17 = load i64, ptr %l, align 8
  store i64 %17, ptr %retval, align 8
  br label %return

sw.default:                                       ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.default, %cond.end, %sw.bb4, %sw.bb1, %sw.bb
  %18 = load i64, ptr %retval, align 8
  ret i64 %18
}

declare i32 @luaH_getn(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_tocfunction(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %2, i32 0, i32 1
  %3 = load i32, ptr %tt, align 8
  %cmp = icmp eq i32 %3, 6
  br i1 %cmp, label %land.lhs.true, label %cond.true

land.lhs.true:                                    ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 0
  %5 = load ptr, ptr %value, align 8
  %isC = getelementptr inbounds %struct.CClosure, ptr %5, i32 0, i32 3
  %6 = load i8, ptr %isC, align 2
  %conv = zext i8 %6 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %cond.false, label %cond.true

cond.true:                                        ; preds = %land.lhs.true, %entry
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true
  %7 = load ptr, ptr %o, align 8
  %value1 = getelementptr inbounds %struct.lua_TValue, ptr %7, i32 0, i32 0
  %8 = load ptr, ptr %value1, align 8
  %f = getelementptr inbounds %struct.CClosure, ptr %8, i32 0, i32 8
  %9 = load ptr, ptr %f, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi ptr [ null, %cond.true ], [ %9, %cond.false ]
  ret ptr %cond
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_touserdata(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %retval = alloca ptr, align 8
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %2, i32 0, i32 1
  %3 = load i32, ptr %tt, align 8
  switch i32 %3, label %sw.default [
    i32 7, label %sw.bb
    i32 2, label %sw.bb1
  ]

sw.bb:                                            ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 0
  %5 = load ptr, ptr %value, align 8
  %add.ptr = getelementptr inbounds %union.Udata, ptr %5, i64 1
  store ptr %add.ptr, ptr %retval, align 8
  br label %return

sw.bb1:                                           ; preds = %entry
  %6 = load ptr, ptr %o, align 8
  %value2 = getelementptr inbounds %struct.lua_TValue, ptr %6, i32 0, i32 0
  %7 = load ptr, ptr %value2, align 8
  store ptr %7, ptr %retval, align 8
  br label %return

sw.default:                                       ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.default, %sw.bb1, %sw.bb
  %8 = load ptr, ptr %retval, align 8
  ret ptr %8
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_tothread(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %2, i32 0, i32 1
  %3 = load i32, ptr %tt, align 8
  %cmp = icmp eq i32 %3, 8
  br i1 %cmp, label %cond.false, label %cond.true

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 0
  %5 = load ptr, ptr %value, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi ptr [ null, %cond.true ], [ %5, %cond.false ]
  ret ptr %cond
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_topointer(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %retval = alloca ptr, align 8
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %2, i32 0, i32 1
  %3 = load i32, ptr %tt, align 8
  switch i32 %3, label %sw.default [
    i32 5, label %sw.bb
    i32 6, label %sw.bb1
    i32 8, label %sw.bb3
    i32 7, label %sw.bb5
    i32 2, label %sw.bb5
  ]

sw.bb:                                            ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 0
  %5 = load ptr, ptr %value, align 8
  store ptr %5, ptr %retval, align 8
  br label %return

sw.bb1:                                           ; preds = %entry
  %6 = load ptr, ptr %o, align 8
  %value2 = getelementptr inbounds %struct.lua_TValue, ptr %6, i32 0, i32 0
  %7 = load ptr, ptr %value2, align 8
  store ptr %7, ptr %retval, align 8
  br label %return

sw.bb3:                                           ; preds = %entry
  %8 = load ptr, ptr %o, align 8
  %value4 = getelementptr inbounds %struct.lua_TValue, ptr %8, i32 0, i32 0
  %9 = load ptr, ptr %value4, align 8
  store ptr %9, ptr %retval, align 8
  br label %return

sw.bb5:                                           ; preds = %entry, %entry
  %10 = load ptr, ptr %L.addr, align 8
  %11 = load i32, ptr %idx.addr, align 4
  %call6 = call ptr @lua_touserdata(ptr noundef %10, i32 noundef %11)
  store ptr %call6, ptr %retval, align 8
  br label %return

sw.default:                                       ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.default, %sw.bb5, %sw.bb3, %sw.bb1, %sw.bb
  %12 = load ptr, ptr %retval, align 8
  ret ptr %12
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushnil(ptr noundef %L) #0 {
entry:
  %L.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %0, i32 0, i32 4
  %1 = load ptr, ptr %top, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %1, i32 0, i32 1
  store i32 0, ptr %tt, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %top1 = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 4
  %4 = load ptr, ptr %top1, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 1
  store ptr %incdec.ptr, ptr %top1, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushnumber(ptr noundef %L, double noundef %n) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %n.addr = alloca double, align 8
  %i_x = alloca double, align 8
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store double %n, ptr %n.addr, align 8
  %0 = load double, ptr %n.addr, align 8
  store double %0, ptr %i_x, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %1, i32 0, i32 4
  %2 = load ptr, ptr %top, align 8
  store ptr %2, ptr %i_o, align 8
  %3 = load double, ptr %i_x, align 8
  %4 = load ptr, ptr %i_o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 0
  store double %3, ptr %value, align 8
  %5 = load ptr, ptr %i_o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %5, i32 0, i32 1
  store i32 3, ptr %tt, align 8
  %6 = load ptr, ptr %L.addr, align 8
  %7 = load ptr, ptr %L.addr, align 8
  %top1 = getelementptr inbounds %struct.lua_State, ptr %7, i32 0, i32 4
  %8 = load ptr, ptr %top1, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %8, i32 1
  store ptr %incdec.ptr, ptr %top1, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushinteger(ptr noundef %L, i64 noundef %n) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %i_x = alloca double, align 8
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  %0 = load i64, ptr %n.addr, align 8
  %conv = sitofp i64 %0 to double
  store double %conv, ptr %i_x, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %1, i32 0, i32 4
  %2 = load ptr, ptr %top, align 8
  store ptr %2, ptr %i_o, align 8
  %3 = load double, ptr %i_x, align 8
  %4 = load ptr, ptr %i_o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 0
  store double %3, ptr %value, align 8
  %5 = load ptr, ptr %i_o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %5, i32 0, i32 1
  store i32 3, ptr %tt, align 8
  %6 = load ptr, ptr %L.addr, align 8
  %7 = load ptr, ptr %L.addr, align 8
  %top1 = getelementptr inbounds %struct.lua_State, ptr %7, i32 0, i32 4
  %8 = load ptr, ptr %top1, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %8, i32 1
  store ptr %incdec.ptr, ptr %top1, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushlstring(ptr noundef %L, ptr noundef %s, i64 noundef %len) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %s.addr = alloca ptr, align 8
  %len.addr = alloca i64, align 8
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %s, ptr %s.addr, align 8
  store i64 %len, ptr %len.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %0, i32 0, i32 6
  %1 = load ptr, ptr %l_G, align 8
  %totalbytes = getelementptr inbounds %struct.global_State, ptr %1, i32 0, i32 15
  %2 = load i64, ptr %totalbytes, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %l_G1 = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 6
  %4 = load ptr, ptr %l_G1, align 8
  %GCthreshold = getelementptr inbounds %struct.global_State, ptr %4, i32 0, i32 14
  %5 = load i64, ptr %GCthreshold, align 8
  %cmp = icmp uge i64 %2, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load ptr, ptr %L.addr, align 8
  call void @luaC_step(ptr noundef %6)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load ptr, ptr %L.addr, align 8
  %8 = load ptr, ptr %s.addr, align 8
  %9 = load i64, ptr %len.addr, align 8
  %call = call ptr @luaS_newlstr(ptr noundef %7, ptr noundef %8, i64 noundef %9)
  store ptr %call, ptr %i_x, align 8
  %10 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %10, i32 0, i32 4
  %11 = load ptr, ptr %top, align 8
  store ptr %11, ptr %i_o, align 8
  %12 = load ptr, ptr %i_x, align 8
  %13 = load ptr, ptr %i_o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 0
  store ptr %12, ptr %value, align 8
  %14 = load ptr, ptr %i_o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 1
  store i32 4, ptr %tt, align 8
  %15 = load ptr, ptr %L.addr, align 8
  %16 = load ptr, ptr %L.addr, align 8
  %top2 = getelementptr inbounds %struct.lua_State, ptr %16, i32 0, i32 4
  %17 = load ptr, ptr %top2, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %17, i32 1
  store ptr %incdec.ptr, ptr %top2, align 8
  ret void
}

declare ptr @luaS_newlstr(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushstring(ptr noundef %L, ptr noundef %s) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %s.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %s, ptr %s.addr, align 8
  %0 = load ptr, ptr %s.addr, align 8
  %cmp = icmp eq ptr %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %L.addr, align 8
  call void @lua_pushnil(ptr noundef %1)
  br label %if.end

if.else:                                          ; preds = %entry
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %s.addr, align 8
  %4 = load ptr, ptr %s.addr, align 8
  %call = call i64 @strlen(ptr noundef %4)
  call void @lua_pushlstring(ptr noundef %2, ptr noundef %3, i64 noundef %call)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare i64 @strlen(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_pushvfstring(ptr noundef %L, ptr noundef %fmt, ptr noundef %argp) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %fmt.addr = alloca ptr, align 8
  %argp.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %fmt, ptr %fmt.addr, align 8
  store ptr %argp, ptr %argp.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %0, i32 0, i32 6
  %1 = load ptr, ptr %l_G, align 8
  %totalbytes = getelementptr inbounds %struct.global_State, ptr %1, i32 0, i32 15
  %2 = load i64, ptr %totalbytes, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %l_G1 = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 6
  %4 = load ptr, ptr %l_G1, align 8
  %GCthreshold = getelementptr inbounds %struct.global_State, ptr %4, i32 0, i32 14
  %5 = load i64, ptr %GCthreshold, align 8
  %cmp = icmp uge i64 %2, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load ptr, ptr %L.addr, align 8
  call void @luaC_step(ptr noundef %6)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load ptr, ptr %L.addr, align 8
  %8 = load ptr, ptr %fmt.addr, align 8
  %9 = load ptr, ptr %argp.addr, align 8
  %call = call ptr @luaO_pushvfstring(ptr noundef %7, ptr noundef %8, ptr noundef %9)
  store ptr %call, ptr %ret, align 8
  %10 = load ptr, ptr %ret, align 8
  ret ptr %10
}

declare ptr @luaO_pushvfstring(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_pushfstring(ptr noundef %L, ptr noundef %fmt, ...) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %fmt.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  %argp = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %fmt, ptr %fmt.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %0, i32 0, i32 6
  %1 = load ptr, ptr %l_G, align 8
  %totalbytes = getelementptr inbounds %struct.global_State, ptr %1, i32 0, i32 15
  %2 = load i64, ptr %totalbytes, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %l_G1 = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 6
  %4 = load ptr, ptr %l_G1, align 8
  %GCthreshold = getelementptr inbounds %struct.global_State, ptr %4, i32 0, i32 14
  %5 = load i64, ptr %GCthreshold, align 8
  %cmp = icmp uge i64 %2, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load ptr, ptr %L.addr, align 8
  call void @luaC_step(ptr noundef %6)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.va_start(ptr %argp)
  %7 = load ptr, ptr %L.addr, align 8
  %8 = load ptr, ptr %fmt.addr, align 8
  %9 = load ptr, ptr %argp, align 8
  %call = call ptr @luaO_pushvfstring(ptr noundef %7, ptr noundef %8, ptr noundef %9)
  store ptr %call, ptr %ret, align 8
  call void @llvm.va_end(ptr %argp)
  %10 = load ptr, ptr %ret, align 8
  ret ptr %10
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #3

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushcclosure(ptr noundef %L, ptr noundef %fn, i32 noundef %n) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %fn.addr = alloca ptr, align 8
  %n.addr = alloca i32, align 4
  %cl = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %o1 = alloca ptr, align 8
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %fn, ptr %fn.addr, align 8
  store i32 %n, ptr %n.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %0, i32 0, i32 6
  %1 = load ptr, ptr %l_G, align 8
  %totalbytes = getelementptr inbounds %struct.global_State, ptr %1, i32 0, i32 15
  %2 = load i64, ptr %totalbytes, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %l_G1 = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 6
  %4 = load ptr, ptr %l_G1, align 8
  %GCthreshold = getelementptr inbounds %struct.global_State, ptr %4, i32 0, i32 14
  %5 = load i64, ptr %GCthreshold, align 8
  %cmp = icmp uge i64 %2, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load ptr, ptr %L.addr, align 8
  call void @luaC_step(ptr noundef %6)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load ptr, ptr %L.addr, align 8
  %8 = load ptr, ptr %L.addr, align 8
  %9 = load i32, ptr %n.addr, align 4
  %10 = load ptr, ptr %L.addr, align 8
  %call = call ptr @getcurrenv(ptr noundef %10)
  %call2 = call ptr @luaF_newCclosure(ptr noundef %8, i32 noundef %9, ptr noundef %call)
  store ptr %call2, ptr %cl, align 8
  %11 = load ptr, ptr %fn.addr, align 8
  %12 = load ptr, ptr %cl, align 8
  %f = getelementptr inbounds %struct.CClosure, ptr %12, i32 0, i32 8
  store ptr %11, ptr %f, align 8
  %13 = load i32, ptr %n.addr, align 4
  %14 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %14, i32 0, i32 4
  %15 = load ptr, ptr %top, align 8
  %idx.ext = sext i32 %13 to i64
  %idx.neg = sub i64 0, %idx.ext
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %15, i64 %idx.neg
  store ptr %add.ptr, ptr %top, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %16 = load i32, ptr %n.addr, align 4
  %dec = add nsw i32 %16, -1
  store i32 %dec, ptr %n.addr, align 4
  %tobool = icmp ne i32 %16, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %17 = load ptr, ptr %L.addr, align 8
  %top3 = getelementptr inbounds %struct.lua_State, ptr %17, i32 0, i32 4
  %18 = load ptr, ptr %top3, align 8
  %19 = load i32, ptr %n.addr, align 4
  %idx.ext4 = sext i32 %19 to i64
  %add.ptr5 = getelementptr inbounds %struct.lua_TValue, ptr %18, i64 %idx.ext4
  store ptr %add.ptr5, ptr %o2, align 8
  %20 = load ptr, ptr %cl, align 8
  %upvalue = getelementptr inbounds %struct.CClosure, ptr %20, i32 0, i32 9
  %21 = load i32, ptr %n.addr, align 4
  %idxprom = sext i32 %21 to i64
  %arrayidx = getelementptr inbounds [1 x %struct.lua_TValue], ptr %upvalue, i64 0, i64 %idxprom
  store ptr %arrayidx, ptr %o1, align 8
  %22 = load ptr, ptr %o1, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %22, i32 0, i32 0
  %23 = load ptr, ptr %o2, align 8
  %value6 = getelementptr inbounds %struct.lua_TValue, ptr %23, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value, ptr align 8 %value6, i64 8, i1 false)
  %24 = load ptr, ptr %o2, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %24, i32 0, i32 1
  %25 = load i32, ptr %tt, align 8
  %26 = load ptr, ptr %o1, align 8
  %tt7 = getelementptr inbounds %struct.lua_TValue, ptr %26, i32 0, i32 1
  store i32 %25, ptr %tt7, align 8
  br label %while.cond, !llvm.loop !11

while.end:                                        ; preds = %while.cond
  %27 = load ptr, ptr %cl, align 8
  store ptr %27, ptr %i_x, align 8
  %28 = load ptr, ptr %L.addr, align 8
  %top8 = getelementptr inbounds %struct.lua_State, ptr %28, i32 0, i32 4
  %29 = load ptr, ptr %top8, align 8
  store ptr %29, ptr %i_o, align 8
  %30 = load ptr, ptr %i_x, align 8
  %31 = load ptr, ptr %i_o, align 8
  %value9 = getelementptr inbounds %struct.lua_TValue, ptr %31, i32 0, i32 0
  store ptr %30, ptr %value9, align 8
  %32 = load ptr, ptr %i_o, align 8
  %tt10 = getelementptr inbounds %struct.lua_TValue, ptr %32, i32 0, i32 1
  store i32 6, ptr %tt10, align 8
  %33 = load ptr, ptr %L.addr, align 8
  %34 = load ptr, ptr %L.addr, align 8
  %top11 = getelementptr inbounds %struct.lua_State, ptr %34, i32 0, i32 4
  %35 = load ptr, ptr %top11, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %35, i32 1
  store ptr %incdec.ptr, ptr %top11, align 8
  ret void
}

declare ptr @luaF_newCclosure(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @getcurrenv(ptr noundef %L) #0 {
entry:
  %retval = alloca ptr, align 8
  %L.addr = alloca ptr, align 8
  %func = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %ci = getelementptr inbounds %struct.lua_State, ptr %0, i32 0, i32 7
  %1 = load ptr, ptr %ci, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %base_ci = getelementptr inbounds %struct.lua_State, ptr %2, i32 0, i32 12
  %3 = load ptr, ptr %base_ci, align 8
  %cmp = icmp eq ptr %1, %3
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %L.addr, align 8
  %l_gt = getelementptr inbounds %struct.lua_State, ptr %4, i32 0, i32 21
  %value = getelementptr inbounds %struct.lua_TValue, ptr %l_gt, i32 0, i32 0
  %5 = load ptr, ptr %value, align 8
  store ptr %5, ptr %retval, align 8
  br label %return

if.else:                                          ; preds = %entry
  %6 = load ptr, ptr %L.addr, align 8
  %ci1 = getelementptr inbounds %struct.lua_State, ptr %6, i32 0, i32 7
  %7 = load ptr, ptr %ci1, align 8
  %func2 = getelementptr inbounds %struct.CallInfo, ptr %7, i32 0, i32 1
  %8 = load ptr, ptr %func2, align 8
  %value3 = getelementptr inbounds %struct.lua_TValue, ptr %8, i32 0, i32 0
  %9 = load ptr, ptr %value3, align 8
  store ptr %9, ptr %func, align 8
  %10 = load ptr, ptr %func, align 8
  %env = getelementptr inbounds %struct.CClosure, ptr %10, i32 0, i32 6
  %11 = load ptr, ptr %env, align 8
  store ptr %11, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.else, %if.then
  %12 = load ptr, ptr %retval, align 8
  ret ptr %12
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushboolean(ptr noundef %L, i32 noundef %b) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %b.addr = alloca i32, align 4
  %i_x = alloca i32, align 4
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %b, ptr %b.addr, align 4
  %0 = load i32, ptr %b.addr, align 4
  %cmp = icmp ne i32 %0, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, ptr %i_x, align 4
  %1 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %1, i32 0, i32 4
  %2 = load ptr, ptr %top, align 8
  store ptr %2, ptr %i_o, align 8
  %3 = load i32, ptr %i_x, align 4
  %4 = load ptr, ptr %i_o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 0
  store i32 %3, ptr %value, align 8
  %5 = load ptr, ptr %i_o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %5, i32 0, i32 1
  store i32 1, ptr %tt, align 8
  %6 = load ptr, ptr %L.addr, align 8
  %7 = load ptr, ptr %L.addr, align 8
  %top1 = getelementptr inbounds %struct.lua_State, ptr %7, i32 0, i32 4
  %8 = load ptr, ptr %top1, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %8, i32 1
  store ptr %incdec.ptr, ptr %top1, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushlightuserdata(ptr noundef %L, ptr noundef %p) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %p.addr = alloca ptr, align 8
  %ptr = alloca %union.anon.2, align 8
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %p, ptr %p.addr, align 8
  %0 = load ptr, ptr %p.addr, align 8
  store ptr %0, ptr %ptr, align 8
  %1 = load ptr, ptr %ptr, align 8
  store ptr %1, ptr %i_x, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %2, i32 0, i32 4
  %3 = load ptr, ptr %top, align 8
  store ptr %3, ptr %i_o, align 8
  %4 = load ptr, ptr %i_x, align 8
  %5 = load ptr, ptr %i_o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %5, i32 0, i32 0
  store ptr %4, ptr %value, align 8
  %6 = load ptr, ptr %i_o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %6, i32 0, i32 1
  store i32 2, ptr %tt, align 8
  %7 = load ptr, ptr %L.addr, align 8
  %8 = load ptr, ptr %L.addr, align 8
  %top1 = getelementptr inbounds %struct.lua_State, ptr %8, i32 0, i32 4
  %9 = load ptr, ptr %top1, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 1
  store ptr %incdec.ptr, ptr %top1, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_pushthread(ptr noundef %L) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  store ptr %0, ptr %i_x, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %1, i32 0, i32 4
  %2 = load ptr, ptr %top, align 8
  store ptr %2, ptr %i_o, align 8
  %3 = load ptr, ptr %i_x, align 8
  %4 = load ptr, ptr %i_o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 0
  store ptr %3, ptr %value, align 8
  %5 = load ptr, ptr %i_o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %5, i32 0, i32 1
  store i32 8, ptr %tt, align 8
  %6 = load ptr, ptr %L.addr, align 8
  %7 = load ptr, ptr %L.addr, align 8
  %top1 = getelementptr inbounds %struct.lua_State, ptr %7, i32 0, i32 4
  %8 = load ptr, ptr %top1, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %8, i32 1
  store ptr %incdec.ptr, ptr %top1, align 8
  %9 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %9, i32 0, i32 6
  %10 = load ptr, ptr %l_G, align 8
  %mainthread = getelementptr inbounds %struct.global_State, ptr %10, i32 0, i32 23
  %11 = load ptr, ptr %mainthread, align 8
  %12 = load ptr, ptr %L.addr, align 8
  %cmp = icmp eq ptr %11, %12
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_gettable(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %t = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %t, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load ptr, ptr %t, align 8
  %5 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %5, i32 0, i32 4
  %6 = load ptr, ptr %top, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %6, i64 -1
  %7 = load ptr, ptr %L.addr, align 8
  %top1 = getelementptr inbounds %struct.lua_State, ptr %7, i32 0, i32 4
  %8 = load ptr, ptr %top1, align 8
  %add.ptr2 = getelementptr inbounds %struct.lua_TValue, ptr %8, i64 -1
  call void @luaV_gettable(ptr noundef %3, ptr noundef %4, ptr noundef %add.ptr, ptr noundef %add.ptr2)
  ret void
}

declare void @luaV_gettable(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_getfield(ptr noundef %L, i32 noundef %idx, ptr noundef %k) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %k.addr = alloca ptr, align 8
  %t = alloca ptr, align 8
  %key = alloca %struct.lua_TValue, align 8
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  store ptr %k, ptr %k.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %t, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %marked = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 2
  %4 = load i8, ptr %marked, align 1
  %conv = zext i8 %4 to i32
  %or = or i32 %conv, 8
  %conv1 = trunc i32 %or to i8
  store i8 %conv1, ptr %marked, align 1
  %5 = load ptr, ptr %L.addr, align 8
  %6 = load ptr, ptr %k.addr, align 8
  %7 = load ptr, ptr %k.addr, align 8
  %call2 = call i64 @strlen(ptr noundef %7)
  %call3 = call ptr @luaS_newlstr(ptr noundef %5, ptr noundef %6, i64 noundef %call2)
  store ptr %call3, ptr %i_x, align 8
  store ptr %key, ptr %i_o, align 8
  %8 = load ptr, ptr %i_x, align 8
  %9 = load ptr, ptr %i_o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 0, i32 0
  store ptr %8, ptr %value, align 8
  %10 = load ptr, ptr %i_o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 0, i32 1
  store i32 4, ptr %tt, align 8
  %11 = load ptr, ptr %L.addr, align 8
  %marked4 = getelementptr inbounds %struct.lua_State, ptr %11, i32 0, i32 2
  %12 = load i8, ptr %marked4, align 1
  %conv5 = zext i8 %12 to i32
  %and = and i32 %conv5, 247
  %conv6 = trunc i32 %and to i8
  store i8 %conv6, ptr %marked4, align 1
  %13 = load ptr, ptr %L.addr, align 8
  %14 = load ptr, ptr %t, align 8
  %15 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %15, i32 0, i32 4
  %16 = load ptr, ptr %top, align 8
  call void @luaV_gettable(ptr noundef %13, ptr noundef %14, ptr noundef %key, ptr noundef %16)
  %17 = load ptr, ptr %L.addr, align 8
  %18 = load ptr, ptr %L.addr, align 8
  %top7 = getelementptr inbounds %struct.lua_State, ptr %18, i32 0, i32 4
  %19 = load ptr, ptr %top7, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %19, i32 1
  store ptr %incdec.ptr, ptr %top7, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_rawget(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %t = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %o1 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %t, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %t, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %3, i32 0, i32 0
  %4 = load ptr, ptr %value, align 8
  %5 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %5, i32 0, i32 4
  %6 = load ptr, ptr %top, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %6, i64 -1
  %call1 = call ptr @luaH_get(ptr noundef %4, ptr noundef %add.ptr)
  store ptr %call1, ptr %o2, align 8
  %7 = load ptr, ptr %L.addr, align 8
  %top2 = getelementptr inbounds %struct.lua_State, ptr %7, i32 0, i32 4
  %8 = load ptr, ptr %top2, align 8
  %add.ptr3 = getelementptr inbounds %struct.lua_TValue, ptr %8, i64 -1
  store ptr %add.ptr3, ptr %o1, align 8
  %9 = load ptr, ptr %o1, align 8
  %value4 = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 0, i32 0
  %10 = load ptr, ptr %o2, align 8
  %value5 = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value4, ptr align 8 %value5, i64 8, i1 false)
  %11 = load ptr, ptr %o2, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %11, i32 0, i32 1
  %12 = load i32, ptr %tt, align 8
  %13 = load ptr, ptr %o1, align 8
  %tt6 = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 1
  store i32 %12, ptr %tt6, align 8
  ret void
}

declare ptr @luaH_get(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_rawgeti(ptr noundef %L, i32 noundef %idx, i32 noundef %n) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %o1 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  store i32 %n, ptr %n.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %3, i32 0, i32 0
  %4 = load ptr, ptr %value, align 8
  %5 = load i32, ptr %n.addr, align 4
  %call1 = call ptr @luaH_getnum(ptr noundef %4, i32 noundef %5)
  store ptr %call1, ptr %o2, align 8
  %6 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %6, i32 0, i32 4
  %7 = load ptr, ptr %top, align 8
  store ptr %7, ptr %o1, align 8
  %8 = load ptr, ptr %o1, align 8
  %value2 = getelementptr inbounds %struct.lua_TValue, ptr %8, i32 0, i32 0
  %9 = load ptr, ptr %o2, align 8
  %value3 = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value2, ptr align 8 %value3, i64 8, i1 false)
  %10 = load ptr, ptr %o2, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 0, i32 1
  %11 = load i32, ptr %tt, align 8
  %12 = load ptr, ptr %o1, align 8
  %tt4 = getelementptr inbounds %struct.lua_TValue, ptr %12, i32 0, i32 1
  store i32 %11, ptr %tt4, align 8
  %13 = load ptr, ptr %L.addr, align 8
  %14 = load ptr, ptr %L.addr, align 8
  %top5 = getelementptr inbounds %struct.lua_State, ptr %14, i32 0, i32 4
  %15 = load ptr, ptr %top5, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %15, i32 1
  store ptr %incdec.ptr, ptr %top5, align 8
  ret void
}

declare ptr @luaH_getnum(ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_createtable(ptr noundef %L, i32 noundef %narray, i32 noundef %nrec) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %narray.addr = alloca i32, align 4
  %nrec.addr = alloca i32, align 4
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %narray, ptr %narray.addr, align 4
  store i32 %nrec, ptr %nrec.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %0, i32 0, i32 6
  %1 = load ptr, ptr %l_G, align 8
  %totalbytes = getelementptr inbounds %struct.global_State, ptr %1, i32 0, i32 15
  %2 = load i64, ptr %totalbytes, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %l_G1 = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 6
  %4 = load ptr, ptr %l_G1, align 8
  %GCthreshold = getelementptr inbounds %struct.global_State, ptr %4, i32 0, i32 14
  %5 = load i64, ptr %GCthreshold, align 8
  %cmp = icmp uge i64 %2, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load ptr, ptr %L.addr, align 8
  call void @luaC_step(ptr noundef %6)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load ptr, ptr %L.addr, align 8
  %8 = load i32, ptr %narray.addr, align 4
  %9 = load i32, ptr %nrec.addr, align 4
  %call = call ptr @luaH_new(ptr noundef %7, i32 noundef %8, i32 noundef %9)
  store ptr %call, ptr %i_x, align 8
  %10 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %10, i32 0, i32 4
  %11 = load ptr, ptr %top, align 8
  store ptr %11, ptr %i_o, align 8
  %12 = load ptr, ptr %i_x, align 8
  %13 = load ptr, ptr %i_o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 0
  store ptr %12, ptr %value, align 8
  %14 = load ptr, ptr %i_o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 1
  store i32 5, ptr %tt, align 8
  %15 = load ptr, ptr %L.addr, align 8
  %16 = load ptr, ptr %L.addr, align 8
  %top2 = getelementptr inbounds %struct.lua_State, ptr %16, i32 0, i32 4
  %17 = load ptr, ptr %top2, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %17, i32 1
  store ptr %incdec.ptr, ptr %top2, align 8
  ret void
}

declare ptr @luaH_new(ptr noundef, i32 noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_getmetatable(ptr noundef %L, i32 noundef %objindex) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %objindex.addr = alloca i32, align 4
  %obj = alloca ptr, align 8
  %mt = alloca ptr, align 8
  %res = alloca i32, align 4
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %objindex, ptr %objindex.addr, align 4
  store ptr null, ptr %mt, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %objindex.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %obj, align 8
  %2 = load ptr, ptr %obj, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %2, i32 0, i32 1
  %3 = load i32, ptr %tt, align 8
  switch i32 %3, label %sw.default [
    i32 5, label %sw.bb
    i32 7, label %sw.bb1
  ]

sw.bb:                                            ; preds = %entry
  %4 = load ptr, ptr %obj, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 0
  %5 = load ptr, ptr %value, align 8
  %metatable = getelementptr inbounds %struct.Table, ptr %5, i32 0, i32 5
  %6 = load ptr, ptr %metatable, align 8
  store ptr %6, ptr %mt, align 8
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %7 = load ptr, ptr %obj, align 8
  %value2 = getelementptr inbounds %struct.lua_TValue, ptr %7, i32 0, i32 0
  %8 = load ptr, ptr %value2, align 8
  %metatable3 = getelementptr inbounds %struct.anon.1, ptr %8, i32 0, i32 3
  %9 = load ptr, ptr %metatable3, align 8
  store ptr %9, ptr %mt, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %10 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %10, i32 0, i32 6
  %11 = load ptr, ptr %l_G, align 8
  %mt4 = getelementptr inbounds %struct.global_State, ptr %11, i32 0, i32 25
  %12 = load ptr, ptr %obj, align 8
  %tt5 = getelementptr inbounds %struct.lua_TValue, ptr %12, i32 0, i32 1
  %13 = load i32, ptr %tt5, align 8
  %idxprom = sext i32 %13 to i64
  %arrayidx = getelementptr inbounds [9 x ptr], ptr %mt4, i64 0, i64 %idxprom
  %14 = load ptr, ptr %arrayidx, align 8
  store ptr %14, ptr %mt, align 8
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb1, %sw.bb
  %15 = load ptr, ptr %mt, align 8
  %cmp = icmp eq ptr %15, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %sw.epilog
  store i32 0, ptr %res, align 4
  br label %if.end

if.else:                                          ; preds = %sw.epilog
  %16 = load ptr, ptr %mt, align 8
  store ptr %16, ptr %i_x, align 8
  %17 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %17, i32 0, i32 4
  %18 = load ptr, ptr %top, align 8
  store ptr %18, ptr %i_o, align 8
  %19 = load ptr, ptr %i_x, align 8
  %20 = load ptr, ptr %i_o, align 8
  %value6 = getelementptr inbounds %struct.lua_TValue, ptr %20, i32 0, i32 0
  store ptr %19, ptr %value6, align 8
  %21 = load ptr, ptr %i_o, align 8
  %tt7 = getelementptr inbounds %struct.lua_TValue, ptr %21, i32 0, i32 1
  store i32 5, ptr %tt7, align 8
  %22 = load ptr, ptr %L.addr, align 8
  %23 = load ptr, ptr %L.addr, align 8
  %top8 = getelementptr inbounds %struct.lua_State, ptr %23, i32 0, i32 4
  %24 = load ptr, ptr %top8, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %24, i32 1
  store ptr %incdec.ptr, ptr %top8, align 8
  store i32 1, ptr %res, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %25 = load i32, ptr %res, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_getfenv(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  %i_x4 = alloca ptr, align 8
  %i_o7 = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %o1 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %3, i32 0, i32 1
  %4 = load i32, ptr %tt, align 8
  switch i32 %4, label %sw.default [
    i32 6, label %sw.bb
    i32 7, label %sw.bb3
    i32 8, label %sw.bb11
  ]

sw.bb:                                            ; preds = %entry
  %5 = load ptr, ptr %o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %5, i32 0, i32 0
  %6 = load ptr, ptr %value, align 8
  %env = getelementptr inbounds %struct.CClosure, ptr %6, i32 0, i32 6
  %7 = load ptr, ptr %env, align 8
  store ptr %7, ptr %i_x, align 8
  %8 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %8, i32 0, i32 4
  %9 = load ptr, ptr %top, align 8
  store ptr %9, ptr %i_o, align 8
  %10 = load ptr, ptr %i_x, align 8
  %11 = load ptr, ptr %i_o, align 8
  %value1 = getelementptr inbounds %struct.lua_TValue, ptr %11, i32 0, i32 0
  store ptr %10, ptr %value1, align 8
  %12 = load ptr, ptr %i_o, align 8
  %tt2 = getelementptr inbounds %struct.lua_TValue, ptr %12, i32 0, i32 1
  store i32 5, ptr %tt2, align 8
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %13 = load ptr, ptr %o, align 8
  %value5 = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 0
  %14 = load ptr, ptr %value5, align 8
  %env6 = getelementptr inbounds %struct.anon.1, ptr %14, i32 0, i32 4
  %15 = load ptr, ptr %env6, align 8
  store ptr %15, ptr %i_x4, align 8
  %16 = load ptr, ptr %L.addr, align 8
  %top8 = getelementptr inbounds %struct.lua_State, ptr %16, i32 0, i32 4
  %17 = load ptr, ptr %top8, align 8
  store ptr %17, ptr %i_o7, align 8
  %18 = load ptr, ptr %i_x4, align 8
  %19 = load ptr, ptr %i_o7, align 8
  %value9 = getelementptr inbounds %struct.lua_TValue, ptr %19, i32 0, i32 0
  store ptr %18, ptr %value9, align 8
  %20 = load ptr, ptr %i_o7, align 8
  %tt10 = getelementptr inbounds %struct.lua_TValue, ptr %20, i32 0, i32 1
  store i32 5, ptr %tt10, align 8
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry
  %21 = load ptr, ptr %o, align 8
  %value12 = getelementptr inbounds %struct.lua_TValue, ptr %21, i32 0, i32 0
  %22 = load ptr, ptr %value12, align 8
  %l_gt = getelementptr inbounds %struct.lua_State, ptr %22, i32 0, i32 21
  store ptr %l_gt, ptr %o2, align 8
  %23 = load ptr, ptr %L.addr, align 8
  %top13 = getelementptr inbounds %struct.lua_State, ptr %23, i32 0, i32 4
  %24 = load ptr, ptr %top13, align 8
  store ptr %24, ptr %o1, align 8
  %25 = load ptr, ptr %o1, align 8
  %value14 = getelementptr inbounds %struct.lua_TValue, ptr %25, i32 0, i32 0
  %26 = load ptr, ptr %o2, align 8
  %value15 = getelementptr inbounds %struct.lua_TValue, ptr %26, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value14, ptr align 8 %value15, i64 8, i1 false)
  %27 = load ptr, ptr %o2, align 8
  %tt16 = getelementptr inbounds %struct.lua_TValue, ptr %27, i32 0, i32 1
  %28 = load i32, ptr %tt16, align 8
  %29 = load ptr, ptr %o1, align 8
  %tt17 = getelementptr inbounds %struct.lua_TValue, ptr %29, i32 0, i32 1
  store i32 %28, ptr %tt17, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %30 = load ptr, ptr %L.addr, align 8
  %top18 = getelementptr inbounds %struct.lua_State, ptr %30, i32 0, i32 4
  %31 = load ptr, ptr %top18, align 8
  %tt19 = getelementptr inbounds %struct.lua_TValue, ptr %31, i32 0, i32 1
  store i32 0, ptr %tt19, align 8
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb11, %sw.bb3, %sw.bb
  %32 = load ptr, ptr %L.addr, align 8
  %33 = load ptr, ptr %L.addr, align 8
  %top20 = getelementptr inbounds %struct.lua_State, ptr %33, i32 0, i32 4
  %34 = load ptr, ptr %top20, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %34, i32 1
  store ptr %incdec.ptr, ptr %top20, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_settable(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %t = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %1, i32 noundef %2)
  store ptr %call, ptr %t, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load ptr, ptr %L.addr, align 8
  %5 = load ptr, ptr %t, align 8
  %6 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %6, i32 0, i32 4
  %7 = load ptr, ptr %top, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %7, i64 -2
  %8 = load ptr, ptr %L.addr, align 8
  %top1 = getelementptr inbounds %struct.lua_State, ptr %8, i32 0, i32 4
  %9 = load ptr, ptr %top1, align 8
  %add.ptr2 = getelementptr inbounds %struct.lua_TValue, ptr %9, i64 -1
  call void @luaV_settable(ptr noundef %4, ptr noundef %5, ptr noundef %add.ptr, ptr noundef %add.ptr2)
  %10 = load ptr, ptr %L.addr, align 8
  %top3 = getelementptr inbounds %struct.lua_State, ptr %10, i32 0, i32 4
  %11 = load ptr, ptr %top3, align 8
  %add.ptr4 = getelementptr inbounds %struct.lua_TValue, ptr %11, i64 -2
  store ptr %add.ptr4, ptr %top3, align 8
  ret void
}

declare void @luaV_settable(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_setfield(ptr noundef %L, i32 noundef %idx, ptr noundef %k) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %k.addr = alloca ptr, align 8
  %t = alloca ptr, align 8
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  store ptr %k, ptr %k.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %1, i32 noundef %2)
  store ptr %call, ptr %t, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load ptr, ptr %L.addr, align 8
  %5 = load ptr, ptr %k.addr, align 8
  %6 = load ptr, ptr %k.addr, align 8
  %call1 = call i64 @strlen(ptr noundef %6)
  %call2 = call ptr @luaS_newlstr(ptr noundef %4, ptr noundef %5, i64 noundef %call1)
  store ptr %call2, ptr %i_x, align 8
  %7 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %7, i32 0, i32 4
  %8 = load ptr, ptr %top, align 8
  store ptr %8, ptr %i_o, align 8
  %9 = load ptr, ptr %i_x, align 8
  %10 = load ptr, ptr %i_o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 0, i32 0
  store ptr %9, ptr %value, align 8
  %11 = load ptr, ptr %i_o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %11, i32 0, i32 1
  store i32 4, ptr %tt, align 8
  %12 = load ptr, ptr %L.addr, align 8
  %13 = load ptr, ptr %L.addr, align 8
  %top3 = getelementptr inbounds %struct.lua_State, ptr %13, i32 0, i32 4
  %14 = load ptr, ptr %top3, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 1
  store ptr %incdec.ptr, ptr %top3, align 8
  %15 = load ptr, ptr %L.addr, align 8
  %16 = load ptr, ptr %t, align 8
  %17 = load ptr, ptr %L.addr, align 8
  %top4 = getelementptr inbounds %struct.lua_State, ptr %17, i32 0, i32 4
  %18 = load ptr, ptr %top4, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %18, i64 -1
  %19 = load ptr, ptr %L.addr, align 8
  %top5 = getelementptr inbounds %struct.lua_State, ptr %19, i32 0, i32 4
  %20 = load ptr, ptr %top5, align 8
  %add.ptr6 = getelementptr inbounds %struct.lua_TValue, ptr %20, i64 -2
  call void @luaV_settable(ptr noundef %15, ptr noundef %16, ptr noundef %add.ptr, ptr noundef %add.ptr6)
  %21 = load ptr, ptr %L.addr, align 8
  %top7 = getelementptr inbounds %struct.lua_State, ptr %21, i32 0, i32 4
  %22 = load ptr, ptr %top7, align 8
  %add.ptr8 = getelementptr inbounds %struct.lua_TValue, ptr %22, i64 -2
  store ptr %add.ptr8, ptr %top7, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_rawset(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %t = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %o1 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %1, i32 noundef %2)
  store ptr %call, ptr %t, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load ptr, ptr %L.addr, align 8
  %marked = getelementptr inbounds %struct.lua_State, ptr %4, i32 0, i32 2
  %5 = load i8, ptr %marked, align 1
  %conv = zext i8 %5 to i32
  %or = or i32 %conv, 8
  %conv1 = trunc i32 %or to i8
  store i8 %conv1, ptr %marked, align 1
  %6 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %6, i32 0, i32 4
  %7 = load ptr, ptr %top, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %7, i64 -1
  store ptr %add.ptr, ptr %o2, align 8
  %8 = load ptr, ptr %L.addr, align 8
  %9 = load ptr, ptr %t, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 0, i32 0
  %10 = load ptr, ptr %value, align 8
  %11 = load ptr, ptr %L.addr, align 8
  %top2 = getelementptr inbounds %struct.lua_State, ptr %11, i32 0, i32 4
  %12 = load ptr, ptr %top2, align 8
  %add.ptr3 = getelementptr inbounds %struct.lua_TValue, ptr %12, i64 -2
  %call4 = call ptr @luaH_set(ptr noundef %8, ptr noundef %10, ptr noundef %add.ptr3)
  store ptr %call4, ptr %o1, align 8
  %13 = load ptr, ptr %o1, align 8
  %value5 = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 0
  %14 = load ptr, ptr %o2, align 8
  %value6 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value5, ptr align 8 %value6, i64 8, i1 false)
  %15 = load ptr, ptr %o2, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %15, i32 0, i32 1
  %16 = load i32, ptr %tt, align 8
  %17 = load ptr, ptr %o1, align 8
  %tt7 = getelementptr inbounds %struct.lua_TValue, ptr %17, i32 0, i32 1
  store i32 %16, ptr %tt7, align 8
  %18 = load ptr, ptr %L.addr, align 8
  %marked8 = getelementptr inbounds %struct.lua_State, ptr %18, i32 0, i32 2
  %19 = load i8, ptr %marked8, align 1
  %conv9 = zext i8 %19 to i32
  %and = and i32 %conv9, 247
  %conv10 = trunc i32 %and to i8
  store i8 %conv10, ptr %marked8, align 1
  %20 = load ptr, ptr %L.addr, align 8
  %top11 = getelementptr inbounds %struct.lua_State, ptr %20, i32 0, i32 4
  %21 = load ptr, ptr %top11, align 8
  %add.ptr12 = getelementptr inbounds %struct.lua_TValue, ptr %21, i64 -1
  %tt13 = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr12, i32 0, i32 1
  %22 = load i32, ptr %tt13, align 8
  %cmp = icmp sge i32 %22, 4
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %23 = load ptr, ptr %L.addr, align 8
  %top15 = getelementptr inbounds %struct.lua_State, ptr %23, i32 0, i32 4
  %24 = load ptr, ptr %top15, align 8
  %add.ptr16 = getelementptr inbounds %struct.lua_TValue, ptr %24, i64 -1
  %value17 = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr16, i32 0, i32 0
  %25 = load ptr, ptr %value17, align 8
  %marked18 = getelementptr inbounds %struct.GCheader, ptr %25, i32 0, i32 2
  %26 = load i8, ptr %marked18, align 1
  %conv19 = zext i8 %26 to i32
  %and20 = and i32 %conv19, 3
  %tobool = icmp ne i32 %and20, 0
  br i1 %tobool, label %land.lhs.true21, label %if.end

land.lhs.true21:                                  ; preds = %land.lhs.true
  %27 = load ptr, ptr %t, align 8
  %value22 = getelementptr inbounds %struct.lua_TValue, ptr %27, i32 0, i32 0
  %28 = load ptr, ptr %value22, align 8
  %marked23 = getelementptr inbounds %struct.GCheader, ptr %28, i32 0, i32 2
  %29 = load i8, ptr %marked23, align 1
  %conv24 = zext i8 %29 to i32
  %and25 = and i32 %conv24, 4
  %tobool26 = icmp ne i32 %and25, 0
  br i1 %tobool26, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true21
  %30 = load ptr, ptr %L.addr, align 8
  %31 = load ptr, ptr %t, align 8
  %value27 = getelementptr inbounds %struct.lua_TValue, ptr %31, i32 0, i32 0
  %32 = load ptr, ptr %value27, align 8
  call void @luaC_barrierback(ptr noundef %30, ptr noundef %32)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true21, %land.lhs.true, %entry
  %33 = load ptr, ptr %L.addr, align 8
  %top28 = getelementptr inbounds %struct.lua_State, ptr %33, i32 0, i32 4
  %34 = load ptr, ptr %top28, align 8
  %add.ptr29 = getelementptr inbounds %struct.lua_TValue, ptr %34, i64 -2
  store ptr %add.ptr29, ptr %top28, align 8
  ret void
}

declare ptr @luaH_set(ptr noundef, ptr noundef, ptr noundef) #2

declare void @luaC_barrierback(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_rawseti(ptr noundef %L, i32 noundef %idx, i32 noundef %n) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %o1 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  store i32 %n, ptr %n.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %1, i32 noundef %2)
  store ptr %call, ptr %o, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load ptr, ptr %L.addr, align 8
  %marked = getelementptr inbounds %struct.lua_State, ptr %4, i32 0, i32 2
  %5 = load i8, ptr %marked, align 1
  %conv = zext i8 %5 to i32
  %or = or i32 %conv, 8
  %conv1 = trunc i32 %or to i8
  store i8 %conv1, ptr %marked, align 1
  %6 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %6, i32 0, i32 4
  %7 = load ptr, ptr %top, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %7, i64 -1
  store ptr %add.ptr, ptr %o2, align 8
  %8 = load ptr, ptr %L.addr, align 8
  %9 = load ptr, ptr %o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 0, i32 0
  %10 = load ptr, ptr %value, align 8
  %11 = load i32, ptr %n.addr, align 4
  %call2 = call ptr @luaH_setnum(ptr noundef %8, ptr noundef %10, i32 noundef %11)
  store ptr %call2, ptr %o1, align 8
  %12 = load ptr, ptr %o1, align 8
  %value3 = getelementptr inbounds %struct.lua_TValue, ptr %12, i32 0, i32 0
  %13 = load ptr, ptr %o2, align 8
  %value4 = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value3, ptr align 8 %value4, i64 8, i1 false)
  %14 = load ptr, ptr %o2, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 1
  %15 = load i32, ptr %tt, align 8
  %16 = load ptr, ptr %o1, align 8
  %tt5 = getelementptr inbounds %struct.lua_TValue, ptr %16, i32 0, i32 1
  store i32 %15, ptr %tt5, align 8
  %17 = load ptr, ptr %L.addr, align 8
  %marked6 = getelementptr inbounds %struct.lua_State, ptr %17, i32 0, i32 2
  %18 = load i8, ptr %marked6, align 1
  %conv7 = zext i8 %18 to i32
  %and = and i32 %conv7, 247
  %conv8 = trunc i32 %and to i8
  store i8 %conv8, ptr %marked6, align 1
  %19 = load ptr, ptr %L.addr, align 8
  %top9 = getelementptr inbounds %struct.lua_State, ptr %19, i32 0, i32 4
  %20 = load ptr, ptr %top9, align 8
  %add.ptr10 = getelementptr inbounds %struct.lua_TValue, ptr %20, i64 -1
  %tt11 = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr10, i32 0, i32 1
  %21 = load i32, ptr %tt11, align 8
  %cmp = icmp sge i32 %21, 4
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %22 = load ptr, ptr %L.addr, align 8
  %top13 = getelementptr inbounds %struct.lua_State, ptr %22, i32 0, i32 4
  %23 = load ptr, ptr %top13, align 8
  %add.ptr14 = getelementptr inbounds %struct.lua_TValue, ptr %23, i64 -1
  %value15 = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr14, i32 0, i32 0
  %24 = load ptr, ptr %value15, align 8
  %marked16 = getelementptr inbounds %struct.GCheader, ptr %24, i32 0, i32 2
  %25 = load i8, ptr %marked16, align 1
  %conv17 = zext i8 %25 to i32
  %and18 = and i32 %conv17, 3
  %tobool = icmp ne i32 %and18, 0
  br i1 %tobool, label %land.lhs.true19, label %if.end

land.lhs.true19:                                  ; preds = %land.lhs.true
  %26 = load ptr, ptr %o, align 8
  %value20 = getelementptr inbounds %struct.lua_TValue, ptr %26, i32 0, i32 0
  %27 = load ptr, ptr %value20, align 8
  %marked21 = getelementptr inbounds %struct.GCheader, ptr %27, i32 0, i32 2
  %28 = load i8, ptr %marked21, align 1
  %conv22 = zext i8 %28 to i32
  %and23 = and i32 %conv22, 4
  %tobool24 = icmp ne i32 %and23, 0
  br i1 %tobool24, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true19
  %29 = load ptr, ptr %L.addr, align 8
  %30 = load ptr, ptr %o, align 8
  %value25 = getelementptr inbounds %struct.lua_TValue, ptr %30, i32 0, i32 0
  %31 = load ptr, ptr %value25, align 8
  call void @luaC_barrierback(ptr noundef %29, ptr noundef %31)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true19, %land.lhs.true, %entry
  %32 = load ptr, ptr %L.addr, align 8
  %top26 = getelementptr inbounds %struct.lua_State, ptr %32, i32 0, i32 4
  %33 = load ptr, ptr %top26, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %33, i32 -1
  store ptr %incdec.ptr, ptr %top26, align 8
  ret void
}

declare ptr @luaH_setnum(ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_setmetatable(ptr noundef %L, i32 noundef %objindex) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %objindex.addr = alloca i32, align 4
  %obj = alloca ptr, align 8
  %mt = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %objindex, ptr %objindex.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load i32, ptr %objindex.addr, align 4
  %call = call ptr @index2adr(ptr noundef %1, i32 noundef %2)
  store ptr %call, ptr %obj, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %4, i32 0, i32 4
  %5 = load ptr, ptr %top, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %5, i64 -1
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr, i32 0, i32 1
  %6 = load i32, ptr %tt, align 8
  %cmp = icmp eq i32 %6, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store ptr null, ptr %mt, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %7 = load ptr, ptr %L.addr, align 8
  %8 = load ptr, ptr %L.addr, align 8
  %top1 = getelementptr inbounds %struct.lua_State, ptr %8, i32 0, i32 4
  %9 = load ptr, ptr %top1, align 8
  %add.ptr2 = getelementptr inbounds %struct.lua_TValue, ptr %9, i64 -1
  %value = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr2, i32 0, i32 0
  %10 = load ptr, ptr %value, align 8
  store ptr %10, ptr %mt, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %11 = load ptr, ptr %obj, align 8
  %tt3 = getelementptr inbounds %struct.lua_TValue, ptr %11, i32 0, i32 1
  %12 = load i32, ptr %tt3, align 8
  switch i32 %12, label %sw.default [
    i32 5, label %sw.bb
    i32 7, label %sw.bb16
  ]

sw.bb:                                            ; preds = %if.end
  %13 = load ptr, ptr %mt, align 8
  %14 = load ptr, ptr %obj, align 8
  %value4 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 0
  %15 = load ptr, ptr %value4, align 8
  %metatable = getelementptr inbounds %struct.Table, ptr %15, i32 0, i32 5
  store ptr %13, ptr %metatable, align 8
  %16 = load ptr, ptr %mt, align 8
  %tobool = icmp ne ptr %16, null
  br i1 %tobool, label %if.then5, label %if.end15

if.then5:                                         ; preds = %sw.bb
  %17 = load ptr, ptr %mt, align 8
  %marked = getelementptr inbounds %struct.GCheader, ptr %17, i32 0, i32 2
  %18 = load i8, ptr %marked, align 1
  %conv = zext i8 %18 to i32
  %and = and i32 %conv, 3
  %tobool6 = icmp ne i32 %and, 0
  br i1 %tobool6, label %land.lhs.true, label %if.end14

land.lhs.true:                                    ; preds = %if.then5
  %19 = load ptr, ptr %obj, align 8
  %value7 = getelementptr inbounds %struct.lua_TValue, ptr %19, i32 0, i32 0
  %20 = load ptr, ptr %value7, align 8
  %marked8 = getelementptr inbounds %struct.GCheader, ptr %20, i32 0, i32 2
  %21 = load i8, ptr %marked8, align 1
  %conv9 = zext i8 %21 to i32
  %and10 = and i32 %conv9, 4
  %tobool11 = icmp ne i32 %and10, 0
  br i1 %tobool11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %land.lhs.true
  %22 = load ptr, ptr %L.addr, align 8
  %23 = load ptr, ptr %obj, align 8
  %value13 = getelementptr inbounds %struct.lua_TValue, ptr %23, i32 0, i32 0
  %24 = load ptr, ptr %value13, align 8
  call void @luaC_barrierback(ptr noundef %22, ptr noundef %24)
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %land.lhs.true, %if.then5
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %sw.bb
  br label %sw.epilog

sw.bb16:                                          ; preds = %if.end
  %25 = load ptr, ptr %mt, align 8
  %26 = load ptr, ptr %obj, align 8
  %value17 = getelementptr inbounds %struct.lua_TValue, ptr %26, i32 0, i32 0
  %27 = load ptr, ptr %value17, align 8
  %metatable18 = getelementptr inbounds %struct.anon.1, ptr %27, i32 0, i32 3
  store ptr %25, ptr %metatable18, align 8
  %28 = load ptr, ptr %mt, align 8
  %tobool19 = icmp ne ptr %28, null
  br i1 %tobool19, label %if.then20, label %if.end34

if.then20:                                        ; preds = %sw.bb16
  %29 = load ptr, ptr %mt, align 8
  %marked21 = getelementptr inbounds %struct.GCheader, ptr %29, i32 0, i32 2
  %30 = load i8, ptr %marked21, align 1
  %conv22 = zext i8 %30 to i32
  %and23 = and i32 %conv22, 3
  %tobool24 = icmp ne i32 %and23, 0
  br i1 %tobool24, label %land.lhs.true25, label %if.end33

land.lhs.true25:                                  ; preds = %if.then20
  %31 = load ptr, ptr %obj, align 8
  %value26 = getelementptr inbounds %struct.lua_TValue, ptr %31, i32 0, i32 0
  %32 = load ptr, ptr %value26, align 8
  %marked27 = getelementptr inbounds %struct.GCheader, ptr %32, i32 0, i32 2
  %33 = load i8, ptr %marked27, align 1
  %conv28 = zext i8 %33 to i32
  %and29 = and i32 %conv28, 4
  %tobool30 = icmp ne i32 %and29, 0
  br i1 %tobool30, label %if.then31, label %if.end33

if.then31:                                        ; preds = %land.lhs.true25
  %34 = load ptr, ptr %L.addr, align 8
  %35 = load ptr, ptr %obj, align 8
  %value32 = getelementptr inbounds %struct.lua_TValue, ptr %35, i32 0, i32 0
  %36 = load ptr, ptr %value32, align 8
  %37 = load ptr, ptr %mt, align 8
  call void @luaC_barrierf(ptr noundef %34, ptr noundef %36, ptr noundef %37)
  br label %if.end33

if.end33:                                         ; preds = %if.then31, %land.lhs.true25, %if.then20
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %sw.bb16
  br label %sw.epilog

sw.default:                                       ; preds = %if.end
  %38 = load ptr, ptr %mt, align 8
  %39 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %39, i32 0, i32 6
  %40 = load ptr, ptr %l_G, align 8
  %mt35 = getelementptr inbounds %struct.global_State, ptr %40, i32 0, i32 25
  %41 = load ptr, ptr %obj, align 8
  %tt36 = getelementptr inbounds %struct.lua_TValue, ptr %41, i32 0, i32 1
  %42 = load i32, ptr %tt36, align 8
  %idxprom = sext i32 %42 to i64
  %arrayidx = getelementptr inbounds [9 x ptr], ptr %mt35, i64 0, i64 %idxprom
  store ptr %38, ptr %arrayidx, align 8
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %if.end34, %if.end15
  %43 = load ptr, ptr %L.addr, align 8
  %top37 = getelementptr inbounds %struct.lua_State, ptr %43, i32 0, i32 4
  %44 = load ptr, ptr %top37, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %44, i32 -1
  store ptr %incdec.ptr, ptr %top37, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_setfenv(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %o = alloca ptr, align 8
  %res = alloca i32, align 4
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  store i32 1, ptr %res, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %1, i32 noundef %2)
  store ptr %call, ptr %o, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load ptr, ptr %L.addr, align 8
  %5 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %5, i32 0, i32 1
  %6 = load i32, ptr %tt, align 8
  switch i32 %6, label %sw.default [
    i32 6, label %sw.bb
    i32 7, label %sw.bb2
    i32 8, label %sw.bb8
  ]

sw.bb:                                            ; preds = %entry
  %7 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %7, i32 0, i32 4
  %8 = load ptr, ptr %top, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %8, i64 -1
  %value = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr, i32 0, i32 0
  %9 = load ptr, ptr %value, align 8
  %10 = load ptr, ptr %o, align 8
  %value1 = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 0, i32 0
  %11 = load ptr, ptr %value1, align 8
  %env = getelementptr inbounds %struct.CClosure, ptr %11, i32 0, i32 6
  store ptr %9, ptr %env, align 8
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %12 = load ptr, ptr %L.addr, align 8
  %top3 = getelementptr inbounds %struct.lua_State, ptr %12, i32 0, i32 4
  %13 = load ptr, ptr %top3, align 8
  %add.ptr4 = getelementptr inbounds %struct.lua_TValue, ptr %13, i64 -1
  %value5 = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr4, i32 0, i32 0
  %14 = load ptr, ptr %value5, align 8
  %15 = load ptr, ptr %o, align 8
  %value6 = getelementptr inbounds %struct.lua_TValue, ptr %15, i32 0, i32 0
  %16 = load ptr, ptr %value6, align 8
  %env7 = getelementptr inbounds %struct.anon.1, ptr %16, i32 0, i32 4
  store ptr %14, ptr %env7, align 8
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %17 = load ptr, ptr %L.addr, align 8
  %top9 = getelementptr inbounds %struct.lua_State, ptr %17, i32 0, i32 4
  %18 = load ptr, ptr %top9, align 8
  %add.ptr10 = getelementptr inbounds %struct.lua_TValue, ptr %18, i64 -1
  %value11 = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr10, i32 0, i32 0
  %19 = load ptr, ptr %value11, align 8
  store ptr %19, ptr %i_x, align 8
  %20 = load ptr, ptr %o, align 8
  %value12 = getelementptr inbounds %struct.lua_TValue, ptr %20, i32 0, i32 0
  %21 = load ptr, ptr %value12, align 8
  %l_gt = getelementptr inbounds %struct.lua_State, ptr %21, i32 0, i32 21
  store ptr %l_gt, ptr %i_o, align 8
  %22 = load ptr, ptr %i_x, align 8
  %23 = load ptr, ptr %i_o, align 8
  %value13 = getelementptr inbounds %struct.lua_TValue, ptr %23, i32 0, i32 0
  store ptr %22, ptr %value13, align 8
  %24 = load ptr, ptr %i_o, align 8
  %tt14 = getelementptr inbounds %struct.lua_TValue, ptr %24, i32 0, i32 1
  store i32 5, ptr %tt14, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  store i32 0, ptr %res, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb8, %sw.bb2, %sw.bb
  %25 = load i32, ptr %res, align 4
  %tobool = icmp ne i32 %25, 0
  br i1 %tobool, label %if.then, label %if.end29

if.then:                                          ; preds = %sw.epilog
  %26 = load ptr, ptr %L.addr, align 8
  %top15 = getelementptr inbounds %struct.lua_State, ptr %26, i32 0, i32 4
  %27 = load ptr, ptr %top15, align 8
  %add.ptr16 = getelementptr inbounds %struct.lua_TValue, ptr %27, i64 -1
  %value17 = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr16, i32 0, i32 0
  %28 = load ptr, ptr %value17, align 8
  %marked = getelementptr inbounds %struct.GCheader, ptr %28, i32 0, i32 2
  %29 = load i8, ptr %marked, align 1
  %conv = zext i8 %29 to i32
  %and = and i32 %conv, 3
  %tobool18 = icmp ne i32 %and, 0
  br i1 %tobool18, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %30 = load ptr, ptr %o, align 8
  %value19 = getelementptr inbounds %struct.lua_TValue, ptr %30, i32 0, i32 0
  %31 = load ptr, ptr %value19, align 8
  %marked20 = getelementptr inbounds %struct.GCheader, ptr %31, i32 0, i32 2
  %32 = load i8, ptr %marked20, align 1
  %conv21 = zext i8 %32 to i32
  %and22 = and i32 %conv21, 4
  %tobool23 = icmp ne i32 %and22, 0
  br i1 %tobool23, label %if.then24, label %if.end

if.then24:                                        ; preds = %land.lhs.true
  %33 = load ptr, ptr %L.addr, align 8
  %34 = load ptr, ptr %o, align 8
  %value25 = getelementptr inbounds %struct.lua_TValue, ptr %34, i32 0, i32 0
  %35 = load ptr, ptr %value25, align 8
  %36 = load ptr, ptr %L.addr, align 8
  %top26 = getelementptr inbounds %struct.lua_State, ptr %36, i32 0, i32 4
  %37 = load ptr, ptr %top26, align 8
  %add.ptr27 = getelementptr inbounds %struct.lua_TValue, ptr %37, i64 -1
  %value28 = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr27, i32 0, i32 0
  %38 = load ptr, ptr %value28, align 8
  call void @luaC_barrierf(ptr noundef %33, ptr noundef %35, ptr noundef %38)
  br label %if.end

if.end:                                           ; preds = %if.then24, %land.lhs.true, %if.then
  br label %if.end29

if.end29:                                         ; preds = %if.end, %sw.epilog
  %39 = load ptr, ptr %L.addr, align 8
  %top30 = getelementptr inbounds %struct.lua_State, ptr %39, i32 0, i32 4
  %40 = load ptr, ptr %top30, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %40, i32 -1
  store ptr %incdec.ptr, ptr %top30, align 8
  %41 = load i32, ptr %res, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_call(ptr noundef %L, i32 noundef %nargs, i32 noundef %nresults) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %nargs.addr = alloca i32, align 4
  %nresults.addr = alloca i32, align 4
  %func = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %nargs, ptr %nargs.addr, align 4
  store i32 %nresults, ptr %nresults.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %2, i32 0, i32 4
  %3 = load ptr, ptr %top, align 8
  %4 = load i32, ptr %nargs.addr, align 4
  %add = add nsw i32 %4, 1
  %idx.ext = sext i32 %add to i64
  %idx.neg = sub i64 0, %idx.ext
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %3, i64 %idx.neg
  store ptr %add.ptr, ptr %func, align 8
  %5 = load ptr, ptr %L.addr, align 8
  %6 = load ptr, ptr %func, align 8
  %7 = load i32, ptr %nresults.addr, align 4
  call void @luaD_call(ptr noundef %5, ptr noundef %6, i32 noundef %7)
  %8 = load i32, ptr %nresults.addr, align 4
  %cmp = icmp eq i32 %8, -1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %9 = load ptr, ptr %L.addr, align 8
  %top1 = getelementptr inbounds %struct.lua_State, ptr %9, i32 0, i32 4
  %10 = load ptr, ptr %top1, align 8
  %11 = load ptr, ptr %L.addr, align 8
  %ci = getelementptr inbounds %struct.lua_State, ptr %11, i32 0, i32 7
  %12 = load ptr, ptr %ci, align 8
  %top2 = getelementptr inbounds %struct.CallInfo, ptr %12, i32 0, i32 2
  %13 = load ptr, ptr %top2, align 8
  %cmp3 = icmp uge ptr %10, %13
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %14 = load ptr, ptr %L.addr, align 8
  %top4 = getelementptr inbounds %struct.lua_State, ptr %14, i32 0, i32 4
  %15 = load ptr, ptr %top4, align 8
  %16 = load ptr, ptr %L.addr, align 8
  %ci5 = getelementptr inbounds %struct.lua_State, ptr %16, i32 0, i32 7
  %17 = load ptr, ptr %ci5, align 8
  %top6 = getelementptr inbounds %struct.CallInfo, ptr %17, i32 0, i32 2
  store ptr %15, ptr %top6, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

declare void @luaD_call(ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_pcall(ptr noundef %L, i32 noundef %nargs, i32 noundef %nresults, i32 noundef %errfunc) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %nargs.addr = alloca i32, align 4
  %nresults.addr = alloca i32, align 4
  %errfunc.addr = alloca i32, align 4
  %c = alloca %struct.CallS, align 8
  %status = alloca i32, align 4
  %func = alloca i64, align 8
  %o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %nargs, ptr %nargs.addr, align 4
  store i32 %nresults, ptr %nresults.addr, align 4
  store i32 %errfunc, ptr %errfunc.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load i32, ptr %errfunc.addr, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i64 0, ptr %func, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load i32, ptr %errfunc.addr, align 4
  %call = call ptr @index2adr(ptr noundef %3, i32 noundef %4)
  store ptr %call, ptr %o, align 8
  %5 = load ptr, ptr %L.addr, align 8
  %6 = load ptr, ptr %o, align 8
  %7 = load ptr, ptr %L.addr, align 8
  %stack = getelementptr inbounds %struct.lua_State, ptr %7, i32 0, i32 10
  %8 = load ptr, ptr %stack, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %6 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %8 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i64 %sub.ptr.sub, ptr %func, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %9 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %9, i32 0, i32 4
  %10 = load ptr, ptr %top, align 8
  %11 = load i32, ptr %nargs.addr, align 4
  %add = add nsw i32 %11, 1
  %idx.ext = sext i32 %add to i64
  %idx.neg = sub i64 0, %idx.ext
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %10, i64 %idx.neg
  %func1 = getelementptr inbounds %struct.CallS, ptr %c, i32 0, i32 0
  store ptr %add.ptr, ptr %func1, align 8
  %12 = load i32, ptr %nresults.addr, align 4
  %nresults2 = getelementptr inbounds %struct.CallS, ptr %c, i32 0, i32 1
  store i32 %12, ptr %nresults2, align 8
  %13 = load ptr, ptr %L.addr, align 8
  %func3 = getelementptr inbounds %struct.CallS, ptr %c, i32 0, i32 0
  %14 = load ptr, ptr %func3, align 8
  %15 = load ptr, ptr %L.addr, align 8
  %stack4 = getelementptr inbounds %struct.lua_State, ptr %15, i32 0, i32 10
  %16 = load ptr, ptr %stack4, align 8
  %sub.ptr.lhs.cast5 = ptrtoint ptr %14 to i64
  %sub.ptr.rhs.cast6 = ptrtoint ptr %16 to i64
  %sub.ptr.sub7 = sub i64 %sub.ptr.lhs.cast5, %sub.ptr.rhs.cast6
  %17 = load i64, ptr %func, align 8
  %call8 = call i32 @luaD_pcall(ptr noundef %13, ptr noundef @f_call, ptr noundef %c, i64 noundef %sub.ptr.sub7, i64 noundef %17)
  store i32 %call8, ptr %status, align 4
  %18 = load i32, ptr %nresults.addr, align 4
  %cmp9 = icmp eq i32 %18, -1
  br i1 %cmp9, label %land.lhs.true, label %if.end17

land.lhs.true:                                    ; preds = %if.end
  %19 = load ptr, ptr %L.addr, align 8
  %top10 = getelementptr inbounds %struct.lua_State, ptr %19, i32 0, i32 4
  %20 = load ptr, ptr %top10, align 8
  %21 = load ptr, ptr %L.addr, align 8
  %ci = getelementptr inbounds %struct.lua_State, ptr %21, i32 0, i32 7
  %22 = load ptr, ptr %ci, align 8
  %top11 = getelementptr inbounds %struct.CallInfo, ptr %22, i32 0, i32 2
  %23 = load ptr, ptr %top11, align 8
  %cmp12 = icmp uge ptr %20, %23
  br i1 %cmp12, label %if.then13, label %if.end17

if.then13:                                        ; preds = %land.lhs.true
  %24 = load ptr, ptr %L.addr, align 8
  %top14 = getelementptr inbounds %struct.lua_State, ptr %24, i32 0, i32 4
  %25 = load ptr, ptr %top14, align 8
  %26 = load ptr, ptr %L.addr, align 8
  %ci15 = getelementptr inbounds %struct.lua_State, ptr %26, i32 0, i32 7
  %27 = load ptr, ptr %ci15, align 8
  %top16 = getelementptr inbounds %struct.CallInfo, ptr %27, i32 0, i32 2
  store ptr %25, ptr %top16, align 8
  br label %if.end17

if.end17:                                         ; preds = %if.then13, %land.lhs.true, %if.end
  %28 = load i32, ptr %status, align 4
  ret i32 %28
}

declare i32 @luaD_pcall(ptr noundef, ptr noundef, ptr noundef, i64 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @f_call(ptr noundef %L, ptr noundef %ud) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %ud.addr = alloca ptr, align 8
  %c = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %ud, ptr %ud.addr, align 8
  %0 = load ptr, ptr %ud.addr, align 8
  store ptr %0, ptr %c, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load ptr, ptr %c, align 8
  %func = getelementptr inbounds %struct.CallS, ptr %2, i32 0, i32 0
  %3 = load ptr, ptr %func, align 8
  %4 = load ptr, ptr %c, align 8
  %nresults = getelementptr inbounds %struct.CallS, ptr %4, i32 0, i32 1
  %5 = load i32, ptr %nresults, align 8
  call void @luaD_call(ptr noundef %1, ptr noundef %3, i32 noundef %5)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_cpcall(ptr noundef %L, ptr noundef %func, ptr noundef %ud) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %ud.addr = alloca ptr, align 8
  %c = alloca %struct.CCallS, align 8
  %status = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  store ptr %ud, ptr %ud.addr, align 8
  %0 = load ptr, ptr %func.addr, align 8
  %func1 = getelementptr inbounds %struct.CCallS, ptr %c, i32 0, i32 0
  store ptr %0, ptr %func1, align 8
  %1 = load ptr, ptr %ud.addr, align 8
  %ud2 = getelementptr inbounds %struct.CCallS, ptr %c, i32 0, i32 1
  store ptr %1, ptr %ud2, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 4
  %4 = load ptr, ptr %top, align 8
  %5 = load ptr, ptr %L.addr, align 8
  %stack = getelementptr inbounds %struct.lua_State, ptr %5, i32 0, i32 10
  %6 = load ptr, ptr %stack, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %4 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %6 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %call = call i32 @luaD_pcall(ptr noundef %2, ptr noundef @f_Ccall, ptr noundef %c, i64 noundef %sub.ptr.sub, i64 noundef 0)
  store i32 %call, ptr %status, align 4
  %7 = load i32, ptr %status, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @f_Ccall(ptr noundef %L, ptr noundef %ud) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %ud.addr = alloca ptr, align 8
  %c = alloca ptr, align 8
  %cl = alloca ptr, align 8
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  %i_x3 = alloca ptr, align 8
  %i_o5 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %ud, ptr %ud.addr, align 8
  %0 = load ptr, ptr %ud.addr, align 8
  store ptr %0, ptr %c, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %call = call ptr @getcurrenv(ptr noundef %2)
  %call1 = call ptr @luaF_newCclosure(ptr noundef %1, i32 noundef 0, ptr noundef %call)
  store ptr %call1, ptr %cl, align 8
  %3 = load ptr, ptr %c, align 8
  %func = getelementptr inbounds %struct.CCallS, ptr %3, i32 0, i32 0
  %4 = load ptr, ptr %func, align 8
  %5 = load ptr, ptr %cl, align 8
  %f = getelementptr inbounds %struct.CClosure, ptr %5, i32 0, i32 8
  store ptr %4, ptr %f, align 8
  %6 = load ptr, ptr %cl, align 8
  store ptr %6, ptr %i_x, align 8
  %7 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %7, i32 0, i32 4
  %8 = load ptr, ptr %top, align 8
  store ptr %8, ptr %i_o, align 8
  %9 = load ptr, ptr %i_x, align 8
  %10 = load ptr, ptr %i_o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 0, i32 0
  store ptr %9, ptr %value, align 8
  %11 = load ptr, ptr %i_o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %11, i32 0, i32 1
  store i32 6, ptr %tt, align 8
  %12 = load ptr, ptr %L.addr, align 8
  %13 = load ptr, ptr %L.addr, align 8
  %top2 = getelementptr inbounds %struct.lua_State, ptr %13, i32 0, i32 4
  %14 = load ptr, ptr %top2, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 1
  store ptr %incdec.ptr, ptr %top2, align 8
  %15 = load ptr, ptr %c, align 8
  %ud4 = getelementptr inbounds %struct.CCallS, ptr %15, i32 0, i32 1
  %16 = load ptr, ptr %ud4, align 8
  store ptr %16, ptr %i_x3, align 8
  %17 = load ptr, ptr %L.addr, align 8
  %top6 = getelementptr inbounds %struct.lua_State, ptr %17, i32 0, i32 4
  %18 = load ptr, ptr %top6, align 8
  store ptr %18, ptr %i_o5, align 8
  %19 = load ptr, ptr %i_x3, align 8
  %20 = load ptr, ptr %i_o5, align 8
  %value7 = getelementptr inbounds %struct.lua_TValue, ptr %20, i32 0, i32 0
  store ptr %19, ptr %value7, align 8
  %21 = load ptr, ptr %i_o5, align 8
  %tt8 = getelementptr inbounds %struct.lua_TValue, ptr %21, i32 0, i32 1
  store i32 2, ptr %tt8, align 8
  %22 = load ptr, ptr %L.addr, align 8
  %23 = load ptr, ptr %L.addr, align 8
  %top9 = getelementptr inbounds %struct.lua_State, ptr %23, i32 0, i32 4
  %24 = load ptr, ptr %top9, align 8
  %incdec.ptr10 = getelementptr inbounds %struct.lua_TValue, ptr %24, i32 1
  store ptr %incdec.ptr10, ptr %top9, align 8
  %25 = load ptr, ptr %L.addr, align 8
  %26 = load ptr, ptr %L.addr, align 8
  %top11 = getelementptr inbounds %struct.lua_State, ptr %26, i32 0, i32 4
  %27 = load ptr, ptr %top11, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %27, i64 -2
  call void @luaD_call(ptr noundef %25, ptr noundef %add.ptr, i32 noundef 0)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_load(ptr noundef %L, ptr noundef %reader, ptr noundef %data, ptr noundef %chunkname) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %reader.addr = alloca ptr, align 8
  %data.addr = alloca ptr, align 8
  %chunkname.addr = alloca ptr, align 8
  %z = alloca %struct.Zio, align 8
  %status = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store ptr %reader, ptr %reader.addr, align 8
  store ptr %data, ptr %data.addr, align 8
  store ptr %chunkname, ptr %chunkname.addr, align 8
  %0 = load ptr, ptr %chunkname.addr, align 8
  %tobool = icmp ne ptr %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store ptr @.str.2, ptr %chunkname.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load ptr, ptr %reader.addr, align 8
  %3 = load ptr, ptr %data.addr, align 8
  call void @luaZ_init(ptr noundef %1, ptr noundef %z, ptr noundef %2, ptr noundef %3)
  %4 = load ptr, ptr %L.addr, align 8
  %5 = load ptr, ptr %chunkname.addr, align 8
  %call = call i32 @luaD_protectedparser(ptr noundef %4, ptr noundef %z, ptr noundef %5)
  store i32 %call, ptr %status, align 4
  %6 = load i32, ptr %status, align 4
  ret i32 %6
}

declare void @luaZ_init(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @luaD_protectedparser(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_dump(ptr noundef %L, ptr noundef %writer, ptr noundef %data) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %writer.addr = alloca ptr, align 8
  %data.addr = alloca ptr, align 8
  %status = alloca i32, align 4
  %o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %writer, ptr %writer.addr, align 8
  store ptr %data, ptr %data.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %1, i32 0, i32 4
  %2 = load ptr, ptr %top, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %2, i64 -1
  store ptr %add.ptr, ptr %o, align 8
  %3 = load ptr, ptr %o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %3, i32 0, i32 1
  %4 = load i32, ptr %tt, align 8
  %cmp = icmp eq i32 %4, 6
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %5 = load ptr, ptr %o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %5, i32 0, i32 0
  %6 = load ptr, ptr %value, align 8
  %isC = getelementptr inbounds %struct.CClosure, ptr %6, i32 0, i32 3
  %7 = load i8, ptr %isC, align 2
  %tobool = icmp ne i8 %7, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %8 = load ptr, ptr %L.addr, align 8
  %9 = load ptr, ptr %o, align 8
  %value1 = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 0, i32 0
  %10 = load ptr, ptr %value1, align 8
  %p = getelementptr inbounds %struct.LClosure, ptr %10, i32 0, i32 8
  %11 = load ptr, ptr %p, align 8
  %12 = load ptr, ptr %writer.addr, align 8
  %13 = load ptr, ptr %data.addr, align 8
  %call = call i32 @luaU_dump(ptr noundef %8, ptr noundef %11, ptr noundef %12, ptr noundef %13, i32 noundef 0)
  store i32 %call, ptr %status, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %entry
  store i32 1, ptr %status, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %14 = load i32, ptr %status, align 4
  ret i32 %14
}

declare i32 @luaU_dump(ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_status(ptr noundef %L) #0 {
entry:
  %L.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %status = getelementptr inbounds %struct.lua_State, ptr %0, i32 0, i32 3
  %1 = load i8, ptr %status, align 2
  %conv = zext i8 %1 to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_gc(ptr noundef %L, i32 noundef %what, i32 noundef %data) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %what.addr = alloca i32, align 4
  %data.addr = alloca i32, align 4
  %res = alloca i32, align 4
  %g = alloca ptr, align 8
  %a = alloca i64, align 8
  %new_memlimit = alloca i64, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %what, ptr %what.addr, align 4
  store i32 %data, ptr %data.addr, align 4
  store i32 0, ptr %res, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %0, i32 0, i32 6
  %1 = load ptr, ptr %l_G, align 8
  store ptr %1, ptr %g, align 8
  %2 = load i32, ptr %what.addr, align 4
  switch i32 %2, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb3
    i32 2, label %sw.bb8
    i32 3, label %sw.bb9
    i32 4, label %sw.bb11
    i32 5, label %sw.bb15
    i32 6, label %sw.bb36
    i32 7, label %sw.bb38
    i32 8, label %sw.bb40
    i32 9, label %sw.bb59
  ]

sw.bb:                                            ; preds = %entry
  %3 = load ptr, ptr %L.addr, align 8
  %l_G1 = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 6
  %4 = load ptr, ptr %l_G1, align 8
  %gcflags = getelementptr inbounds %struct.global_State, ptr %4, i32 0, i32 5
  %5 = load i8, ptr %gcflags, align 2
  %conv = zext i8 %5 to i32
  %or = or i32 %conv, 1
  %conv2 = trunc i32 %or to i8
  store i8 %conv2, ptr %gcflags, align 2
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %6 = load ptr, ptr %L.addr, align 8
  %l_G4 = getelementptr inbounds %struct.lua_State, ptr %6, i32 0, i32 6
  %7 = load ptr, ptr %l_G4, align 8
  %gcflags5 = getelementptr inbounds %struct.global_State, ptr %7, i32 0, i32 5
  %8 = load i8, ptr %gcflags5, align 2
  %conv6 = zext i8 %8 to i32
  %and = and i32 %conv6, 254
  %conv7 = trunc i32 %and to i8
  store i8 %conv7, ptr %gcflags5, align 2
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %9 = load ptr, ptr %L.addr, align 8
  call void @luaC_fullgc(ptr noundef %9)
  br label %sw.epilog

sw.bb9:                                           ; preds = %entry
  %10 = load ptr, ptr %g, align 8
  %totalbytes = getelementptr inbounds %struct.global_State, ptr %10, i32 0, i32 15
  %11 = load i64, ptr %totalbytes, align 8
  %shr = lshr i64 %11, 10
  %conv10 = trunc i64 %shr to i32
  store i32 %conv10, ptr %res, align 4
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry
  %12 = load ptr, ptr %g, align 8
  %totalbytes12 = getelementptr inbounds %struct.global_State, ptr %12, i32 0, i32 15
  %13 = load i64, ptr %totalbytes12, align 8
  %and13 = and i64 %13, 1023
  %conv14 = trunc i64 %and13 to i32
  store i32 %conv14, ptr %res, align 4
  br label %sw.epilog

sw.bb15:                                          ; preds = %entry
  %14 = load ptr, ptr %L.addr, align 8
  %l_G16 = getelementptr inbounds %struct.lua_State, ptr %14, i32 0, i32 6
  %15 = load ptr, ptr %l_G16, align 8
  %gcflags17 = getelementptr inbounds %struct.global_State, ptr %15, i32 0, i32 5
  %16 = load i8, ptr %gcflags17, align 2
  %conv18 = zext i8 %16 to i32
  %and19 = and i32 %conv18, 1
  %tobool = icmp ne i32 %and19, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb15
  store i32 1, ptr %res, align 4
  br label %sw.epilog

if.end:                                           ; preds = %sw.bb15
  %17 = load i32, ptr %data.addr, align 4
  %conv20 = sext i32 %17 to i64
  %shl = shl i64 %conv20, 10
  store i64 %shl, ptr %a, align 8
  %18 = load i64, ptr %a, align 8
  %19 = load ptr, ptr %g, align 8
  %totalbytes21 = getelementptr inbounds %struct.global_State, ptr %19, i32 0, i32 15
  %20 = load i64, ptr %totalbytes21, align 8
  %cmp = icmp ule i64 %18, %20
  br i1 %cmp, label %if.then23, label %if.else

if.then23:                                        ; preds = %if.end
  %21 = load ptr, ptr %g, align 8
  %totalbytes24 = getelementptr inbounds %struct.global_State, ptr %21, i32 0, i32 15
  %22 = load i64, ptr %totalbytes24, align 8
  %23 = load i64, ptr %a, align 8
  %sub = sub i64 %22, %23
  %24 = load ptr, ptr %g, align 8
  %GCthreshold = getelementptr inbounds %struct.global_State, ptr %24, i32 0, i32 14
  store i64 %sub, ptr %GCthreshold, align 8
  br label %if.end26

if.else:                                          ; preds = %if.end
  %25 = load ptr, ptr %g, align 8
  %GCthreshold25 = getelementptr inbounds %struct.global_State, ptr %25, i32 0, i32 14
  store i64 0, ptr %GCthreshold25, align 8
  br label %if.end26

if.end26:                                         ; preds = %if.else, %if.then23
  br label %while.cond

while.cond:                                       ; preds = %if.end35, %if.end26
  %26 = load ptr, ptr %g, align 8
  %GCthreshold27 = getelementptr inbounds %struct.global_State, ptr %26, i32 0, i32 14
  %27 = load i64, ptr %GCthreshold27, align 8
  %28 = load ptr, ptr %g, align 8
  %totalbytes28 = getelementptr inbounds %struct.global_State, ptr %28, i32 0, i32 15
  %29 = load i64, ptr %totalbytes28, align 8
  %cmp29 = icmp ule i64 %27, %29
  br i1 %cmp29, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %30 = load ptr, ptr %L.addr, align 8
  call void @luaC_step(ptr noundef %30)
  %31 = load ptr, ptr %g, align 8
  %gcstate = getelementptr inbounds %struct.global_State, ptr %31, i32 0, i32 4
  %32 = load i8, ptr %gcstate, align 1
  %conv31 = zext i8 %32 to i32
  %cmp32 = icmp eq i32 %conv31, 0
  br i1 %cmp32, label %if.then34, label %if.end35

if.then34:                                        ; preds = %while.body
  store i32 1, ptr %res, align 4
  br label %while.end

if.end35:                                         ; preds = %while.body
  br label %while.cond, !llvm.loop !12

while.end:                                        ; preds = %if.then34, %while.cond
  br label %sw.epilog

sw.bb36:                                          ; preds = %entry
  %33 = load ptr, ptr %g, align 8
  %gcpause = getelementptr inbounds %struct.global_State, ptr %33, i32 0, i32 19
  %34 = load i32, ptr %gcpause, align 8
  store i32 %34, ptr %res, align 4
  %35 = load i32, ptr %data.addr, align 4
  %36 = load ptr, ptr %g, align 8
  %gcpause37 = getelementptr inbounds %struct.global_State, ptr %36, i32 0, i32 19
  store i32 %35, ptr %gcpause37, align 8
  br label %sw.epilog

sw.bb38:                                          ; preds = %entry
  %37 = load ptr, ptr %g, align 8
  %gcstepmul = getelementptr inbounds %struct.global_State, ptr %37, i32 0, i32 20
  %38 = load i32, ptr %gcstepmul, align 4
  store i32 %38, ptr %res, align 4
  %39 = load i32, ptr %data.addr, align 4
  %40 = load ptr, ptr %g, align 8
  %gcstepmul39 = getelementptr inbounds %struct.global_State, ptr %40, i32 0, i32 20
  store i32 %39, ptr %gcstepmul39, align 4
  br label %sw.epilog

sw.bb40:                                          ; preds = %entry
  %41 = load i32, ptr %data.addr, align 4
  %conv41 = sext i32 %41 to i64
  %shl42 = shl i64 %conv41, 10
  store i64 %shl42, ptr %new_memlimit, align 8
  %42 = load i64, ptr %new_memlimit, align 8
  %cmp43 = icmp ugt i64 %42, 0
  br i1 %cmp43, label %land.lhs.true, label %if.end56

land.lhs.true:                                    ; preds = %sw.bb40
  %43 = load i64, ptr %new_memlimit, align 8
  %44 = load ptr, ptr %g, align 8
  %totalbytes45 = getelementptr inbounds %struct.global_State, ptr %44, i32 0, i32 15
  %45 = load i64, ptr %totalbytes45, align 8
  %cmp46 = icmp ult i64 %43, %45
  br i1 %cmp46, label %if.then48, label %if.end56

if.then48:                                        ; preds = %land.lhs.true
  %46 = load ptr, ptr %L.addr, align 8
  call void @luaC_fullgc(ptr noundef %46)
  %47 = load i64, ptr %new_memlimit, align 8
  %48 = load ptr, ptr %g, align 8
  %totalbytes49 = getelementptr inbounds %struct.global_State, ptr %48, i32 0, i32 15
  %49 = load i64, ptr %totalbytes49, align 8
  %cmp50 = icmp ult i64 %47, %49
  br i1 %cmp50, label %if.then52, label %if.end55

if.then52:                                        ; preds = %if.then48
  %50 = load ptr, ptr %g, align 8
  %totalbytes53 = getelementptr inbounds %struct.global_State, ptr %50, i32 0, i32 15
  %51 = load i64, ptr %totalbytes53, align 8
  %add = add i64 %51, 1024
  %and54 = and i64 %add, -1024
  store i64 %and54, ptr %new_memlimit, align 8
  br label %if.end55

if.end55:                                         ; preds = %if.then52, %if.then48
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %land.lhs.true, %sw.bb40
  %52 = load i64, ptr %new_memlimit, align 8
  %53 = load ptr, ptr %g, align 8
  %memlimit = getelementptr inbounds %struct.global_State, ptr %53, i32 0, i32 16
  store i64 %52, ptr %memlimit, align 8
  %54 = load i64, ptr %new_memlimit, align 8
  %shr57 = lshr i64 %54, 10
  %conv58 = trunc i64 %shr57 to i32
  store i32 %conv58, ptr %res, align 4
  br label %sw.epilog

sw.bb59:                                          ; preds = %entry
  %55 = load ptr, ptr %g, align 8
  %memlimit60 = getelementptr inbounds %struct.global_State, ptr %55, i32 0, i32 16
  %56 = load i64, ptr %memlimit60, align 8
  %shr61 = lshr i64 %56, 10
  %conv62 = trunc i64 %shr61 to i32
  store i32 %conv62, ptr %res, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  store i32 -1, ptr %res, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb59, %if.end56, %sw.bb38, %sw.bb36, %while.end, %if.then, %sw.bb11, %sw.bb9, %sw.bb8, %sw.bb3, %sw.bb
  %57 = load i32, ptr %res, align 4
  ret i32 %57
}

declare void @luaC_fullgc(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_error(ptr noundef %L) #0 {
entry:
  %L.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %L.addr, align 8
  call void @luaG_errormsg(ptr noundef %1)
  ret i32 0
}

declare void @luaG_errormsg(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_next(ptr noundef %L, i32 noundef %idx) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %t = alloca ptr, align 8
  %more = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %t, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load ptr, ptr %t, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %4, i32 0, i32 0
  %5 = load ptr, ptr %value, align 8
  %6 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %6, i32 0, i32 4
  %7 = load ptr, ptr %top, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %7, i64 -1
  %call1 = call i32 @luaH_next(ptr noundef %3, ptr noundef %5, ptr noundef %add.ptr)
  store i32 %call1, ptr %more, align 4
  %8 = load i32, ptr %more, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %9 = load ptr, ptr %L.addr, align 8
  %10 = load ptr, ptr %L.addr, align 8
  %top2 = getelementptr inbounds %struct.lua_State, ptr %10, i32 0, i32 4
  %11 = load ptr, ptr %top2, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %11, i32 1
  store ptr %incdec.ptr, ptr %top2, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %12 = load ptr, ptr %L.addr, align 8
  %top3 = getelementptr inbounds %struct.lua_State, ptr %12, i32 0, i32 4
  %13 = load ptr, ptr %top3, align 8
  %add.ptr4 = getelementptr inbounds %struct.lua_TValue, ptr %13, i64 -1
  store ptr %add.ptr4, ptr %top3, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %14 = load i32, ptr %more, align 4
  ret i32 %14
}

declare i32 @luaH_next(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_concat(ptr noundef %L, i32 noundef %n) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %n.addr = alloca i32, align 4
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %n, ptr %n.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %n.addr, align 4
  %cmp = icmp sge i32 %1, 2
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %2, i32 0, i32 6
  %3 = load ptr, ptr %l_G, align 8
  %totalbytes = getelementptr inbounds %struct.global_State, ptr %3, i32 0, i32 15
  %4 = load i64, ptr %totalbytes, align 8
  %5 = load ptr, ptr %L.addr, align 8
  %l_G1 = getelementptr inbounds %struct.lua_State, ptr %5, i32 0, i32 6
  %6 = load ptr, ptr %l_G1, align 8
  %GCthreshold = getelementptr inbounds %struct.global_State, ptr %6, i32 0, i32 14
  %7 = load i64, ptr %GCthreshold, align 8
  %cmp2 = icmp uge i64 %4, %7
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %8 = load ptr, ptr %L.addr, align 8
  call void @luaC_step(ptr noundef %8)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %9 = load ptr, ptr %L.addr, align 8
  %10 = load i32, ptr %n.addr, align 4
  %11 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %11, i32 0, i32 4
  %12 = load ptr, ptr %top, align 8
  %13 = load ptr, ptr %L.addr, align 8
  %base = getelementptr inbounds %struct.lua_State, ptr %13, i32 0, i32 5
  %14 = load ptr, ptr %base, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %12 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %14 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 16
  %conv = trunc i64 %sub.ptr.div to i32
  %sub = sub nsw i32 %conv, 1
  call void @luaV_concat(ptr noundef %9, i32 noundef %10, i32 noundef %sub)
  %15 = load i32, ptr %n.addr, align 4
  %sub4 = sub nsw i32 %15, 1
  %16 = load ptr, ptr %L.addr, align 8
  %top5 = getelementptr inbounds %struct.lua_State, ptr %16, i32 0, i32 4
  %17 = load ptr, ptr %top5, align 8
  %idx.ext = sext i32 %sub4 to i64
  %idx.neg = sub i64 0, %idx.ext
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %17, i64 %idx.neg
  store ptr %add.ptr, ptr %top5, align 8
  br label %if.end12

if.else:                                          ; preds = %entry
  %18 = load i32, ptr %n.addr, align 4
  %cmp6 = icmp eq i32 %18, 0
  br i1 %cmp6, label %if.then8, label %if.end11

if.then8:                                         ; preds = %if.else
  %19 = load ptr, ptr %L.addr, align 8
  %call = call ptr @luaS_newlstr(ptr noundef %19, ptr noundef @.str.3, i64 noundef 0)
  store ptr %call, ptr %i_x, align 8
  %20 = load ptr, ptr %L.addr, align 8
  %top9 = getelementptr inbounds %struct.lua_State, ptr %20, i32 0, i32 4
  %21 = load ptr, ptr %top9, align 8
  store ptr %21, ptr %i_o, align 8
  %22 = load ptr, ptr %i_x, align 8
  %23 = load ptr, ptr %i_o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %23, i32 0, i32 0
  store ptr %22, ptr %value, align 8
  %24 = load ptr, ptr %i_o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %24, i32 0, i32 1
  store i32 4, ptr %tt, align 8
  %25 = load ptr, ptr %L.addr, align 8
  %26 = load ptr, ptr %L.addr, align 8
  %top10 = getelementptr inbounds %struct.lua_State, ptr %26, i32 0, i32 4
  %27 = load ptr, ptr %top10, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %27, i32 1
  store ptr %incdec.ptr, ptr %top10, align 8
  br label %if.end11

if.end11:                                         ; preds = %if.then8, %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.end
  ret void
}

declare void @luaV_concat(ptr noundef, i32 noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_getallocf(ptr noundef %L, ptr noundef %ud) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %ud.addr = alloca ptr, align 8
  %f = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %ud, ptr %ud.addr, align 8
  %0 = load ptr, ptr %ud.addr, align 8
  %tobool = icmp ne ptr %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %1, i32 0, i32 6
  %2 = load ptr, ptr %l_G, align 8
  %ud1 = getelementptr inbounds %struct.global_State, ptr %2, i32 0, i32 2
  %3 = load ptr, ptr %ud1, align 8
  %4 = load ptr, ptr %ud.addr, align 8
  store ptr %3, ptr %4, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load ptr, ptr %L.addr, align 8
  %l_G2 = getelementptr inbounds %struct.lua_State, ptr %5, i32 0, i32 6
  %6 = load ptr, ptr %l_G2, align 8
  %frealloc = getelementptr inbounds %struct.global_State, ptr %6, i32 0, i32 1
  %7 = load ptr, ptr %frealloc, align 8
  store ptr %7, ptr %f, align 8
  %8 = load ptr, ptr %f, align 8
  ret ptr %8
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_setallocf(ptr noundef %L, ptr noundef %f, ptr noundef %ud) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %f.addr = alloca ptr, align 8
  %ud.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %f, ptr %f.addr, align 8
  store ptr %ud, ptr %ud.addr, align 8
  %0 = load ptr, ptr %ud.addr, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %1, i32 0, i32 6
  %2 = load ptr, ptr %l_G, align 8
  %ud1 = getelementptr inbounds %struct.global_State, ptr %2, i32 0, i32 2
  store ptr %0, ptr %ud1, align 8
  %3 = load ptr, ptr %f.addr, align 8
  %4 = load ptr, ptr %L.addr, align 8
  %l_G2 = getelementptr inbounds %struct.lua_State, ptr %4, i32 0, i32 6
  %5 = load ptr, ptr %l_G2, align 8
  %frealloc = getelementptr inbounds %struct.global_State, ptr %5, i32 0, i32 1
  store ptr %3, ptr %frealloc, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_newuserdata(ptr noundef %L, i64 noundef %size) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %u = alloca ptr, align 8
  %i_x = alloca ptr, align 8
  %i_o = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %0, i32 0, i32 6
  %1 = load ptr, ptr %l_G, align 8
  %totalbytes = getelementptr inbounds %struct.global_State, ptr %1, i32 0, i32 15
  %2 = load i64, ptr %totalbytes, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %l_G1 = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 6
  %4 = load ptr, ptr %l_G1, align 8
  %GCthreshold = getelementptr inbounds %struct.global_State, ptr %4, i32 0, i32 14
  %5 = load i64, ptr %GCthreshold, align 8
  %cmp = icmp uge i64 %2, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load ptr, ptr %L.addr, align 8
  call void @luaC_step(ptr noundef %6)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load ptr, ptr %L.addr, align 8
  %8 = load i64, ptr %size.addr, align 8
  %9 = load ptr, ptr %L.addr, align 8
  %call = call ptr @getcurrenv(ptr noundef %9)
  %call2 = call ptr @luaS_newudata(ptr noundef %7, i64 noundef %8, ptr noundef %call)
  store ptr %call2, ptr %u, align 8
  %10 = load ptr, ptr %u, align 8
  store ptr %10, ptr %i_x, align 8
  %11 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %11, i32 0, i32 4
  %12 = load ptr, ptr %top, align 8
  store ptr %12, ptr %i_o, align 8
  %13 = load ptr, ptr %i_x, align 8
  %14 = load ptr, ptr %i_o, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 0
  store ptr %13, ptr %value, align 8
  %15 = load ptr, ptr %i_o, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %15, i32 0, i32 1
  store i32 7, ptr %tt, align 8
  %16 = load ptr, ptr %L.addr, align 8
  %17 = load ptr, ptr %L.addr, align 8
  %top3 = getelementptr inbounds %struct.lua_State, ptr %17, i32 0, i32 4
  %18 = load ptr, ptr %top3, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %18, i32 1
  store ptr %incdec.ptr, ptr %top3, align 8
  %19 = load ptr, ptr %u, align 8
  %add.ptr = getelementptr inbounds %union.Udata, ptr %19, i64 1
  ret ptr %add.ptr
}

declare ptr @luaS_newudata(ptr noundef, i64 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_getupvalue(ptr noundef %L, i32 noundef %funcindex, i32 noundef %n) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %funcindex.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %name = alloca ptr, align 8
  %val = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %o1 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %funcindex, ptr %funcindex.addr, align 4
  store i32 %n, ptr %n.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %funcindex.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  %2 = load i32, ptr %n.addr, align 4
  %call1 = call ptr @aux_upvalue(ptr noundef %call, i32 noundef %2, ptr noundef %val)
  store ptr %call1, ptr %name, align 8
  %3 = load ptr, ptr %name, align 8
  %tobool = icmp ne ptr %3, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %val, align 8
  store ptr %4, ptr %o2, align 8
  %5 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %5, i32 0, i32 4
  %6 = load ptr, ptr %top, align 8
  store ptr %6, ptr %o1, align 8
  %7 = load ptr, ptr %o1, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %7, i32 0, i32 0
  %8 = load ptr, ptr %o2, align 8
  %value2 = getelementptr inbounds %struct.lua_TValue, ptr %8, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value, ptr align 8 %value2, i64 8, i1 false)
  %9 = load ptr, ptr %o2, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 0, i32 1
  %10 = load i32, ptr %tt, align 8
  %11 = load ptr, ptr %o1, align 8
  %tt3 = getelementptr inbounds %struct.lua_TValue, ptr %11, i32 0, i32 1
  store i32 %10, ptr %tt3, align 8
  %12 = load ptr, ptr %L.addr, align 8
  %13 = load ptr, ptr %L.addr, align 8
  %top4 = getelementptr inbounds %struct.lua_State, ptr %13, i32 0, i32 4
  %14 = load ptr, ptr %top4, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 1
  store ptr %incdec.ptr, ptr %top4, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %15 = load ptr, ptr %name, align 8
  ret ptr %15
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @aux_upvalue(ptr noundef %fi, i32 noundef %n, ptr noundef %val) #0 {
entry:
  %retval = alloca ptr, align 8
  %fi.addr = alloca ptr, align 8
  %n.addr = alloca i32, align 4
  %val.addr = alloca ptr, align 8
  %f = alloca ptr, align 8
  %p = alloca ptr, align 8
  store ptr %fi, ptr %fi.addr, align 8
  store i32 %n, ptr %n.addr, align 4
  store ptr %val, ptr %val.addr, align 8
  %0 = load ptr, ptr %fi.addr, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %0, i32 0, i32 1
  %1 = load i32, ptr %tt, align 8
  %cmp = icmp eq i32 %1, 6
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %fi.addr, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %2, i32 0, i32 0
  %3 = load ptr, ptr %value, align 8
  store ptr %3, ptr %f, align 8
  %4 = load ptr, ptr %f, align 8
  %isC = getelementptr inbounds %struct.CClosure, ptr %4, i32 0, i32 3
  %5 = load i8, ptr %isC, align 2
  %tobool = icmp ne i8 %5, 0
  br i1 %tobool, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.end
  %6 = load i32, ptr %n.addr, align 4
  %cmp2 = icmp sle i32 1, %6
  br i1 %cmp2, label %land.lhs.true, label %if.then5

land.lhs.true:                                    ; preds = %if.then1
  %7 = load i32, ptr %n.addr, align 4
  %8 = load ptr, ptr %f, align 8
  %nupvalues = getelementptr inbounds %struct.CClosure, ptr %8, i32 0, i32 4
  %9 = load i8, ptr %nupvalues, align 1
  %conv = zext i8 %9 to i32
  %cmp3 = icmp sle i32 %7, %conv
  br i1 %cmp3, label %if.end6, label %if.then5

if.then5:                                         ; preds = %land.lhs.true, %if.then1
  store ptr null, ptr %retval, align 8
  br label %return

if.end6:                                          ; preds = %land.lhs.true
  %10 = load ptr, ptr %f, align 8
  %upvalue = getelementptr inbounds %struct.CClosure, ptr %10, i32 0, i32 9
  %11 = load i32, ptr %n.addr, align 4
  %sub = sub nsw i32 %11, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds [1 x %struct.lua_TValue], ptr %upvalue, i64 0, i64 %idxprom
  %12 = load ptr, ptr %val.addr, align 8
  store ptr %arrayidx, ptr %12, align 8
  store ptr @.str.3, ptr %retval, align 8
  br label %return

if.else:                                          ; preds = %if.end
  %13 = load ptr, ptr %f, align 8
  %p7 = getelementptr inbounds %struct.LClosure, ptr %13, i32 0, i32 8
  %14 = load ptr, ptr %p7, align 8
  store ptr %14, ptr %p, align 8
  %15 = load i32, ptr %n.addr, align 4
  %cmp8 = icmp sle i32 1, %15
  br i1 %cmp8, label %land.lhs.true10, label %if.then13

land.lhs.true10:                                  ; preds = %if.else
  %16 = load i32, ptr %n.addr, align 4
  %17 = load ptr, ptr %p, align 8
  %sizeupvalues = getelementptr inbounds %struct.Proto, ptr %17, i32 0, i32 10
  %18 = load i32, ptr %sizeupvalues, align 8
  %cmp11 = icmp sle i32 %16, %18
  br i1 %cmp11, label %if.end14, label %if.then13

if.then13:                                        ; preds = %land.lhs.true10, %if.else
  store ptr null, ptr %retval, align 8
  br label %return

if.end14:                                         ; preds = %land.lhs.true10
  %19 = load ptr, ptr %f, align 8
  %upvals = getelementptr inbounds %struct.LClosure, ptr %19, i32 0, i32 9
  %20 = load i32, ptr %n.addr, align 4
  %sub15 = sub nsw i32 %20, 1
  %idxprom16 = sext i32 %sub15 to i64
  %arrayidx17 = getelementptr inbounds [1 x ptr], ptr %upvals, i64 0, i64 %idxprom16
  %21 = load ptr, ptr %arrayidx17, align 8
  %v = getelementptr inbounds %struct.UpVal, ptr %21, i32 0, i32 3
  %22 = load ptr, ptr %v, align 8
  %23 = load ptr, ptr %val.addr, align 8
  store ptr %22, ptr %23, align 8
  %24 = load ptr, ptr %p, align 8
  %upvalues = getelementptr inbounds %struct.Proto, ptr %24, i32 0, i32 8
  %25 = load ptr, ptr %upvalues, align 8
  %26 = load i32, ptr %n.addr, align 4
  %sub18 = sub nsw i32 %26, 1
  %idxprom19 = sext i32 %sub18 to i64
  %arrayidx20 = getelementptr inbounds ptr, ptr %25, i64 %idxprom19
  %27 = load ptr, ptr %arrayidx20, align 8
  %add.ptr = getelementptr inbounds %union.TString, ptr %27, i64 1
  store ptr %add.ptr, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end14, %if.then13, %if.end6, %if.then5, %if.then
  %28 = load ptr, ptr %retval, align 8
  ret ptr %28
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_setupvalue(ptr noundef %L, i32 noundef %funcindex, i32 noundef %n) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %funcindex.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %name = alloca ptr, align 8
  %val = alloca ptr, align 8
  %fi = alloca ptr, align 8
  %o2 = alloca ptr, align 8
  %o1 = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %funcindex, ptr %funcindex.addr, align 4
  store i32 %n, ptr %n.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %funcindex.addr, align 4
  %call = call ptr @index2adr(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %fi, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %fi, align 8
  %4 = load i32, ptr %n.addr, align 4
  %call1 = call ptr @aux_upvalue(ptr noundef %3, i32 noundef %4, ptr noundef %val)
  store ptr %call1, ptr %name, align 8
  %5 = load ptr, ptr %name, align 8
  %tobool = icmp ne ptr %5, null
  br i1 %tobool, label %if.then, label %if.end20

if.then:                                          ; preds = %entry
  %6 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %6, i32 0, i32 4
  %7 = load ptr, ptr %top, align 8
  %incdec.ptr = getelementptr inbounds %struct.lua_TValue, ptr %7, i32 -1
  store ptr %incdec.ptr, ptr %top, align 8
  %8 = load ptr, ptr %L.addr, align 8
  %top2 = getelementptr inbounds %struct.lua_State, ptr %8, i32 0, i32 4
  %9 = load ptr, ptr %top2, align 8
  store ptr %9, ptr %o2, align 8
  %10 = load ptr, ptr %val, align 8
  store ptr %10, ptr %o1, align 8
  %11 = load ptr, ptr %o1, align 8
  %value = getelementptr inbounds %struct.lua_TValue, ptr %11, i32 0, i32 0
  %12 = load ptr, ptr %o2, align 8
  %value3 = getelementptr inbounds %struct.lua_TValue, ptr %12, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %value, ptr align 8 %value3, i64 8, i1 false)
  %13 = load ptr, ptr %o2, align 8
  %tt = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 1
  %14 = load i32, ptr %tt, align 8
  %15 = load ptr, ptr %o1, align 8
  %tt4 = getelementptr inbounds %struct.lua_TValue, ptr %15, i32 0, i32 1
  store i32 %14, ptr %tt4, align 8
  %16 = load ptr, ptr %L.addr, align 8
  %top5 = getelementptr inbounds %struct.lua_State, ptr %16, i32 0, i32 4
  %17 = load ptr, ptr %top5, align 8
  %tt6 = getelementptr inbounds %struct.lua_TValue, ptr %17, i32 0, i32 1
  %18 = load i32, ptr %tt6, align 8
  %cmp = icmp sge i32 %18, 4
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %19 = load ptr, ptr %L.addr, align 8
  %top7 = getelementptr inbounds %struct.lua_State, ptr %19, i32 0, i32 4
  %20 = load ptr, ptr %top7, align 8
  %value8 = getelementptr inbounds %struct.lua_TValue, ptr %20, i32 0, i32 0
  %21 = load ptr, ptr %value8, align 8
  %marked = getelementptr inbounds %struct.GCheader, ptr %21, i32 0, i32 2
  %22 = load i8, ptr %marked, align 1
  %conv = zext i8 %22 to i32
  %and = and i32 %conv, 3
  %tobool9 = icmp ne i32 %and, 0
  br i1 %tobool9, label %land.lhs.true10, label %if.end

land.lhs.true10:                                  ; preds = %land.lhs.true
  %23 = load ptr, ptr %fi, align 8
  %value11 = getelementptr inbounds %struct.lua_TValue, ptr %23, i32 0, i32 0
  %24 = load ptr, ptr %value11, align 8
  %marked12 = getelementptr inbounds %struct.GCheader, ptr %24, i32 0, i32 2
  %25 = load i8, ptr %marked12, align 1
  %conv13 = zext i8 %25 to i32
  %and14 = and i32 %conv13, 4
  %tobool15 = icmp ne i32 %and14, 0
  br i1 %tobool15, label %if.then16, label %if.end

if.then16:                                        ; preds = %land.lhs.true10
  %26 = load ptr, ptr %L.addr, align 8
  %27 = load ptr, ptr %fi, align 8
  %value17 = getelementptr inbounds %struct.lua_TValue, ptr %27, i32 0, i32 0
  %28 = load ptr, ptr %value17, align 8
  %29 = load ptr, ptr %L.addr, align 8
  %top18 = getelementptr inbounds %struct.lua_State, ptr %29, i32 0, i32 4
  %30 = load ptr, ptr %top18, align 8
  %value19 = getelementptr inbounds %struct.lua_TValue, ptr %30, i32 0, i32 0
  %31 = load ptr, ptr %value19, align 8
  call void @luaC_barrierf(ptr noundef %26, ptr noundef %28, ptr noundef %31)
  br label %if.end

if.end:                                           ; preds = %if.then16, %land.lhs.true10, %land.lhs.true, %if.then
  br label %if.end20

if.end20:                                         ; preds = %if.end, %entry
  %32 = load ptr, ptr %name, align 8
  ret ptr %32
}

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { nocallback nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 14, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"clang version 17.0.6 (https://github.com/llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
