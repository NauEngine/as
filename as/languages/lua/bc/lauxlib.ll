; ModuleID = '/Users/alexzelenshikov/Work/NAU_ENGINE/as_proto/cmake-build-debug/as/languages/lua/lauxlib.bc'
source_filename = "lua/lauxlib.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

%struct.lua_Debug = type { i32, ptr, ptr, ptr, ptr, i32, i32, i32, i32, [60 x i8], i32 }
%struct.luaL_Reg = type { ptr, ptr }
%struct.luaL_Reg3 = type { ptr, ptr, ptr }
%struct.lua_State = type { ptr, i8, i8, i8, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i16, i8, i8, i32, i32, ptr, %struct.lua_TValue, %struct.lua_TValue, ptr, ptr, ptr, i64 }
%struct.lua_TValue = type { %union.Value, i32 }
%union.Value = type { ptr }
%struct.CClosure = type { ptr, i8, i8, i8, i8, ptr, ptr, ptr, ptr, [1 x %struct.lua_TValue] }
%struct.luaL_Buffer = type { ptr, i32, ptr, [1024 x i8] }
%struct.LoadF = type { i32, ptr, [1024 x i8] }
%struct.LoadS = type { ptr, i64 }
%struct.global_State = type { %struct.stringtable, ptr, ptr, i8, i8, i8, i32, ptr, ptr, ptr, ptr, ptr, ptr, %struct.Mbuffer, i64, i64, i64, i64, i64, i32, i32, ptr, %struct.lua_TValue, ptr, %struct.UpVal, [9 x ptr], [17 x ptr] }
%struct.stringtable = type { ptr, i32, i32 }
%struct.Mbuffer = type { ptr, i64, i64 }
%struct.UpVal = type { ptr, i8, i8, ptr, %union.anon }
%union.anon = type { %struct.lua_TValue }

@.str = private unnamed_addr constant [22 x i8] c"bad argument #%d (%s)\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"method\00", align 1
@.str.3 = private unnamed_addr constant [30 x i8] c"calling '%s' on bad self (%s)\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"?\00", align 1
@.str.5 = private unnamed_addr constant [30 x i8] c"bad argument #%d to '%s' (%s)\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"%s expected, got %s\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"Sl\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"%s:%d: \00", align 1
@.str.9 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.10 = private unnamed_addr constant [20 x i8] c"invalid option '%s'\00", align 1
@.str.11 = private unnamed_addr constant [20 x i8] c"stack overflow (%s)\00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c"value expected\00", align 1
@.str.13 = private unnamed_addr constant [8 x i8] c"_LOADED\00", align 1
@.str.14 = private unnamed_addr constant [30 x i8] c"name conflict for module '%s'\00", align 1
@.str.15 = private unnamed_addr constant [7 x i8] c"=stdin\00", align 1
@__stdinp = external global ptr, align 8
@.str.16 = private unnamed_addr constant [4 x i8] c"@%s\00", align 1
@.str.17 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.18 = private unnamed_addr constant [5 x i8] c"open\00", align 1
@.str.19 = private unnamed_addr constant [5 x i8] c"\1BLua\00", align 1
@.str.20 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.21 = private unnamed_addr constant [7 x i8] c"reopen\00", align 1
@.str.22 = private unnamed_addr constant [5 x i8] c"read\00", align 1
@.str.23 = private unnamed_addr constant [17 x i8] c"cannot %s %s: %s\00", align 1
@.str.24 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__stderrp = external global ptr, align 8
@.str.25 = private unnamed_addr constant [50 x i8] c"PANIC: unprotected error in call to Lua API (%s)\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_argerror(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca %struct.lua_Debug, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = call i32 @lua_getstack(ptr noundef %9, i32 noundef 0, ptr noundef %8)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %17, label %12

12:                                               ; preds = %3
  %13 = load ptr, ptr %5, align 8
  %14 = load i32, ptr %6, align 4
  %15 = load ptr, ptr %7, align 8
  %16 = call i32 (ptr, ptr, ...) @luaL_error(ptr noundef %13, ptr noundef @.str, i32 noundef %14, ptr noundef %15)
  store i32 %16, ptr %4, align 4
  br label %49

17:                                               ; preds = %3
  %18 = load ptr, ptr %5, align 8
  %19 = call i32 @lua_getinfo(ptr noundef %18, ptr noundef @.str.1, ptr noundef %8)
  %20 = getelementptr inbounds %struct.lua_Debug, ptr %8, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  %22 = call i32 @strcmp(ptr noundef %21, ptr noundef @.str.2)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %36

24:                                               ; preds = %17
  %25 = load i32, ptr %6, align 4
  %26 = add nsw i32 %25, -1
  store i32 %26, ptr %6, align 4
  %27 = load i32, ptr %6, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %35

29:                                               ; preds = %24
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.lua_Debug, ptr %8, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = load ptr, ptr %7, align 8
  %34 = call i32 (ptr, ptr, ...) @luaL_error(ptr noundef %30, ptr noundef @.str.3, ptr noundef %32, ptr noundef %33)
  store i32 %34, ptr %4, align 4
  br label %49

35:                                               ; preds = %24
  br label %36

36:                                               ; preds = %35, %17
  %37 = getelementptr inbounds %struct.lua_Debug, ptr %8, i32 0, i32 1
  %38 = load ptr, ptr %37, align 8
  %39 = icmp eq ptr %38, null
  br i1 %39, label %40, label %42

40:                                               ; preds = %36
  %41 = getelementptr inbounds %struct.lua_Debug, ptr %8, i32 0, i32 1
  store ptr @.str.4, ptr %41, align 8
  br label %42

42:                                               ; preds = %40, %36
  %43 = load ptr, ptr %5, align 8
  %44 = load i32, ptr %6, align 4
  %45 = getelementptr inbounds %struct.lua_Debug, ptr %8, i32 0, i32 1
  %46 = load ptr, ptr %45, align 8
  %47 = load ptr, ptr %7, align 8
  %48 = call i32 (ptr, ptr, ...) @luaL_error(ptr noundef %43, ptr noundef @.str.5, i32 noundef %44, ptr noundef %46, ptr noundef %47)
  store i32 %48, ptr %4, align 4
  br label %49

49:                                               ; preds = %42, %29, %12
  %50 = load i32, ptr %4, align 4
  ret i32 %50
}

declare i32 @lua_getstack(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_error(ptr noundef %0, ptr noundef %1, ...) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  call void @llvm.va_start(ptr %5)
  %6 = load ptr, ptr %3, align 8
  call void @luaL_where(ptr noundef %6, i32 noundef 1)
  %7 = load ptr, ptr %3, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = call ptr @lua_pushvfstring(ptr noundef %7, ptr noundef %8, ptr noundef %9)
  call void @llvm.va_end(ptr %5)
  %11 = load ptr, ptr %3, align 8
  call void @lua_concat(ptr noundef %11, i32 noundef 2)
  %12 = load ptr, ptr %3, align 8
  %13 = call i32 @lua_error(ptr noundef %12)
  ret i32 %13
}

declare i32 @lua_getinfo(ptr noundef, ptr noundef, ptr noundef) #1

declare i32 @strcmp(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_typerror(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %5, align 4
  %13 = call i32 @lua_type(ptr noundef %11, i32 noundef %12)
  %14 = call ptr @lua_typename(ptr noundef %10, i32 noundef %13)
  %15 = call ptr (ptr, ptr, ...) @lua_pushfstring(ptr noundef %8, ptr noundef @.str.6, ptr noundef %9, ptr noundef %14)
  store ptr %15, ptr %7, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = load i32, ptr %5, align 4
  %18 = load ptr, ptr %7, align 8
  %19 = call i32 @luaL_argerror(ptr noundef %16, i32 noundef %17, ptr noundef %18)
  ret i32 %19
}

declare ptr @lua_pushfstring(ptr noundef, ptr noundef, ...) #1

declare ptr @lua_typename(ptr noundef, i32 noundef) #1

declare i32 @lua_type(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_where(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.lua_Debug, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  %8 = call i32 @lua_getstack(ptr noundef %6, i32 noundef %7, ptr noundef %5)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %24

10:                                               ; preds = %2
  %11 = load ptr, ptr %3, align 8
  %12 = call i32 @lua_getinfo(ptr noundef %11, ptr noundef @.str.7, ptr noundef %5)
  %13 = getelementptr inbounds %struct.lua_Debug, ptr %5, i32 0, i32 5
  %14 = load i32, ptr %13, align 8
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %23

16:                                               ; preds = %10
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.lua_Debug, ptr %5, i32 0, i32 9
  %19 = getelementptr inbounds [60 x i8], ptr %18, i64 0, i64 0
  %20 = getelementptr inbounds %struct.lua_Debug, ptr %5, i32 0, i32 5
  %21 = load i32, ptr %20, align 8
  %22 = call ptr (ptr, ptr, ...) @lua_pushfstring(ptr noundef %17, ptr noundef @.str.8, ptr noundef %19, i32 noundef %21)
  br label %26

23:                                               ; preds = %10
  br label %24

24:                                               ; preds = %23, %2
  %25 = load ptr, ptr %3, align 8
  call void @lua_pushlstring(ptr noundef %25, ptr noundef @.str.9, i64 noundef 0)
  br label %26

26:                                               ; preds = %24, %16
  ret void
}

declare void @lua_pushlstring(ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #2

declare ptr @lua_pushvfstring(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #2

declare void @lua_concat(ptr noundef, i32 noundef) #1

declare i32 @lua_error(ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_checkoption(ptr noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %19

14:                                               ; preds = %4
  %15 = load ptr, ptr %6, align 8
  %16 = load i32, ptr %7, align 4
  %17 = load ptr, ptr %8, align 8
  %18 = call ptr @luaL_optlstring(ptr noundef %15, i32 noundef %16, ptr noundef %17, ptr noundef null)
  br label %23

19:                                               ; preds = %4
  %20 = load ptr, ptr %6, align 8
  %21 = load i32, ptr %7, align 4
  %22 = call ptr @luaL_checklstring(ptr noundef %20, i32 noundef %21, ptr noundef null)
  br label %23

23:                                               ; preds = %19, %14
  %24 = phi ptr [ %18, %14 ], [ %22, %19 ]
  store ptr %24, ptr %10, align 8
  store i32 0, ptr %11, align 4
  br label %25

25:                                               ; preds = %44, %23
  %26 = load ptr, ptr %9, align 8
  %27 = load i32, ptr %11, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds ptr, ptr %26, i64 %28
  %30 = load ptr, ptr %29, align 8
  %31 = icmp ne ptr %30, null
  br i1 %31, label %32, label %47

32:                                               ; preds = %25
  %33 = load ptr, ptr %9, align 8
  %34 = load i32, ptr %11, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds ptr, ptr %33, i64 %35
  %37 = load ptr, ptr %36, align 8
  %38 = load ptr, ptr %10, align 8
  %39 = call i32 @strcmp(ptr noundef %37, ptr noundef %38)
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %43

41:                                               ; preds = %32
  %42 = load i32, ptr %11, align 4
  store i32 %42, ptr %5, align 4
  br label %54

43:                                               ; preds = %32
  br label %44

44:                                               ; preds = %43
  %45 = load i32, ptr %11, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %11, align 4
  br label %25, !llvm.loop !6

47:                                               ; preds = %25
  %48 = load ptr, ptr %6, align 8
  %49 = load i32, ptr %7, align 4
  %50 = load ptr, ptr %6, align 8
  %51 = load ptr, ptr %10, align 8
  %52 = call ptr (ptr, ptr, ...) @lua_pushfstring(ptr noundef %50, ptr noundef @.str.10, ptr noundef %51)
  %53 = call i32 @luaL_argerror(ptr noundef %48, i32 noundef %49, ptr noundef %52)
  store i32 %53, ptr %5, align 4
  br label %54

54:                                               ; preds = %47, %41
  %55 = load i32, ptr %5, align 4
  ret i32 %55
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @luaL_optlstring(ptr noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load i32, ptr %7, align 4
  %12 = call i32 @lua_type(ptr noundef %10, i32 noundef %11)
  %13 = icmp sle i32 %12, 0
  br i1 %13, label %14, label %29

14:                                               ; preds = %4
  %15 = load ptr, ptr %9, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %27

17:                                               ; preds = %14
  %18 = load ptr, ptr %8, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %23

20:                                               ; preds = %17
  %21 = load ptr, ptr %8, align 8
  %22 = call i64 @strlen(ptr noundef %21)
  br label %24

23:                                               ; preds = %17
  br label %24

24:                                               ; preds = %23, %20
  %25 = phi i64 [ %22, %20 ], [ 0, %23 ]
  %26 = load ptr, ptr %9, align 8
  store i64 %25, ptr %26, align 8
  br label %27

27:                                               ; preds = %24, %14
  %28 = load ptr, ptr %8, align 8
  store ptr %28, ptr %5, align 8
  br label %34

29:                                               ; preds = %4
  %30 = load ptr, ptr %6, align 8
  %31 = load i32, ptr %7, align 4
  %32 = load ptr, ptr %9, align 8
  %33 = call ptr @luaL_checklstring(ptr noundef %30, i32 noundef %31, ptr noundef %32)
  store ptr %33, ptr %5, align 8
  br label %34

34:                                               ; preds = %29, %27
  %35 = load ptr, ptr %5, align 8
  ret ptr %35
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @luaL_checklstring(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load i32, ptr %5, align 4
  %10 = load ptr, ptr %6, align 8
  %11 = call ptr @lua_tolstring(ptr noundef %8, i32 noundef %9, ptr noundef %10)
  store ptr %11, ptr %7, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %17, label %14

14:                                               ; preds = %3
  %15 = load ptr, ptr %4, align 8
  %16 = load i32, ptr %5, align 4
  call void @tag_error(ptr noundef %15, i32 noundef %16, i32 noundef 4)
  br label %17

17:                                               ; preds = %14, %3
  %18 = load ptr, ptr %7, align 8
  ret ptr %18
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_newmetatable(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %5, align 8
  call void @lua_getfield(ptr noundef %6, i32 noundef -10000, ptr noundef %7)
  %8 = load ptr, ptr %4, align 8
  %9 = call i32 @lua_type(ptr noundef %8, i32 noundef -1)
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %2
  store i32 0, ptr %3, align 4
  br label %18

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8
  call void @lua_settop(ptr noundef %13, i32 noundef -2)
  %14 = load ptr, ptr %4, align 8
  call void @lua_createtable(ptr noundef %14, i32 noundef 0, i32 noundef 0)
  %15 = load ptr, ptr %4, align 8
  call void @lua_pushvalue(ptr noundef %15, i32 noundef -1)
  %16 = load ptr, ptr %4, align 8
  %17 = load ptr, ptr %5, align 8
  call void @lua_setfield(ptr noundef %16, i32 noundef -10000, ptr noundef %17)
  store i32 1, ptr %3, align 4
  br label %18

18:                                               ; preds = %12, %11
  %19 = load i32, ptr %3, align 4
  ret i32 %19
}

declare void @lua_getfield(ptr noundef, i32 noundef, ptr noundef) #1

declare void @lua_settop(ptr noundef, i32 noundef) #1

declare void @lua_createtable(ptr noundef, i32 noundef, i32 noundef) #1

declare void @lua_pushvalue(ptr noundef, i32 noundef) #1

declare void @lua_setfield(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @luaL_checkudata(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
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
  %11 = call ptr @lua_touserdata(ptr noundef %9, i32 noundef %10)
  store ptr %11, ptr %8, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %30

14:                                               ; preds = %3
  %15 = load ptr, ptr %5, align 8
  %16 = load i32, ptr %6, align 4
  %17 = call i32 @lua_getmetatable(ptr noundef %15, i32 noundef %16)
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %29

19:                                               ; preds = %14
  %20 = load ptr, ptr %5, align 8
  %21 = load ptr, ptr %7, align 8
  call void @lua_getfield(ptr noundef %20, i32 noundef -10000, ptr noundef %21)
  %22 = load ptr, ptr %5, align 8
  %23 = call i32 @lua_rawequal(ptr noundef %22, i32 noundef -1, i32 noundef -2)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %28

25:                                               ; preds = %19
  %26 = load ptr, ptr %5, align 8
  call void @lua_settop(ptr noundef %26, i32 noundef -3)
  %27 = load ptr, ptr %8, align 8
  store ptr %27, ptr %4, align 8
  br label %35

28:                                               ; preds = %19
  br label %29

29:                                               ; preds = %28, %14
  br label %30

30:                                               ; preds = %29, %3
  %31 = load ptr, ptr %5, align 8
  %32 = load i32, ptr %6, align 4
  %33 = load ptr, ptr %7, align 8
  %34 = call i32 @luaL_typerror(ptr noundef %31, i32 noundef %32, ptr noundef %33)
  store ptr null, ptr %4, align 8
  br label %35

35:                                               ; preds = %30, %25
  %36 = load ptr, ptr %4, align 8
  ret ptr %36
}

declare ptr @lua_touserdata(ptr noundef, i32 noundef) #1

declare i32 @lua_getmetatable(ptr noundef, i32 noundef) #1

declare i32 @lua_rawequal(ptr noundef, i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_checkstack(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i32, ptr %5, align 4
  %9 = call i32 @lua_checkstack(ptr noundef %7, i32 noundef %8)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %15, label %11

11:                                               ; preds = %3
  %12 = load ptr, ptr %4, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = call i32 (ptr, ptr, ...) @luaL_error(ptr noundef %12, ptr noundef @.str.11, ptr noundef %13)
  br label %15

15:                                               ; preds = %11, %3
  ret void
}

declare i32 @lua_checkstack(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_checktype(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = load i32, ptr %5, align 4
  %9 = call i32 @lua_type(ptr noundef %7, i32 noundef %8)
  %10 = load i32, ptr %6, align 4
  %11 = icmp ne i32 %9, %10
  br i1 %11, label %12, label %16

12:                                               ; preds = %3
  %13 = load ptr, ptr %4, align 8
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %6, align 4
  call void @tag_error(ptr noundef %13, i32 noundef %14, i32 noundef %15)
  br label %16

16:                                               ; preds = %12, %3
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @tag_error(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = load i32, ptr %5, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = load i32, ptr %6, align 4
  %11 = call ptr @lua_typename(ptr noundef %9, i32 noundef %10)
  %12 = call i32 @luaL_typerror(ptr noundef %7, i32 noundef %8, ptr noundef %11)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_checkany(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  %7 = call i32 @lua_type(ptr noundef %5, i32 noundef %6)
  %8 = icmp eq i32 %7, -1
  br i1 %8, label %9, label %13

9:                                                ; preds = %2
  %10 = load ptr, ptr %3, align 8
  %11 = load i32, ptr %4, align 4
  %12 = call i32 @luaL_argerror(ptr noundef %10, i32 noundef %11, ptr noundef @.str.12)
  br label %13

13:                                               ; preds = %9, %2
  ret void
}

declare ptr @lua_tolstring(ptr noundef, i32 noundef, ptr noundef) #1

declare i64 @strlen(ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define double @luaL_checknumber(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  %8 = call double @lua_tonumber(ptr noundef %6, i32 noundef %7)
  store double %8, ptr %5, align 8
  %9 = load double, ptr %5, align 8
  %10 = fcmp oeq double %9, 0.000000e+00
  br i1 %10, label %11, label %19

11:                                               ; preds = %2
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %4, align 4
  %14 = call i32 @lua_isnumber(ptr noundef %12, i32 noundef %13)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %19, label %16

16:                                               ; preds = %11
  %17 = load ptr, ptr %3, align 8
  %18 = load i32, ptr %4, align 4
  call void @tag_error(ptr noundef %17, i32 noundef %18, i32 noundef 3)
  br label %19

19:                                               ; preds = %16, %11, %2
  %20 = load double, ptr %5, align 8
  ret double %20
}

declare double @lua_tonumber(ptr noundef, i32 noundef) #1

declare i32 @lua_isnumber(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define double @luaL_optnumber(ptr noundef %0, i32 noundef %1, double noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store double %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i32, ptr %5, align 4
  %9 = call i32 @lua_type(ptr noundef %7, i32 noundef %8)
  %10 = icmp sle i32 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %3
  %12 = load double, ptr %6, align 8
  br label %17

13:                                               ; preds = %3
  %14 = load ptr, ptr %4, align 8
  %15 = load i32, ptr %5, align 4
  %16 = call double @luaL_checknumber(ptr noundef %14, i32 noundef %15)
  br label %17

17:                                               ; preds = %13, %11
  %18 = phi double [ %12, %11 ], [ %16, %13 ]
  ret double %18
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @luaL_checkinteger(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %4, align 4
  %8 = call i64 @lua_tointeger(ptr noundef %6, i32 noundef %7)
  store i64 %8, ptr %5, align 8
  %9 = load i64, ptr %5, align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %19

11:                                               ; preds = %2
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %4, align 4
  %14 = call i32 @lua_isnumber(ptr noundef %12, i32 noundef %13)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %19, label %16

16:                                               ; preds = %11
  %17 = load ptr, ptr %3, align 8
  %18 = load i32, ptr %4, align 4
  call void @tag_error(ptr noundef %17, i32 noundef %18, i32 noundef 3)
  br label %19

19:                                               ; preds = %16, %11, %2
  %20 = load i64, ptr %5, align 8
  ret i64 %20
}

declare i64 @lua_tointeger(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @luaL_optinteger(ptr noundef %0, i32 noundef %1, i64 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i32, ptr %5, align 4
  %9 = call i32 @lua_type(ptr noundef %7, i32 noundef %8)
  %10 = icmp sle i32 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %3
  %12 = load i64, ptr %6, align 8
  br label %17

13:                                               ; preds = %3
  %14 = load ptr, ptr %4, align 8
  %15 = load i32, ptr %5, align 4
  %16 = call i64 @luaL_checkinteger(ptr noundef %14, i32 noundef %15)
  br label %17

17:                                               ; preds = %13, %11
  %18 = phi i64 [ %12, %11 ], [ %16, %13 ]
  ret i64 %18
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_getmetafield(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i32, ptr %6, align 4
  %10 = call i32 @lua_getmetatable(ptr noundef %8, i32 noundef %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %13, label %12

12:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %24

13:                                               ; preds = %3
  %14 = load ptr, ptr %5, align 8
  %15 = load ptr, ptr %7, align 8
  call void @lua_pushstring(ptr noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %5, align 8
  call void @lua_rawget(ptr noundef %16, i32 noundef -2)
  %17 = load ptr, ptr %5, align 8
  %18 = call i32 @lua_type(ptr noundef %17, i32 noundef -1)
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %13
  %21 = load ptr, ptr %5, align 8
  call void @lua_settop(ptr noundef %21, i32 noundef -3)
  store i32 0, ptr %4, align 4
  br label %24

22:                                               ; preds = %13
  %23 = load ptr, ptr %5, align 8
  call void @lua_remove(ptr noundef %23, i32 noundef -2)
  store i32 1, ptr %4, align 4
  br label %24

24:                                               ; preds = %22, %20, %12
  %25 = load i32, ptr %4, align 4
  ret i32 %25
}

declare void @lua_pushstring(ptr noundef, ptr noundef) #1

declare void @lua_rawget(ptr noundef, i32 noundef) #1

declare void @lua_remove(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_callmeta(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  %8 = load i32, ptr %6, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %13, label %10

10:                                               ; preds = %3
  %11 = load i32, ptr %6, align 4
  %12 = icmp sle i32 %11, -10000
  br i1 %12, label %13, label %15

13:                                               ; preds = %10, %3
  %14 = load i32, ptr %6, align 4
  br label %21

15:                                               ; preds = %10
  %16 = load ptr, ptr %5, align 8
  %17 = call i32 @lua_gettop(ptr noundef %16)
  %18 = load i32, ptr %6, align 4
  %19 = add nsw i32 %17, %18
  %20 = add nsw i32 %19, 1
  br label %21

21:                                               ; preds = %15, %13
  %22 = phi i32 [ %14, %13 ], [ %20, %15 ]
  store i32 %22, ptr %6, align 4
  %23 = load ptr, ptr %5, align 8
  %24 = load i32, ptr %6, align 4
  %25 = load ptr, ptr %7, align 8
  %26 = call i32 @luaL_getmetafield(ptr noundef %23, i32 noundef %24, ptr noundef %25)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %29, label %28

28:                                               ; preds = %21
  store i32 0, ptr %4, align 4
  br label %33

29:                                               ; preds = %21
  %30 = load ptr, ptr %5, align 8
  %31 = load i32, ptr %6, align 4
  call void @lua_pushvalue(ptr noundef %30, i32 noundef %31)
  %32 = load ptr, ptr %5, align 8
  call void @lua_call(ptr noundef %32, i32 noundef 1, i32 noundef 1)
  store i32 1, ptr %4, align 4
  br label %33

33:                                               ; preds = %29, %28
  %34 = load i32, ptr %4, align 4
  ret i32 %34
}

declare i32 @lua_gettop(ptr noundef) #1

declare void @lua_call(ptr noundef, i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_register(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  call void @luaL_openlib(ptr noundef %7, ptr noundef %8, ptr noundef %9, i32 noundef 0)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_openlib(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i32 %3, ptr %8, align 4
  %11 = load ptr, ptr %6, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %44

13:                                               ; preds = %4
  %14 = load ptr, ptr %7, align 8
  %15 = call i32 @libsize(ptr noundef %14)
  store i32 %15, ptr %9, align 4
  %16 = load ptr, ptr %5, align 8
  %17 = call ptr @luaL_findtable(ptr noundef %16, i32 noundef -10000, ptr noundef @.str.13, i32 noundef 1)
  %18 = load ptr, ptr %5, align 8
  %19 = load ptr, ptr %6, align 8
  call void @lua_getfield(ptr noundef %18, i32 noundef -1, ptr noundef %19)
  %20 = load ptr, ptr %5, align 8
  %21 = call i32 @lua_type(ptr noundef %20, i32 noundef -1)
  %22 = icmp eq i32 %21, 5
  br i1 %22, label %38, label %23

23:                                               ; preds = %13
  %24 = load ptr, ptr %5, align 8
  call void @lua_settop(ptr noundef %24, i32 noundef -2)
  %25 = load ptr, ptr %5, align 8
  %26 = load ptr, ptr %6, align 8
  %27 = load i32, ptr %9, align 4
  %28 = call ptr @luaL_findtable(ptr noundef %25, i32 noundef -10002, ptr noundef %26, i32 noundef %27)
  %29 = icmp ne ptr %28, null
  br i1 %29, label %30, label %34

30:                                               ; preds = %23
  %31 = load ptr, ptr %5, align 8
  %32 = load ptr, ptr %6, align 8
  %33 = call i32 (ptr, ptr, ...) @luaL_error(ptr noundef %31, ptr noundef @.str.14, ptr noundef %32)
  br label %34

34:                                               ; preds = %30, %23
  %35 = load ptr, ptr %5, align 8
  call void @lua_pushvalue(ptr noundef %35, i32 noundef -1)
  %36 = load ptr, ptr %5, align 8
  %37 = load ptr, ptr %6, align 8
  call void @lua_setfield(ptr noundef %36, i32 noundef -3, ptr noundef %37)
  br label %38

38:                                               ; preds = %34, %13
  %39 = load ptr, ptr %5, align 8
  call void @lua_remove(ptr noundef %39, i32 noundef -2)
  %40 = load ptr, ptr %5, align 8
  %41 = load i32, ptr %8, align 4
  %42 = add nsw i32 %41, 1
  %43 = sub nsw i32 0, %42
  call void @lua_insert(ptr noundef %40, i32 noundef %43)
  br label %44

44:                                               ; preds = %38, %4
  br label %45

45:                                               ; preds = %75, %44
  %46 = load ptr, ptr %7, align 8
  %47 = getelementptr inbounds %struct.luaL_Reg, ptr %46, i32 0, i32 0
  %48 = load ptr, ptr %47, align 8
  %49 = icmp ne ptr %48, null
  br i1 %49, label %50, label %78

50:                                               ; preds = %45
  store i32 0, ptr %10, align 4
  br label %51

51:                                               ; preds = %59, %50
  %52 = load i32, ptr %10, align 4
  %53 = load i32, ptr %8, align 4
  %54 = icmp slt i32 %52, %53
  br i1 %54, label %55, label %62

55:                                               ; preds = %51
  %56 = load ptr, ptr %5, align 8
  %57 = load i32, ptr %8, align 4
  %58 = sub nsw i32 0, %57
  call void @lua_pushvalue(ptr noundef %56, i32 noundef %58)
  br label %59

59:                                               ; preds = %55
  %60 = load i32, ptr %10, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %10, align 4
  br label %51, !llvm.loop !8

62:                                               ; preds = %51
  %63 = load ptr, ptr %5, align 8
  %64 = load ptr, ptr %7, align 8
  %65 = getelementptr inbounds %struct.luaL_Reg, ptr %64, i32 0, i32 1
  %66 = load ptr, ptr %65, align 8
  %67 = load i32, ptr %8, align 4
  call void @lua_pushcclosure(ptr noundef %63, ptr noundef %66, i32 noundef %67)
  %68 = load ptr, ptr %5, align 8
  %69 = load i32, ptr %8, align 4
  %70 = add nsw i32 %69, 2
  %71 = sub nsw i32 0, %70
  %72 = load ptr, ptr %7, align 8
  %73 = getelementptr inbounds %struct.luaL_Reg, ptr %72, i32 0, i32 0
  %74 = load ptr, ptr %73, align 8
  call void @lua_setfield(ptr noundef %68, i32 noundef %71, ptr noundef %74)
  br label %75

75:                                               ; preds = %62
  %76 = load ptr, ptr %7, align 8
  %77 = getelementptr inbounds %struct.luaL_Reg, ptr %76, i32 1
  store ptr %77, ptr %7, align 8
  br label %45, !llvm.loop !9

78:                                               ; preds = %45
  %79 = load ptr, ptr %5, align 8
  %80 = load i32, ptr %8, align 4
  %81 = sub nsw i32 0, %80
  %82 = sub nsw i32 %81, 1
  call void @lua_settop(ptr noundef %79, i32 noundef %82)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @libsize(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %12, %1
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.luaL_Reg, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %15

9:                                                ; preds = %4
  %10 = load i32, ptr %3, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %3, align 4
  br label %12

12:                                               ; preds = %9
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.luaL_Reg, ptr %13, i32 1
  store ptr %14, ptr %2, align 8
  br label %4, !llvm.loop !10

15:                                               ; preds = %4
  %16 = load i32, ptr %3, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @luaL_findtable(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  %11 = load ptr, ptr %6, align 8
  %12 = load i32, ptr %7, align 4
  call void @lua_pushvalue(ptr noundef %11, i32 noundef %12)
  br label %13

13:                                               ; preds = %68, %4
  %14 = load ptr, ptr %8, align 8
  %15 = call ptr @strchr(ptr noundef %14, i32 noundef 46)
  store ptr %15, ptr %10, align 8
  %16 = load ptr, ptr %10, align 8
  %17 = icmp eq ptr %16, null
  br i1 %17, label %18, label %23

18:                                               ; preds = %13
  %19 = load ptr, ptr %8, align 8
  %20 = load ptr, ptr %8, align 8
  %21 = call i64 @strlen(ptr noundef %20)
  %22 = getelementptr inbounds i8, ptr %19, i64 %21
  store ptr %22, ptr %10, align 8
  br label %23

23:                                               ; preds = %18, %13
  %24 = load ptr, ptr %6, align 8
  %25 = load ptr, ptr %8, align 8
  %26 = load ptr, ptr %10, align 8
  %27 = load ptr, ptr %8, align 8
  %28 = ptrtoint ptr %26 to i64
  %29 = ptrtoint ptr %27 to i64
  %30 = sub i64 %28, %29
  call void @lua_pushlstring(ptr noundef %24, ptr noundef %25, i64 noundef %30)
  %31 = load ptr, ptr %6, align 8
  call void @lua_rawget(ptr noundef %31, i32 noundef -2)
  %32 = load ptr, ptr %6, align 8
  %33 = call i32 @lua_type(ptr noundef %32, i32 noundef -1)
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %56

35:                                               ; preds = %23
  %36 = load ptr, ptr %6, align 8
  call void @lua_settop(ptr noundef %36, i32 noundef -2)
  %37 = load ptr, ptr %6, align 8
  %38 = load ptr, ptr %10, align 8
  %39 = load i8, ptr %38, align 1
  %40 = sext i8 %39 to i32
  %41 = icmp eq i32 %40, 46
  br i1 %41, label %42, label %43

42:                                               ; preds = %35
  br label %45

43:                                               ; preds = %35
  %44 = load i32, ptr %9, align 4
  br label %45

45:                                               ; preds = %43, %42
  %46 = phi i32 [ 1, %42 ], [ %44, %43 ]
  call void @lua_createtable(ptr noundef %37, i32 noundef 0, i32 noundef %46)
  %47 = load ptr, ptr %6, align 8
  %48 = load ptr, ptr %8, align 8
  %49 = load ptr, ptr %10, align 8
  %50 = load ptr, ptr %8, align 8
  %51 = ptrtoint ptr %49 to i64
  %52 = ptrtoint ptr %50 to i64
  %53 = sub i64 %51, %52
  call void @lua_pushlstring(ptr noundef %47, ptr noundef %48, i64 noundef %53)
  %54 = load ptr, ptr %6, align 8
  call void @lua_pushvalue(ptr noundef %54, i32 noundef -2)
  %55 = load ptr, ptr %6, align 8
  call void @lua_settable(ptr noundef %55, i32 noundef -4)
  br label %64

56:                                               ; preds = %23
  %57 = load ptr, ptr %6, align 8
  %58 = call i32 @lua_type(ptr noundef %57, i32 noundef -1)
  %59 = icmp eq i32 %58, 5
  br i1 %59, label %63, label %60

60:                                               ; preds = %56
  %61 = load ptr, ptr %6, align 8
  call void @lua_settop(ptr noundef %61, i32 noundef -3)
  %62 = load ptr, ptr %8, align 8
  store ptr %62, ptr %5, align 8
  br label %74

63:                                               ; preds = %56
  br label %64

64:                                               ; preds = %63, %45
  %65 = load ptr, ptr %6, align 8
  call void @lua_remove(ptr noundef %65, i32 noundef -2)
  %66 = load ptr, ptr %10, align 8
  %67 = getelementptr inbounds i8, ptr %66, i64 1
  store ptr %67, ptr %8, align 8
  br label %68

68:                                               ; preds = %64
  %69 = load ptr, ptr %10, align 8
  %70 = load i8, ptr %69, align 1
  %71 = sext i8 %70 to i32
  %72 = icmp eq i32 %71, 46
  br i1 %72, label %13, label %73, !llvm.loop !11

73:                                               ; preds = %68
  store ptr null, ptr %5, align 8
  br label %74

74:                                               ; preds = %73, %60
  %75 = load ptr, ptr %5, align 8
  ret ptr %75
}

declare void @lua_insert(ptr noundef, i32 noundef) #1

declare void @lua_pushcclosure(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_register3(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  call void @luaI_openlib3(ptr noundef %7, ptr noundef %8, ptr noundef %9, i32 noundef 0)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaI_openlib3(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i32 %3, ptr %8, align 4
  %12 = load ptr, ptr %6, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %45

14:                                               ; preds = %4
  %15 = load ptr, ptr %7, align 8
  %16 = call i32 @libsize3(ptr noundef %15)
  store i32 %16, ptr %9, align 4
  %17 = load ptr, ptr %5, align 8
  %18 = call ptr @luaL_findtable(ptr noundef %17, i32 noundef -10000, ptr noundef @.str.13, i32 noundef 1)
  %19 = load ptr, ptr %5, align 8
  %20 = load ptr, ptr %6, align 8
  call void @lua_getfield(ptr noundef %19, i32 noundef -1, ptr noundef %20)
  %21 = load ptr, ptr %5, align 8
  %22 = call i32 @lua_type(ptr noundef %21, i32 noundef -1)
  %23 = icmp eq i32 %22, 5
  br i1 %23, label %39, label %24

24:                                               ; preds = %14
  %25 = load ptr, ptr %5, align 8
  call void @lua_settop(ptr noundef %25, i32 noundef -2)
  %26 = load ptr, ptr %5, align 8
  %27 = load ptr, ptr %6, align 8
  %28 = load i32, ptr %9, align 4
  %29 = call ptr @luaL_findtable(ptr noundef %26, i32 noundef -10002, ptr noundef %27, i32 noundef %28)
  %30 = icmp ne ptr %29, null
  br i1 %30, label %31, label %35

31:                                               ; preds = %24
  %32 = load ptr, ptr %5, align 8
  %33 = load ptr, ptr %6, align 8
  %34 = call i32 (ptr, ptr, ...) @luaL_error(ptr noundef %32, ptr noundef @.str.14, ptr noundef %33)
  br label %35

35:                                               ; preds = %31, %24
  %36 = load ptr, ptr %5, align 8
  call void @lua_pushvalue(ptr noundef %36, i32 noundef -1)
  %37 = load ptr, ptr %5, align 8
  %38 = load ptr, ptr %6, align 8
  call void @lua_setfield(ptr noundef %37, i32 noundef -3, ptr noundef %38)
  br label %39

39:                                               ; preds = %35, %14
  %40 = load ptr, ptr %5, align 8
  call void @lua_remove(ptr noundef %40, i32 noundef -2)
  %41 = load ptr, ptr %5, align 8
  %42 = load i32, ptr %8, align 4
  %43 = add nsw i32 %42, 1
  %44 = sub nsw i32 0, %43
  call void @lua_insert(ptr noundef %41, i32 noundef %44)
  br label %45

45:                                               ; preds = %39, %4
  br label %46

46:                                               ; preds = %93, %45
  %47 = load ptr, ptr %7, align 8
  %48 = getelementptr inbounds %struct.luaL_Reg3, ptr %47, i32 0, i32 0
  %49 = load ptr, ptr %48, align 8
  %50 = icmp ne ptr %49, null
  br i1 %50, label %51, label %96

51:                                               ; preds = %46
  store i32 0, ptr %10, align 4
  br label %52

52:                                               ; preds = %60, %51
  %53 = load i32, ptr %10, align 4
  %54 = load i32, ptr %8, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %63

56:                                               ; preds = %52
  %57 = load ptr, ptr %5, align 8
  %58 = load i32, ptr %8, align 4
  %59 = sub nsw i32 0, %58
  call void @lua_pushvalue(ptr noundef %57, i32 noundef %59)
  br label %60

60:                                               ; preds = %56
  %61 = load i32, ptr %10, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %10, align 4
  br label %52, !llvm.loop !12

63:                                               ; preds = %52
  %64 = load ptr, ptr %5, align 8
  %65 = load ptr, ptr %7, align 8
  %66 = getelementptr inbounds %struct.luaL_Reg3, ptr %65, i32 0, i32 1
  %67 = load ptr, ptr %66, align 8
  %68 = load i32, ptr %8, align 4
  call void @lua_pushcclosure(ptr noundef %64, ptr noundef %67, i32 noundef %68)
  %69 = load ptr, ptr %7, align 8
  %70 = getelementptr inbounds %struct.luaL_Reg3, ptr %69, i32 0, i32 2
  %71 = load ptr, ptr %70, align 8
  %72 = icmp ne ptr %71, null
  br i1 %72, label %73, label %85

73:                                               ; preds = %63
  %74 = load ptr, ptr %5, align 8
  %75 = getelementptr inbounds %struct.lua_State, ptr %74, i32 0, i32 4
  %76 = load ptr, ptr %75, align 8
  %77 = getelementptr inbounds %struct.lua_TValue, ptr %76, i64 -1
  %78 = getelementptr inbounds %struct.lua_TValue, ptr %77, i32 0, i32 0
  %79 = load ptr, ptr %78, align 8
  store ptr %79, ptr %11, align 8
  %80 = load ptr, ptr %7, align 8
  %81 = getelementptr inbounds %struct.luaL_Reg3, ptr %80, i32 0, i32 2
  %82 = load ptr, ptr %81, align 8
  %83 = load ptr, ptr %11, align 8
  %84 = getelementptr inbounds %struct.CClosure, ptr %83, i32 0, i32 7
  store ptr %82, ptr %84, align 8
  br label %85

85:                                               ; preds = %73, %63
  %86 = load ptr, ptr %5, align 8
  %87 = load i32, ptr %8, align 4
  %88 = add nsw i32 %87, 2
  %89 = sub nsw i32 0, %88
  %90 = load ptr, ptr %7, align 8
  %91 = getelementptr inbounds %struct.luaL_Reg3, ptr %90, i32 0, i32 0
  %92 = load ptr, ptr %91, align 8
  call void @lua_setfield(ptr noundef %86, i32 noundef %89, ptr noundef %92)
  br label %93

93:                                               ; preds = %85
  %94 = load ptr, ptr %7, align 8
  %95 = getelementptr inbounds %struct.luaL_Reg3, ptr %94, i32 1
  store ptr %95, ptr %7, align 8
  br label %46, !llvm.loop !13

96:                                               ; preds = %46
  %97 = load ptr, ptr %5, align 8
  %98 = load i32, ptr %8, align 4
  %99 = sub nsw i32 0, %98
  %100 = sub nsw i32 %99, 1
  call void @lua_settop(ptr noundef %97, i32 noundef %100)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @libsize3(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %12, %1
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.luaL_Reg3, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %15

9:                                                ; preds = %4
  %10 = load i32, ptr %3, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %3, align 4
  br label %12

12:                                               ; preds = %9
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.luaL_Reg3, ptr %13, i32 1
  store ptr %14, ptr %2, align 8
  br label %4, !llvm.loop !14

15:                                               ; preds = %4
  %16 = load i32, ptr %3, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @luaL_gsub(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca %struct.luaL_Buffer, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = call i64 @strlen(ptr noundef %12)
  store i64 %13, ptr %10, align 8
  %14 = load ptr, ptr %5, align 8
  call void @luaL_buffinit(ptr noundef %14, ptr noundef %11)
  br label %15

15:                                               ; preds = %20, %4
  %16 = load ptr, ptr %6, align 8
  %17 = load ptr, ptr %7, align 8
  %18 = call ptr @strstr(ptr noundef %16, ptr noundef %17)
  store ptr %18, ptr %9, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %31

20:                                               ; preds = %15
  %21 = load ptr, ptr %6, align 8
  %22 = load ptr, ptr %9, align 8
  %23 = load ptr, ptr %6, align 8
  %24 = ptrtoint ptr %22 to i64
  %25 = ptrtoint ptr %23 to i64
  %26 = sub i64 %24, %25
  call void @luaL_addlstring(ptr noundef %11, ptr noundef %21, i64 noundef %26)
  %27 = load ptr, ptr %8, align 8
  call void @luaL_addstring(ptr noundef %11, ptr noundef %27)
  %28 = load ptr, ptr %9, align 8
  %29 = load i64, ptr %10, align 8
  %30 = getelementptr inbounds i8, ptr %28, i64 %29
  store ptr %30, ptr %6, align 8
  br label %15, !llvm.loop !15

31:                                               ; preds = %15
  %32 = load ptr, ptr %6, align 8
  call void @luaL_addstring(ptr noundef %11, ptr noundef %32)
  call void @luaL_pushresult(ptr noundef %11)
  %33 = load ptr, ptr %5, align 8
  %34 = call ptr @lua_tolstring(ptr noundef %33, i32 noundef -1, ptr noundef null)
  ret ptr %34
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_buffinit(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds %struct.luaL_Buffer, ptr %6, i32 0, i32 2
  store ptr %5, ptr %7, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %struct.luaL_Buffer, ptr %8, i32 0, i32 3
  %10 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.luaL_Buffer, ptr %11, i32 0, i32 0
  store ptr %10, ptr %12, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.luaL_Buffer, ptr %13, i32 0, i32 1
  store i32 0, ptr %14, align 8
  ret void
}

declare ptr @strstr(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_addlstring(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  br label %7

7:                                                ; preds = %24, %3
  %8 = load i64, ptr %6, align 8
  %9 = add i64 %8, -1
  store i64 %9, ptr %6, align 8
  %10 = icmp ne i64 %8, 0
  br i1 %10, label %11, label %34

11:                                               ; preds = %7
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.luaL_Buffer, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.luaL_Buffer, ptr %15, i32 0, i32 3
  %17 = getelementptr inbounds [1024 x i8], ptr %16, i64 0, i64 0
  %18 = getelementptr inbounds i8, ptr %17, i64 1024
  %19 = icmp ult ptr %14, %18
  br i1 %19, label %24, label %20

20:                                               ; preds = %11
  %21 = load ptr, ptr %4, align 8
  %22 = call ptr @luaL_prepbuffer(ptr noundef %21)
  %23 = icmp ne ptr %22, null
  br label %24

24:                                               ; preds = %20, %11
  %25 = phi i1 [ true, %11 ], [ %23, %20 ]
  %26 = zext i1 %25 to i32
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds i8, ptr %27, i32 1
  store ptr %28, ptr %5, align 8
  %29 = load i8, ptr %27, align 1
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.luaL_Buffer, ptr %30, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds i8, ptr %32, i32 1
  store ptr %33, ptr %31, align 8
  store i8 %29, ptr %32, align 1
  br label %7, !llvm.loop !16

34:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_addstring(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call i64 @strlen(ptr noundef %7)
  call void @luaL_addlstring(ptr noundef %5, ptr noundef %6, i64 noundef %8)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_pushresult(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 @emptybuffer(ptr noundef %3)
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.luaL_Buffer, ptr %5, i32 0, i32 2
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.luaL_Buffer, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 8
  call void @lua_concat(ptr noundef %7, i32 noundef %10)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.luaL_Buffer, ptr %11, i32 0, i32 1
  store i32 1, ptr %12, align 8
  ret void
}

declare ptr @strchr(ptr noundef, i32 noundef) #1

declare void @lua_settable(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @luaL_prepbuffer(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 @emptybuffer(ptr noundef %3)
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  call void @adjuststack(ptr noundef %7)
  br label %8

8:                                                ; preds = %6, %1
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.luaL_Buffer, ptr %9, i32 0, i32 3
  %11 = getelementptr inbounds [1024 x i8], ptr %10, i64 0, i64 0
  ret ptr %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @emptybuffer(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.luaL_Buffer, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.luaL_Buffer, ptr %8, i32 0, i32 3
  %10 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %11 = ptrtoint ptr %7 to i64
  %12 = ptrtoint ptr %10 to i64
  %13 = sub i64 %11, %12
  store i64 %13, ptr %4, align 8
  %14 = load i64, ptr %4, align 8
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %1
  store i32 0, ptr %2, align 4
  br label %34

17:                                               ; preds = %1
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.luaL_Buffer, ptr %18, i32 0, i32 2
  %20 = load ptr, ptr %19, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.luaL_Buffer, ptr %21, i32 0, i32 3
  %23 = getelementptr inbounds [1024 x i8], ptr %22, i64 0, i64 0
  %24 = load i64, ptr %4, align 8
  call void @lua_pushlstring(ptr noundef %20, ptr noundef %23, i64 noundef %24)
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.luaL_Buffer, ptr %25, i32 0, i32 3
  %27 = getelementptr inbounds [1024 x i8], ptr %26, i64 0, i64 0
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds %struct.luaL_Buffer, ptr %28, i32 0, i32 0
  store ptr %27, ptr %29, align 8
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds %struct.luaL_Buffer, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 8
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %31, align 8
  store i32 1, ptr %2, align 4
  br label %34

34:                                               ; preds = %17, %16
  %35 = load i32, ptr %2, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @adjuststack(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.luaL_Buffer, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  %10 = icmp sgt i32 %9, 1
  br i1 %10, label %11, label %59

11:                                               ; preds = %1
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.luaL_Buffer, ptr %12, i32 0, i32 2
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %3, align 8
  store i32 1, ptr %4, align 4
  %15 = load ptr, ptr %3, align 8
  %16 = call i64 @lua_objlen(ptr noundef %15, i32 noundef -1)
  store i64 %16, ptr %5, align 8
  br label %17

17:                                               ; preds = %42, %11
  %18 = load ptr, ptr %3, align 8
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, 1
  %21 = sub nsw i32 0, %20
  %22 = call i64 @lua_objlen(ptr noundef %18, i32 noundef %21)
  store i64 %22, ptr %6, align 8
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.luaL_Buffer, ptr %23, i32 0, i32 1
  %25 = load i32, ptr %24, align 8
  %26 = load i32, ptr %4, align 4
  %27 = sub nsw i32 %25, %26
  %28 = add nsw i32 %27, 1
  %29 = icmp sge i32 %28, 10
  br i1 %29, label %34, label %30

30:                                               ; preds = %17
  %31 = load i64, ptr %5, align 8
  %32 = load i64, ptr %6, align 8
  %33 = icmp ugt i64 %31, %32
  br i1 %33, label %34, label %40

34:                                               ; preds = %30, %17
  %35 = load i64, ptr %6, align 8
  %36 = load i64, ptr %5, align 8
  %37 = add i64 %36, %35
  store i64 %37, ptr %5, align 8
  %38 = load i32, ptr %4, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %4, align 4
  br label %41

40:                                               ; preds = %30
  br label %48

41:                                               ; preds = %34
  br label %42

42:                                               ; preds = %41
  %43 = load i32, ptr %4, align 4
  %44 = load ptr, ptr %2, align 8
  %45 = getelementptr inbounds %struct.luaL_Buffer, ptr %44, i32 0, i32 1
  %46 = load i32, ptr %45, align 8
  %47 = icmp slt i32 %43, %46
  br i1 %47, label %17, label %48, !llvm.loop !17

48:                                               ; preds = %42, %40
  %49 = load ptr, ptr %3, align 8
  %50 = load i32, ptr %4, align 4
  call void @lua_concat(ptr noundef %49, i32 noundef %50)
  %51 = load ptr, ptr %2, align 8
  %52 = getelementptr inbounds %struct.luaL_Buffer, ptr %51, i32 0, i32 1
  %53 = load i32, ptr %52, align 8
  %54 = load i32, ptr %4, align 4
  %55 = sub nsw i32 %53, %54
  %56 = add nsw i32 %55, 1
  %57 = load ptr, ptr %2, align 8
  %58 = getelementptr inbounds %struct.luaL_Buffer, ptr %57, i32 0, i32 1
  store i32 %56, ptr %58, align 8
  br label %59

59:                                               ; preds = %48, %1
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_addvalue(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.luaL_Buffer, ptr %6, i32 0, i32 2
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = call ptr @lua_tolstring(ptr noundef %9, i32 noundef -1, ptr noundef %4)
  store ptr %10, ptr %5, align 8
  %11 = load i64, ptr %4, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.luaL_Buffer, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.luaL_Buffer, ptr %15, i32 0, i32 3
  %17 = getelementptr inbounds [1024 x i8], ptr %16, i64 0, i64 0
  %18 = ptrtoint ptr %14 to i64
  %19 = ptrtoint ptr %17 to i64
  %20 = sub i64 %18, %19
  %21 = sub nsw i64 1024, %20
  %22 = icmp ule i64 %11, %21
  br i1 %22, label %23, label %40

23:                                               ; preds = %1
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds %struct.luaL_Buffer, ptr %24, i32 0, i32 0
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %5, align 8
  %28 = load i64, ptr %4, align 8
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.luaL_Buffer, ptr %29, i32 0, i32 0
  %31 = load ptr, ptr %30, align 8
  %32 = call i64 @llvm.objectsize.i64.p0(ptr %31, i1 false, i1 true, i1 false)
  %33 = call ptr @__memcpy_chk(ptr noundef %26, ptr noundef %27, i64 noundef %28, i64 noundef %32) #6
  %34 = load i64, ptr %4, align 8
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds %struct.luaL_Buffer, ptr %35, i32 0, i32 0
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr inbounds i8, ptr %37, i64 %34
  store ptr %38, ptr %36, align 8
  %39 = load ptr, ptr %3, align 8
  call void @lua_settop(ptr noundef %39, i32 noundef -2)
  br label %52

40:                                               ; preds = %1
  %41 = load ptr, ptr %2, align 8
  %42 = call i32 @emptybuffer(ptr noundef %41)
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %46

44:                                               ; preds = %40
  %45 = load ptr, ptr %3, align 8
  call void @lua_insert(ptr noundef %45, i32 noundef -2)
  br label %46

46:                                               ; preds = %44, %40
  %47 = load ptr, ptr %2, align 8
  %48 = getelementptr inbounds %struct.luaL_Buffer, ptr %47, i32 0, i32 1
  %49 = load i32, ptr %48, align 8
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %48, align 8
  %51 = load ptr, ptr %2, align 8
  call void @adjuststack(ptr noundef %51)
  br label %52

52:                                               ; preds = %46, %23
  ret void
}

; Function Attrs: nounwind
declare ptr @__memcpy_chk(ptr noundef, ptr noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.objectsize.i64.p0(ptr, i1 immarg, i1 immarg, i1 immarg) #4

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_ref(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %7 = load i32, ptr %5, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %12, label %9

9:                                                ; preds = %2
  %10 = load i32, ptr %5, align 4
  %11 = icmp sle i32 %10, -10000
  br i1 %11, label %12, label %14

12:                                               ; preds = %9, %2
  %13 = load i32, ptr %5, align 4
  br label %20

14:                                               ; preds = %9
  %15 = load ptr, ptr %4, align 8
  %16 = call i32 @lua_gettop(ptr noundef %15)
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %16, %17
  %19 = add nsw i32 %18, 1
  br label %20

20:                                               ; preds = %14, %12
  %21 = phi i32 [ %13, %12 ], [ %19, %14 ]
  store i32 %21, ptr %5, align 4
  %22 = load ptr, ptr %4, align 8
  %23 = call i32 @lua_type(ptr noundef %22, i32 noundef -1)
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %20
  %26 = load ptr, ptr %4, align 8
  call void @lua_settop(ptr noundef %26, i32 noundef -2)
  store i32 -1, ptr %3, align 4
  br label %54

27:                                               ; preds = %20
  %28 = load ptr, ptr %4, align 8
  %29 = load i32, ptr %5, align 4
  call void @lua_rawgeti(ptr noundef %28, i32 noundef %29, i32 noundef 0)
  %30 = load ptr, ptr %4, align 8
  %31 = call i64 @lua_tointeger(ptr noundef %30, i32 noundef -1)
  %32 = trunc i64 %31 to i32
  store i32 %32, ptr %6, align 4
  %33 = load ptr, ptr %4, align 8
  call void @lua_settop(ptr noundef %33, i32 noundef -2)
  %34 = load i32, ptr %6, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %42

36:                                               ; preds = %27
  %37 = load ptr, ptr %4, align 8
  %38 = load i32, ptr %5, align 4
  %39 = load i32, ptr %6, align 4
  call void @lua_rawgeti(ptr noundef %37, i32 noundef %38, i32 noundef %39)
  %40 = load ptr, ptr %4, align 8
  %41 = load i32, ptr %5, align 4
  call void @lua_rawseti(ptr noundef %40, i32 noundef %41, i32 noundef 0)
  br label %49

42:                                               ; preds = %27
  %43 = load ptr, ptr %4, align 8
  %44 = load i32, ptr %5, align 4
  %45 = call i64 @lua_objlen(ptr noundef %43, i32 noundef %44)
  %46 = trunc i64 %45 to i32
  store i32 %46, ptr %6, align 4
  %47 = load i32, ptr %6, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %6, align 4
  br label %49

49:                                               ; preds = %42, %36
  %50 = load ptr, ptr %4, align 8
  %51 = load i32, ptr %5, align 4
  %52 = load i32, ptr %6, align 4
  call void @lua_rawseti(ptr noundef %50, i32 noundef %51, i32 noundef %52)
  %53 = load i32, ptr %6, align 4
  store i32 %53, ptr %3, align 4
  br label %54

54:                                               ; preds = %49, %25
  %55 = load i32, ptr %3, align 4
  ret i32 %55
}

declare void @lua_rawgeti(ptr noundef, i32 noundef, i32 noundef) #1

declare void @lua_rawseti(ptr noundef, i32 noundef, i32 noundef) #1

declare i64 @lua_objlen(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_unref(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %7 = load i32, ptr %6, align 4
  %8 = icmp sge i32 %7, 0
  br i1 %8, label %9, label %35

9:                                                ; preds = %3
  %10 = load i32, ptr %5, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %15, label %12

12:                                               ; preds = %9
  %13 = load i32, ptr %5, align 4
  %14 = icmp sle i32 %13, -10000
  br i1 %14, label %15, label %17

15:                                               ; preds = %12, %9
  %16 = load i32, ptr %5, align 4
  br label %23

17:                                               ; preds = %12
  %18 = load ptr, ptr %4, align 8
  %19 = call i32 @lua_gettop(ptr noundef %18)
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %19, %20
  %22 = add nsw i32 %21, 1
  br label %23

23:                                               ; preds = %17, %15
  %24 = phi i32 [ %16, %15 ], [ %22, %17 ]
  store i32 %24, ptr %5, align 4
  %25 = load ptr, ptr %4, align 8
  %26 = load i32, ptr %5, align 4
  call void @lua_rawgeti(ptr noundef %25, i32 noundef %26, i32 noundef 0)
  %27 = load ptr, ptr %4, align 8
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %6, align 4
  call void @lua_rawseti(ptr noundef %27, i32 noundef %28, i32 noundef %29)
  %30 = load ptr, ptr %4, align 8
  %31 = load i32, ptr %6, align 4
  %32 = sext i32 %31 to i64
  call void @lua_pushinteger(ptr noundef %30, i64 noundef %32)
  %33 = load ptr, ptr %4, align 8
  %34 = load i32, ptr %5, align 4
  call void @lua_rawseti(ptr noundef %33, i32 noundef %34, i32 noundef 0)
  br label %35

35:                                               ; preds = %23, %3
  ret void
}

declare void @lua_pushinteger(ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_loadfile(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca %struct.LoadF, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = call i32 @lua_gettop(ptr noundef %11)
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %10, align 4
  %14 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 0
  store i32 0, ptr %14, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %21

17:                                               ; preds = %2
  %18 = load ptr, ptr %4, align 8
  call void @lua_pushlstring(ptr noundef %18, ptr noundef @.str.15, i64 noundef 6)
  %19 = load ptr, ptr @__stdinp, align 8
  %20 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 1
  store ptr %19, ptr %20, align 8
  br label %36

21:                                               ; preds = %2
  %22 = load ptr, ptr %4, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = call ptr (ptr, ptr, ...) @lua_pushfstring(ptr noundef %22, ptr noundef @.str.16, ptr noundef %23)
  %25 = load ptr, ptr %5, align 8
  %26 = call ptr @"\01_fopen"(ptr noundef %25, ptr noundef @.str.17)
  %27 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 1
  store ptr %26, ptr %27, align 8
  %28 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = icmp eq ptr %29, null
  br i1 %30, label %31, label %35

31:                                               ; preds = %21
  %32 = load ptr, ptr %4, align 8
  %33 = load i32, ptr %10, align 4
  %34 = call i32 @errfile(ptr noundef %32, ptr noundef @.str.18, i32 noundef %33)
  store i32 %34, ptr %3, align 4
  br label %131

35:                                               ; preds = %21
  br label %36

36:                                               ; preds = %35, %17
  %37 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 1
  %38 = load ptr, ptr %37, align 8
  %39 = call i32 @getc(ptr noundef %38)
  store i32 %39, ptr %9, align 4
  %40 = load i32, ptr %9, align 4
  %41 = icmp eq i32 %40, 35
  br i1 %41, label %42, label %63

42:                                               ; preds = %36
  %43 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 0
  store i32 1, ptr %43, align 8
  br label %44

44:                                               ; preds = %54, %42
  %45 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 1
  %46 = load ptr, ptr %45, align 8
  %47 = call i32 @getc(ptr noundef %46)
  store i32 %47, ptr %9, align 4
  %48 = icmp ne i32 %47, -1
  br i1 %48, label %49, label %52

49:                                               ; preds = %44
  %50 = load i32, ptr %9, align 4
  %51 = icmp ne i32 %50, 10
  br label %52

52:                                               ; preds = %49, %44
  %53 = phi i1 [ false, %44 ], [ %51, %49 ]
  br i1 %53, label %54, label %55

54:                                               ; preds = %52
  br label %44, !llvm.loop !18

55:                                               ; preds = %52
  %56 = load i32, ptr %9, align 4
  %57 = icmp eq i32 %56, 10
  br i1 %57, label %58, label %62

58:                                               ; preds = %55
  %59 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 1
  %60 = load ptr, ptr %59, align 8
  %61 = call i32 @getc(ptr noundef %60)
  store i32 %61, ptr %9, align 4
  br label %62

62:                                               ; preds = %58, %55
  br label %63

63:                                               ; preds = %62, %36
  %64 = load i32, ptr %9, align 4
  %65 = load i8, ptr @.str.19, align 1
  %66 = sext i8 %65 to i32
  %67 = icmp eq i32 %64, %66
  br i1 %67, label %68, label %100

68:                                               ; preds = %63
  %69 = load ptr, ptr %5, align 8
  %70 = icmp ne ptr %69, null
  br i1 %70, label %71, label %100

71:                                               ; preds = %68
  %72 = load ptr, ptr %5, align 8
  %73 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 1
  %74 = load ptr, ptr %73, align 8
  %75 = call ptr @"\01_freopen"(ptr noundef %72, ptr noundef @.str.20, ptr noundef %74)
  %76 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 1
  store ptr %75, ptr %76, align 8
  %77 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 1
  %78 = load ptr, ptr %77, align 8
  %79 = icmp eq ptr %78, null
  br i1 %79, label %80, label %84

80:                                               ; preds = %71
  %81 = load ptr, ptr %4, align 8
  %82 = load i32, ptr %10, align 4
  %83 = call i32 @errfile(ptr noundef %81, ptr noundef @.str.21, i32 noundef %82)
  store i32 %83, ptr %3, align 4
  br label %131

84:                                               ; preds = %71
  br label %85

85:                                               ; preds = %97, %84
  %86 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 1
  %87 = load ptr, ptr %86, align 8
  %88 = call i32 @getc(ptr noundef %87)
  store i32 %88, ptr %9, align 4
  %89 = icmp ne i32 %88, -1
  br i1 %89, label %90, label %95

90:                                               ; preds = %85
  %91 = load i32, ptr %9, align 4
  %92 = load i8, ptr @.str.19, align 1
  %93 = sext i8 %92 to i32
  %94 = icmp ne i32 %91, %93
  br label %95

95:                                               ; preds = %90, %85
  %96 = phi i1 [ false, %85 ], [ %94, %90 ]
  br i1 %96, label %97, label %98

97:                                               ; preds = %95
  br label %85, !llvm.loop !19

98:                                               ; preds = %95
  %99 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 0
  store i32 0, ptr %99, align 8
  br label %100

100:                                              ; preds = %98, %68, %63
  %101 = load i32, ptr %9, align 4
  %102 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 1
  %103 = load ptr, ptr %102, align 8
  %104 = call i32 @ungetc(i32 noundef %101, ptr noundef %103)
  %105 = load ptr, ptr %4, align 8
  %106 = load ptr, ptr %4, align 8
  %107 = call ptr @lua_tolstring(ptr noundef %106, i32 noundef -1, ptr noundef null)
  %108 = call i32 @lua_load(ptr noundef %105, ptr noundef @getF, ptr noundef %6, ptr noundef %107)
  store i32 %108, ptr %7, align 4
  %109 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 1
  %110 = load ptr, ptr %109, align 8
  %111 = call i32 @ferror(ptr noundef %110)
  store i32 %111, ptr %8, align 4
  %112 = load ptr, ptr %5, align 8
  %113 = icmp ne ptr %112, null
  br i1 %113, label %114, label %118

114:                                              ; preds = %100
  %115 = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 1
  %116 = load ptr, ptr %115, align 8
  %117 = call i32 @fclose(ptr noundef %116)
  br label %118

118:                                              ; preds = %114, %100
  %119 = load i32, ptr %8, align 4
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %121, label %127

121:                                              ; preds = %118
  %122 = load ptr, ptr %4, align 8
  %123 = load i32, ptr %10, align 4
  call void @lua_settop(ptr noundef %122, i32 noundef %123)
  %124 = load ptr, ptr %4, align 8
  %125 = load i32, ptr %10, align 4
  %126 = call i32 @errfile(ptr noundef %124, ptr noundef @.str.22, i32 noundef %125)
  store i32 %126, ptr %3, align 4
  br label %131

127:                                              ; preds = %118
  %128 = load ptr, ptr %4, align 8
  %129 = load i32, ptr %10, align 4
  call void @lua_remove(ptr noundef %128, i32 noundef %129)
  %130 = load i32, ptr %7, align 4
  store i32 %130, ptr %3, align 4
  br label %131

131:                                              ; preds = %127, %121, %80, %31
  %132 = load i32, ptr %3, align 4
  ret i32 %132
}

declare ptr @"\01_fopen"(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @errfile(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %9 = call ptr @__error()
  %10 = load i32, ptr %9, align 4
  %11 = call ptr @"\01_strerror"(i32 noundef %10)
  store ptr %11, ptr %7, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = load i32, ptr %6, align 4
  %14 = call ptr @lua_tolstring(ptr noundef %12, i32 noundef %13, ptr noundef null)
  %15 = getelementptr inbounds i8, ptr %14, i64 1
  store ptr %15, ptr %8, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = load ptr, ptr %8, align 8
  %19 = load ptr, ptr %7, align 8
  %20 = call ptr (ptr, ptr, ...) @lua_pushfstring(ptr noundef %16, ptr noundef @.str.23, ptr noundef %17, ptr noundef %18, ptr noundef %19)
  %21 = load ptr, ptr %4, align 8
  %22 = load i32, ptr %6, align 4
  call void @lua_remove(ptr noundef %21, i32 noundef %22)
  ret i32 6
}

declare i32 @getc(ptr noundef) #1

declare ptr @"\01_freopen"(ptr noundef, ptr noundef, ptr noundef) #1

declare i32 @ungetc(i32 noundef, ptr noundef) #1

declare i32 @lua_load(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @getF(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %6, align 8
  store ptr %9, ptr %8, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load ptr, ptr %8, align 8
  %12 = getelementptr inbounds %struct.LoadF, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %12, align 8
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %19

15:                                               ; preds = %3
  %16 = load ptr, ptr %8, align 8
  %17 = getelementptr inbounds %struct.LoadF, ptr %16, i32 0, i32 0
  store i32 0, ptr %17, align 8
  %18 = load ptr, ptr %7, align 8
  store i64 1, ptr %18, align 8
  store ptr @.str.24, ptr %4, align 8
  br label %45

19:                                               ; preds = %3
  %20 = load ptr, ptr %8, align 8
  %21 = getelementptr inbounds %struct.LoadF, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = call i32 @feof(ptr noundef %22)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %19
  store ptr null, ptr %4, align 8
  br label %45

26:                                               ; preds = %19
  %27 = load ptr, ptr %8, align 8
  %28 = getelementptr inbounds %struct.LoadF, ptr %27, i32 0, i32 2
  %29 = getelementptr inbounds [1024 x i8], ptr %28, i64 0, i64 0
  %30 = load ptr, ptr %8, align 8
  %31 = getelementptr inbounds %struct.LoadF, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = call i64 @fread(ptr noundef %29, i64 noundef 1, i64 noundef 1024, ptr noundef %32)
  %34 = load ptr, ptr %7, align 8
  store i64 %33, ptr %34, align 8
  %35 = load ptr, ptr %7, align 8
  %36 = load i64, ptr %35, align 8
  %37 = icmp ugt i64 %36, 0
  br i1 %37, label %38, label %42

38:                                               ; preds = %26
  %39 = load ptr, ptr %8, align 8
  %40 = getelementptr inbounds %struct.LoadF, ptr %39, i32 0, i32 2
  %41 = getelementptr inbounds [1024 x i8], ptr %40, i64 0, i64 0
  br label %43

42:                                               ; preds = %26
  br label %43

43:                                               ; preds = %42, %38
  %44 = phi ptr [ %41, %38 ], [ null, %42 ]
  store ptr %44, ptr %4, align 8
  br label %45

45:                                               ; preds = %43, %25, %15
  %46 = load ptr, ptr %4, align 8
  ret ptr %46
}

declare i32 @ferror(ptr noundef) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_loadbuffer(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %struct.LoadS, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = getelementptr inbounds %struct.LoadS, ptr %9, i32 0, i32 0
  store ptr %10, ptr %11, align 8
  %12 = load i64, ptr %7, align 8
  %13 = getelementptr inbounds %struct.LoadS, ptr %9, i32 0, i32 1
  store i64 %12, ptr %13, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = load ptr, ptr %8, align 8
  %16 = call i32 @lua_load(ptr noundef %14, ptr noundef @getS, ptr noundef %9, ptr noundef %15)
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @getS(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %6, align 8
  store ptr %9, ptr %8, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load ptr, ptr %8, align 8
  %12 = getelementptr inbounds %struct.LoadS, ptr %11, i32 0, i32 1
  %13 = load i64, ptr %12, align 8
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %3
  store ptr null, ptr %4, align 8
  br label %26

16:                                               ; preds = %3
  %17 = load ptr, ptr %8, align 8
  %18 = getelementptr inbounds %struct.LoadS, ptr %17, i32 0, i32 1
  %19 = load i64, ptr %18, align 8
  %20 = load ptr, ptr %7, align 8
  store i64 %19, ptr %20, align 8
  %21 = load ptr, ptr %8, align 8
  %22 = getelementptr inbounds %struct.LoadS, ptr %21, i32 0, i32 1
  store i64 0, ptr %22, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = getelementptr inbounds %struct.LoadS, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %4, align 8
  br label %26

26:                                               ; preds = %16, %15
  %27 = load ptr, ptr %4, align 8
  ret ptr %27
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_loadstring(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call i64 @strlen(ptr noundef %7)
  %9 = load ptr, ptr %4, align 8
  %10 = call i32 @luaL_loadbuffer(ptr noundef %5, ptr noundef %6, i64 noundef %8, ptr noundef %9)
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @luaL_newstate() #0 {
  %1 = alloca ptr, align 8
  %2 = call ptr @lua_newstate(ptr noundef @l_alloc, ptr noundef null)
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = load ptr, ptr %1, align 8
  call void @lua_setallocf(ptr noundef %3, ptr noundef @l_alloc, ptr noundef %4)
  %5 = load ptr, ptr %1, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %10

7:                                                ; preds = %0
  %8 = load ptr, ptr %1, align 8
  %9 = call ptr @lua_atpanic(ptr noundef %8, ptr noundef @panic)
  br label %10

10:                                               ; preds = %7, %0
  %11 = load ptr, ptr %1, align 8
  ret ptr %11
}

declare ptr @lua_newstate(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @l_alloc(ptr noundef %0, ptr noundef %1, i64 noundef %2, i64 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i64 %2, ptr %8, align 8
  store i64 %3, ptr %9, align 8
  %12 = load ptr, ptr %6, align 8
  store ptr %12, ptr %10, align 8
  %13 = load i64, ptr %9, align 8
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %4
  %16 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %16)
  store ptr null, ptr %5, align 8
  br label %56

17:                                               ; preds = %4
  %18 = load i64, ptr %9, align 8
  %19 = load i64, ptr %8, align 8
  %20 = icmp ugt i64 %18, %19
  br i1 %20, label %21, label %40

21:                                               ; preds = %17
  %22 = load ptr, ptr %10, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %40

24:                                               ; preds = %21
  %25 = load ptr, ptr %10, align 8
  %26 = getelementptr inbounds %struct.lua_State, ptr %25, i32 0, i32 6
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %struct.global_State, ptr %27, i32 0, i32 16
  %29 = load i64, ptr %28, align 8
  %30 = icmp ugt i64 %29, 0
  br i1 %30, label %31, label %39

31:                                               ; preds = %24
  %32 = load ptr, ptr %10, align 8
  %33 = load i64, ptr %9, align 8
  %34 = load i64, ptr %8, align 8
  %35 = sub i64 %33, %34
  %36 = call i32 @l_check_memlimit(ptr noundef %32, i64 noundef %35)
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %39

38:                                               ; preds = %31
  store ptr null, ptr %5, align 8
  br label %56

39:                                               ; preds = %31, %24
  br label %40

40:                                               ; preds = %39, %21, %17
  %41 = load ptr, ptr %7, align 8
  %42 = load i64, ptr %9, align 8
  %43 = call ptr @realloc(ptr noundef %41, i64 noundef %42) #7
  store ptr %43, ptr %11, align 8
  %44 = load ptr, ptr %11, align 8
  %45 = icmp eq ptr %44, null
  br i1 %45, label %46, label %54

46:                                               ; preds = %40
  %47 = load ptr, ptr %10, align 8
  %48 = icmp ne ptr %47, null
  br i1 %48, label %49, label %54

49:                                               ; preds = %46
  %50 = load ptr, ptr %10, align 8
  call void @luaC_fullgc(ptr noundef %50)
  %51 = load ptr, ptr %7, align 8
  %52 = load i64, ptr %9, align 8
  %53 = call ptr @realloc(ptr noundef %51, i64 noundef %52) #7
  store ptr %53, ptr %11, align 8
  br label %54

54:                                               ; preds = %49, %46, %40
  %55 = load ptr, ptr %11, align 8
  store ptr %55, ptr %5, align 8
  br label %56

56:                                               ; preds = %54, %38, %15
  %57 = load ptr, ptr %5, align 8
  ret ptr %57
}

declare void @lua_setallocf(ptr noundef, ptr noundef, ptr noundef) #1

declare ptr @lua_atpanic(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @panic(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr @__stderrp, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call ptr @lua_tolstring(ptr noundef %5, i32 noundef -1, ptr noundef null)
  %7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %4, ptr noundef @.str.25, ptr noundef %6)
  ret i32 0
}

declare ptr @"\01_strerror"(i32 noundef) #1

declare ptr @__error() #1

declare i32 @feof(ptr noundef) #1

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

declare void @free(ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @l_check_memlimit(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.lua_State, ptr %9, i32 0, i32 6
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %6, align 8
  store i32 0, ptr %7, align 4
  %12 = load ptr, ptr %6, align 8
  %13 = getelementptr inbounds %struct.global_State, ptr %12, i32 0, i32 16
  %14 = load i64, ptr %13, align 8
  %15 = load i64, ptr %5, align 8
  %16 = sub i64 %14, %15
  store i64 %16, ptr %8, align 8
  %17 = load i64, ptr %5, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds %struct.global_State, ptr %18, i32 0, i32 16
  %20 = load i64, ptr %19, align 8
  %21 = icmp ugt i64 %17, %20
  br i1 %21, label %22, label %23

22:                                               ; preds = %2
  store i32 1, ptr %3, align 4
  br label %61

23:                                               ; preds = %2
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.lua_State, ptr %24, i32 0, i32 6
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds %struct.global_State, ptr %26, i32 0, i32 5
  %28 = load i8, ptr %27, align 2
  %29 = zext i8 %28 to i32
  %30 = and i32 %29, 1
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %53, label %32

32:                                               ; preds = %23
  br label %33

33:                                               ; preds = %50, %32
  %34 = load ptr, ptr %6, align 8
  %35 = getelementptr inbounds %struct.global_State, ptr %34, i32 0, i32 15
  %36 = load i64, ptr %35, align 8
  %37 = load i64, ptr %8, align 8
  %38 = icmp uge i64 %36, %37
  br i1 %38, label %39, label %52

39:                                               ; preds = %33
  %40 = load ptr, ptr %6, align 8
  %41 = getelementptr inbounds %struct.global_State, ptr %40, i32 0, i32 4
  %42 = load i8, ptr %41, align 1
  %43 = zext i8 %42 to i32
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %50

45:                                               ; preds = %39
  %46 = load i32, ptr %7, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %7, align 4
  %48 = icmp sgt i32 %47, 1
  br i1 %48, label %49, label %50

49:                                               ; preds = %45
  br label %52

50:                                               ; preds = %45, %39
  %51 = load ptr, ptr %4, align 8
  call void @luaC_step(ptr noundef %51)
  br label %33, !llvm.loop !20

52:                                               ; preds = %49, %33
  br label %53

53:                                               ; preds = %52, %23
  %54 = load ptr, ptr %6, align 8
  %55 = getelementptr inbounds %struct.global_State, ptr %54, i32 0, i32 15
  %56 = load i64, ptr %55, align 8
  %57 = load i64, ptr %8, align 8
  %58 = icmp uge i64 %56, %57
  %59 = zext i1 %58 to i64
  %60 = select i1 %58, i32 1, i32 0
  store i32 %60, ptr %3, align 4
  br label %61

61:                                               ; preds = %53, %22
  %62 = load i32, ptr %3, align 4
  ret i32 %62
}

; Function Attrs: allocsize(1)
declare ptr @realloc(ptr noundef, i64 noundef) #5

declare void @luaC_fullgc(ptr noundef) #1

declare void @luaC_step(ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nosync nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { allocsize(1) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #6 = { nounwind }
attributes #7 = { allocsize(1) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 14, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Homebrew clang version 17.0.2"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
