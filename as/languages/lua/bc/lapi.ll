; ModuleID = '/Users/ivn/Projects/stream/as_proto/cmake-build-debug/as/languages/lua/lapi.bc'
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
define void @luaA_pushobject(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.lua_State, ptr %8, i32 0, i32 4
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %6, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = getelementptr inbounds %struct.lua_TValue, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %12, ptr align 8 %14, i64 8, i1 false)
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.lua_TValue, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds %struct.lua_TValue, ptr %18, i32 0, i32 1
  store i32 %17, ptr %19, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.lua_State, ptr %21, i32 0, i32 4
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr inbounds %struct.lua_TValue, ptr %23, i32 1
  store ptr %24, ptr %22, align 8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_checkstack(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp sgt i32 %6, 8000
  br i1 %7, label %23, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.lua_State, ptr %9, i32 0, i32 4
  %11 = load ptr, ptr %10, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.lua_State, ptr %12, i32 0, i32 5
  %14 = load ptr, ptr %13, align 8
  %15 = ptrtoint ptr %11 to i64
  %16 = ptrtoint ptr %14 to i64
  %17 = sub i64 %15, %16
  %18 = sdiv exact i64 %17, 16
  %19 = load i32, ptr %4, align 4
  %20 = sext i32 %19 to i64
  %21 = add nsw i64 %18, %20
  %22 = icmp sgt i64 %21, 8000
  br i1 %22, label %23, label %24

23:                                               ; preds = %8, %2
  store i32 0, ptr %5, align 4
  br label %71

24:                                               ; preds = %8
  %25 = load i32, ptr %4, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %70

27:                                               ; preds = %24
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds %struct.lua_State, ptr %28, i32 0, i32 9
  %30 = load ptr, ptr %29, align 8
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds %struct.lua_State, ptr %31, i32 0, i32 4
  %33 = load ptr, ptr %32, align 8
  %34 = ptrtoint ptr %30 to i64
  %35 = ptrtoint ptr %33 to i64
  %36 = sub i64 %34, %35
  %37 = load i32, ptr %4, align 4
  %38 = mul nsw i32 %37, 16
  %39 = sext i32 %38 to i64
  %40 = icmp sle i64 %36, %39
  br i1 %40, label %41, label %44

41:                                               ; preds = %27
  %42 = load ptr, ptr %3, align 8
  %43 = load i32, ptr %4, align 4
  call void @luaD_growstack(ptr noundef %42, i32 noundef %43)
  br label %45

44:                                               ; preds = %27
  br label %45

45:                                               ; preds = %44, %41
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds %struct.lua_State, ptr %46, i32 0, i32 7
  %48 = load ptr, ptr %47, align 8
  %49 = getelementptr inbounds %struct.CallInfo, ptr %48, i32 0, i32 2
  %50 = load ptr, ptr %49, align 8
  %51 = load ptr, ptr %3, align 8
  %52 = getelementptr inbounds %struct.lua_State, ptr %51, i32 0, i32 4
  %53 = load ptr, ptr %52, align 8
  %54 = load i32, ptr %4, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds %struct.lua_TValue, ptr %53, i64 %55
  %57 = icmp ult ptr %50, %56
  br i1 %57, label %58, label %69

58:                                               ; preds = %45
  %59 = load ptr, ptr %3, align 8
  %60 = getelementptr inbounds %struct.lua_State, ptr %59, i32 0, i32 4
  %61 = load ptr, ptr %60, align 8
  %62 = load i32, ptr %4, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds %struct.lua_TValue, ptr %61, i64 %63
  %65 = load ptr, ptr %3, align 8
  %66 = getelementptr inbounds %struct.lua_State, ptr %65, i32 0, i32 7
  %67 = load ptr, ptr %66, align 8
  %68 = getelementptr inbounds %struct.CallInfo, ptr %67, i32 0, i32 2
  store ptr %64, ptr %68, align 8
  br label %69

69:                                               ; preds = %58, %45
  br label %70

70:                                               ; preds = %69, %24
  br label %71

71:                                               ; preds = %70, %23
  %72 = load i32, ptr %5, align 4
  ret i32 %72
}

declare void @luaD_growstack(ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_xmove(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = icmp eq ptr %11, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %3
  br label %52

15:                                               ; preds = %3
  %16 = load ptr, ptr %4, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = load ptr, ptr %4, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.lua_State, ptr %19, i32 0, i32 4
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %7, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds %struct.lua_State, ptr %22, i32 0, i32 4
  %24 = load ptr, ptr %23, align 8
  %25 = load i32, ptr %6, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds %struct.lua_TValue, ptr %24, i64 %26
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds %struct.lua_State, ptr %28, i32 0, i32 4
  store ptr %27, ptr %29, align 8
  store ptr %27, ptr %8, align 8
  br label %30

30:                                               ; preds = %34, %15
  %31 = load i32, ptr %6, align 4
  %32 = add nsw i32 %31, -1
  store i32 %32, ptr %6, align 4
  %33 = icmp sge i32 %32, 0
  br i1 %33, label %34, label %48

34:                                               ; preds = %30
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr inbounds %struct.lua_TValue, ptr %35, i32 -1
  store ptr %36, ptr %7, align 8
  store ptr %36, ptr %9, align 8
  %37 = load ptr, ptr %8, align 8
  %38 = getelementptr inbounds %struct.lua_TValue, ptr %37, i32 -1
  store ptr %38, ptr %8, align 8
  store ptr %38, ptr %10, align 8
  %39 = load ptr, ptr %10, align 8
  %40 = getelementptr inbounds %struct.lua_TValue, ptr %39, i32 0, i32 0
  %41 = load ptr, ptr %9, align 8
  %42 = getelementptr inbounds %struct.lua_TValue, ptr %41, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %40, ptr align 8 %42, i64 8, i1 false)
  %43 = load ptr, ptr %9, align 8
  %44 = getelementptr inbounds %struct.lua_TValue, ptr %43, i32 0, i32 1
  %45 = load i32, ptr %44, align 8
  %46 = load ptr, ptr %10, align 8
  %47 = getelementptr inbounds %struct.lua_TValue, ptr %46, i32 0, i32 1
  store i32 %45, ptr %47, align 8
  br label %30, !llvm.loop !6

48:                                               ; preds = %30
  %49 = load ptr, ptr %7, align 8
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds %struct.lua_State, ptr %50, i32 0, i32 4
  store ptr %49, ptr %51, align 8
  br label %52

52:                                               ; preds = %48, %14
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_atpanic(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.lua_State, ptr %6, i32 0, i32 6
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds %struct.global_State, ptr %8, i32 0, i32 21
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.lua_State, ptr %12, i32 0, i32 6
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %struct.global_State, ptr %14, i32 0, i32 21
  store ptr %11, ptr %15, align 8
  %16 = load ptr, ptr %5, align 8
  ret ptr %16
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_newthread(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.lua_State, ptr %6, i32 0, i32 6
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds %struct.global_State, ptr %8, i32 0, i32 15
  %10 = load i64, ptr %9, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.lua_State, ptr %11, i32 0, i32 6
  %13 = load ptr, ptr %12, align 8
  %14 = getelementptr inbounds %struct.global_State, ptr %13, i32 0, i32 14
  %15 = load i64, ptr %14, align 8
  %16 = icmp uge i64 %10, %15
  br i1 %16, label %17, label %19

17:                                               ; preds = %1
  %18 = load ptr, ptr %2, align 8
  call void @luaC_step(ptr noundef %18)
  br label %19

19:                                               ; preds = %17, %1
  %20 = load ptr, ptr %2, align 8
  %21 = call ptr @luaE_newthread(ptr noundef %20)
  store ptr %21, ptr %3, align 8
  %22 = load ptr, ptr %3, align 8
  store ptr %22, ptr %4, align 8
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.lua_State, ptr %23, i32 0, i32 4
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %5, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds %struct.lua_TValue, ptr %27, i32 0, i32 0
  store ptr %26, ptr %28, align 8
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds %struct.lua_TValue, ptr %29, i32 0, i32 1
  store i32 8, ptr %30, align 8
  %31 = load ptr, ptr %2, align 8
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds %struct.lua_State, ptr %32, i32 0, i32 4
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds %struct.lua_TValue, ptr %34, i32 1
  store ptr %35, ptr %33, align 8
  %36 = load ptr, ptr %3, align 8
  %37 = getelementptr inbounds ptr, ptr %36, i64 -1
  store ptr null, ptr %37, align 8
  %38 = load ptr, ptr %3, align 8
  ret ptr %38
}

declare void @luaC_step(ptr noundef) #2

declare ptr @luaE_newthread(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_gettop(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 4
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.lua_State, ptr %6, i32 0, i32 5
  %8 = load ptr, ptr %7, align 8
  %9 = ptrtoint ptr %5 to i64
  %10 = ptrtoint ptr %8 to i64
  %11 = sub i64 %9, %10
  %12 = sdiv exact i64 %11, 16
  %13 = trunc i64 %12 to i32
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_settop(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = icmp sge i32 %5, 0
  br i1 %6, label %7, label %35

7:                                                ; preds = %2
  %8 = load ptr, ptr %3, align 8
  br label %9

9:                                                ; preds = %20, %7
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.lua_State, ptr %10, i32 0, i32 4
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.lua_State, ptr %13, i32 0, i32 5
  %15 = load ptr, ptr %14, align 8
  %16 = load i32, ptr %4, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.lua_TValue, ptr %15, i64 %17
  %19 = icmp ult ptr %12, %18
  br i1 %19, label %20, label %26

20:                                               ; preds = %9
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.lua_State, ptr %21, i32 0, i32 4
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr inbounds %struct.lua_TValue, ptr %23, i32 1
  store ptr %24, ptr %22, align 8
  %25 = getelementptr inbounds %struct.lua_TValue, ptr %23, i32 0, i32 1
  store i32 0, ptr %25, align 8
  br label %9, !llvm.loop !8

26:                                               ; preds = %9
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds %struct.lua_State, ptr %27, i32 0, i32 5
  %29 = load ptr, ptr %28, align 8
  %30 = load i32, ptr %4, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds %struct.lua_TValue, ptr %29, i64 %31
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds %struct.lua_State, ptr %33, i32 0, i32 4
  store ptr %32, ptr %34, align 8
  br label %44

35:                                               ; preds = %2
  %36 = load ptr, ptr %3, align 8
  %37 = load i32, ptr %4, align 4
  %38 = add nsw i32 %37, 1
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds %struct.lua_State, ptr %39, i32 0, i32 4
  %41 = load ptr, ptr %40, align 8
  %42 = sext i32 %38 to i64
  %43 = getelementptr inbounds %struct.lua_TValue, ptr %41, i64 %42
  store ptr %43, ptr %40, align 8
  br label %44

44:                                               ; preds = %35, %26
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_remove(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = load i32, ptr %4, align 4
  %10 = call ptr @index2adr(ptr noundef %8, i32 noundef %9)
  store ptr %10, ptr %5, align 8
  %11 = load ptr, ptr %3, align 8
  br label %12

12:                                               ; preds = %19, %2
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 1
  store ptr %14, ptr %5, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.lua_State, ptr %15, i32 0, i32 4
  %17 = load ptr, ptr %16, align 8
  %18 = icmp ult ptr %14, %17
  br i1 %18, label %19, label %32

19:                                               ; preds = %12
  %20 = load ptr, ptr %5, align 8
  store ptr %20, ptr %6, align 8
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds %struct.lua_TValue, ptr %21, i64 -1
  store ptr %22, ptr %7, align 8
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr inbounds %struct.lua_TValue, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds %struct.lua_TValue, ptr %25, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %24, ptr align 8 %26, i64 8, i1 false)
  %27 = load ptr, ptr %6, align 8
  %28 = getelementptr inbounds %struct.lua_TValue, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %28, align 8
  %30 = load ptr, ptr %7, align 8
  %31 = getelementptr inbounds %struct.lua_TValue, ptr %30, i32 0, i32 1
  store i32 %29, ptr %31, align 8
  br label %12, !llvm.loop !9

32:                                               ; preds = %12
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds %struct.lua_State, ptr %33, i32 0, i32 4
  %35 = load ptr, ptr %34, align 8
  %36 = getelementptr inbounds %struct.lua_TValue, ptr %35, i32 -1
  store ptr %36, ptr %34, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @index2adr(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %11 = load i32, ptr %5, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %30

13:                                               ; preds = %2
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.lua_State, ptr %14, i32 0, i32 5
  %16 = load ptr, ptr %15, align 8
  %17 = load i32, ptr %5, align 4
  %18 = sub nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %struct.lua_TValue, ptr %16, i64 %19
  store ptr %20, ptr %6, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.lua_State, ptr %23, i32 0, i32 4
  %25 = load ptr, ptr %24, align 8
  %26 = icmp uge ptr %22, %25
  br i1 %26, label %27, label %28

27:                                               ; preds = %13
  store ptr @luaO_nilobject_, ptr %3, align 8
  br label %97

28:                                               ; preds = %13
  %29 = load ptr, ptr %6, align 8
  store ptr %29, ptr %3, align 8
  br label %97

30:                                               ; preds = %2
  %31 = load i32, ptr %5, align 4
  %32 = icmp sgt i32 %31, -10000
  br i1 %32, label %33, label %41

33:                                               ; preds = %30
  %34 = load ptr, ptr %4, align 8
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds %struct.lua_State, ptr %35, i32 0, i32 4
  %37 = load ptr, ptr %36, align 8
  %38 = load i32, ptr %5, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds %struct.lua_TValue, ptr %37, i64 %39
  store ptr %40, ptr %3, align 8
  br label %97

41:                                               ; preds = %30
  %42 = load i32, ptr %5, align 4
  switch i32 %42, label %71 [
    i32 -10000, label %43
    i32 -10001, label %48
    i32 -10002, label %68
  ]

43:                                               ; preds = %41
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds %struct.lua_State, ptr %44, i32 0, i32 6
  %46 = load ptr, ptr %45, align 8
  %47 = getelementptr inbounds %struct.global_State, ptr %46, i32 0, i32 22
  store ptr %47, ptr %3, align 8
  br label %97

48:                                               ; preds = %41
  %49 = load ptr, ptr %4, align 8
  %50 = getelementptr inbounds %struct.lua_State, ptr %49, i32 0, i32 7
  %51 = load ptr, ptr %50, align 8
  %52 = getelementptr inbounds %struct.CallInfo, ptr %51, i32 0, i32 1
  %53 = load ptr, ptr %52, align 8
  %54 = getelementptr inbounds %struct.lua_TValue, ptr %53, i32 0, i32 0
  %55 = load ptr, ptr %54, align 8
  store ptr %55, ptr %7, align 8
  %56 = load ptr, ptr %7, align 8
  %57 = getelementptr inbounds %struct.CClosure, ptr %56, i32 0, i32 6
  %58 = load ptr, ptr %57, align 8
  store ptr %58, ptr %8, align 8
  %59 = load ptr, ptr %4, align 8
  %60 = getelementptr inbounds %struct.lua_State, ptr %59, i32 0, i32 22
  store ptr %60, ptr %9, align 8
  %61 = load ptr, ptr %8, align 8
  %62 = load ptr, ptr %9, align 8
  %63 = getelementptr inbounds %struct.lua_TValue, ptr %62, i32 0, i32 0
  store ptr %61, ptr %63, align 8
  %64 = load ptr, ptr %9, align 8
  %65 = getelementptr inbounds %struct.lua_TValue, ptr %64, i32 0, i32 1
  store i32 5, ptr %65, align 8
  %66 = load ptr, ptr %4, align 8
  %67 = getelementptr inbounds %struct.lua_State, ptr %66, i32 0, i32 22
  store ptr %67, ptr %3, align 8
  br label %97

68:                                               ; preds = %41
  %69 = load ptr, ptr %4, align 8
  %70 = getelementptr inbounds %struct.lua_State, ptr %69, i32 0, i32 21
  store ptr %70, ptr %3, align 8
  br label %97

71:                                               ; preds = %41
  %72 = load ptr, ptr %4, align 8
  %73 = getelementptr inbounds %struct.lua_State, ptr %72, i32 0, i32 7
  %74 = load ptr, ptr %73, align 8
  %75 = getelementptr inbounds %struct.CallInfo, ptr %74, i32 0, i32 1
  %76 = load ptr, ptr %75, align 8
  %77 = getelementptr inbounds %struct.lua_TValue, ptr %76, i32 0, i32 0
  %78 = load ptr, ptr %77, align 8
  store ptr %78, ptr %10, align 8
  %79 = load i32, ptr %5, align 4
  %80 = sub nsw i32 -10002, %79
  store i32 %80, ptr %5, align 4
  %81 = load i32, ptr %5, align 4
  %82 = load ptr, ptr %10, align 8
  %83 = getelementptr inbounds %struct.CClosure, ptr %82, i32 0, i32 4
  %84 = load i8, ptr %83, align 1
  %85 = zext i8 %84 to i32
  %86 = icmp sle i32 %81, %85
  br i1 %86, label %87, label %94

87:                                               ; preds = %71
  %88 = load ptr, ptr %10, align 8
  %89 = getelementptr inbounds %struct.CClosure, ptr %88, i32 0, i32 9
  %90 = load i32, ptr %5, align 4
  %91 = sub nsw i32 %90, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [1 x %struct.lua_TValue], ptr %89, i64 0, i64 %92
  br label %95

94:                                               ; preds = %71
  br label %95

95:                                               ; preds = %94, %87
  %96 = phi ptr [ %93, %87 ], [ @luaO_nilobject_, %94 ]
  store ptr %96, ptr %3, align 8
  br label %97

97:                                               ; preds = %95, %68, %48, %43, %33, %28, %27
  %98 = load ptr, ptr %3, align 8
  ret ptr %98
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_insert(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = load i32, ptr %4, align 4
  %13 = call ptr @index2adr(ptr noundef %11, i32 noundef %12)
  store ptr %13, ptr %5, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.lua_State, ptr %15, i32 0, i32 4
  %17 = load ptr, ptr %16, align 8
  store ptr %17, ptr %6, align 8
  br label %18

18:                                               ; preds = %35, %2
  %19 = load ptr, ptr %6, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = icmp ugt ptr %19, %20
  br i1 %21, label %22, label %38

22:                                               ; preds = %18
  %23 = load ptr, ptr %6, align 8
  %24 = getelementptr inbounds %struct.lua_TValue, ptr %23, i64 -1
  store ptr %24, ptr %7, align 8
  %25 = load ptr, ptr %6, align 8
  store ptr %25, ptr %8, align 8
  %26 = load ptr, ptr %8, align 8
  %27 = getelementptr inbounds %struct.lua_TValue, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %7, align 8
  %29 = getelementptr inbounds %struct.lua_TValue, ptr %28, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %27, ptr align 8 %29, i64 8, i1 false)
  %30 = load ptr, ptr %7, align 8
  %31 = getelementptr inbounds %struct.lua_TValue, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 8
  %33 = load ptr, ptr %8, align 8
  %34 = getelementptr inbounds %struct.lua_TValue, ptr %33, i32 0, i32 1
  store i32 %32, ptr %34, align 8
  br label %35

35:                                               ; preds = %22
  %36 = load ptr, ptr %6, align 8
  %37 = getelementptr inbounds %struct.lua_TValue, ptr %36, i32 -1
  store ptr %37, ptr %6, align 8
  br label %18, !llvm.loop !10

38:                                               ; preds = %18
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds %struct.lua_State, ptr %39, i32 0, i32 4
  %41 = load ptr, ptr %40, align 8
  store ptr %41, ptr %9, align 8
  %42 = load ptr, ptr %5, align 8
  store ptr %42, ptr %10, align 8
  %43 = load ptr, ptr %10, align 8
  %44 = getelementptr inbounds %struct.lua_TValue, ptr %43, i32 0, i32 0
  %45 = load ptr, ptr %9, align 8
  %46 = getelementptr inbounds %struct.lua_TValue, ptr %45, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %44, ptr align 8 %46, i64 8, i1 false)
  %47 = load ptr, ptr %9, align 8
  %48 = getelementptr inbounds %struct.lua_TValue, ptr %47, i32 0, i32 1
  %49 = load i32, ptr %48, align 8
  %50 = load ptr, ptr %10, align 8
  %51 = getelementptr inbounds %struct.lua_TValue, ptr %50, i32 0, i32 1
  store i32 %49, ptr %51, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_replace(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp eq i32 %9, -10001
  br i1 %10, label %11, label %21

11:                                               ; preds = %2
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.lua_State, ptr %12, i32 0, i32 7
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.lua_State, ptr %15, i32 0, i32 12
  %17 = load ptr, ptr %16, align 8
  %18 = icmp eq ptr %14, %17
  br i1 %18, label %19, label %21

19:                                               ; preds = %11
  %20 = load ptr, ptr %3, align 8
  call void (ptr, ptr, ...) @luaG_runerror(ptr noundef %20, ptr noundef @.str)
  br label %21

21:                                               ; preds = %19, %11, %2
  %22 = load ptr, ptr %3, align 8
  %23 = load ptr, ptr %3, align 8
  %24 = load i32, ptr %4, align 4
  %25 = call ptr @index2adr(ptr noundef %23, i32 noundef %24)
  store ptr %25, ptr %5, align 8
  %26 = load ptr, ptr %3, align 8
  %27 = load i32, ptr %4, align 4
  %28 = icmp eq i32 %27, -10001
  br i1 %28, label %29, label %82

29:                                               ; preds = %21
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds %struct.lua_State, ptr %30, i32 0, i32 7
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds %struct.CallInfo, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds %struct.lua_TValue, ptr %34, i32 0, i32 0
  %36 = load ptr, ptr %35, align 8
  store ptr %36, ptr %6, align 8
  %37 = load ptr, ptr %3, align 8
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds %struct.lua_State, ptr %38, i32 0, i32 4
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds %struct.lua_TValue, ptr %40, i64 -1
  %42 = getelementptr inbounds %struct.lua_TValue, ptr %41, i32 0, i32 0
  %43 = load ptr, ptr %42, align 8
  %44 = load ptr, ptr %6, align 8
  %45 = getelementptr inbounds %struct.CClosure, ptr %44, i32 0, i32 6
  store ptr %43, ptr %45, align 8
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds %struct.lua_State, ptr %46, i32 0, i32 4
  %48 = load ptr, ptr %47, align 8
  %49 = getelementptr inbounds %struct.lua_TValue, ptr %48, i64 -1
  %50 = getelementptr inbounds %struct.lua_TValue, ptr %49, i32 0, i32 1
  %51 = load i32, ptr %50, align 8
  %52 = icmp sge i32 %51, 4
  br i1 %52, label %53, label %81

53:                                               ; preds = %29
  %54 = load ptr, ptr %3, align 8
  %55 = getelementptr inbounds %struct.lua_State, ptr %54, i32 0, i32 4
  %56 = load ptr, ptr %55, align 8
  %57 = getelementptr inbounds %struct.lua_TValue, ptr %56, i64 -1
  %58 = getelementptr inbounds %struct.lua_TValue, ptr %57, i32 0, i32 0
  %59 = load ptr, ptr %58, align 8
  %60 = getelementptr inbounds %struct.GCheader, ptr %59, i32 0, i32 2
  %61 = load i8, ptr %60, align 1
  %62 = zext i8 %61 to i32
  %63 = and i32 %62, 3
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %81

65:                                               ; preds = %53
  %66 = load ptr, ptr %6, align 8
  %67 = getelementptr inbounds %struct.GCheader, ptr %66, i32 0, i32 2
  %68 = load i8, ptr %67, align 1
  %69 = zext i8 %68 to i32
  %70 = and i32 %69, 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %81

72:                                               ; preds = %65
  %73 = load ptr, ptr %3, align 8
  %74 = load ptr, ptr %6, align 8
  %75 = load ptr, ptr %3, align 8
  %76 = getelementptr inbounds %struct.lua_State, ptr %75, i32 0, i32 4
  %77 = load ptr, ptr %76, align 8
  %78 = getelementptr inbounds %struct.lua_TValue, ptr %77, i64 -1
  %79 = getelementptr inbounds %struct.lua_TValue, ptr %78, i32 0, i32 0
  %80 = load ptr, ptr %79, align 8
  call void @luaC_barrierf(ptr noundef %73, ptr noundef %74, ptr noundef %80)
  br label %81

81:                                               ; preds = %72, %65, %53, %29
  br label %149

82:                                               ; preds = %21
  %83 = load ptr, ptr %3, align 8
  %84 = getelementptr inbounds %struct.lua_State, ptr %83, i32 0, i32 4
  %85 = load ptr, ptr %84, align 8
  %86 = getelementptr inbounds %struct.lua_TValue, ptr %85, i64 -1
  store ptr %86, ptr %7, align 8
  %87 = load ptr, ptr %5, align 8
  store ptr %87, ptr %8, align 8
  %88 = load ptr, ptr %8, align 8
  %89 = getelementptr inbounds %struct.lua_TValue, ptr %88, i32 0, i32 0
  %90 = load ptr, ptr %7, align 8
  %91 = getelementptr inbounds %struct.lua_TValue, ptr %90, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %89, ptr align 8 %91, i64 8, i1 false)
  %92 = load ptr, ptr %7, align 8
  %93 = getelementptr inbounds %struct.lua_TValue, ptr %92, i32 0, i32 1
  %94 = load i32, ptr %93, align 8
  %95 = load ptr, ptr %8, align 8
  %96 = getelementptr inbounds %struct.lua_TValue, ptr %95, i32 0, i32 1
  store i32 %94, ptr %96, align 8
  %97 = load i32, ptr %4, align 4
  %98 = icmp slt i32 %97, -10002
  br i1 %98, label %99, label %148

99:                                               ; preds = %82
  %100 = load ptr, ptr %3, align 8
  %101 = getelementptr inbounds %struct.lua_State, ptr %100, i32 0, i32 4
  %102 = load ptr, ptr %101, align 8
  %103 = getelementptr inbounds %struct.lua_TValue, ptr %102, i64 -1
  %104 = getelementptr inbounds %struct.lua_TValue, ptr %103, i32 0, i32 1
  %105 = load i32, ptr %104, align 8
  %106 = icmp sge i32 %105, 4
  br i1 %106, label %107, label %147

107:                                              ; preds = %99
  %108 = load ptr, ptr %3, align 8
  %109 = getelementptr inbounds %struct.lua_State, ptr %108, i32 0, i32 4
  %110 = load ptr, ptr %109, align 8
  %111 = getelementptr inbounds %struct.lua_TValue, ptr %110, i64 -1
  %112 = getelementptr inbounds %struct.lua_TValue, ptr %111, i32 0, i32 0
  %113 = load ptr, ptr %112, align 8
  %114 = getelementptr inbounds %struct.GCheader, ptr %113, i32 0, i32 2
  %115 = load i8, ptr %114, align 1
  %116 = zext i8 %115 to i32
  %117 = and i32 %116, 3
  %118 = icmp ne i32 %117, 0
  br i1 %118, label %119, label %147

119:                                              ; preds = %107
  %120 = load ptr, ptr %3, align 8
  %121 = getelementptr inbounds %struct.lua_State, ptr %120, i32 0, i32 7
  %122 = load ptr, ptr %121, align 8
  %123 = getelementptr inbounds %struct.CallInfo, ptr %122, i32 0, i32 1
  %124 = load ptr, ptr %123, align 8
  %125 = getelementptr inbounds %struct.lua_TValue, ptr %124, i32 0, i32 0
  %126 = load ptr, ptr %125, align 8
  %127 = getelementptr inbounds %struct.GCheader, ptr %126, i32 0, i32 2
  %128 = load i8, ptr %127, align 1
  %129 = zext i8 %128 to i32
  %130 = and i32 %129, 4
  %131 = icmp ne i32 %130, 0
  br i1 %131, label %132, label %147

132:                                              ; preds = %119
  %133 = load ptr, ptr %3, align 8
  %134 = load ptr, ptr %3, align 8
  %135 = getelementptr inbounds %struct.lua_State, ptr %134, i32 0, i32 7
  %136 = load ptr, ptr %135, align 8
  %137 = getelementptr inbounds %struct.CallInfo, ptr %136, i32 0, i32 1
  %138 = load ptr, ptr %137, align 8
  %139 = getelementptr inbounds %struct.lua_TValue, ptr %138, i32 0, i32 0
  %140 = load ptr, ptr %139, align 8
  %141 = load ptr, ptr %3, align 8
  %142 = getelementptr inbounds %struct.lua_State, ptr %141, i32 0, i32 4
  %143 = load ptr, ptr %142, align 8
  %144 = getelementptr inbounds %struct.lua_TValue, ptr %143, i64 -1
  %145 = getelementptr inbounds %struct.lua_TValue, ptr %144, i32 0, i32 0
  %146 = load ptr, ptr %145, align 8
  call void @luaC_barrierf(ptr noundef %133, ptr noundef %140, ptr noundef %146)
  br label %147

147:                                              ; preds = %132, %119, %107, %99
  br label %148

148:                                              ; preds = %147, %82
  br label %149

149:                                              ; preds = %148, %81
  %150 = load ptr, ptr %3, align 8
  %151 = getelementptr inbounds %struct.lua_State, ptr %150, i32 0, i32 4
  %152 = load ptr, ptr %151, align 8
  %153 = getelementptr inbounds %struct.lua_TValue, ptr %152, i32 -1
  store ptr %153, ptr %151, align 8
  ret void
}

declare void @luaG_runerror(ptr noundef, ptr noundef, ...) #2

declare void @luaC_barrierf(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushvalue(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = load i32, ptr %4, align 4
  %9 = call ptr @index2adr(ptr noundef %7, i32 noundef %8)
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.lua_State, ptr %10, i32 0, i32 4
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %6, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.lua_TValue, ptr %15, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %14, ptr align 8 %16, i64 8, i1 false)
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.lua_TValue, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 8
  %20 = load ptr, ptr %6, align 8
  %21 = getelementptr inbounds %struct.lua_TValue, ptr %20, i32 0, i32 1
  store i32 %19, ptr %21, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.lua_State, ptr %23, i32 0, i32 4
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %struct.lua_TValue, ptr %25, i32 1
  store ptr %26, ptr %24, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_type(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  %8 = call ptr @index2adr(ptr noundef %6, i32 noundef %7)
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = icmp eq ptr %9, @luaO_nilobject_
  br i1 %10, label %11, label %12

11:                                               ; preds = %2
  br label %16

12:                                               ; preds = %2
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 8
  br label %16

16:                                               ; preds = %12, %11
  %17 = phi i32 [ -1, %11 ], [ %15, %12 ]
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_typename(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  %7 = icmp eq i32 %6, -1
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  br label %14

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [0 x ptr], ptr @luaT_typenames, i64 0, i64 %11
  %13 = load ptr, ptr %12, align 8
  br label %14

14:                                               ; preds = %9, %8
  %15 = phi ptr [ @.str.1, %8 ], [ %13, %9 ]
  ret ptr %15
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_iscfunction(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  %8 = call ptr @index2adr(ptr noundef %6, i32 noundef %7)
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 8
  %12 = icmp eq i32 %11, 6
  br i1 %12, label %13, label %21

13:                                               ; preds = %2
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.CClosure, ptr %16, i32 0, i32 3
  %18 = load i8, ptr %17, align 2
  %19 = zext i8 %18 to i32
  %20 = icmp ne i32 %19, 0
  br label %21

21:                                               ; preds = %13, %2
  %22 = phi i1 [ false, %2 ], [ %20, %13 ]
  %23 = zext i1 %22 to i32
  ret i32 %23
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_isnumber(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.lua_TValue, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = load i32, ptr %4, align 4
  %9 = call ptr @index2adr(ptr noundef %7, i32 noundef %8)
  store ptr %9, ptr %6, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 3
  br i1 %13, label %18, label %14

14:                                               ; preds = %2
  %15 = load ptr, ptr %6, align 8
  %16 = call ptr @luaV_tonumber(ptr noundef %15, ptr noundef %5)
  store ptr %16, ptr %6, align 8
  %17 = icmp ne ptr %16, null
  br label %18

18:                                               ; preds = %14, %2
  %19 = phi i1 [ true, %2 ], [ %17, %14 ]
  %20 = zext i1 %19 to i32
  ret i32 %20
}

declare ptr @luaV_tonumber(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_isstring(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  %8 = call i32 @lua_type(ptr noundef %6, i32 noundef %7)
  store i32 %8, ptr %5, align 4
  %9 = load i32, ptr %5, align 4
  %10 = icmp eq i32 %9, 4
  br i1 %10, label %14, label %11

11:                                               ; preds = %2
  %12 = load i32, ptr %5, align 4
  %13 = icmp eq i32 %12, 3
  br label %14

14:                                               ; preds = %11, %2
  %15 = phi i1 [ true, %2 ], [ %13, %11 ]
  %16 = zext i1 %15 to i32
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_isuserdata(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  %8 = call ptr @index2adr(ptr noundef %6, i32 noundef %7)
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 8
  %12 = icmp eq i32 %11, 7
  br i1 %12, label %18, label %13

13:                                               ; preds = %2
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 1
  %16 = load i32, ptr %15, align 8
  %17 = icmp eq i32 %16, 2
  br label %18

18:                                               ; preds = %13, %2
  %19 = phi i1 [ true, %2 ], [ %17, %13 ]
  %20 = zext i1 %19 to i32
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_rawequal(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = load i32, ptr %5, align 4
  %11 = call ptr @index2adr(ptr noundef %9, i32 noundef %10)
  store ptr %11, ptr %7, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = load i32, ptr %6, align 4
  %14 = call ptr @index2adr(ptr noundef %12, i32 noundef %13)
  store ptr %14, ptr %8, align 8
  %15 = load ptr, ptr %7, align 8
  %16 = icmp eq ptr %15, @luaO_nilobject_
  br i1 %16, label %20, label %17

17:                                               ; preds = %3
  %18 = load ptr, ptr %8, align 8
  %19 = icmp eq ptr %18, @luaO_nilobject_
  br i1 %19, label %20, label %21

20:                                               ; preds = %17, %3
  br label %25

21:                                               ; preds = %17
  %22 = load ptr, ptr %7, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = call i32 @luaO_rawequalObj(ptr noundef %22, ptr noundef %23)
  br label %25

25:                                               ; preds = %21, %20
  %26 = phi i32 [ 0, %20 ], [ %24, %21 ]
  ret i32 %26
}

declare i32 @luaO_rawequalObj(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_equal(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %10 = load ptr, ptr %4, align 8
  %11 = load i32, ptr %5, align 4
  %12 = call ptr @index2adr(ptr noundef %10, i32 noundef %11)
  store ptr %12, ptr %7, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = load i32, ptr %6, align 4
  %15 = call ptr @index2adr(ptr noundef %13, i32 noundef %14)
  store ptr %15, ptr %8, align 8
  %16 = load ptr, ptr %7, align 8
  %17 = icmp eq ptr %16, @luaO_nilobject_
  br i1 %17, label %21, label %18

18:                                               ; preds = %3
  %19 = load ptr, ptr %8, align 8
  %20 = icmp eq ptr %19, @luaO_nilobject_
  br i1 %20, label %21, label %22

21:                                               ; preds = %18, %3
  br label %39

22:                                               ; preds = %18
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr inbounds %struct.lua_TValue, ptr %23, i32 0, i32 1
  %25 = load i32, ptr %24, align 8
  %26 = load ptr, ptr %8, align 8
  %27 = getelementptr inbounds %struct.lua_TValue, ptr %26, i32 0, i32 1
  %28 = load i32, ptr %27, align 8
  %29 = icmp eq i32 %25, %28
  br i1 %29, label %30, label %36

30:                                               ; preds = %22
  %31 = load ptr, ptr %4, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = load ptr, ptr %8, align 8
  %34 = call i32 @luaV_equalval(ptr noundef %31, ptr noundef %32, ptr noundef %33)
  %35 = icmp ne i32 %34, 0
  br label %36

36:                                               ; preds = %30, %22
  %37 = phi i1 [ false, %22 ], [ %35, %30 ]
  %38 = zext i1 %37 to i32
  br label %39

39:                                               ; preds = %36, %21
  %40 = phi i32 [ 0, %21 ], [ %38, %36 ]
  store i32 %40, ptr %9, align 4
  %41 = load i32, ptr %9, align 4
  ret i32 %41
}

declare i32 @luaV_equalval(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_lessthan(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %10 = load ptr, ptr %4, align 8
  %11 = load i32, ptr %5, align 4
  %12 = call ptr @index2adr(ptr noundef %10, i32 noundef %11)
  store ptr %12, ptr %7, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = load i32, ptr %6, align 4
  %15 = call ptr @index2adr(ptr noundef %13, i32 noundef %14)
  store ptr %15, ptr %8, align 8
  %16 = load ptr, ptr %7, align 8
  %17 = icmp eq ptr %16, @luaO_nilobject_
  br i1 %17, label %21, label %18

18:                                               ; preds = %3
  %19 = load ptr, ptr %8, align 8
  %20 = icmp eq ptr %19, @luaO_nilobject_
  br i1 %20, label %21, label %22

21:                                               ; preds = %18, %3
  br label %27

22:                                               ; preds = %18
  %23 = load ptr, ptr %4, align 8
  %24 = load ptr, ptr %7, align 8
  %25 = load ptr, ptr %8, align 8
  %26 = call i32 @luaV_lessthan(ptr noundef %23, ptr noundef %24, ptr noundef %25)
  br label %27

27:                                               ; preds = %22, %21
  %28 = phi i32 [ 0, %21 ], [ %26, %22 ]
  store i32 %28, ptr %9, align 4
  %29 = load i32, ptr %9, align 4
  ret i32 %29
}

declare i32 @luaV_lessthan(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define double @lua_tonumber(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca double, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.lua_TValue, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = load i32, ptr %5, align 4
  %10 = call ptr @index2adr(ptr noundef %8, i32 noundef %9)
  store ptr %10, ptr %7, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = getelementptr inbounds %struct.lua_TValue, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 8
  %14 = icmp eq i32 %13, 3
  br i1 %14, label %19, label %15

15:                                               ; preds = %2
  %16 = load ptr, ptr %7, align 8
  %17 = call ptr @luaV_tonumber(ptr noundef %16, ptr noundef %6)
  store ptr %17, ptr %7, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %23

19:                                               ; preds = %15, %2
  %20 = load ptr, ptr %7, align 8
  %21 = getelementptr inbounds %struct.lua_TValue, ptr %20, i32 0, i32 0
  %22 = load double, ptr %21, align 8
  store double %22, ptr %3, align 8
  br label %24

23:                                               ; preds = %15
  store double 0.000000e+00, ptr %3, align 8
  br label %24

24:                                               ; preds = %23, %19
  %25 = load double, ptr %3, align 8
  ret double %25
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @lua_tointeger(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.lua_TValue, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca double, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %10 = load ptr, ptr %4, align 8
  %11 = load i32, ptr %5, align 4
  %12 = call ptr @index2adr(ptr noundef %10, i32 noundef %11)
  store ptr %12, ptr %7, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 8
  %16 = icmp eq i32 %15, 3
  br i1 %16, label %21, label %17

17:                                               ; preds = %2
  %18 = load ptr, ptr %7, align 8
  %19 = call ptr @luaV_tonumber(ptr noundef %18, ptr noundef %6)
  store ptr %19, ptr %7, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %28

21:                                               ; preds = %17, %2
  %22 = load ptr, ptr %7, align 8
  %23 = getelementptr inbounds %struct.lua_TValue, ptr %22, i32 0, i32 0
  %24 = load double, ptr %23, align 8
  store double %24, ptr %9, align 8
  %25 = load double, ptr %9, align 8
  %26 = fptosi double %25 to i64
  store i64 %26, ptr %8, align 8
  %27 = load i64, ptr %8, align 8
  store i64 %27, ptr %3, align 8
  br label %29

28:                                               ; preds = %17
  store i64 0, ptr %3, align 8
  br label %29

29:                                               ; preds = %28, %21
  %30 = load i64, ptr %3, align 8
  ret i64 %30
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_toboolean(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  %8 = call ptr @index2adr(ptr noundef %6, i32 noundef %7)
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %25, label %13

13:                                               ; preds = %2
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 1
  %16 = load i32, ptr %15, align 8
  %17 = icmp eq i32 %16, 1
  br i1 %17, label %18, label %23

18:                                               ; preds = %13
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds %struct.lua_TValue, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = icmp eq i32 %21, 0
  br label %23

23:                                               ; preds = %18, %13
  %24 = phi i1 [ false, %13 ], [ %22, %18 ]
  br label %25

25:                                               ; preds = %23, %2
  %26 = phi i1 [ true, %2 ], [ %24, %23 ]
  %27 = xor i1 %26, true
  %28 = zext i1 %27 to i32
  ret i32 %28
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_tolstring(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i32, ptr %6, align 4
  %11 = call ptr @index2adr(ptr noundef %9, i32 noundef %10)
  store ptr %11, ptr %8, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = getelementptr inbounds %struct.lua_TValue, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 8
  %15 = icmp eq i32 %14, 4
  br i1 %15, label %45, label %16

16:                                               ; preds = %3
  %17 = load ptr, ptr %5, align 8
  %18 = load ptr, ptr %8, align 8
  %19 = call i32 @luaV_tostring(ptr noundef %17, ptr noundef %18)
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %27, label %21

21:                                               ; preds = %16
  %22 = load ptr, ptr %7, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %26

24:                                               ; preds = %21
  %25 = load ptr, ptr %7, align 8
  store i64 0, ptr %25, align 8
  br label %26

26:                                               ; preds = %24, %21
  store ptr null, ptr %4, align 8
  br label %60

27:                                               ; preds = %16
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds %struct.lua_State, ptr %28, i32 0, i32 6
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds %struct.global_State, ptr %30, i32 0, i32 15
  %32 = load i64, ptr %31, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds %struct.lua_State, ptr %33, i32 0, i32 6
  %35 = load ptr, ptr %34, align 8
  %36 = getelementptr inbounds %struct.global_State, ptr %35, i32 0, i32 14
  %37 = load i64, ptr %36, align 8
  %38 = icmp uge i64 %32, %37
  br i1 %38, label %39, label %41

39:                                               ; preds = %27
  %40 = load ptr, ptr %5, align 8
  call void @luaC_step(ptr noundef %40)
  br label %41

41:                                               ; preds = %39, %27
  %42 = load ptr, ptr %5, align 8
  %43 = load i32, ptr %6, align 4
  %44 = call ptr @index2adr(ptr noundef %42, i32 noundef %43)
  store ptr %44, ptr %8, align 8
  br label %45

45:                                               ; preds = %41, %3
  %46 = load ptr, ptr %7, align 8
  %47 = icmp ne ptr %46, null
  br i1 %47, label %48, label %55

48:                                               ; preds = %45
  %49 = load ptr, ptr %8, align 8
  %50 = getelementptr inbounds %struct.lua_TValue, ptr %49, i32 0, i32 0
  %51 = load ptr, ptr %50, align 8
  %52 = getelementptr inbounds %struct.anon.0, ptr %51, i32 0, i32 5
  %53 = load i64, ptr %52, align 8
  %54 = load ptr, ptr %7, align 8
  store i64 %53, ptr %54, align 8
  br label %55

55:                                               ; preds = %48, %45
  %56 = load ptr, ptr %8, align 8
  %57 = getelementptr inbounds %struct.lua_TValue, ptr %56, i32 0, i32 0
  %58 = load ptr, ptr %57, align 8
  %59 = getelementptr inbounds %union.TString, ptr %58, i64 1
  store ptr %59, ptr %4, align 8
  br label %60

60:                                               ; preds = %55, %26
  %61 = load ptr, ptr %4, align 8
  ret ptr %61
}

declare i32 @luaV_tostring(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @lua_objlen(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = load i32, ptr %5, align 4
  %10 = call ptr @index2adr(ptr noundef %8, i32 noundef %9)
  store ptr %10, ptr %6, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = getelementptr inbounds %struct.lua_TValue, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 8
  switch i32 %13, label %47 [
    i32 4, label %14
    i32 7, label %20
    i32 5, label %26
    i32 3, label %32
  ]

14:                                               ; preds = %2
  %15 = load ptr, ptr %6, align 8
  %16 = getelementptr inbounds %struct.lua_TValue, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds %struct.anon.0, ptr %17, i32 0, i32 5
  %19 = load i64, ptr %18, align 8
  store i64 %19, ptr %3, align 8
  br label %48

20:                                               ; preds = %2
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds %struct.lua_TValue, ptr %21, i32 0, i32 0
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr inbounds %struct.anon.1, ptr %23, i32 0, i32 5
  %25 = load i64, ptr %24, align 8
  store i64 %25, ptr %3, align 8
  br label %48

26:                                               ; preds = %2
  %27 = load ptr, ptr %6, align 8
  %28 = getelementptr inbounds %struct.lua_TValue, ptr %27, i32 0, i32 0
  %29 = load ptr, ptr %28, align 8
  %30 = call i32 @luaH_getn(ptr noundef %29)
  %31 = sext i32 %30 to i64
  store i64 %31, ptr %3, align 8
  br label %48

32:                                               ; preds = %2
  %33 = load ptr, ptr %4, align 8
  %34 = load ptr, ptr %6, align 8
  %35 = call i32 @luaV_tostring(ptr noundef %33, ptr noundef %34)
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %43

37:                                               ; preds = %32
  %38 = load ptr, ptr %6, align 8
  %39 = getelementptr inbounds %struct.lua_TValue, ptr %38, i32 0, i32 0
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds %struct.anon.0, ptr %40, i32 0, i32 5
  %42 = load i64, ptr %41, align 8
  br label %44

43:                                               ; preds = %32
  br label %44

44:                                               ; preds = %43, %37
  %45 = phi i64 [ %42, %37 ], [ 0, %43 ]
  store i64 %45, ptr %7, align 8
  %46 = load i64, ptr %7, align 8
  store i64 %46, ptr %3, align 8
  br label %48

47:                                               ; preds = %2
  store i64 0, ptr %3, align 8
  br label %48

48:                                               ; preds = %47, %44, %26, %20, %14
  %49 = load i64, ptr %3, align 8
  ret i64 %49
}

declare i32 @luaH_getn(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_tocfunction(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  %8 = call ptr @index2adr(ptr noundef %6, i32 noundef %7)
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 8
  %12 = icmp eq i32 %11, 6
  br i1 %12, label %13, label %21

13:                                               ; preds = %2
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.CClosure, ptr %16, i32 0, i32 3
  %18 = load i8, ptr %17, align 2
  %19 = zext i8 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %22, label %21

21:                                               ; preds = %13, %2
  br label %28

22:                                               ; preds = %13
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds %struct.lua_TValue, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %struct.CClosure, ptr %25, i32 0, i32 8
  %27 = load ptr, ptr %26, align 8
  br label %28

28:                                               ; preds = %22, %21
  %29 = phi ptr [ null, %21 ], [ %27, %22 ]
  ret ptr %29
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_touserdata(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = load i32, ptr %5, align 4
  %9 = call ptr @index2adr(ptr noundef %7, i32 noundef %8)
  store ptr %9, ptr %6, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  switch i32 %12, label %22 [
    i32 7, label %13
    i32 2, label %18
  ]

13:                                               ; preds = %2
  %14 = load ptr, ptr %6, align 8
  %15 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %union.Udata, ptr %16, i64 1
  store ptr %17, ptr %3, align 8
  br label %23

18:                                               ; preds = %2
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds %struct.lua_TValue, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %3, align 8
  br label %23

22:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %23

23:                                               ; preds = %22, %18, %13
  %24 = load ptr, ptr %3, align 8
  ret ptr %24
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_tothread(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  %8 = call ptr @index2adr(ptr noundef %6, i32 noundef %7)
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.lua_TValue, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 8
  %12 = icmp eq i32 %11, 8
  br i1 %12, label %14, label %13

13:                                               ; preds = %2
  br label %18

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.lua_TValue, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  br label %18

18:                                               ; preds = %14, %13
  %19 = phi ptr [ null, %13 ], [ %17, %14 ]
  ret ptr %19
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_topointer(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = load i32, ptr %5, align 4
  %9 = call ptr @index2adr(ptr noundef %7, i32 noundef %8)
  store ptr %9, ptr %6, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  switch i32 %12, label %29 [
    i32 5, label %13
    i32 6, label %17
    i32 8, label %21
    i32 7, label %25
    i32 2, label %25
  ]

13:                                               ; preds = %2
  %14 = load ptr, ptr %6, align 8
  %15 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  store ptr %16, ptr %3, align 8
  br label %30

17:                                               ; preds = %2
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds %struct.lua_TValue, ptr %18, i32 0, i32 0
  %20 = load ptr, ptr %19, align 8
  store ptr %20, ptr %3, align 8
  br label %30

21:                                               ; preds = %2
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds %struct.lua_TValue, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %3, align 8
  br label %30

25:                                               ; preds = %2, %2
  %26 = load ptr, ptr %4, align 8
  %27 = load i32, ptr %5, align 4
  %28 = call ptr @lua_touserdata(ptr noundef %26, i32 noundef %27)
  store ptr %28, ptr %3, align 8
  br label %30

29:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %30

30:                                               ; preds = %29, %25, %21, %17, %13
  %31 = load ptr, ptr %3, align 8
  ret ptr %31
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushnil(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 4
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %struct.lua_TValue, ptr %5, i32 0, i32 1
  store i32 0, ptr %6, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.lua_State, ptr %8, i32 0, i32 4
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 1
  store ptr %11, ptr %9, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushnumber(ptr noundef %0, double noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store double %1, ptr %4, align 8
  %7 = load double, ptr %4, align 8
  store double %7, ptr %5, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.lua_State, ptr %8, i32 0, i32 4
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %6, align 8
  %11 = load double, ptr %5, align 8
  %12 = load ptr, ptr %6, align 8
  %13 = getelementptr inbounds %struct.lua_TValue, ptr %12, i32 0, i32 0
  store double %11, ptr %13, align 8
  %14 = load ptr, ptr %6, align 8
  %15 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 1
  store i32 3, ptr %15, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.lua_State, ptr %17, i32 0, i32 4
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.lua_TValue, ptr %19, i32 1
  store ptr %20, ptr %18, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushinteger(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca double, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %7 = load i64, ptr %4, align 8
  %8 = sitofp i64 %7 to double
  store double %8, ptr %5, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.lua_State, ptr %9, i32 0, i32 4
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %6, align 8
  %12 = load double, ptr %5, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 0
  store double %12, ptr %14, align 8
  %15 = load ptr, ptr %6, align 8
  %16 = getelementptr inbounds %struct.lua_TValue, ptr %15, i32 0, i32 1
  store i32 3, ptr %16, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.lua_State, ptr %18, i32 0, i32 4
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.lua_TValue, ptr %20, i32 1
  store ptr %21, ptr %19, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushlstring(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.lua_State, ptr %9, i32 0, i32 6
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %struct.global_State, ptr %11, i32 0, i32 15
  %13 = load i64, ptr %12, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.lua_State, ptr %14, i32 0, i32 6
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.global_State, ptr %16, i32 0, i32 14
  %18 = load i64, ptr %17, align 8
  %19 = icmp uge i64 %13, %18
  br i1 %19, label %20, label %22

20:                                               ; preds = %3
  %21 = load ptr, ptr %4, align 8
  call void @luaC_step(ptr noundef %21)
  br label %22

22:                                               ; preds = %20, %3
  %23 = load ptr, ptr %4, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = load i64, ptr %6, align 8
  %26 = call ptr @luaS_newlstr(ptr noundef %23, ptr noundef %24, i64 noundef %25)
  store ptr %26, ptr %7, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.lua_State, ptr %27, i32 0, i32 4
  %29 = load ptr, ptr %28, align 8
  store ptr %29, ptr %8, align 8
  %30 = load ptr, ptr %7, align 8
  %31 = load ptr, ptr %8, align 8
  %32 = getelementptr inbounds %struct.lua_TValue, ptr %31, i32 0, i32 0
  store ptr %30, ptr %32, align 8
  %33 = load ptr, ptr %8, align 8
  %34 = getelementptr inbounds %struct.lua_TValue, ptr %33, i32 0, i32 1
  store i32 4, ptr %34, align 8
  %35 = load ptr, ptr %4, align 8
  %36 = load ptr, ptr %4, align 8
  %37 = getelementptr inbounds %struct.lua_State, ptr %36, i32 0, i32 4
  %38 = load ptr, ptr %37, align 8
  %39 = getelementptr inbounds %struct.lua_TValue, ptr %38, i32 1
  store ptr %39, ptr %37, align 8
  ret void
}

declare ptr @luaS_newlstr(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushstring(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %9

7:                                                ; preds = %2
  %8 = load ptr, ptr %3, align 8
  call void @lua_pushnil(ptr noundef %8)
  br label %14

9:                                                ; preds = %2
  %10 = load ptr, ptr %3, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = call i64 @strlen(ptr noundef %12)
  call void @lua_pushlstring(ptr noundef %10, ptr noundef %11, i64 noundef %13)
  br label %14

14:                                               ; preds = %9, %7
  ret void
}

declare i64 @strlen(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_pushvfstring(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %struct.lua_State, ptr %8, i32 0, i32 6
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds %struct.global_State, ptr %10, i32 0, i32 15
  %12 = load i64, ptr %11, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.lua_State, ptr %13, i32 0, i32 6
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.global_State, ptr %15, i32 0, i32 14
  %17 = load i64, ptr %16, align 8
  %18 = icmp uge i64 %12, %17
  br i1 %18, label %19, label %21

19:                                               ; preds = %3
  %20 = load ptr, ptr %4, align 8
  call void @luaC_step(ptr noundef %20)
  br label %21

21:                                               ; preds = %19, %3
  %22 = load ptr, ptr %4, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = load ptr, ptr %6, align 8
  %25 = call ptr @luaO_pushvfstring(ptr noundef %22, ptr noundef %23, ptr noundef %24)
  store ptr %25, ptr %7, align 8
  %26 = load ptr, ptr %7, align 8
  ret ptr %26
}

declare ptr @luaO_pushvfstring(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_pushfstring(ptr noundef %0, ptr noundef %1, ...) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.lua_State, ptr %7, i32 0, i32 6
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds %struct.global_State, ptr %9, i32 0, i32 15
  %11 = load i64, ptr %10, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.lua_State, ptr %12, i32 0, i32 6
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %struct.global_State, ptr %14, i32 0, i32 14
  %16 = load i64, ptr %15, align 8
  %17 = icmp uge i64 %11, %16
  br i1 %17, label %18, label %20

18:                                               ; preds = %2
  %19 = load ptr, ptr %3, align 8
  call void @luaC_step(ptr noundef %19)
  br label %20

20:                                               ; preds = %18, %2
  call void @llvm.va_start(ptr %6)
  %21 = load ptr, ptr %3, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = load ptr, ptr %6, align 8
  %24 = call ptr @luaO_pushvfstring(ptr noundef %21, ptr noundef %22, ptr noundef %23)
  store ptr %24, ptr %5, align 8
  call void @llvm.va_end(ptr %6)
  %25 = load ptr, ptr %5, align 8
  ret ptr %25
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #3

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushcclosure(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.lua_State, ptr %12, i32 0, i32 6
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %struct.global_State, ptr %14, i32 0, i32 15
  %16 = load i64, ptr %15, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.lua_State, ptr %17, i32 0, i32 6
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.global_State, ptr %19, i32 0, i32 14
  %21 = load i64, ptr %20, align 8
  %22 = icmp uge i64 %16, %21
  br i1 %22, label %23, label %25

23:                                               ; preds = %3
  %24 = load ptr, ptr %4, align 8
  call void @luaC_step(ptr noundef %24)
  br label %25

25:                                               ; preds = %23, %3
  %26 = load ptr, ptr %4, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = load i32, ptr %6, align 4
  %29 = load ptr, ptr %4, align 8
  %30 = call ptr @getcurrenv(ptr noundef %29)
  %31 = call ptr @luaF_newCclosure(ptr noundef %27, i32 noundef %28, ptr noundef %30)
  store ptr %31, ptr %7, align 8
  %32 = load ptr, ptr %5, align 8
  %33 = load ptr, ptr %7, align 8
  %34 = getelementptr inbounds %struct.CClosure, ptr %33, i32 0, i32 8
  store ptr %32, ptr %34, align 8
  %35 = load i32, ptr %6, align 4
  %36 = load ptr, ptr %4, align 8
  %37 = getelementptr inbounds %struct.lua_State, ptr %36, i32 0, i32 4
  %38 = load ptr, ptr %37, align 8
  %39 = sext i32 %35 to i64
  %40 = sub i64 0, %39
  %41 = getelementptr inbounds %struct.lua_TValue, ptr %38, i64 %40
  store ptr %41, ptr %37, align 8
  br label %42

42:                                               ; preds = %46, %25
  %43 = load i32, ptr %6, align 4
  %44 = add nsw i32 %43, -1
  store i32 %44, ptr %6, align 4
  %45 = icmp ne i32 %43, 0
  br i1 %45, label %46, label %67

46:                                               ; preds = %42
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds %struct.lua_State, ptr %47, i32 0, i32 4
  %49 = load ptr, ptr %48, align 8
  %50 = load i32, ptr %6, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds %struct.lua_TValue, ptr %49, i64 %51
  store ptr %52, ptr %8, align 8
  %53 = load ptr, ptr %7, align 8
  %54 = getelementptr inbounds %struct.CClosure, ptr %53, i32 0, i32 9
  %55 = load i32, ptr %6, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1 x %struct.lua_TValue], ptr %54, i64 0, i64 %56
  store ptr %57, ptr %9, align 8
  %58 = load ptr, ptr %9, align 8
  %59 = getelementptr inbounds %struct.lua_TValue, ptr %58, i32 0, i32 0
  %60 = load ptr, ptr %8, align 8
  %61 = getelementptr inbounds %struct.lua_TValue, ptr %60, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %59, ptr align 8 %61, i64 8, i1 false)
  %62 = load ptr, ptr %8, align 8
  %63 = getelementptr inbounds %struct.lua_TValue, ptr %62, i32 0, i32 1
  %64 = load i32, ptr %63, align 8
  %65 = load ptr, ptr %9, align 8
  %66 = getelementptr inbounds %struct.lua_TValue, ptr %65, i32 0, i32 1
  store i32 %64, ptr %66, align 8
  br label %42, !llvm.loop !11

67:                                               ; preds = %42
  %68 = load ptr, ptr %7, align 8
  store ptr %68, ptr %10, align 8
  %69 = load ptr, ptr %4, align 8
  %70 = getelementptr inbounds %struct.lua_State, ptr %69, i32 0, i32 4
  %71 = load ptr, ptr %70, align 8
  store ptr %71, ptr %11, align 8
  %72 = load ptr, ptr %10, align 8
  %73 = load ptr, ptr %11, align 8
  %74 = getelementptr inbounds %struct.lua_TValue, ptr %73, i32 0, i32 0
  store ptr %72, ptr %74, align 8
  %75 = load ptr, ptr %11, align 8
  %76 = getelementptr inbounds %struct.lua_TValue, ptr %75, i32 0, i32 1
  store i32 6, ptr %76, align 8
  %77 = load ptr, ptr %4, align 8
  %78 = load ptr, ptr %4, align 8
  %79 = getelementptr inbounds %struct.lua_State, ptr %78, i32 0, i32 4
  %80 = load ptr, ptr %79, align 8
  %81 = getelementptr inbounds %struct.lua_TValue, ptr %80, i32 1
  store ptr %81, ptr %79, align 8
  ret void
}

declare ptr @luaF_newCclosure(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @getcurrenv(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.lua_State, ptr %5, i32 0, i32 7
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.lua_State, ptr %8, i32 0, i32 12
  %10 = load ptr, ptr %9, align 8
  %11 = icmp eq ptr %7, %10
  br i1 %11, label %12, label %17

12:                                               ; preds = %1
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.lua_State, ptr %13, i32 0, i32 21
  %15 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  store ptr %16, ptr %2, align 8
  br label %28

17:                                               ; preds = %1
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.lua_State, ptr %18, i32 0, i32 7
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.CallInfo, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds %struct.lua_TValue, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %4, align 8
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.CClosure, ptr %25, i32 0, i32 6
  %27 = load ptr, ptr %26, align 8
  store ptr %27, ptr %2, align 8
  br label %28

28:                                               ; preds = %17, %12
  %29 = load ptr, ptr %2, align 8
  ret ptr %29
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushboolean(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp ne i32 %7, 0
  %9 = zext i1 %8 to i32
  store i32 %9, ptr %5, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.lua_State, ptr %10, i32 0, i32 4
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %6, align 8
  %13 = load i32, ptr %5, align 4
  %14 = load ptr, ptr %6, align 8
  %15 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 0
  store i32 %13, ptr %15, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = getelementptr inbounds %struct.lua_TValue, ptr %16, i32 0, i32 1
  store i32 1, ptr %17, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.lua_State, ptr %19, i32 0, i32 4
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds %struct.lua_TValue, ptr %21, i32 1
  store ptr %22, ptr %20, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_pushlightuserdata(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %union.anon.2, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %4, align 8
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  store ptr %9, ptr %6, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.lua_State, ptr %10, i32 0, i32 4
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %7, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = load ptr, ptr %7, align 8
  %15 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 0
  store ptr %13, ptr %15, align 8
  %16 = load ptr, ptr %7, align 8
  %17 = getelementptr inbounds %struct.lua_TValue, ptr %16, i32 0, i32 1
  store i32 2, ptr %17, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.lua_State, ptr %19, i32 0, i32 4
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds %struct.lua_TValue, ptr %21, i32 1
  store ptr %22, ptr %20, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_pushthread(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  store ptr %5, ptr %3, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.lua_State, ptr %6, i32 0, i32 4
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %4, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 0, i32 0
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.lua_TValue, ptr %12, i32 0, i32 1
  store i32 8, ptr %13, align 8
  %14 = load ptr, ptr %2, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.lua_State, ptr %15, i32 0, i32 4
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds %struct.lua_TValue, ptr %17, i32 1
  store ptr %18, ptr %16, align 8
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.lua_State, ptr %19, i32 0, i32 6
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds %struct.global_State, ptr %21, i32 0, i32 23
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %2, align 8
  %25 = icmp eq ptr %23, %24
  %26 = zext i1 %25 to i32
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_gettable(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  %8 = call ptr @index2adr(ptr noundef %6, i32 noundef %7)
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.lua_State, ptr %12, i32 0, i32 4
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %struct.lua_TValue, ptr %14, i64 -1
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.lua_State, ptr %16, i32 0, i32 4
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.lua_TValue, ptr %18, i64 -1
  call void @luaV_gettable(ptr noundef %10, ptr noundef %11, ptr noundef %15, ptr noundef %19)
  ret void
}

declare void @luaV_gettable(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_getfield(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.lua_TValue, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %5, align 4
  %13 = call ptr @index2adr(ptr noundef %11, i32 noundef %12)
  store ptr %13, ptr %7, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.lua_State, ptr %15, i32 0, i32 2
  %17 = load i8, ptr %16, align 1
  %18 = zext i8 %17 to i32
  %19 = or i32 %18, 8
  %20 = trunc i32 %19 to i8
  store i8 %20, ptr %16, align 1
  %21 = load ptr, ptr %4, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = load ptr, ptr %6, align 8
  %24 = call i64 @strlen(ptr noundef %23)
  %25 = call ptr @luaS_newlstr(ptr noundef %21, ptr noundef %22, i64 noundef %24)
  store ptr %25, ptr %9, align 8
  store ptr %8, ptr %10, align 8
  %26 = load ptr, ptr %9, align 8
  %27 = load ptr, ptr %10, align 8
  %28 = getelementptr inbounds %struct.lua_TValue, ptr %27, i32 0, i32 0
  store ptr %26, ptr %28, align 8
  %29 = load ptr, ptr %10, align 8
  %30 = getelementptr inbounds %struct.lua_TValue, ptr %29, i32 0, i32 1
  store i32 4, ptr %30, align 8
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.lua_State, ptr %31, i32 0, i32 2
  %33 = load i8, ptr %32, align 1
  %34 = zext i8 %33 to i32
  %35 = and i32 %34, 247
  %36 = trunc i32 %35 to i8
  store i8 %36, ptr %32, align 1
  %37 = load ptr, ptr %4, align 8
  %38 = load ptr, ptr %7, align 8
  %39 = load ptr, ptr %4, align 8
  %40 = getelementptr inbounds %struct.lua_State, ptr %39, i32 0, i32 4
  %41 = load ptr, ptr %40, align 8
  call void @luaV_gettable(ptr noundef %37, ptr noundef %38, ptr noundef %8, ptr noundef %41)
  %42 = load ptr, ptr %4, align 8
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds %struct.lua_State, ptr %43, i32 0, i32 4
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr inbounds %struct.lua_TValue, ptr %45, i32 1
  store ptr %46, ptr %44, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_rawget(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = load i32, ptr %4, align 4
  %10 = call ptr @index2adr(ptr noundef %8, i32 noundef %9)
  store ptr %10, ptr %5, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.lua_TValue, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.lua_State, ptr %15, i32 0, i32 4
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds %struct.lua_TValue, ptr %17, i64 -1
  %19 = call ptr @luaH_get(ptr noundef %14, ptr noundef %18)
  store ptr %19, ptr %6, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.lua_State, ptr %20, i32 0, i32 4
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds %struct.lua_TValue, ptr %22, i64 -1
  store ptr %23, ptr %7, align 8
  %24 = load ptr, ptr %7, align 8
  %25 = getelementptr inbounds %struct.lua_TValue, ptr %24, i32 0, i32 0
  %26 = load ptr, ptr %6, align 8
  %27 = getelementptr inbounds %struct.lua_TValue, ptr %26, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %25, ptr align 8 %27, i64 8, i1 false)
  %28 = load ptr, ptr %6, align 8
  %29 = getelementptr inbounds %struct.lua_TValue, ptr %28, i32 0, i32 1
  %30 = load i32, ptr %29, align 8
  %31 = load ptr, ptr %7, align 8
  %32 = getelementptr inbounds %struct.lua_TValue, ptr %31, i32 0, i32 1
  store i32 %30, ptr %32, align 8
  ret void
}

declare ptr @luaH_get(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_rawgeti(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %10 = load ptr, ptr %4, align 8
  %11 = load i32, ptr %5, align 4
  %12 = call ptr @index2adr(ptr noundef %10, i32 noundef %11)
  store ptr %12, ptr %7, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = load ptr, ptr %7, align 8
  %15 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = load i32, ptr %6, align 4
  %18 = call ptr @luaH_getnum(ptr noundef %16, i32 noundef %17)
  store ptr %18, ptr %8, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.lua_State, ptr %19, i32 0, i32 4
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %9, align 8
  %22 = load ptr, ptr %9, align 8
  %23 = getelementptr inbounds %struct.lua_TValue, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr inbounds %struct.lua_TValue, ptr %24, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %23, ptr align 8 %25, i64 8, i1 false)
  %26 = load ptr, ptr %8, align 8
  %27 = getelementptr inbounds %struct.lua_TValue, ptr %26, i32 0, i32 1
  %28 = load i32, ptr %27, align 8
  %29 = load ptr, ptr %9, align 8
  %30 = getelementptr inbounds %struct.lua_TValue, ptr %29, i32 0, i32 1
  store i32 %28, ptr %30, align 8
  %31 = load ptr, ptr %4, align 8
  %32 = load ptr, ptr %4, align 8
  %33 = getelementptr inbounds %struct.lua_State, ptr %32, i32 0, i32 4
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds %struct.lua_TValue, ptr %34, i32 1
  store ptr %35, ptr %33, align 8
  ret void
}

declare ptr @luaH_getnum(ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_createtable(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.lua_State, ptr %9, i32 0, i32 6
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %struct.global_State, ptr %11, i32 0, i32 15
  %13 = load i64, ptr %12, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.lua_State, ptr %14, i32 0, i32 6
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.global_State, ptr %16, i32 0, i32 14
  %18 = load i64, ptr %17, align 8
  %19 = icmp uge i64 %13, %18
  br i1 %19, label %20, label %22

20:                                               ; preds = %3
  %21 = load ptr, ptr %4, align 8
  call void @luaC_step(ptr noundef %21)
  br label %22

22:                                               ; preds = %20, %3
  %23 = load ptr, ptr %4, align 8
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %6, align 4
  %26 = call ptr @luaH_new(ptr noundef %23, i32 noundef %24, i32 noundef %25)
  store ptr %26, ptr %7, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.lua_State, ptr %27, i32 0, i32 4
  %29 = load ptr, ptr %28, align 8
  store ptr %29, ptr %8, align 8
  %30 = load ptr, ptr %7, align 8
  %31 = load ptr, ptr %8, align 8
  %32 = getelementptr inbounds %struct.lua_TValue, ptr %31, i32 0, i32 0
  store ptr %30, ptr %32, align 8
  %33 = load ptr, ptr %8, align 8
  %34 = getelementptr inbounds %struct.lua_TValue, ptr %33, i32 0, i32 1
  store i32 5, ptr %34, align 8
  %35 = load ptr, ptr %4, align 8
  %36 = load ptr, ptr %4, align 8
  %37 = getelementptr inbounds %struct.lua_State, ptr %36, i32 0, i32 4
  %38 = load ptr, ptr %37, align 8
  %39 = getelementptr inbounds %struct.lua_TValue, ptr %38, i32 1
  store ptr %39, ptr %37, align 8
  ret void
}

declare ptr @luaH_new(ptr noundef, i32 noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_getmetatable(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store ptr null, ptr %6, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = load i32, ptr %4, align 4
  %12 = call ptr @index2adr(ptr noundef %10, i32 noundef %11)
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.lua_TValue, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 8
  switch i32 %15, label %28 [
    i32 5, label %16
    i32 7, label %22
  ]

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.lua_TValue, ptr %17, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.Table, ptr %19, i32 0, i32 5
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %6, align 8
  br label %39

22:                                               ; preds = %2
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds %struct.lua_TValue, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %struct.anon.1, ptr %25, i32 0, i32 3
  %27 = load ptr, ptr %26, align 8
  store ptr %27, ptr %6, align 8
  br label %39

28:                                               ; preds = %2
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.lua_State, ptr %29, i32 0, i32 6
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds %struct.global_State, ptr %31, i32 0, i32 25
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds %struct.lua_TValue, ptr %33, i32 0, i32 1
  %35 = load i32, ptr %34, align 8
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [9 x ptr], ptr %32, i64 0, i64 %36
  %38 = load ptr, ptr %37, align 8
  store ptr %38, ptr %6, align 8
  br label %39

39:                                               ; preds = %28, %22, %16
  %40 = load ptr, ptr %6, align 8
  %41 = icmp eq ptr %40, null
  br i1 %41, label %42, label %43

42:                                               ; preds = %39
  store i32 0, ptr %7, align 4
  br label %58

43:                                               ; preds = %39
  %44 = load ptr, ptr %6, align 8
  store ptr %44, ptr %8, align 8
  %45 = load ptr, ptr %3, align 8
  %46 = getelementptr inbounds %struct.lua_State, ptr %45, i32 0, i32 4
  %47 = load ptr, ptr %46, align 8
  store ptr %47, ptr %9, align 8
  %48 = load ptr, ptr %8, align 8
  %49 = load ptr, ptr %9, align 8
  %50 = getelementptr inbounds %struct.lua_TValue, ptr %49, i32 0, i32 0
  store ptr %48, ptr %50, align 8
  %51 = load ptr, ptr %9, align 8
  %52 = getelementptr inbounds %struct.lua_TValue, ptr %51, i32 0, i32 1
  store i32 5, ptr %52, align 8
  %53 = load ptr, ptr %3, align 8
  %54 = load ptr, ptr %3, align 8
  %55 = getelementptr inbounds %struct.lua_State, ptr %54, i32 0, i32 4
  %56 = load ptr, ptr %55, align 8
  %57 = getelementptr inbounds %struct.lua_TValue, ptr %56, i32 1
  store ptr %57, ptr %55, align 8
  store i32 1, ptr %7, align 4
  br label %58

58:                                               ; preds = %43, %42
  %59 = load i32, ptr %7, align 4
  ret i32 %59
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_getfenv(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %4, align 4
  %14 = call ptr @index2adr(ptr noundef %12, i32 noundef %13)
  store ptr %14, ptr %5, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.lua_TValue, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 8
  switch i32 %18, label %64 [
    i32 6, label %19
    i32 7, label %33
    i32 8, label %47
  ]

19:                                               ; preds = %2
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds %struct.lua_TValue, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds %struct.CClosure, ptr %22, i32 0, i32 6
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %6, align 8
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.lua_State, ptr %25, i32 0, i32 4
  %27 = load ptr, ptr %26, align 8
  store ptr %27, ptr %7, align 8
  %28 = load ptr, ptr %6, align 8
  %29 = load ptr, ptr %7, align 8
  %30 = getelementptr inbounds %struct.lua_TValue, ptr %29, i32 0, i32 0
  store ptr %28, ptr %30, align 8
  %31 = load ptr, ptr %7, align 8
  %32 = getelementptr inbounds %struct.lua_TValue, ptr %31, i32 0, i32 1
  store i32 5, ptr %32, align 8
  br label %69

33:                                               ; preds = %2
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds %struct.lua_TValue, ptr %34, i32 0, i32 0
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds %struct.anon.1, ptr %36, i32 0, i32 4
  %38 = load ptr, ptr %37, align 8
  store ptr %38, ptr %8, align 8
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds %struct.lua_State, ptr %39, i32 0, i32 4
  %41 = load ptr, ptr %40, align 8
  store ptr %41, ptr %9, align 8
  %42 = load ptr, ptr %8, align 8
  %43 = load ptr, ptr %9, align 8
  %44 = getelementptr inbounds %struct.lua_TValue, ptr %43, i32 0, i32 0
  store ptr %42, ptr %44, align 8
  %45 = load ptr, ptr %9, align 8
  %46 = getelementptr inbounds %struct.lua_TValue, ptr %45, i32 0, i32 1
  store i32 5, ptr %46, align 8
  br label %69

47:                                               ; preds = %2
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds %struct.lua_TValue, ptr %48, i32 0, i32 0
  %50 = load ptr, ptr %49, align 8
  %51 = getelementptr inbounds %struct.lua_State, ptr %50, i32 0, i32 21
  store ptr %51, ptr %10, align 8
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds %struct.lua_State, ptr %52, i32 0, i32 4
  %54 = load ptr, ptr %53, align 8
  store ptr %54, ptr %11, align 8
  %55 = load ptr, ptr %11, align 8
  %56 = getelementptr inbounds %struct.lua_TValue, ptr %55, i32 0, i32 0
  %57 = load ptr, ptr %10, align 8
  %58 = getelementptr inbounds %struct.lua_TValue, ptr %57, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %56, ptr align 8 %58, i64 8, i1 false)
  %59 = load ptr, ptr %10, align 8
  %60 = getelementptr inbounds %struct.lua_TValue, ptr %59, i32 0, i32 1
  %61 = load i32, ptr %60, align 8
  %62 = load ptr, ptr %11, align 8
  %63 = getelementptr inbounds %struct.lua_TValue, ptr %62, i32 0, i32 1
  store i32 %61, ptr %63, align 8
  br label %69

64:                                               ; preds = %2
  %65 = load ptr, ptr %3, align 8
  %66 = getelementptr inbounds %struct.lua_State, ptr %65, i32 0, i32 4
  %67 = load ptr, ptr %66, align 8
  %68 = getelementptr inbounds %struct.lua_TValue, ptr %67, i32 0, i32 1
  store i32 0, ptr %68, align 8
  br label %69

69:                                               ; preds = %64, %47, %33, %19
  %70 = load ptr, ptr %3, align 8
  %71 = load ptr, ptr %3, align 8
  %72 = getelementptr inbounds %struct.lua_State, ptr %71, i32 0, i32 4
  %73 = load ptr, ptr %72, align 8
  %74 = getelementptr inbounds %struct.lua_TValue, ptr %73, i32 1
  store ptr %74, ptr %72, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_settable(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = load i32, ptr %4, align 4
  %9 = call ptr @index2adr(ptr noundef %7, i32 noundef %8)
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.lua_State, ptr %13, i32 0, i32 4
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.lua_TValue, ptr %15, i64 -2
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.lua_State, ptr %17, i32 0, i32 4
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.lua_TValue, ptr %19, i64 -1
  call void @luaV_settable(ptr noundef %11, ptr noundef %12, ptr noundef %16, ptr noundef %20)
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.lua_State, ptr %21, i32 0, i32 4
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr inbounds %struct.lua_TValue, ptr %23, i64 -2
  store ptr %24, ptr %22, align 8
  ret void
}

declare void @luaV_settable(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_setfield(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %5, align 4
  %13 = call ptr @index2adr(ptr noundef %11, i32 noundef %12)
  store ptr %13, ptr %7, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = load ptr, ptr %6, align 8
  %18 = call i64 @strlen(ptr noundef %17)
  %19 = call ptr @luaS_newlstr(ptr noundef %15, ptr noundef %16, i64 noundef %18)
  store ptr %19, ptr %8, align 8
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %struct.lua_State, ptr %20, i32 0, i32 4
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %9, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = load ptr, ptr %9, align 8
  %25 = getelementptr inbounds %struct.lua_TValue, ptr %24, i32 0, i32 0
  store ptr %23, ptr %25, align 8
  %26 = load ptr, ptr %9, align 8
  %27 = getelementptr inbounds %struct.lua_TValue, ptr %26, i32 0, i32 1
  store i32 4, ptr %27, align 8
  %28 = load ptr, ptr %4, align 8
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds %struct.lua_State, ptr %29, i32 0, i32 4
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds %struct.lua_TValue, ptr %31, i32 1
  store ptr %32, ptr %30, align 8
  %33 = load ptr, ptr %4, align 8
  %34 = load ptr, ptr %7, align 8
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds %struct.lua_State, ptr %35, i32 0, i32 4
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr inbounds %struct.lua_TValue, ptr %37, i64 -1
  %39 = load ptr, ptr %4, align 8
  %40 = getelementptr inbounds %struct.lua_State, ptr %39, i32 0, i32 4
  %41 = load ptr, ptr %40, align 8
  %42 = getelementptr inbounds %struct.lua_TValue, ptr %41, i64 -2
  call void @luaV_settable(ptr noundef %33, ptr noundef %34, ptr noundef %38, ptr noundef %42)
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds %struct.lua_State, ptr %43, i32 0, i32 4
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr inbounds %struct.lua_TValue, ptr %45, i64 -2
  store ptr %46, ptr %44, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_rawset(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = load i32, ptr %4, align 4
  %11 = call ptr @index2adr(ptr noundef %9, i32 noundef %10)
  store ptr %11, ptr %5, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.lua_State, ptr %13, i32 0, i32 2
  %15 = load i8, ptr %14, align 1
  %16 = zext i8 %15 to i32
  %17 = or i32 %16, 8
  %18 = trunc i32 %17 to i8
  store i8 %18, ptr %14, align 1
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.lua_State, ptr %19, i32 0, i32 4
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds %struct.lua_TValue, ptr %21, i64 -1
  store ptr %22, ptr %6, align 8
  %23 = load ptr, ptr %3, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds %struct.lua_TValue, ptr %24, i32 0, i32 0
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds %struct.lua_State, ptr %27, i32 0, i32 4
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds %struct.lua_TValue, ptr %29, i64 -2
  %31 = call ptr @luaH_set(ptr noundef %23, ptr noundef %26, ptr noundef %30)
  store ptr %31, ptr %7, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds %struct.lua_TValue, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %6, align 8
  %35 = getelementptr inbounds %struct.lua_TValue, ptr %34, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %33, ptr align 8 %35, i64 8, i1 false)
  %36 = load ptr, ptr %6, align 8
  %37 = getelementptr inbounds %struct.lua_TValue, ptr %36, i32 0, i32 1
  %38 = load i32, ptr %37, align 8
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr inbounds %struct.lua_TValue, ptr %39, i32 0, i32 1
  store i32 %38, ptr %40, align 8
  %41 = load ptr, ptr %3, align 8
  %42 = getelementptr inbounds %struct.lua_State, ptr %41, i32 0, i32 2
  %43 = load i8, ptr %42, align 1
  %44 = zext i8 %43 to i32
  %45 = and i32 %44, 247
  %46 = trunc i32 %45 to i8
  store i8 %46, ptr %42, align 1
  %47 = load ptr, ptr %3, align 8
  %48 = getelementptr inbounds %struct.lua_State, ptr %47, i32 0, i32 4
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds %struct.lua_TValue, ptr %49, i64 -1
  %51 = getelementptr inbounds %struct.lua_TValue, ptr %50, i32 0, i32 1
  %52 = load i32, ptr %51, align 8
  %53 = icmp sge i32 %52, 4
  br i1 %53, label %54, label %80

54:                                               ; preds = %2
  %55 = load ptr, ptr %3, align 8
  %56 = getelementptr inbounds %struct.lua_State, ptr %55, i32 0, i32 4
  %57 = load ptr, ptr %56, align 8
  %58 = getelementptr inbounds %struct.lua_TValue, ptr %57, i64 -1
  %59 = getelementptr inbounds %struct.lua_TValue, ptr %58, i32 0, i32 0
  %60 = load ptr, ptr %59, align 8
  %61 = getelementptr inbounds %struct.GCheader, ptr %60, i32 0, i32 2
  %62 = load i8, ptr %61, align 1
  %63 = zext i8 %62 to i32
  %64 = and i32 %63, 3
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %80

66:                                               ; preds = %54
  %67 = load ptr, ptr %5, align 8
  %68 = getelementptr inbounds %struct.lua_TValue, ptr %67, i32 0, i32 0
  %69 = load ptr, ptr %68, align 8
  %70 = getelementptr inbounds %struct.GCheader, ptr %69, i32 0, i32 2
  %71 = load i8, ptr %70, align 1
  %72 = zext i8 %71 to i32
  %73 = and i32 %72, 4
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %80

75:                                               ; preds = %66
  %76 = load ptr, ptr %3, align 8
  %77 = load ptr, ptr %5, align 8
  %78 = getelementptr inbounds %struct.lua_TValue, ptr %77, i32 0, i32 0
  %79 = load ptr, ptr %78, align 8
  call void @luaC_barrierback(ptr noundef %76, ptr noundef %79)
  br label %80

80:                                               ; preds = %75, %66, %54, %2
  %81 = load ptr, ptr %3, align 8
  %82 = getelementptr inbounds %struct.lua_State, ptr %81, i32 0, i32 4
  %83 = load ptr, ptr %82, align 8
  %84 = getelementptr inbounds %struct.lua_TValue, ptr %83, i64 -2
  store ptr %84, ptr %82, align 8
  ret void
}

declare ptr @luaH_set(ptr noundef, ptr noundef, ptr noundef) #2

declare void @luaC_barrierback(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_rawseti(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %5, align 4
  %13 = call ptr @index2adr(ptr noundef %11, i32 noundef %12)
  store ptr %13, ptr %7, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.lua_State, ptr %15, i32 0, i32 2
  %17 = load i8, ptr %16, align 1
  %18 = zext i8 %17 to i32
  %19 = or i32 %18, 8
  %20 = trunc i32 %19 to i8
  store i8 %20, ptr %16, align 1
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds %struct.lua_State, ptr %21, i32 0, i32 4
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr inbounds %struct.lua_TValue, ptr %23, i64 -1
  store ptr %24, ptr %8, align 8
  %25 = load ptr, ptr %4, align 8
  %26 = load ptr, ptr %7, align 8
  %27 = getelementptr inbounds %struct.lua_TValue, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = load i32, ptr %6, align 4
  %30 = call ptr @luaH_setnum(ptr noundef %25, ptr noundef %28, i32 noundef %29)
  store ptr %30, ptr %9, align 8
  %31 = load ptr, ptr %9, align 8
  %32 = getelementptr inbounds %struct.lua_TValue, ptr %31, i32 0, i32 0
  %33 = load ptr, ptr %8, align 8
  %34 = getelementptr inbounds %struct.lua_TValue, ptr %33, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %32, ptr align 8 %34, i64 8, i1 false)
  %35 = load ptr, ptr %8, align 8
  %36 = getelementptr inbounds %struct.lua_TValue, ptr %35, i32 0, i32 1
  %37 = load i32, ptr %36, align 8
  %38 = load ptr, ptr %9, align 8
  %39 = getelementptr inbounds %struct.lua_TValue, ptr %38, i32 0, i32 1
  store i32 %37, ptr %39, align 8
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.lua_State, ptr %40, i32 0, i32 2
  %42 = load i8, ptr %41, align 1
  %43 = zext i8 %42 to i32
  %44 = and i32 %43, 247
  %45 = trunc i32 %44 to i8
  store i8 %45, ptr %41, align 1
  %46 = load ptr, ptr %4, align 8
  %47 = getelementptr inbounds %struct.lua_State, ptr %46, i32 0, i32 4
  %48 = load ptr, ptr %47, align 8
  %49 = getelementptr inbounds %struct.lua_TValue, ptr %48, i64 -1
  %50 = getelementptr inbounds %struct.lua_TValue, ptr %49, i32 0, i32 1
  %51 = load i32, ptr %50, align 8
  %52 = icmp sge i32 %51, 4
  br i1 %52, label %53, label %79

53:                                               ; preds = %3
  %54 = load ptr, ptr %4, align 8
  %55 = getelementptr inbounds %struct.lua_State, ptr %54, i32 0, i32 4
  %56 = load ptr, ptr %55, align 8
  %57 = getelementptr inbounds %struct.lua_TValue, ptr %56, i64 -1
  %58 = getelementptr inbounds %struct.lua_TValue, ptr %57, i32 0, i32 0
  %59 = load ptr, ptr %58, align 8
  %60 = getelementptr inbounds %struct.GCheader, ptr %59, i32 0, i32 2
  %61 = load i8, ptr %60, align 1
  %62 = zext i8 %61 to i32
  %63 = and i32 %62, 3
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %79

65:                                               ; preds = %53
  %66 = load ptr, ptr %7, align 8
  %67 = getelementptr inbounds %struct.lua_TValue, ptr %66, i32 0, i32 0
  %68 = load ptr, ptr %67, align 8
  %69 = getelementptr inbounds %struct.GCheader, ptr %68, i32 0, i32 2
  %70 = load i8, ptr %69, align 1
  %71 = zext i8 %70 to i32
  %72 = and i32 %71, 4
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %79

74:                                               ; preds = %65
  %75 = load ptr, ptr %4, align 8
  %76 = load ptr, ptr %7, align 8
  %77 = getelementptr inbounds %struct.lua_TValue, ptr %76, i32 0, i32 0
  %78 = load ptr, ptr %77, align 8
  call void @luaC_barrierback(ptr noundef %75, ptr noundef %78)
  br label %79

79:                                               ; preds = %74, %65, %53, %3
  %80 = load ptr, ptr %4, align 8
  %81 = getelementptr inbounds %struct.lua_State, ptr %80, i32 0, i32 4
  %82 = load ptr, ptr %81, align 8
  %83 = getelementptr inbounds %struct.lua_TValue, ptr %82, i32 -1
  store ptr %83, ptr %81, align 8
  ret void
}

declare ptr @luaH_setnum(ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_setmetatable(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load i32, ptr %4, align 4
  %10 = call ptr @index2adr(ptr noundef %8, i32 noundef %9)
  store ptr %10, ptr %5, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.lua_State, ptr %12, i32 0, i32 4
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %struct.lua_TValue, ptr %14, i64 -1
  %16 = getelementptr inbounds %struct.lua_TValue, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 8
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %2
  store ptr null, ptr %6, align 8
  br label %28

20:                                               ; preds = %2
  %21 = load ptr, ptr %3, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.lua_State, ptr %22, i32 0, i32 4
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.lua_TValue, ptr %24, i64 -1
  %26 = getelementptr inbounds %struct.lua_TValue, ptr %25, i32 0, i32 0
  %27 = load ptr, ptr %26, align 8
  store ptr %27, ptr %6, align 8
  br label %28

28:                                               ; preds = %20, %19
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds %struct.lua_TValue, ptr %29, i32 0, i32 1
  %31 = load i32, ptr %30, align 8
  switch i32 %31, label %95 [
    i32 5, label %32
    i32 7, label %63
  ]

32:                                               ; preds = %28
  %33 = load ptr, ptr %6, align 8
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds %struct.lua_TValue, ptr %34, i32 0, i32 0
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds %struct.Table, ptr %36, i32 0, i32 5
  store ptr %33, ptr %37, align 8
  %38 = load ptr, ptr %6, align 8
  %39 = icmp ne ptr %38, null
  br i1 %39, label %40, label %62

40:                                               ; preds = %32
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds %struct.GCheader, ptr %41, i32 0, i32 2
  %43 = load i8, ptr %42, align 1
  %44 = zext i8 %43 to i32
  %45 = and i32 %44, 3
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %61

47:                                               ; preds = %40
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds %struct.lua_TValue, ptr %48, i32 0, i32 0
  %50 = load ptr, ptr %49, align 8
  %51 = getelementptr inbounds %struct.GCheader, ptr %50, i32 0, i32 2
  %52 = load i8, ptr %51, align 1
  %53 = zext i8 %52 to i32
  %54 = and i32 %53, 4
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %61

56:                                               ; preds = %47
  %57 = load ptr, ptr %3, align 8
  %58 = load ptr, ptr %5, align 8
  %59 = getelementptr inbounds %struct.lua_TValue, ptr %58, i32 0, i32 0
  %60 = load ptr, ptr %59, align 8
  call void @luaC_barrierback(ptr noundef %57, ptr noundef %60)
  br label %61

61:                                               ; preds = %56, %47, %40
  br label %62

62:                                               ; preds = %61, %32
  br label %106

63:                                               ; preds = %28
  %64 = load ptr, ptr %6, align 8
  %65 = load ptr, ptr %5, align 8
  %66 = getelementptr inbounds %struct.lua_TValue, ptr %65, i32 0, i32 0
  %67 = load ptr, ptr %66, align 8
  %68 = getelementptr inbounds %struct.anon.1, ptr %67, i32 0, i32 3
  store ptr %64, ptr %68, align 8
  %69 = load ptr, ptr %6, align 8
  %70 = icmp ne ptr %69, null
  br i1 %70, label %71, label %94

71:                                               ; preds = %63
  %72 = load ptr, ptr %6, align 8
  %73 = getelementptr inbounds %struct.GCheader, ptr %72, i32 0, i32 2
  %74 = load i8, ptr %73, align 1
  %75 = zext i8 %74 to i32
  %76 = and i32 %75, 3
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %93

78:                                               ; preds = %71
  %79 = load ptr, ptr %5, align 8
  %80 = getelementptr inbounds %struct.lua_TValue, ptr %79, i32 0, i32 0
  %81 = load ptr, ptr %80, align 8
  %82 = getelementptr inbounds %struct.GCheader, ptr %81, i32 0, i32 2
  %83 = load i8, ptr %82, align 1
  %84 = zext i8 %83 to i32
  %85 = and i32 %84, 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %93

87:                                               ; preds = %78
  %88 = load ptr, ptr %3, align 8
  %89 = load ptr, ptr %5, align 8
  %90 = getelementptr inbounds %struct.lua_TValue, ptr %89, i32 0, i32 0
  %91 = load ptr, ptr %90, align 8
  %92 = load ptr, ptr %6, align 8
  call void @luaC_barrierf(ptr noundef %88, ptr noundef %91, ptr noundef %92)
  br label %93

93:                                               ; preds = %87, %78, %71
  br label %94

94:                                               ; preds = %93, %63
  br label %106

95:                                               ; preds = %28
  %96 = load ptr, ptr %6, align 8
  %97 = load ptr, ptr %3, align 8
  %98 = getelementptr inbounds %struct.lua_State, ptr %97, i32 0, i32 6
  %99 = load ptr, ptr %98, align 8
  %100 = getelementptr inbounds %struct.global_State, ptr %99, i32 0, i32 25
  %101 = load ptr, ptr %5, align 8
  %102 = getelementptr inbounds %struct.lua_TValue, ptr %101, i32 0, i32 1
  %103 = load i32, ptr %102, align 8
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [9 x ptr], ptr %100, i64 0, i64 %104
  store ptr %96, ptr %105, align 8
  br label %106

106:                                              ; preds = %95, %94, %62
  %107 = load ptr, ptr %3, align 8
  %108 = getelementptr inbounds %struct.lua_State, ptr %107, i32 0, i32 4
  %109 = load ptr, ptr %108, align 8
  %110 = getelementptr inbounds %struct.lua_TValue, ptr %109, i32 -1
  store ptr %110, ptr %108, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_setfenv(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 1, ptr %6, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = load i32, ptr %4, align 4
  %12 = call ptr @index2adr(ptr noundef %10, i32 noundef %11)
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.lua_TValue, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 8
  switch i32 %17, label %56 [
    i32 6, label %18
    i32 7, label %29
    i32 8, label %40
  ]

18:                                               ; preds = %2
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.lua_State, ptr %19, i32 0, i32 4
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds %struct.lua_TValue, ptr %21, i64 -1
  %23 = getelementptr inbounds %struct.lua_TValue, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds %struct.lua_TValue, ptr %25, i32 0, i32 0
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %struct.CClosure, ptr %27, i32 0, i32 6
  store ptr %24, ptr %28, align 8
  br label %57

29:                                               ; preds = %2
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds %struct.lua_State, ptr %30, i32 0, i32 4
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds %struct.lua_TValue, ptr %32, i64 -1
  %34 = getelementptr inbounds %struct.lua_TValue, ptr %33, i32 0, i32 0
  %35 = load ptr, ptr %34, align 8
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds %struct.lua_TValue, ptr %36, i32 0, i32 0
  %38 = load ptr, ptr %37, align 8
  %39 = getelementptr inbounds %struct.anon.1, ptr %38, i32 0, i32 4
  store ptr %35, ptr %39, align 8
  br label %57

40:                                               ; preds = %2
  %41 = load ptr, ptr %3, align 8
  %42 = getelementptr inbounds %struct.lua_State, ptr %41, i32 0, i32 4
  %43 = load ptr, ptr %42, align 8
  %44 = getelementptr inbounds %struct.lua_TValue, ptr %43, i64 -1
  %45 = getelementptr inbounds %struct.lua_TValue, ptr %44, i32 0, i32 0
  %46 = load ptr, ptr %45, align 8
  store ptr %46, ptr %7, align 8
  %47 = load ptr, ptr %5, align 8
  %48 = getelementptr inbounds %struct.lua_TValue, ptr %47, i32 0, i32 0
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds %struct.lua_State, ptr %49, i32 0, i32 21
  store ptr %50, ptr %8, align 8
  %51 = load ptr, ptr %7, align 8
  %52 = load ptr, ptr %8, align 8
  %53 = getelementptr inbounds %struct.lua_TValue, ptr %52, i32 0, i32 0
  store ptr %51, ptr %53, align 8
  %54 = load ptr, ptr %8, align 8
  %55 = getelementptr inbounds %struct.lua_TValue, ptr %54, i32 0, i32 1
  store i32 5, ptr %55, align 8
  br label %57

56:                                               ; preds = %2
  store i32 0, ptr %6, align 4
  br label %57

57:                                               ; preds = %56, %40, %29, %18
  %58 = load i32, ptr %6, align 4
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %93

60:                                               ; preds = %57
  %61 = load ptr, ptr %3, align 8
  %62 = getelementptr inbounds %struct.lua_State, ptr %61, i32 0, i32 4
  %63 = load ptr, ptr %62, align 8
  %64 = getelementptr inbounds %struct.lua_TValue, ptr %63, i64 -1
  %65 = getelementptr inbounds %struct.lua_TValue, ptr %64, i32 0, i32 0
  %66 = load ptr, ptr %65, align 8
  %67 = getelementptr inbounds %struct.GCheader, ptr %66, i32 0, i32 2
  %68 = load i8, ptr %67, align 1
  %69 = zext i8 %68 to i32
  %70 = and i32 %69, 3
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %92

72:                                               ; preds = %60
  %73 = load ptr, ptr %5, align 8
  %74 = getelementptr inbounds %struct.lua_TValue, ptr %73, i32 0, i32 0
  %75 = load ptr, ptr %74, align 8
  %76 = getelementptr inbounds %struct.GCheader, ptr %75, i32 0, i32 2
  %77 = load i8, ptr %76, align 1
  %78 = zext i8 %77 to i32
  %79 = and i32 %78, 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %92

81:                                               ; preds = %72
  %82 = load ptr, ptr %3, align 8
  %83 = load ptr, ptr %5, align 8
  %84 = getelementptr inbounds %struct.lua_TValue, ptr %83, i32 0, i32 0
  %85 = load ptr, ptr %84, align 8
  %86 = load ptr, ptr %3, align 8
  %87 = getelementptr inbounds %struct.lua_State, ptr %86, i32 0, i32 4
  %88 = load ptr, ptr %87, align 8
  %89 = getelementptr inbounds %struct.lua_TValue, ptr %88, i64 -1
  %90 = getelementptr inbounds %struct.lua_TValue, ptr %89, i32 0, i32 0
  %91 = load ptr, ptr %90, align 8
  call void @luaC_barrierf(ptr noundef %82, ptr noundef %85, ptr noundef %91)
  br label %92

92:                                               ; preds = %81, %72, %60
  br label %93

93:                                               ; preds = %92, %57
  %94 = load ptr, ptr %3, align 8
  %95 = getelementptr inbounds %struct.lua_State, ptr %94, i32 0, i32 4
  %96 = load ptr, ptr %95, align 8
  %97 = getelementptr inbounds %struct.lua_TValue, ptr %96, i32 -1
  store ptr %97, ptr %95, align 8
  %98 = load i32, ptr %6, align 4
  ret i32 %98
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_call(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.lua_State, ptr %10, i32 0, i32 4
  %12 = load ptr, ptr %11, align 8
  %13 = load i32, ptr %5, align 4
  %14 = add nsw i32 %13, 1
  %15 = sext i32 %14 to i64
  %16 = sub i64 0, %15
  %17 = getelementptr inbounds %struct.lua_TValue, ptr %12, i64 %16
  store ptr %17, ptr %7, align 8
  %18 = load ptr, ptr %4, align 8
  %19 = load ptr, ptr %7, align 8
  %20 = load i32, ptr %6, align 4
  call void @luaD_call(ptr noundef %18, ptr noundef %19, i32 noundef %20)
  %21 = load i32, ptr %6, align 4
  %22 = icmp eq i32 %21, -1
  br i1 %22, label %23, label %41

23:                                               ; preds = %3
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.lua_State, ptr %24, i32 0, i32 4
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.lua_State, ptr %27, i32 0, i32 7
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds %struct.CallInfo, ptr %29, i32 0, i32 2
  %31 = load ptr, ptr %30, align 8
  %32 = icmp uge ptr %26, %31
  br i1 %32, label %33, label %41

33:                                               ; preds = %23
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds %struct.lua_State, ptr %34, i32 0, i32 4
  %36 = load ptr, ptr %35, align 8
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.lua_State, ptr %37, i32 0, i32 7
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds %struct.CallInfo, ptr %39, i32 0, i32 2
  store ptr %36, ptr %40, align 8
  br label %41

41:                                               ; preds = %33, %23, %3
  ret void
}

declare void @luaD_call(ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_pcall(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.CallS, align 8
  %10 = alloca i32, align 4
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %13 = load ptr, ptr %5, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = load i32, ptr %8, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %4
  store i64 0, ptr %11, align 8
  br label %30

18:                                               ; preds = %4
  %19 = load ptr, ptr %5, align 8
  %20 = load i32, ptr %8, align 4
  %21 = call ptr @index2adr(ptr noundef %19, i32 noundef %20)
  store ptr %21, ptr %12, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = load ptr, ptr %12, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds %struct.lua_State, ptr %24, i32 0, i32 10
  %26 = load ptr, ptr %25, align 8
  %27 = ptrtoint ptr %23 to i64
  %28 = ptrtoint ptr %26 to i64
  %29 = sub i64 %27, %28
  store i64 %29, ptr %11, align 8
  br label %30

30:                                               ; preds = %18, %17
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds %struct.lua_State, ptr %31, i32 0, i32 4
  %33 = load ptr, ptr %32, align 8
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  %37 = sub i64 0, %36
  %38 = getelementptr inbounds %struct.lua_TValue, ptr %33, i64 %37
  %39 = getelementptr inbounds %struct.CallS, ptr %9, i32 0, i32 0
  store ptr %38, ptr %39, align 8
  %40 = load i32, ptr %7, align 4
  %41 = getelementptr inbounds %struct.CallS, ptr %9, i32 0, i32 1
  store i32 %40, ptr %41, align 8
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds %struct.CallS, ptr %9, i32 0, i32 0
  %44 = load ptr, ptr %43, align 8
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds %struct.lua_State, ptr %45, i32 0, i32 10
  %47 = load ptr, ptr %46, align 8
  %48 = ptrtoint ptr %44 to i64
  %49 = ptrtoint ptr %47 to i64
  %50 = sub i64 %48, %49
  %51 = load i64, ptr %11, align 8
  %52 = call i32 @luaD_pcall(ptr noundef %42, ptr noundef @f_call, ptr noundef %9, i64 noundef %50, i64 noundef %51)
  store i32 %52, ptr %10, align 4
  %53 = load i32, ptr %7, align 4
  %54 = icmp eq i32 %53, -1
  br i1 %54, label %55, label %73

55:                                               ; preds = %30
  %56 = load ptr, ptr %5, align 8
  %57 = getelementptr inbounds %struct.lua_State, ptr %56, i32 0, i32 4
  %58 = load ptr, ptr %57, align 8
  %59 = load ptr, ptr %5, align 8
  %60 = getelementptr inbounds %struct.lua_State, ptr %59, i32 0, i32 7
  %61 = load ptr, ptr %60, align 8
  %62 = getelementptr inbounds %struct.CallInfo, ptr %61, i32 0, i32 2
  %63 = load ptr, ptr %62, align 8
  %64 = icmp uge ptr %58, %63
  br i1 %64, label %65, label %73

65:                                               ; preds = %55
  %66 = load ptr, ptr %5, align 8
  %67 = getelementptr inbounds %struct.lua_State, ptr %66, i32 0, i32 4
  %68 = load ptr, ptr %67, align 8
  %69 = load ptr, ptr %5, align 8
  %70 = getelementptr inbounds %struct.lua_State, ptr %69, i32 0, i32 7
  %71 = load ptr, ptr %70, align 8
  %72 = getelementptr inbounds %struct.CallInfo, ptr %71, i32 0, i32 2
  store ptr %68, ptr %72, align 8
  br label %73

73:                                               ; preds = %65, %55, %30
  %74 = load i32, ptr %10, align 4
  ret i32 %74
}

declare i32 @luaD_pcall(ptr noundef, ptr noundef, ptr noundef, i64 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @f_call(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.CallS, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.CallS, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 8
  call void @luaD_call(ptr noundef %7, ptr noundef %10, i32 noundef %13)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_cpcall(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.CCallS, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.CCallS, ptr %7, i32 0, i32 0
  store ptr %9, ptr %10, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = getelementptr inbounds %struct.CCallS, ptr %7, i32 0, i32 1
  store ptr %11, ptr %12, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.lua_State, ptr %14, i32 0, i32 4
  %16 = load ptr, ptr %15, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.lua_State, ptr %17, i32 0, i32 10
  %19 = load ptr, ptr %18, align 8
  %20 = ptrtoint ptr %16 to i64
  %21 = ptrtoint ptr %19 to i64
  %22 = sub i64 %20, %21
  %23 = call i32 @luaD_pcall(ptr noundef %13, ptr noundef @f_Ccall, ptr noundef %7, i64 noundef %22, i64 noundef 0)
  store i32 %23, ptr %8, align 4
  %24 = load i32, ptr %8, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @f_Ccall(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %11 = load ptr, ptr %4, align 8
  store ptr %11, ptr %5, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = call ptr @getcurrenv(ptr noundef %13)
  %15 = call ptr @luaF_newCclosure(ptr noundef %12, i32 noundef 0, ptr noundef %14)
  store ptr %15, ptr %6, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.CCallS, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds %struct.CClosure, ptr %19, i32 0, i32 8
  store ptr %18, ptr %20, align 8
  %21 = load ptr, ptr %6, align 8
  store ptr %21, ptr %7, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.lua_State, ptr %22, i32 0, i32 4
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %8, align 8
  %25 = load ptr, ptr %7, align 8
  %26 = load ptr, ptr %8, align 8
  %27 = getelementptr inbounds %struct.lua_TValue, ptr %26, i32 0, i32 0
  store ptr %25, ptr %27, align 8
  %28 = load ptr, ptr %8, align 8
  %29 = getelementptr inbounds %struct.lua_TValue, ptr %28, i32 0, i32 1
  store i32 6, ptr %29, align 8
  %30 = load ptr, ptr %3, align 8
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds %struct.lua_State, ptr %31, i32 0, i32 4
  %33 = load ptr, ptr %32, align 8
  %34 = getelementptr inbounds %struct.lua_TValue, ptr %33, i32 1
  store ptr %34, ptr %32, align 8
  %35 = load ptr, ptr %5, align 8
  %36 = getelementptr inbounds %struct.CCallS, ptr %35, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  store ptr %37, ptr %9, align 8
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds %struct.lua_State, ptr %38, i32 0, i32 4
  %40 = load ptr, ptr %39, align 8
  store ptr %40, ptr %10, align 8
  %41 = load ptr, ptr %9, align 8
  %42 = load ptr, ptr %10, align 8
  %43 = getelementptr inbounds %struct.lua_TValue, ptr %42, i32 0, i32 0
  store ptr %41, ptr %43, align 8
  %44 = load ptr, ptr %10, align 8
  %45 = getelementptr inbounds %struct.lua_TValue, ptr %44, i32 0, i32 1
  store i32 2, ptr %45, align 8
  %46 = load ptr, ptr %3, align 8
  %47 = load ptr, ptr %3, align 8
  %48 = getelementptr inbounds %struct.lua_State, ptr %47, i32 0, i32 4
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds %struct.lua_TValue, ptr %49, i32 1
  store ptr %50, ptr %48, align 8
  %51 = load ptr, ptr %3, align 8
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds %struct.lua_State, ptr %52, i32 0, i32 4
  %54 = load ptr, ptr %53, align 8
  %55 = getelementptr inbounds %struct.lua_TValue, ptr %54, i64 -2
  call void @luaD_call(ptr noundef %51, ptr noundef %55, i32 noundef 0)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_load(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %struct.Zio, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %11 = load ptr, ptr %8, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %14, label %13

13:                                               ; preds = %4
  store ptr @.str.2, ptr %8, align 8
  br label %14

14:                                               ; preds = %13, %4
  %15 = load ptr, ptr %5, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = load ptr, ptr %7, align 8
  call void @luaZ_init(ptr noundef %15, ptr noundef %9, ptr noundef %16, ptr noundef %17)
  %18 = load ptr, ptr %5, align 8
  %19 = load ptr, ptr %8, align 8
  %20 = call i32 @luaD_protectedparser(ptr noundef %18, ptr noundef %9, ptr noundef %19)
  store i32 %20, ptr %10, align 4
  %21 = load i32, ptr %10, align 4
  ret i32 %21
}

declare void @luaZ_init(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @luaD_protectedparser(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_dump(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.lua_State, ptr %10, i32 0, i32 4
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds %struct.lua_TValue, ptr %12, i64 -1
  store ptr %13, ptr %8, align 8
  %14 = load ptr, ptr %8, align 8
  %15 = getelementptr inbounds %struct.lua_TValue, ptr %14, i32 0, i32 1
  %16 = load i32, ptr %15, align 8
  %17 = icmp eq i32 %16, 6
  br i1 %17, label %18, label %35

18:                                               ; preds = %3
  %19 = load ptr, ptr %8, align 8
  %20 = getelementptr inbounds %struct.lua_TValue, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds %struct.CClosure, ptr %21, i32 0, i32 3
  %23 = load i8, ptr %22, align 2
  %24 = icmp ne i8 %23, 0
  br i1 %24, label %35, label %25

25:                                               ; preds = %18
  %26 = load ptr, ptr %4, align 8
  %27 = load ptr, ptr %8, align 8
  %28 = getelementptr inbounds %struct.lua_TValue, ptr %27, i32 0, i32 0
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds %struct.LClosure, ptr %29, i32 0, i32 8
  %31 = load ptr, ptr %30, align 8
  %32 = load ptr, ptr %5, align 8
  %33 = load ptr, ptr %6, align 8
  %34 = call i32 @luaU_dump(ptr noundef %26, ptr noundef %31, ptr noundef %32, ptr noundef %33, i32 noundef 0)
  store i32 %34, ptr %7, align 4
  br label %36

35:                                               ; preds = %18, %3
  store i32 1, ptr %7, align 4
  br label %36

36:                                               ; preds = %35, %25
  %37 = load i32, ptr %7, align 4
  ret i32 %37
}

declare i32 @luaU_dump(ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_status(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.lua_State, ptr %3, i32 0, i32 3
  %5 = load i8, ptr %4, align 2
  %6 = zext i8 %5 to i32
  ret i32 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_gc(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.lua_State, ptr %11, i32 0, i32 6
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %8, align 8
  %14 = load i32, ptr %5, align 4
  switch i32 %14, label %149 [
    i32 0, label %15
    i32 1, label %24
    i32 2, label %33
    i32 3, label %35
    i32 4, label %41
    i32 5, label %47
    i32 6, label %96
    i32 7, label %103
    i32 8, label %110
    i32 9, label %143
  ]

15:                                               ; preds = %3
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.lua_State, ptr %16, i32 0, i32 6
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.global_State, ptr %18, i32 0, i32 5
  %20 = load i8, ptr %19, align 2
  %21 = zext i8 %20 to i32
  %22 = or i32 %21, 1
  %23 = trunc i32 %22 to i8
  store i8 %23, ptr %19, align 2
  br label %150

24:                                               ; preds = %3
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.lua_State, ptr %25, i32 0, i32 6
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %struct.global_State, ptr %27, i32 0, i32 5
  %29 = load i8, ptr %28, align 2
  %30 = zext i8 %29 to i32
  %31 = and i32 %30, 254
  %32 = trunc i32 %31 to i8
  store i8 %32, ptr %28, align 2
  br label %150

33:                                               ; preds = %3
  %34 = load ptr, ptr %4, align 8
  call void @luaC_fullgc(ptr noundef %34)
  br label %150

35:                                               ; preds = %3
  %36 = load ptr, ptr %8, align 8
  %37 = getelementptr inbounds %struct.global_State, ptr %36, i32 0, i32 15
  %38 = load i64, ptr %37, align 8
  %39 = lshr i64 %38, 10
  %40 = trunc i64 %39 to i32
  store i32 %40, ptr %7, align 4
  br label %150

41:                                               ; preds = %3
  %42 = load ptr, ptr %8, align 8
  %43 = getelementptr inbounds %struct.global_State, ptr %42, i32 0, i32 15
  %44 = load i64, ptr %43, align 8
  %45 = and i64 %44, 1023
  %46 = trunc i64 %45 to i32
  store i32 %46, ptr %7, align 4
  br label %150

47:                                               ; preds = %3
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds %struct.lua_State, ptr %48, i32 0, i32 6
  %50 = load ptr, ptr %49, align 8
  %51 = getelementptr inbounds %struct.global_State, ptr %50, i32 0, i32 5
  %52 = load i8, ptr %51, align 2
  %53 = zext i8 %52 to i32
  %54 = and i32 %53, 1
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %57

56:                                               ; preds = %47
  store i32 1, ptr %7, align 4
  br label %150

57:                                               ; preds = %47
  %58 = load i32, ptr %6, align 4
  %59 = sext i32 %58 to i64
  %60 = shl i64 %59, 10
  store i64 %60, ptr %9, align 8
  %61 = load i64, ptr %9, align 8
  %62 = load ptr, ptr %8, align 8
  %63 = getelementptr inbounds %struct.global_State, ptr %62, i32 0, i32 15
  %64 = load i64, ptr %63, align 8
  %65 = icmp ule i64 %61, %64
  br i1 %65, label %66, label %74

66:                                               ; preds = %57
  %67 = load ptr, ptr %8, align 8
  %68 = getelementptr inbounds %struct.global_State, ptr %67, i32 0, i32 15
  %69 = load i64, ptr %68, align 8
  %70 = load i64, ptr %9, align 8
  %71 = sub i64 %69, %70
  %72 = load ptr, ptr %8, align 8
  %73 = getelementptr inbounds %struct.global_State, ptr %72, i32 0, i32 14
  store i64 %71, ptr %73, align 8
  br label %77

74:                                               ; preds = %57
  %75 = load ptr, ptr %8, align 8
  %76 = getelementptr inbounds %struct.global_State, ptr %75, i32 0, i32 14
  store i64 0, ptr %76, align 8
  br label %77

77:                                               ; preds = %74, %66
  br label %78

78:                                               ; preds = %94, %77
  %79 = load ptr, ptr %8, align 8
  %80 = getelementptr inbounds %struct.global_State, ptr %79, i32 0, i32 14
  %81 = load i64, ptr %80, align 8
  %82 = load ptr, ptr %8, align 8
  %83 = getelementptr inbounds %struct.global_State, ptr %82, i32 0, i32 15
  %84 = load i64, ptr %83, align 8
  %85 = icmp ule i64 %81, %84
  br i1 %85, label %86, label %95

86:                                               ; preds = %78
  %87 = load ptr, ptr %4, align 8
  call void @luaC_step(ptr noundef %87)
  %88 = load ptr, ptr %8, align 8
  %89 = getelementptr inbounds %struct.global_State, ptr %88, i32 0, i32 4
  %90 = load i8, ptr %89, align 1
  %91 = zext i8 %90 to i32
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %93, label %94

93:                                               ; preds = %86
  store i32 1, ptr %7, align 4
  br label %95

94:                                               ; preds = %86
  br label %78, !llvm.loop !12

95:                                               ; preds = %93, %78
  br label %150

96:                                               ; preds = %3
  %97 = load ptr, ptr %8, align 8
  %98 = getelementptr inbounds %struct.global_State, ptr %97, i32 0, i32 19
  %99 = load i32, ptr %98, align 8
  store i32 %99, ptr %7, align 4
  %100 = load i32, ptr %6, align 4
  %101 = load ptr, ptr %8, align 8
  %102 = getelementptr inbounds %struct.global_State, ptr %101, i32 0, i32 19
  store i32 %100, ptr %102, align 8
  br label %150

103:                                              ; preds = %3
  %104 = load ptr, ptr %8, align 8
  %105 = getelementptr inbounds %struct.global_State, ptr %104, i32 0, i32 20
  %106 = load i32, ptr %105, align 4
  store i32 %106, ptr %7, align 4
  %107 = load i32, ptr %6, align 4
  %108 = load ptr, ptr %8, align 8
  %109 = getelementptr inbounds %struct.global_State, ptr %108, i32 0, i32 20
  store i32 %107, ptr %109, align 4
  br label %150

110:                                              ; preds = %3
  %111 = load i32, ptr %6, align 4
  %112 = sext i32 %111 to i64
  %113 = shl i64 %112, 10
  store i64 %113, ptr %10, align 8
  %114 = load i64, ptr %10, align 8
  %115 = icmp ugt i64 %114, 0
  br i1 %115, label %116, label %136

116:                                              ; preds = %110
  %117 = load i64, ptr %10, align 8
  %118 = load ptr, ptr %8, align 8
  %119 = getelementptr inbounds %struct.global_State, ptr %118, i32 0, i32 15
  %120 = load i64, ptr %119, align 8
  %121 = icmp ult i64 %117, %120
  br i1 %121, label %122, label %136

122:                                              ; preds = %116
  %123 = load ptr, ptr %4, align 8
  call void @luaC_fullgc(ptr noundef %123)
  %124 = load i64, ptr %10, align 8
  %125 = load ptr, ptr %8, align 8
  %126 = getelementptr inbounds %struct.global_State, ptr %125, i32 0, i32 15
  %127 = load i64, ptr %126, align 8
  %128 = icmp ult i64 %124, %127
  br i1 %128, label %129, label %135

129:                                              ; preds = %122
  %130 = load ptr, ptr %8, align 8
  %131 = getelementptr inbounds %struct.global_State, ptr %130, i32 0, i32 15
  %132 = load i64, ptr %131, align 8
  %133 = add i64 %132, 1024
  %134 = and i64 %133, -1024
  store i64 %134, ptr %10, align 8
  br label %135

135:                                              ; preds = %129, %122
  br label %136

136:                                              ; preds = %135, %116, %110
  %137 = load i64, ptr %10, align 8
  %138 = load ptr, ptr %8, align 8
  %139 = getelementptr inbounds %struct.global_State, ptr %138, i32 0, i32 16
  store i64 %137, ptr %139, align 8
  %140 = load i64, ptr %10, align 8
  %141 = lshr i64 %140, 10
  %142 = trunc i64 %141 to i32
  store i32 %142, ptr %7, align 4
  br label %150

143:                                              ; preds = %3
  %144 = load ptr, ptr %8, align 8
  %145 = getelementptr inbounds %struct.global_State, ptr %144, i32 0, i32 16
  %146 = load i64, ptr %145, align 8
  %147 = lshr i64 %146, 10
  %148 = trunc i64 %147 to i32
  store i32 %148, ptr %7, align 4
  br label %150

149:                                              ; preds = %3
  store i32 -1, ptr %7, align 4
  br label %150

150:                                              ; preds = %149, %143, %136, %103, %96, %95, %56, %41, %35, %33, %24, %15
  %151 = load i32, ptr %7, align 4
  ret i32 %151
}

declare void @luaC_fullgc(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_error(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  call void @luaG_errormsg(ptr noundef %4)
  ret i32 0
}

declare void @luaG_errormsg(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @lua_next(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = load i32, ptr %4, align 4
  %9 = call ptr @index2adr(ptr noundef %7, i32 noundef %8)
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.lua_TValue, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.lua_State, ptr %15, i32 0, i32 4
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds %struct.lua_TValue, ptr %17, i64 -1
  %19 = call i32 @luaH_next(ptr noundef %11, ptr noundef %14, ptr noundef %18)
  store i32 %19, ptr %6, align 4
  %20 = load i32, ptr %6, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %28

22:                                               ; preds = %2
  %23 = load ptr, ptr %3, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.lua_State, ptr %24, i32 0, i32 4
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds %struct.lua_TValue, ptr %26, i32 1
  store ptr %27, ptr %25, align 8
  br label %33

28:                                               ; preds = %2
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.lua_State, ptr %29, i32 0, i32 4
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds %struct.lua_TValue, ptr %31, i64 -1
  store ptr %32, ptr %30, align 8
  br label %33

33:                                               ; preds = %28, %22
  %34 = load i32, ptr %6, align 4
  ret i32 %34
}

declare i32 @luaH_next(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_concat(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = load i32, ptr %4, align 4
  %9 = icmp sge i32 %8, 2
  br i1 %9, label %10, label %47

10:                                               ; preds = %2
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds %struct.lua_State, ptr %11, i32 0, i32 6
  %13 = load ptr, ptr %12, align 8
  %14 = getelementptr inbounds %struct.global_State, ptr %13, i32 0, i32 15
  %15 = load i64, ptr %14, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.lua_State, ptr %16, i32 0, i32 6
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.global_State, ptr %18, i32 0, i32 14
  %20 = load i64, ptr %19, align 8
  %21 = icmp uge i64 %15, %20
  br i1 %21, label %22, label %24

22:                                               ; preds = %10
  %23 = load ptr, ptr %3, align 8
  call void @luaC_step(ptr noundef %23)
  br label %24

24:                                               ; preds = %22, %10
  %25 = load ptr, ptr %3, align 8
  %26 = load i32, ptr %4, align 4
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds %struct.lua_State, ptr %27, i32 0, i32 4
  %29 = load ptr, ptr %28, align 8
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds %struct.lua_State, ptr %30, i32 0, i32 5
  %32 = load ptr, ptr %31, align 8
  %33 = ptrtoint ptr %29 to i64
  %34 = ptrtoint ptr %32 to i64
  %35 = sub i64 %33, %34
  %36 = sdiv exact i64 %35, 16
  %37 = trunc i64 %36 to i32
  %38 = sub nsw i32 %37, 1
  call void @luaV_concat(ptr noundef %25, i32 noundef %26, i32 noundef %38)
  %39 = load i32, ptr %4, align 4
  %40 = sub nsw i32 %39, 1
  %41 = load ptr, ptr %3, align 8
  %42 = getelementptr inbounds %struct.lua_State, ptr %41, i32 0, i32 4
  %43 = load ptr, ptr %42, align 8
  %44 = sext i32 %40 to i64
  %45 = sub i64 0, %44
  %46 = getelementptr inbounds %struct.lua_TValue, ptr %43, i64 %45
  store ptr %46, ptr %42, align 8
  br label %67

47:                                               ; preds = %2
  %48 = load i32, ptr %4, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %66

50:                                               ; preds = %47
  %51 = load ptr, ptr %3, align 8
  %52 = call ptr @luaS_newlstr(ptr noundef %51, ptr noundef @.str.3, i64 noundef 0)
  store ptr %52, ptr %5, align 8
  %53 = load ptr, ptr %3, align 8
  %54 = getelementptr inbounds %struct.lua_State, ptr %53, i32 0, i32 4
  %55 = load ptr, ptr %54, align 8
  store ptr %55, ptr %6, align 8
  %56 = load ptr, ptr %5, align 8
  %57 = load ptr, ptr %6, align 8
  %58 = getelementptr inbounds %struct.lua_TValue, ptr %57, i32 0, i32 0
  store ptr %56, ptr %58, align 8
  %59 = load ptr, ptr %6, align 8
  %60 = getelementptr inbounds %struct.lua_TValue, ptr %59, i32 0, i32 1
  store i32 4, ptr %60, align 8
  %61 = load ptr, ptr %3, align 8
  %62 = load ptr, ptr %3, align 8
  %63 = getelementptr inbounds %struct.lua_State, ptr %62, i32 0, i32 4
  %64 = load ptr, ptr %63, align 8
  %65 = getelementptr inbounds %struct.lua_TValue, ptr %64, i32 1
  store ptr %65, ptr %63, align 8
  br label %66

66:                                               ; preds = %50, %47
  br label %67

67:                                               ; preds = %66, %24
  ret void
}

declare void @luaV_concat(ptr noundef, i32 noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_getallocf(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %15

8:                                                ; preds = %2
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.lua_State, ptr %9, i32 0, i32 6
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %struct.global_State, ptr %11, i32 0, i32 2
  %13 = load ptr, ptr %12, align 8
  %14 = load ptr, ptr %4, align 8
  store ptr %13, ptr %14, align 8
  br label %15

15:                                               ; preds = %8, %2
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.lua_State, ptr %16, i32 0, i32 6
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.global_State, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  store ptr %20, ptr %5, align 8
  %21 = load ptr, ptr %5, align 8
  ret ptr %21
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @lua_setallocf(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %struct.lua_State, ptr %8, i32 0, i32 6
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds %struct.global_State, ptr %10, i32 0, i32 2
  store ptr %7, ptr %11, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.lua_State, ptr %13, i32 0, i32 6
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.global_State, ptr %15, i32 0, i32 1
  store ptr %12, ptr %16, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_newuserdata(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.lua_State, ptr %8, i32 0, i32 6
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds %struct.global_State, ptr %10, i32 0, i32 15
  %12 = load i64, ptr %11, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.lua_State, ptr %13, i32 0, i32 6
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.global_State, ptr %15, i32 0, i32 14
  %17 = load i64, ptr %16, align 8
  %18 = icmp uge i64 %12, %17
  br i1 %18, label %19, label %21

19:                                               ; preds = %2
  %20 = load ptr, ptr %3, align 8
  call void @luaC_step(ptr noundef %20)
  br label %21

21:                                               ; preds = %19, %2
  %22 = load ptr, ptr %3, align 8
  %23 = load i64, ptr %4, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = call ptr @getcurrenv(ptr noundef %24)
  %26 = call ptr @luaS_newudata(ptr noundef %22, i64 noundef %23, ptr noundef %25)
  store ptr %26, ptr %5, align 8
  %27 = load ptr, ptr %5, align 8
  store ptr %27, ptr %6, align 8
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds %struct.lua_State, ptr %28, i32 0, i32 4
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %7, align 8
  %31 = load ptr, ptr %6, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds %struct.lua_TValue, ptr %32, i32 0, i32 0
  store ptr %31, ptr %33, align 8
  %34 = load ptr, ptr %7, align 8
  %35 = getelementptr inbounds %struct.lua_TValue, ptr %34, i32 0, i32 1
  store i32 7, ptr %35, align 8
  %36 = load ptr, ptr %3, align 8
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds %struct.lua_State, ptr %37, i32 0, i32 4
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds %struct.lua_TValue, ptr %39, i32 1
  store ptr %40, ptr %38, align 8
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds %union.Udata, ptr %41, i64 1
  ret ptr %42
}

declare ptr @luaS_newudata(ptr noundef, i64 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_getupvalue(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %5, align 4
  %13 = call ptr @index2adr(ptr noundef %11, i32 noundef %12)
  %14 = load i32, ptr %6, align 4
  %15 = call ptr @aux_upvalue(ptr noundef %13, i32 noundef %14, ptr noundef %8)
  store ptr %15, ptr %7, align 8
  %16 = load ptr, ptr %7, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %37

18:                                               ; preds = %3
  %19 = load ptr, ptr %8, align 8
  store ptr %19, ptr %9, align 8
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %struct.lua_State, ptr %20, i32 0, i32 4
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %10, align 8
  %23 = load ptr, ptr %10, align 8
  %24 = getelementptr inbounds %struct.lua_TValue, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %9, align 8
  %26 = getelementptr inbounds %struct.lua_TValue, ptr %25, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %24, ptr align 8 %26, i64 8, i1 false)
  %27 = load ptr, ptr %9, align 8
  %28 = getelementptr inbounds %struct.lua_TValue, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %28, align 8
  %30 = load ptr, ptr %10, align 8
  %31 = getelementptr inbounds %struct.lua_TValue, ptr %30, i32 0, i32 1
  store i32 %29, ptr %31, align 8
  %32 = load ptr, ptr %4, align 8
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds %struct.lua_State, ptr %33, i32 0, i32 4
  %35 = load ptr, ptr %34, align 8
  %36 = getelementptr inbounds %struct.lua_TValue, ptr %35, i32 1
  store ptr %36, ptr %34, align 8
  br label %37

37:                                               ; preds = %18, %3
  %38 = load ptr, ptr %7, align 8
  ret ptr %38
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @aux_upvalue(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds %struct.lua_TValue, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 6
  br i1 %13, label %15, label %14

14:                                               ; preds = %3
  store ptr null, ptr %4, align 8
  br label %75

15:                                               ; preds = %3
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.lua_TValue, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %8, align 8
  %19 = load ptr, ptr %8, align 8
  %20 = getelementptr inbounds %struct.CClosure, ptr %19, i32 0, i32 3
  %21 = load i8, ptr %20, align 2
  %22 = icmp ne i8 %21, 0
  br i1 %22, label %23, label %42

23:                                               ; preds = %15
  %24 = load i32, ptr %6, align 4
  %25 = icmp sle i32 1, %24
  br i1 %25, label %26, label %33

26:                                               ; preds = %23
  %27 = load i32, ptr %6, align 4
  %28 = load ptr, ptr %8, align 8
  %29 = getelementptr inbounds %struct.CClosure, ptr %28, i32 0, i32 4
  %30 = load i8, ptr %29, align 1
  %31 = zext i8 %30 to i32
  %32 = icmp sle i32 %27, %31
  br i1 %32, label %34, label %33

33:                                               ; preds = %26, %23
  store ptr null, ptr %4, align 8
  br label %75

34:                                               ; preds = %26
  %35 = load ptr, ptr %8, align 8
  %36 = getelementptr inbounds %struct.CClosure, ptr %35, i32 0, i32 9
  %37 = load i32, ptr %6, align 4
  %38 = sub nsw i32 %37, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1 x %struct.lua_TValue], ptr %36, i64 0, i64 %39
  %41 = load ptr, ptr %7, align 8
  store ptr %40, ptr %41, align 8
  store ptr @.str.3, ptr %4, align 8
  br label %75

42:                                               ; preds = %15
  %43 = load ptr, ptr %8, align 8
  %44 = getelementptr inbounds %struct.LClosure, ptr %43, i32 0, i32 8
  %45 = load ptr, ptr %44, align 8
  store ptr %45, ptr %9, align 8
  %46 = load i32, ptr %6, align 4
  %47 = icmp sle i32 1, %46
  br i1 %47, label %48, label %54

48:                                               ; preds = %42
  %49 = load i32, ptr %6, align 4
  %50 = load ptr, ptr %9, align 8
  %51 = getelementptr inbounds %struct.Proto, ptr %50, i32 0, i32 10
  %52 = load i32, ptr %51, align 8
  %53 = icmp sle i32 %49, %52
  br i1 %53, label %55, label %54

54:                                               ; preds = %48, %42
  store ptr null, ptr %4, align 8
  br label %75

55:                                               ; preds = %48
  %56 = load ptr, ptr %8, align 8
  %57 = getelementptr inbounds %struct.LClosure, ptr %56, i32 0, i32 9
  %58 = load i32, ptr %6, align 4
  %59 = sub nsw i32 %58, 1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [1 x ptr], ptr %57, i64 0, i64 %60
  %62 = load ptr, ptr %61, align 8
  %63 = getelementptr inbounds %struct.UpVal, ptr %62, i32 0, i32 3
  %64 = load ptr, ptr %63, align 8
  %65 = load ptr, ptr %7, align 8
  store ptr %64, ptr %65, align 8
  %66 = load ptr, ptr %9, align 8
  %67 = getelementptr inbounds %struct.Proto, ptr %66, i32 0, i32 8
  %68 = load ptr, ptr %67, align 8
  %69 = load i32, ptr %6, align 4
  %70 = sub nsw i32 %69, 1
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds ptr, ptr %68, i64 %71
  %73 = load ptr, ptr %72, align 8
  %74 = getelementptr inbounds %union.TString, ptr %73, i64 1
  store ptr %74, ptr %4, align 8
  br label %75

75:                                               ; preds = %55, %54, %34, %33, %14
  %76 = load ptr, ptr %4, align 8
  ret ptr %76
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @lua_setupvalue(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %12 = load ptr, ptr %4, align 8
  %13 = load i32, ptr %5, align 4
  %14 = call ptr @index2adr(ptr noundef %12, i32 noundef %13)
  store ptr %14, ptr %9, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = load ptr, ptr %9, align 8
  %17 = load i32, ptr %6, align 4
  %18 = call ptr @aux_upvalue(ptr noundef %16, i32 noundef %17, ptr noundef %8)
  store ptr %18, ptr %7, align 8
  %19 = load ptr, ptr %7, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %76

21:                                               ; preds = %3
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.lua_State, ptr %22, i32 0, i32 4
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.lua_TValue, ptr %24, i32 -1
  store ptr %25, ptr %23, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.lua_State, ptr %26, i32 0, i32 4
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %10, align 8
  %29 = load ptr, ptr %8, align 8
  store ptr %29, ptr %11, align 8
  %30 = load ptr, ptr %11, align 8
  %31 = getelementptr inbounds %struct.lua_TValue, ptr %30, i32 0, i32 0
  %32 = load ptr, ptr %10, align 8
  %33 = getelementptr inbounds %struct.lua_TValue, ptr %32, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %31, ptr align 8 %33, i64 8, i1 false)
  %34 = load ptr, ptr %10, align 8
  %35 = getelementptr inbounds %struct.lua_TValue, ptr %34, i32 0, i32 1
  %36 = load i32, ptr %35, align 8
  %37 = load ptr, ptr %11, align 8
  %38 = getelementptr inbounds %struct.lua_TValue, ptr %37, i32 0, i32 1
  store i32 %36, ptr %38, align 8
  %39 = load ptr, ptr %4, align 8
  %40 = getelementptr inbounds %struct.lua_State, ptr %39, i32 0, i32 4
  %41 = load ptr, ptr %40, align 8
  %42 = getelementptr inbounds %struct.lua_TValue, ptr %41, i32 0, i32 1
  %43 = load i32, ptr %42, align 8
  %44 = icmp sge i32 %43, 4
  br i1 %44, label %45, label %75

45:                                               ; preds = %21
  %46 = load ptr, ptr %4, align 8
  %47 = getelementptr inbounds %struct.lua_State, ptr %46, i32 0, i32 4
  %48 = load ptr, ptr %47, align 8
  %49 = getelementptr inbounds %struct.lua_TValue, ptr %48, i32 0, i32 0
  %50 = load ptr, ptr %49, align 8
  %51 = getelementptr inbounds %struct.GCheader, ptr %50, i32 0, i32 2
  %52 = load i8, ptr %51, align 1
  %53 = zext i8 %52 to i32
  %54 = and i32 %53, 3
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %75

56:                                               ; preds = %45
  %57 = load ptr, ptr %9, align 8
  %58 = getelementptr inbounds %struct.lua_TValue, ptr %57, i32 0, i32 0
  %59 = load ptr, ptr %58, align 8
  %60 = getelementptr inbounds %struct.GCheader, ptr %59, i32 0, i32 2
  %61 = load i8, ptr %60, align 1
  %62 = zext i8 %61 to i32
  %63 = and i32 %62, 4
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %75

65:                                               ; preds = %56
  %66 = load ptr, ptr %4, align 8
  %67 = load ptr, ptr %9, align 8
  %68 = getelementptr inbounds %struct.lua_TValue, ptr %67, i32 0, i32 0
  %69 = load ptr, ptr %68, align 8
  %70 = load ptr, ptr %4, align 8
  %71 = getelementptr inbounds %struct.lua_State, ptr %70, i32 0, i32 4
  %72 = load ptr, ptr %71, align 8
  %73 = getelementptr inbounds %struct.lua_TValue, ptr %72, i32 0, i32 0
  %74 = load ptr, ptr %73, align 8
  call void @luaC_barrierf(ptr noundef %66, ptr noundef %69, ptr noundef %74)
  br label %75

75:                                               ; preds = %65, %56, %45, %21
  br label %76

76:                                               ; preds = %75, %3
  %77 = load ptr, ptr %7, align 8
  ret ptr %77
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
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
