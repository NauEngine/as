; ModuleID = '/Users/alexzelenshikov/Work/NAU_ENGINE/as_proto/cmake-build-debug_withdebugllvm/as/languages/lua/lauxlib.bc'
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
define i32 @luaL_argerror(ptr noundef %L, i32 noundef %narg, ptr noundef %extramsg) #0 {
entry:
  %retval = alloca i32, align 4
  %L.addr = alloca ptr, align 8
  %narg.addr = alloca i32, align 4
  %extramsg.addr = alloca ptr, align 8
  %ar = alloca %struct.lua_Debug, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %narg, ptr %narg.addr, align 4
  store ptr %extramsg, ptr %extramsg.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %call = call i32 @lua_getstack(ptr noundef %0, i32 noundef 0, ptr noundef %ar)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load i32, ptr %narg.addr, align 4
  %3 = load ptr, ptr %extramsg.addr, align 8
  %call1 = call i32 (ptr, ptr, ...) @luaL_error(ptr noundef %1, ptr noundef @.str, i32 noundef %2, ptr noundef %3)
  store i32 %call1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load ptr, ptr %L.addr, align 8
  %call2 = call i32 @lua_getinfo(ptr noundef %4, ptr noundef @.str.1, ptr noundef %ar)
  %namewhat = getelementptr inbounds %struct.lua_Debug, ptr %ar, i32 0, i32 2
  %5 = load ptr, ptr %namewhat, align 8
  %call3 = call i32 @strcmp(ptr noundef %5, ptr noundef @.str.2)
  %cmp = icmp eq i32 %call3, 0
  br i1 %cmp, label %if.then4, label %if.end9

if.then4:                                         ; preds = %if.end
  %6 = load i32, ptr %narg.addr, align 4
  %dec = add nsw i32 %6, -1
  store i32 %dec, ptr %narg.addr, align 4
  %7 = load i32, ptr %narg.addr, align 4
  %cmp5 = icmp eq i32 %7, 0
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.then4
  %8 = load ptr, ptr %L.addr, align 8
  %name = getelementptr inbounds %struct.lua_Debug, ptr %ar, i32 0, i32 1
  %9 = load ptr, ptr %name, align 8
  %10 = load ptr, ptr %extramsg.addr, align 8
  %call7 = call i32 (ptr, ptr, ...) @luaL_error(ptr noundef %8, ptr noundef @.str.3, ptr noundef %9, ptr noundef %10)
  store i32 %call7, ptr %retval, align 4
  br label %return

if.end8:                                          ; preds = %if.then4
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.end
  %name10 = getelementptr inbounds %struct.lua_Debug, ptr %ar, i32 0, i32 1
  %11 = load ptr, ptr %name10, align 8
  %cmp11 = icmp eq ptr %11, null
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end9
  %name13 = getelementptr inbounds %struct.lua_Debug, ptr %ar, i32 0, i32 1
  store ptr @.str.4, ptr %name13, align 8
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %if.end9
  %12 = load ptr, ptr %L.addr, align 8
  %13 = load i32, ptr %narg.addr, align 4
  %name15 = getelementptr inbounds %struct.lua_Debug, ptr %ar, i32 0, i32 1
  %14 = load ptr, ptr %name15, align 8
  %15 = load ptr, ptr %extramsg.addr, align 8
  %call16 = call i32 (ptr, ptr, ...) @luaL_error(ptr noundef %12, ptr noundef @.str.5, i32 noundef %13, ptr noundef %14, ptr noundef %15)
  store i32 %call16, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end14, %if.then6, %if.then
  %16 = load i32, ptr %retval, align 4
  ret i32 %16
}

declare i32 @lua_getstack(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_error(ptr noundef %L, ptr noundef %fmt, ...) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %fmt.addr = alloca ptr, align 8
  %argp = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %fmt, ptr %fmt.addr, align 8
  call void @llvm.va_start(ptr %argp)
  %0 = load ptr, ptr %L.addr, align 8
  call void @luaL_where(ptr noundef %0, i32 noundef 1)
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load ptr, ptr %fmt.addr, align 8
  %3 = load ptr, ptr %argp, align 8
  %call = call ptr @lua_pushvfstring(ptr noundef %1, ptr noundef %2, ptr noundef %3)
  call void @llvm.va_end(ptr %argp)
  %4 = load ptr, ptr %L.addr, align 8
  call void @lua_concat(ptr noundef %4, i32 noundef 2)
  %5 = load ptr, ptr %L.addr, align 8
  %call1 = call i32 @lua_error(ptr noundef %5)
  ret i32 %call1
}

declare i32 @lua_getinfo(ptr noundef, ptr noundef, ptr noundef) #1

declare i32 @strcmp(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_typerror(ptr noundef %L, i32 noundef %narg, ptr noundef %tname) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %narg.addr = alloca i32, align 4
  %tname.addr = alloca ptr, align 8
  %msg = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %narg, ptr %narg.addr, align 4
  store ptr %tname, ptr %tname.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %tname.addr, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load i32, ptr %narg.addr, align 4
  %call = call i32 @lua_type(ptr noundef %3, i32 noundef %4)
  %call1 = call ptr @lua_typename(ptr noundef %2, i32 noundef %call)
  %call2 = call ptr (ptr, ptr, ...) @lua_pushfstring(ptr noundef %0, ptr noundef @.str.6, ptr noundef %1, ptr noundef %call1)
  store ptr %call2, ptr %msg, align 8
  %5 = load ptr, ptr %L.addr, align 8
  %6 = load i32, ptr %narg.addr, align 4
  %7 = load ptr, ptr %msg, align 8
  %call3 = call i32 @luaL_argerror(ptr noundef %5, i32 noundef %6, ptr noundef %7)
  ret i32 %call3
}

declare ptr @lua_pushfstring(ptr noundef, ptr noundef, ...) #1

declare ptr @lua_typename(ptr noundef, i32 noundef) #1

declare i32 @lua_type(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_where(ptr noundef %L, i32 noundef %level) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %level.addr = alloca i32, align 4
  %ar = alloca %struct.lua_Debug, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %level, ptr %level.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %level.addr, align 4
  %call = call i32 @lua_getstack(ptr noundef %0, i32 noundef %1, ptr noundef %ar)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end5

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %L.addr, align 8
  %call1 = call i32 @lua_getinfo(ptr noundef %2, ptr noundef @.str.7, ptr noundef %ar)
  %currentline = getelementptr inbounds %struct.lua_Debug, ptr %ar, i32 0, i32 5
  %3 = load i32, ptr %currentline, align 8
  %cmp = icmp sgt i32 %3, 0
  br i1 %cmp, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %4 = load ptr, ptr %L.addr, align 8
  %short_src = getelementptr inbounds %struct.lua_Debug, ptr %ar, i32 0, i32 9
  %arraydecay = getelementptr inbounds [60 x i8], ptr %short_src, i64 0, i64 0
  %currentline3 = getelementptr inbounds %struct.lua_Debug, ptr %ar, i32 0, i32 5
  %5 = load i32, ptr %currentline3, align 8
  %call4 = call ptr (ptr, ptr, ...) @lua_pushfstring(ptr noundef %4, ptr noundef @.str.8, ptr noundef %arraydecay, i32 noundef %5)
  br label %return

if.end:                                           ; preds = %if.then
  br label %if.end5

if.end5:                                          ; preds = %if.end, %entry
  %6 = load ptr, ptr %L.addr, align 8
  call void @lua_pushlstring(ptr noundef %6, ptr noundef @.str.9, i64 noundef 0)
  br label %return

return:                                           ; preds = %if.end5, %if.then2
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
define i32 @luaL_checkoption(ptr noundef %L, i32 noundef %narg, ptr noundef %def, ptr noundef %lst) #0 {
entry:
  %retval = alloca i32, align 4
  %L.addr = alloca ptr, align 8
  %narg.addr = alloca i32, align 4
  %def.addr = alloca ptr, align 8
  %lst.addr = alloca ptr, align 8
  %name = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store i32 %narg, ptr %narg.addr, align 4
  store ptr %def, ptr %def.addr, align 8
  store ptr %lst, ptr %lst.addr, align 8
  %0 = load ptr, ptr %def.addr, align 8
  %tobool = icmp ne ptr %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load i32, ptr %narg.addr, align 4
  %3 = load ptr, ptr %def.addr, align 8
  %call = call ptr @luaL_optlstring(ptr noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef null)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load ptr, ptr %L.addr, align 8
  %5 = load i32, ptr %narg.addr, align 4
  %call1 = call ptr @luaL_checklstring(ptr noundef %4, i32 noundef %5, ptr noundef null)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi ptr [ %call, %cond.true ], [ %call1, %cond.false ]
  store ptr %cond, ptr %name, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %6 = load ptr, ptr %lst.addr, align 8
  %7 = load i32, ptr %i, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %6, i64 %idxprom
  %8 = load ptr, ptr %arrayidx, align 8
  %tobool2 = icmp ne ptr %8, null
  br i1 %tobool2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load ptr, ptr %lst.addr, align 8
  %10 = load i32, ptr %i, align 4
  %idxprom3 = sext i32 %10 to i64
  %arrayidx4 = getelementptr inbounds ptr, ptr %9, i64 %idxprom3
  %11 = load ptr, ptr %arrayidx4, align 8
  %12 = load ptr, ptr %name, align 8
  %call5 = call i32 @strcmp(ptr noundef %11, ptr noundef %12)
  %cmp = icmp eq i32 %call5, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %13 = load i32, ptr %i, align 4
  store i32 %13, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %14 = load i32, ptr %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %15 = load ptr, ptr %L.addr, align 8
  %16 = load i32, ptr %narg.addr, align 4
  %17 = load ptr, ptr %L.addr, align 8
  %18 = load ptr, ptr %name, align 8
  %call6 = call ptr (ptr, ptr, ...) @lua_pushfstring(ptr noundef %17, ptr noundef @.str.10, ptr noundef %18)
  %call7 = call i32 @luaL_argerror(ptr noundef %15, i32 noundef %16, ptr noundef %call6)
  store i32 %call7, ptr %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %19 = load i32, ptr %retval, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @luaL_optlstring(ptr noundef %L, i32 noundef %narg, ptr noundef %def, ptr noundef %len) #0 {
entry:
  %retval = alloca ptr, align 8
  %L.addr = alloca ptr, align 8
  %narg.addr = alloca i32, align 4
  %def.addr = alloca ptr, align 8
  %len.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %narg, ptr %narg.addr, align 4
  store ptr %def, ptr %def.addr, align 8
  store ptr %len, ptr %len.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %narg.addr, align 4
  %call = call i32 @lua_type(ptr noundef %0, i32 noundef %1)
  %cmp = icmp sle i32 %call, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %len.addr, align 8
  %tobool = icmp ne ptr %2, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %3 = load ptr, ptr %def.addr, align 8
  %tobool2 = icmp ne ptr %3, null
  br i1 %tobool2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then1
  %4 = load ptr, ptr %def.addr, align 8
  %call3 = call i64 @strlen(ptr noundef %4)
  br label %cond.end

cond.false:                                       ; preds = %if.then1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %call3, %cond.true ], [ 0, %cond.false ]
  %5 = load ptr, ptr %len.addr, align 8
  store i64 %cond, ptr %5, align 8
  br label %if.end

if.end:                                           ; preds = %cond.end, %if.then
  %6 = load ptr, ptr %def.addr, align 8
  store ptr %6, ptr %retval, align 8
  br label %return

if.else:                                          ; preds = %entry
  %7 = load ptr, ptr %L.addr, align 8
  %8 = load i32, ptr %narg.addr, align 4
  %9 = load ptr, ptr %len.addr, align 8
  %call4 = call ptr @luaL_checklstring(ptr noundef %7, i32 noundef %8, ptr noundef %9)
  store ptr %call4, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.else, %if.end
  %10 = load ptr, ptr %retval, align 8
  ret ptr %10
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @luaL_checklstring(ptr noundef %L, i32 noundef %narg, ptr noundef %len) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %narg.addr = alloca i32, align 4
  %len.addr = alloca ptr, align 8
  %s = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %narg, ptr %narg.addr, align 4
  store ptr %len, ptr %len.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %narg.addr, align 4
  %2 = load ptr, ptr %len.addr, align 8
  %call = call ptr @lua_tolstring(ptr noundef %0, i32 noundef %1, ptr noundef %2)
  store ptr %call, ptr %s, align 8
  %3 = load ptr, ptr %s, align 8
  %tobool = icmp ne ptr %3, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %L.addr, align 8
  %5 = load i32, ptr %narg.addr, align 4
  call void @tag_error(ptr noundef %4, i32 noundef %5, i32 noundef 4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load ptr, ptr %s, align 8
  ret ptr %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_newmetatable(ptr noundef %L, ptr noundef %tname) #0 {
entry:
  %retval = alloca i32, align 4
  %L.addr = alloca ptr, align 8
  %tname.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %tname, ptr %tname.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %tname.addr, align 8
  call void @lua_getfield(ptr noundef %0, i32 noundef -10000, ptr noundef %1)
  %2 = load ptr, ptr %L.addr, align 8
  %call = call i32 @lua_type(ptr noundef %2, i32 noundef -1)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load ptr, ptr %L.addr, align 8
  call void @lua_settop(ptr noundef %3, i32 noundef -2)
  %4 = load ptr, ptr %L.addr, align 8
  call void @lua_createtable(ptr noundef %4, i32 noundef 0, i32 noundef 0)
  %5 = load ptr, ptr %L.addr, align 8
  call void @lua_pushvalue(ptr noundef %5, i32 noundef -1)
  %6 = load ptr, ptr %L.addr, align 8
  %7 = load ptr, ptr %tname.addr, align 8
  call void @lua_setfield(ptr noundef %6, i32 noundef -10000, ptr noundef %7)
  store i32 1, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, ptr %retval, align 4
  ret i32 %8
}

declare void @lua_getfield(ptr noundef, i32 noundef, ptr noundef) #1

declare void @lua_settop(ptr noundef, i32 noundef) #1

declare void @lua_createtable(ptr noundef, i32 noundef, i32 noundef) #1

declare void @lua_pushvalue(ptr noundef, i32 noundef) #1

declare void @lua_setfield(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @luaL_checkudata(ptr noundef %L, i32 noundef %ud, ptr noundef %tname) #0 {
entry:
  %retval = alloca ptr, align 8
  %L.addr = alloca ptr, align 8
  %ud.addr = alloca i32, align 4
  %tname.addr = alloca ptr, align 8
  %p = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %ud, ptr %ud.addr, align 4
  store ptr %tname, ptr %tname.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %ud.addr, align 4
  %call = call ptr @lua_touserdata(ptr noundef %0, i32 noundef %1)
  store ptr %call, ptr %p, align 8
  %2 = load ptr, ptr %p, align 8
  %cmp = icmp ne ptr %2, null
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %entry
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load i32, ptr %ud.addr, align 4
  %call1 = call i32 @lua_getmetatable(ptr noundef %3, i32 noundef %4)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.then2, label %if.end6

if.then2:                                         ; preds = %if.then
  %5 = load ptr, ptr %L.addr, align 8
  %6 = load ptr, ptr %tname.addr, align 8
  call void @lua_getfield(ptr noundef %5, i32 noundef -10000, ptr noundef %6)
  %7 = load ptr, ptr %L.addr, align 8
  %call3 = call i32 @lua_rawequal(ptr noundef %7, i32 noundef -1, i32 noundef -2)
  %tobool4 = icmp ne i32 %call3, 0
  br i1 %tobool4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then2
  %8 = load ptr, ptr %L.addr, align 8
  call void @lua_settop(ptr noundef %8, i32 noundef -3)
  %9 = load ptr, ptr %p, align 8
  store ptr %9, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %if.then2
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %entry
  %10 = load ptr, ptr %L.addr, align 8
  %11 = load i32, ptr %ud.addr, align 4
  %12 = load ptr, ptr %tname.addr, align 8
  %call8 = call i32 @luaL_typerror(ptr noundef %10, i32 noundef %11, ptr noundef %12)
  store ptr null, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end7, %if.then5
  %13 = load ptr, ptr %retval, align 8
  ret ptr %13
}

declare ptr @lua_touserdata(ptr noundef, i32 noundef) #1

declare i32 @lua_getmetatable(ptr noundef, i32 noundef) #1

declare i32 @lua_rawequal(ptr noundef, i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_checkstack(ptr noundef %L, i32 noundef %space, ptr noundef %mes) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %space.addr = alloca i32, align 4
  %mes.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %space, ptr %space.addr, align 4
  store ptr %mes, ptr %mes.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %space.addr, align 4
  %call = call i32 @lua_checkstack(ptr noundef %0, i32 noundef %1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %mes.addr, align 8
  %call1 = call i32 (ptr, ptr, ...) @luaL_error(ptr noundef %2, ptr noundef @.str.11, ptr noundef %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i32 @lua_checkstack(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_checktype(ptr noundef %L, i32 noundef %narg, i32 noundef %t) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %narg.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store i32 %narg, ptr %narg.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %narg.addr, align 4
  %call = call i32 @lua_type(ptr noundef %0, i32 noundef %1)
  %2 = load i32, ptr %t.addr, align 4
  %cmp = icmp ne i32 %call, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load i32, ptr %narg.addr, align 4
  %5 = load i32, ptr %t.addr, align 4
  call void @tag_error(ptr noundef %3, i32 noundef %4, i32 noundef %5)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @tag_error(ptr noundef %L, i32 noundef %narg, i32 noundef %tag) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %narg.addr = alloca i32, align 4
  %tag.addr = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store i32 %narg, ptr %narg.addr, align 4
  store i32 %tag, ptr %tag.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %narg.addr, align 4
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load i32, ptr %tag.addr, align 4
  %call = call ptr @lua_typename(ptr noundef %2, i32 noundef %3)
  %call1 = call i32 @luaL_typerror(ptr noundef %0, i32 noundef %1, ptr noundef %call)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_checkany(ptr noundef %L, i32 noundef %narg) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %narg.addr = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store i32 %narg, ptr %narg.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %narg.addr, align 4
  %call = call i32 @lua_type(ptr noundef %0, i32 noundef %1)
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load i32, ptr %narg.addr, align 4
  %call1 = call i32 @luaL_argerror(ptr noundef %2, i32 noundef %3, ptr noundef @.str.12)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare ptr @lua_tolstring(ptr noundef, i32 noundef, ptr noundef) #1

declare i64 @strlen(ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define double @luaL_checknumber(ptr noundef %L, i32 noundef %narg) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %narg.addr = alloca i32, align 4
  %d = alloca double, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %narg, ptr %narg.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %narg.addr, align 4
  %call = call double @lua_tonumber(ptr noundef %0, i32 noundef %1)
  store double %call, ptr %d, align 8
  %2 = load double, ptr %d, align 8
  %cmp = fcmp oeq double %2, 0.000000e+00
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load i32, ptr %narg.addr, align 4
  %call1 = call i32 @lua_isnumber(ptr noundef %3, i32 noundef %4)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %5 = load ptr, ptr %L.addr, align 8
  %6 = load i32, ptr %narg.addr, align 4
  call void @tag_error(ptr noundef %5, i32 noundef %6, i32 noundef 3)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %7 = load double, ptr %d, align 8
  ret double %7
}

declare double @lua_tonumber(ptr noundef, i32 noundef) #1

declare i32 @lua_isnumber(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define double @luaL_optnumber(ptr noundef %L, i32 noundef %narg, double noundef %def) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %narg.addr = alloca i32, align 4
  %def.addr = alloca double, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %narg, ptr %narg.addr, align 4
  store double %def, ptr %def.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %narg.addr, align 4
  %call = call i32 @lua_type(ptr noundef %0, i32 noundef %1)
  %cmp = icmp sle i32 %call, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load double, ptr %def.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load i32, ptr %narg.addr, align 4
  %call1 = call double @luaL_checknumber(ptr noundef %3, i32 noundef %4)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %2, %cond.true ], [ %call1, %cond.false ]
  ret double %cond
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @luaL_checkinteger(ptr noundef %L, i32 noundef %narg) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %narg.addr = alloca i32, align 4
  %d = alloca i64, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %narg, ptr %narg.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %narg.addr, align 4
  %call = call i64 @lua_tointeger(ptr noundef %0, i32 noundef %1)
  store i64 %call, ptr %d, align 8
  %2 = load i64, ptr %d, align 8
  %cmp = icmp eq i64 %2, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load i32, ptr %narg.addr, align 4
  %call1 = call i32 @lua_isnumber(ptr noundef %3, i32 noundef %4)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %5 = load ptr, ptr %L.addr, align 8
  %6 = load i32, ptr %narg.addr, align 4
  call void @tag_error(ptr noundef %5, i32 noundef %6, i32 noundef 3)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %7 = load i64, ptr %d, align 8
  ret i64 %7
}

declare i64 @lua_tointeger(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @luaL_optinteger(ptr noundef %L, i32 noundef %narg, i64 noundef %def) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %narg.addr = alloca i32, align 4
  %def.addr = alloca i64, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %narg, ptr %narg.addr, align 4
  store i64 %def, ptr %def.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %narg.addr, align 4
  %call = call i32 @lua_type(ptr noundef %0, i32 noundef %1)
  %cmp = icmp sle i32 %call, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i64, ptr %def.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load i32, ptr %narg.addr, align 4
  %call1 = call i64 @luaL_checkinteger(ptr noundef %3, i32 noundef %4)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %2, %cond.true ], [ %call1, %cond.false ]
  ret i64 %cond
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_getmetafield(ptr noundef %L, i32 noundef %obj, ptr noundef %event) #0 {
entry:
  %retval = alloca i32, align 4
  %L.addr = alloca ptr, align 8
  %obj.addr = alloca i32, align 4
  %event.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %obj, ptr %obj.addr, align 4
  store ptr %event, ptr %event.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %obj.addr, align 4
  %call = call i32 @lua_getmetatable(ptr noundef %0, i32 noundef %1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %event.addr, align 8
  call void @lua_pushstring(ptr noundef %2, ptr noundef %3)
  %4 = load ptr, ptr %L.addr, align 8
  call void @lua_rawget(ptr noundef %4, i32 noundef -2)
  %5 = load ptr, ptr %L.addr, align 8
  %call1 = call i32 @lua_type(ptr noundef %5, i32 noundef -1)
  %cmp = icmp eq i32 %call1, 0
  br i1 %cmp, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %6 = load ptr, ptr %L.addr, align 8
  call void @lua_settop(ptr noundef %6, i32 noundef -3)
  store i32 0, ptr %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end
  %7 = load ptr, ptr %L.addr, align 8
  call void @lua_remove(ptr noundef %7, i32 noundef -2)
  store i32 1, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then2, %if.then
  %8 = load i32, ptr %retval, align 4
  ret i32 %8
}

declare void @lua_pushstring(ptr noundef, ptr noundef) #1

declare void @lua_rawget(ptr noundef, i32 noundef) #1

declare void @lua_remove(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_callmeta(ptr noundef %L, i32 noundef %obj, ptr noundef %event) #0 {
entry:
  %retval = alloca i32, align 4
  %L.addr = alloca ptr, align 8
  %obj.addr = alloca i32, align 4
  %event.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %obj, ptr %obj.addr, align 4
  store ptr %event, ptr %event.addr, align 8
  %0 = load i32, ptr %obj.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, ptr %obj.addr, align 4
  %cmp1 = icmp sle i32 %1, -10000
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %2 = load i32, ptr %obj.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %3 = load ptr, ptr %L.addr, align 8
  %call = call i32 @lua_gettop(ptr noundef %3)
  %4 = load i32, ptr %obj.addr, align 4
  %add = add nsw i32 %call, %4
  %add2 = add nsw i32 %add, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ %add2, %cond.false ]
  store i32 %cond, ptr %obj.addr, align 4
  %5 = load ptr, ptr %L.addr, align 8
  %6 = load i32, ptr %obj.addr, align 4
  %7 = load ptr, ptr %event.addr, align 8
  %call3 = call i32 @luaL_getmetafield(ptr noundef %5, i32 noundef %6, ptr noundef %7)
  %tobool = icmp ne i32 %call3, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %cond.end
  store i32 0, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %8 = load ptr, ptr %L.addr, align 8
  %9 = load i32, ptr %obj.addr, align 4
  call void @lua_pushvalue(ptr noundef %8, i32 noundef %9)
  %10 = load ptr, ptr %L.addr, align 8
  call void @lua_call(ptr noundef %10, i32 noundef 1, i32 noundef 1)
  store i32 1, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %11 = load i32, ptr %retval, align 4
  ret i32 %11
}

declare i32 @lua_gettop(ptr noundef) #1

declare void @lua_call(ptr noundef, i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_register(ptr noundef %L, ptr noundef %libname, ptr noundef %l) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %libname.addr = alloca ptr, align 8
  %l.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %libname, ptr %libname.addr, align 8
  store ptr %l, ptr %l.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %libname.addr, align 8
  %2 = load ptr, ptr %l.addr, align 8
  call void @luaL_openlib(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef 0)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_openlib(ptr noundef %L, ptr noundef %libname, ptr noundef %l, i32 noundef %nup) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %libname.addr = alloca ptr, align 8
  %l.addr = alloca ptr, align 8
  %nup.addr = alloca i32, align 4
  %size = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store ptr %libname, ptr %libname.addr, align 8
  store ptr %l, ptr %l.addr, align 8
  store i32 %nup, ptr %nup.addr, align 4
  %0 = load ptr, ptr %libname.addr, align 8
  %tobool = icmp ne ptr %0, null
  br i1 %tobool, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %l.addr, align 8
  %call = call i32 @libsize(ptr noundef %1)
  store i32 %call, ptr %size, align 4
  %2 = load ptr, ptr %L.addr, align 8
  %call1 = call ptr @luaL_findtable(ptr noundef %2, i32 noundef -10000, ptr noundef @.str.13, i32 noundef 1)
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load ptr, ptr %libname.addr, align 8
  call void @lua_getfield(ptr noundef %3, i32 noundef -1, ptr noundef %4)
  %5 = load ptr, ptr %L.addr, align 8
  %call2 = call i32 @lua_type(ptr noundef %5, i32 noundef -1)
  %cmp = icmp eq i32 %call2, 5
  br i1 %cmp, label %if.end8, label %if.then3

if.then3:                                         ; preds = %if.then
  %6 = load ptr, ptr %L.addr, align 8
  call void @lua_settop(ptr noundef %6, i32 noundef -2)
  %7 = load ptr, ptr %L.addr, align 8
  %8 = load ptr, ptr %libname.addr, align 8
  %9 = load i32, ptr %size, align 4
  %call4 = call ptr @luaL_findtable(ptr noundef %7, i32 noundef -10002, ptr noundef %8, i32 noundef %9)
  %cmp5 = icmp ne ptr %call4, null
  br i1 %cmp5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then3
  %10 = load ptr, ptr %L.addr, align 8
  %11 = load ptr, ptr %libname.addr, align 8
  %call7 = call i32 (ptr, ptr, ...) @luaL_error(ptr noundef %10, ptr noundef @.str.14, ptr noundef %11)
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then3
  %12 = load ptr, ptr %L.addr, align 8
  call void @lua_pushvalue(ptr noundef %12, i32 noundef -1)
  %13 = load ptr, ptr %L.addr, align 8
  %14 = load ptr, ptr %libname.addr, align 8
  call void @lua_setfield(ptr noundef %13, i32 noundef -3, ptr noundef %14)
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  %15 = load ptr, ptr %L.addr, align 8
  call void @lua_remove(ptr noundef %15, i32 noundef -2)
  %16 = load ptr, ptr %L.addr, align 8
  %17 = load i32, ptr %nup.addr, align 4
  %add = add nsw i32 %17, 1
  %sub = sub nsw i32 0, %add
  call void @lua_insert(ptr noundef %16, i32 noundef %sub)
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %entry
  br label %for.cond

for.cond:                                         ; preds = %for.inc18, %if.end9
  %18 = load ptr, ptr %l.addr, align 8
  %name = getelementptr inbounds %struct.luaL_Reg, ptr %18, i32 0, i32 0
  %19 = load ptr, ptr %name, align 8
  %tobool10 = icmp ne ptr %19, null
  br i1 %tobool10, label %for.body, label %for.end19

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %i, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc, %for.body
  %20 = load i32, ptr %i, align 4
  %21 = load i32, ptr %nup.addr, align 4
  %cmp12 = icmp slt i32 %20, %21
  br i1 %cmp12, label %for.body13, label %for.end

for.body13:                                       ; preds = %for.cond11
  %22 = load ptr, ptr %L.addr, align 8
  %23 = load i32, ptr %nup.addr, align 4
  %sub14 = sub nsw i32 0, %23
  call void @lua_pushvalue(ptr noundef %22, i32 noundef %sub14)
  br label %for.inc

for.inc:                                          ; preds = %for.body13
  %24 = load i32, ptr %i, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond11, !llvm.loop !8

for.end:                                          ; preds = %for.cond11
  %25 = load ptr, ptr %L.addr, align 8
  %26 = load ptr, ptr %l.addr, align 8
  %func = getelementptr inbounds %struct.luaL_Reg, ptr %26, i32 0, i32 1
  %27 = load ptr, ptr %func, align 8
  %28 = load i32, ptr %nup.addr, align 4
  call void @lua_pushcclosure(ptr noundef %25, ptr noundef %27, i32 noundef %28)
  %29 = load ptr, ptr %L.addr, align 8
  %30 = load i32, ptr %nup.addr, align 4
  %add15 = add nsw i32 %30, 2
  %sub16 = sub nsw i32 0, %add15
  %31 = load ptr, ptr %l.addr, align 8
  %name17 = getelementptr inbounds %struct.luaL_Reg, ptr %31, i32 0, i32 0
  %32 = load ptr, ptr %name17, align 8
  call void @lua_setfield(ptr noundef %29, i32 noundef %sub16, ptr noundef %32)
  br label %for.inc18

for.inc18:                                        ; preds = %for.end
  %33 = load ptr, ptr %l.addr, align 8
  %incdec.ptr = getelementptr inbounds %struct.luaL_Reg, ptr %33, i32 1
  store ptr %incdec.ptr, ptr %l.addr, align 8
  br label %for.cond, !llvm.loop !9

for.end19:                                        ; preds = %for.cond
  %34 = load ptr, ptr %L.addr, align 8
  %35 = load i32, ptr %nup.addr, align 4
  %sub20 = sub nsw i32 0, %35
  %sub21 = sub nsw i32 %sub20, 1
  call void @lua_settop(ptr noundef %34, i32 noundef %sub21)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @libsize(ptr noundef %l) #0 {
entry:
  %l.addr = alloca ptr, align 8
  %size = alloca i32, align 4
  store ptr %l, ptr %l.addr, align 8
  store i32 0, ptr %size, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load ptr, ptr %l.addr, align 8
  %name = getelementptr inbounds %struct.luaL_Reg, ptr %0, i32 0, i32 0
  %1 = load ptr, ptr %name, align 8
  %tobool = icmp ne ptr %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %size, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, ptr %size, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load ptr, ptr %l.addr, align 8
  %incdec.ptr = getelementptr inbounds %struct.luaL_Reg, ptr %3, i32 1
  store ptr %incdec.ptr, ptr %l.addr, align 8
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %for.cond
  %4 = load i32, ptr %size, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @luaL_findtable(ptr noundef %L, i32 noundef %idx, ptr noundef %fname, i32 noundef %szhint) #0 {
entry:
  %retval = alloca ptr, align 8
  %L.addr = alloca ptr, align 8
  %idx.addr = alloca i32, align 4
  %fname.addr = alloca ptr, align 8
  %szhint.addr = alloca i32, align 4
  %e = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store i32 %idx, ptr %idx.addr, align 4
  store ptr %fname, ptr %fname.addr, align 8
  store i32 %szhint, ptr %szhint.addr, align 4
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load i32, ptr %idx.addr, align 4
  call void @lua_pushvalue(ptr noundef %0, i32 noundef %1)
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %2 = load ptr, ptr %fname.addr, align 8
  %call = call ptr @strchr(ptr noundef %2, i32 noundef 46)
  store ptr %call, ptr %e, align 8
  %3 = load ptr, ptr %e, align 8
  %cmp = icmp eq ptr %3, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %4 = load ptr, ptr %fname.addr, align 8
  %5 = load ptr, ptr %fname.addr, align 8
  %call1 = call i64 @strlen(ptr noundef %5)
  %add.ptr = getelementptr inbounds i8, ptr %4, i64 %call1
  store ptr %add.ptr, ptr %e, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  %6 = load ptr, ptr %L.addr, align 8
  %7 = load ptr, ptr %fname.addr, align 8
  %8 = load ptr, ptr %e, align 8
  %9 = load ptr, ptr %fname.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %8 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %9 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  call void @lua_pushlstring(ptr noundef %6, ptr noundef %7, i64 noundef %sub.ptr.sub)
  %10 = load ptr, ptr %L.addr, align 8
  call void @lua_rawget(ptr noundef %10, i32 noundef -2)
  %11 = load ptr, ptr %L.addr, align 8
  %call2 = call i32 @lua_type(ptr noundef %11, i32 noundef -1)
  %cmp3 = icmp eq i32 %call2, 0
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  %12 = load ptr, ptr %L.addr, align 8
  call void @lua_settop(ptr noundef %12, i32 noundef -2)
  %13 = load ptr, ptr %L.addr, align 8
  %14 = load ptr, ptr %e, align 8
  %15 = load i8, ptr %14, align 1
  %conv = sext i8 %15 to i32
  %cmp5 = icmp eq i32 %conv, 46
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then4
  br label %cond.end

cond.false:                                       ; preds = %if.then4
  %16 = load i32, ptr %szhint.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ %16, %cond.false ]
  call void @lua_createtable(ptr noundef %13, i32 noundef 0, i32 noundef %cond)
  %17 = load ptr, ptr %L.addr, align 8
  %18 = load ptr, ptr %fname.addr, align 8
  %19 = load ptr, ptr %e, align 8
  %20 = load ptr, ptr %fname.addr, align 8
  %sub.ptr.lhs.cast7 = ptrtoint ptr %19 to i64
  %sub.ptr.rhs.cast8 = ptrtoint ptr %20 to i64
  %sub.ptr.sub9 = sub i64 %sub.ptr.lhs.cast7, %sub.ptr.rhs.cast8
  call void @lua_pushlstring(ptr noundef %17, ptr noundef %18, i64 noundef %sub.ptr.sub9)
  %21 = load ptr, ptr %L.addr, align 8
  call void @lua_pushvalue(ptr noundef %21, i32 noundef -2)
  %22 = load ptr, ptr %L.addr, align 8
  call void @lua_settable(ptr noundef %22, i32 noundef -4)
  br label %if.end15

if.else:                                          ; preds = %if.end
  %23 = load ptr, ptr %L.addr, align 8
  %call10 = call i32 @lua_type(ptr noundef %23, i32 noundef -1)
  %cmp11 = icmp eq i32 %call10, 5
  br i1 %cmp11, label %if.end14, label %if.then13

if.then13:                                        ; preds = %if.else
  %24 = load ptr, ptr %L.addr, align 8
  call void @lua_settop(ptr noundef %24, i32 noundef -3)
  %25 = load ptr, ptr %fname.addr, align 8
  store ptr %25, ptr %retval, align 8
  br label %return

if.end14:                                         ; preds = %if.else
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %cond.end
  %26 = load ptr, ptr %L.addr, align 8
  call void @lua_remove(ptr noundef %26, i32 noundef -2)
  %27 = load ptr, ptr %e, align 8
  %add.ptr16 = getelementptr inbounds i8, ptr %27, i64 1
  store ptr %add.ptr16, ptr %fname.addr, align 8
  br label %do.cond

do.cond:                                          ; preds = %if.end15
  %28 = load ptr, ptr %e, align 8
  %29 = load i8, ptr %28, align 1
  %conv17 = sext i8 %29 to i32
  %cmp18 = icmp eq i32 %conv17, 46
  br i1 %cmp18, label %do.body, label %do.end, !llvm.loop !11

do.end:                                           ; preds = %do.cond
  store ptr null, ptr %retval, align 8
  br label %return

return:                                           ; preds = %do.end, %if.then13
  %30 = load ptr, ptr %retval, align 8
  ret ptr %30
}

declare void @lua_insert(ptr noundef, i32 noundef) #1

declare void @lua_pushcclosure(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_register3(ptr noundef %L, ptr noundef %libname, ptr noundef %l) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %libname.addr = alloca ptr, align 8
  %l.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %libname, ptr %libname.addr, align 8
  store ptr %l, ptr %l.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %libname.addr, align 8
  %2 = load ptr, ptr %l.addr, align 8
  call void @luaI_openlib3(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef 0)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaI_openlib3(ptr noundef %L, ptr noundef %libname, ptr noundef %l, i32 noundef %nup) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %libname.addr = alloca ptr, align 8
  %l.addr = alloca ptr, align 8
  %nup.addr = alloca i32, align 4
  %size = alloca i32, align 4
  %i = alloca i32, align 4
  %cl = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %libname, ptr %libname.addr, align 8
  store ptr %l, ptr %l.addr, align 8
  store i32 %nup, ptr %nup.addr, align 4
  %0 = load ptr, ptr %libname.addr, align 8
  %tobool = icmp ne ptr %0, null
  br i1 %tobool, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %l.addr, align 8
  %call = call i32 @libsize3(ptr noundef %1)
  store i32 %call, ptr %size, align 4
  %2 = load ptr, ptr %L.addr, align 8
  %call1 = call ptr @luaL_findtable(ptr noundef %2, i32 noundef -10000, ptr noundef @.str.13, i32 noundef 1)
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load ptr, ptr %libname.addr, align 8
  call void @lua_getfield(ptr noundef %3, i32 noundef -1, ptr noundef %4)
  %5 = load ptr, ptr %L.addr, align 8
  %call2 = call i32 @lua_type(ptr noundef %5, i32 noundef -1)
  %cmp = icmp eq i32 %call2, 5
  br i1 %cmp, label %if.end8, label %if.then3

if.then3:                                         ; preds = %if.then
  %6 = load ptr, ptr %L.addr, align 8
  call void @lua_settop(ptr noundef %6, i32 noundef -2)
  %7 = load ptr, ptr %L.addr, align 8
  %8 = load ptr, ptr %libname.addr, align 8
  %9 = load i32, ptr %size, align 4
  %call4 = call ptr @luaL_findtable(ptr noundef %7, i32 noundef -10002, ptr noundef %8, i32 noundef %9)
  %cmp5 = icmp ne ptr %call4, null
  br i1 %cmp5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then3
  %10 = load ptr, ptr %L.addr, align 8
  %11 = load ptr, ptr %libname.addr, align 8
  %call7 = call i32 (ptr, ptr, ...) @luaL_error(ptr noundef %10, ptr noundef @.str.14, ptr noundef %11)
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then3
  %12 = load ptr, ptr %L.addr, align 8
  call void @lua_pushvalue(ptr noundef %12, i32 noundef -1)
  %13 = load ptr, ptr %L.addr, align 8
  %14 = load ptr, ptr %libname.addr, align 8
  call void @lua_setfield(ptr noundef %13, i32 noundef -3, ptr noundef %14)
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  %15 = load ptr, ptr %L.addr, align 8
  call void @lua_remove(ptr noundef %15, i32 noundef -2)
  %16 = load ptr, ptr %L.addr, align 8
  %17 = load i32, ptr %nup.addr, align 4
  %add = add nsw i32 %17, 1
  %sub = sub nsw i32 0, %add
  call void @lua_insert(ptr noundef %16, i32 noundef %sub)
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %entry
  br label %for.cond

for.cond:                                         ; preds = %for.inc23, %if.end9
  %18 = load ptr, ptr %l.addr, align 8
  %name = getelementptr inbounds %struct.luaL_Reg3, ptr %18, i32 0, i32 0
  %19 = load ptr, ptr %name, align 8
  %tobool10 = icmp ne ptr %19, null
  br i1 %tobool10, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %i, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc, %for.body
  %20 = load i32, ptr %i, align 4
  %21 = load i32, ptr %nup.addr, align 4
  %cmp12 = icmp slt i32 %20, %21
  br i1 %cmp12, label %for.body13, label %for.end

for.body13:                                       ; preds = %for.cond11
  %22 = load ptr, ptr %L.addr, align 8
  %23 = load i32, ptr %nup.addr, align 4
  %sub14 = sub nsw i32 0, %23
  call void @lua_pushvalue(ptr noundef %22, i32 noundef %sub14)
  br label %for.inc

for.inc:                                          ; preds = %for.body13
  %24 = load i32, ptr %i, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond11, !llvm.loop !12

for.end:                                          ; preds = %for.cond11
  %25 = load ptr, ptr %L.addr, align 8
  %26 = load ptr, ptr %l.addr, align 8
  %func = getelementptr inbounds %struct.luaL_Reg3, ptr %26, i32 0, i32 1
  %27 = load ptr, ptr %func, align 8
  %28 = load i32, ptr %nup.addr, align 4
  call void @lua_pushcclosure(ptr noundef %25, ptr noundef %27, i32 noundef %28)
  %29 = load ptr, ptr %l.addr, align 8
  %precall = getelementptr inbounds %struct.luaL_Reg3, ptr %29, i32 0, i32 2
  %30 = load ptr, ptr %precall, align 8
  %tobool15 = icmp ne ptr %30, null
  br i1 %tobool15, label %if.then16, label %if.end19

if.then16:                                        ; preds = %for.end
  %31 = load ptr, ptr %L.addr, align 8
  %top = getelementptr inbounds %struct.lua_State, ptr %31, i32 0, i32 4
  %32 = load ptr, ptr %top, align 8
  %add.ptr = getelementptr inbounds %struct.lua_TValue, ptr %32, i64 -1
  %value = getelementptr inbounds %struct.lua_TValue, ptr %add.ptr, i32 0, i32 0
  %33 = load ptr, ptr %value, align 8
  store ptr %33, ptr %cl, align 8
  %34 = load ptr, ptr %l.addr, align 8
  %precall17 = getelementptr inbounds %struct.luaL_Reg3, ptr %34, i32 0, i32 2
  %35 = load ptr, ptr %precall17, align 8
  %36 = load ptr, ptr %cl, align 8
  %precall18 = getelementptr inbounds %struct.CClosure, ptr %36, i32 0, i32 7
  store ptr %35, ptr %precall18, align 8
  br label %if.end19

if.end19:                                         ; preds = %if.then16, %for.end
  %37 = load ptr, ptr %L.addr, align 8
  %38 = load i32, ptr %nup.addr, align 4
  %add20 = add nsw i32 %38, 2
  %sub21 = sub nsw i32 0, %add20
  %39 = load ptr, ptr %l.addr, align 8
  %name22 = getelementptr inbounds %struct.luaL_Reg3, ptr %39, i32 0, i32 0
  %40 = load ptr, ptr %name22, align 8
  call void @lua_setfield(ptr noundef %37, i32 noundef %sub21, ptr noundef %40)
  br label %for.inc23

for.inc23:                                        ; preds = %if.end19
  %41 = load ptr, ptr %l.addr, align 8
  %incdec.ptr = getelementptr inbounds %struct.luaL_Reg3, ptr %41, i32 1
  store ptr %incdec.ptr, ptr %l.addr, align 8
  br label %for.cond, !llvm.loop !13

for.end24:                                        ; preds = %for.cond
  %42 = load ptr, ptr %L.addr, align 8
  %43 = load i32, ptr %nup.addr, align 4
  %sub25 = sub nsw i32 0, %43
  %sub26 = sub nsw i32 %sub25, 1
  call void @lua_settop(ptr noundef %42, i32 noundef %sub26)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @libsize3(ptr noundef %l) #0 {
entry:
  %l.addr = alloca ptr, align 8
  %size = alloca i32, align 4
  store ptr %l, ptr %l.addr, align 8
  store i32 0, ptr %size, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load ptr, ptr %l.addr, align 8
  %name = getelementptr inbounds %struct.luaL_Reg3, ptr %0, i32 0, i32 0
  %1 = load ptr, ptr %name, align 8
  %tobool = icmp ne ptr %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %size, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, ptr %size, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load ptr, ptr %l.addr, align 8
  %incdec.ptr = getelementptr inbounds %struct.luaL_Reg3, ptr %3, i32 1
  store ptr %incdec.ptr, ptr %l.addr, align 8
  br label %for.cond, !llvm.loop !14

for.end:                                          ; preds = %for.cond
  %4 = load i32, ptr %size, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @luaL_gsub(ptr noundef %L, ptr noundef %s, ptr noundef %p, ptr noundef %r) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %s.addr = alloca ptr, align 8
  %p.addr = alloca ptr, align 8
  %r.addr = alloca ptr, align 8
  %wild = alloca ptr, align 8
  %l = alloca i64, align 8
  %b = alloca %struct.luaL_Buffer, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %s, ptr %s.addr, align 8
  store ptr %p, ptr %p.addr, align 8
  store ptr %r, ptr %r.addr, align 8
  %0 = load ptr, ptr %p.addr, align 8
  %call = call i64 @strlen(ptr noundef %0)
  store i64 %call, ptr %l, align 8
  %1 = load ptr, ptr %L.addr, align 8
  call void @luaL_buffinit(ptr noundef %1, ptr noundef %b)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %2 = load ptr, ptr %s.addr, align 8
  %3 = load ptr, ptr %p.addr, align 8
  %call1 = call ptr @strstr(ptr noundef %2, ptr noundef %3)
  store ptr %call1, ptr %wild, align 8
  %cmp = icmp ne ptr %call1, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load ptr, ptr %s.addr, align 8
  %5 = load ptr, ptr %wild, align 8
  %6 = load ptr, ptr %s.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %5 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %6 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  call void @luaL_addlstring(ptr noundef %b, ptr noundef %4, i64 noundef %sub.ptr.sub)
  %7 = load ptr, ptr %r.addr, align 8
  call void @luaL_addstring(ptr noundef %b, ptr noundef %7)
  %8 = load ptr, ptr %wild, align 8
  %9 = load i64, ptr %l, align 8
  %add.ptr = getelementptr inbounds i8, ptr %8, i64 %9
  store ptr %add.ptr, ptr %s.addr, align 8
  br label %while.cond, !llvm.loop !15

while.end:                                        ; preds = %while.cond
  %10 = load ptr, ptr %s.addr, align 8
  call void @luaL_addstring(ptr noundef %b, ptr noundef %10)
  call void @luaL_pushresult(ptr noundef %b)
  %11 = load ptr, ptr %L.addr, align 8
  %call2 = call ptr @lua_tolstring(ptr noundef %11, i32 noundef -1, ptr noundef null)
  ret ptr %call2
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_buffinit(ptr noundef %L, ptr noundef %B) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %B.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %B, ptr %B.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %B.addr, align 8
  %L1 = getelementptr inbounds %struct.luaL_Buffer, ptr %1, i32 0, i32 2
  store ptr %0, ptr %L1, align 8
  %2 = load ptr, ptr %B.addr, align 8
  %buffer = getelementptr inbounds %struct.luaL_Buffer, ptr %2, i32 0, i32 3
  %arraydecay = getelementptr inbounds [1024 x i8], ptr %buffer, i64 0, i64 0
  %3 = load ptr, ptr %B.addr, align 8
  %p = getelementptr inbounds %struct.luaL_Buffer, ptr %3, i32 0, i32 0
  store ptr %arraydecay, ptr %p, align 8
  %4 = load ptr, ptr %B.addr, align 8
  %lvl = getelementptr inbounds %struct.luaL_Buffer, ptr %4, i32 0, i32 1
  store i32 0, ptr %lvl, align 8
  ret void
}

declare ptr @strstr(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_addlstring(ptr noundef %B, ptr noundef %s, i64 noundef %l) #0 {
entry:
  %B.addr = alloca ptr, align 8
  %s.addr = alloca ptr, align 8
  %l.addr = alloca i64, align 8
  store ptr %B, ptr %B.addr, align 8
  store ptr %s, ptr %s.addr, align 8
  store i64 %l, ptr %l.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %lor.end, %entry
  %0 = load i64, ptr %l.addr, align 8
  %dec = add i64 %0, -1
  store i64 %dec, ptr %l.addr, align 8
  %tobool = icmp ne i64 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load ptr, ptr %B.addr, align 8
  %p = getelementptr inbounds %struct.luaL_Buffer, ptr %1, i32 0, i32 0
  %2 = load ptr, ptr %p, align 8
  %3 = load ptr, ptr %B.addr, align 8
  %buffer = getelementptr inbounds %struct.luaL_Buffer, ptr %3, i32 0, i32 3
  %arraydecay = getelementptr inbounds [1024 x i8], ptr %buffer, i64 0, i64 0
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay, i64 1024
  %cmp = icmp ult ptr %2, %add.ptr
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.body
  %4 = load ptr, ptr %B.addr, align 8
  %call = call ptr @luaL_prepbuffer(ptr noundef %4)
  %tobool1 = icmp ne ptr %call, null
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %while.body
  %5 = phi i1 [ true, %while.body ], [ %tobool1, %lor.rhs ]
  %lor.ext = zext i1 %5 to i32
  %6 = load ptr, ptr %s.addr, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %6, i32 1
  store ptr %incdec.ptr, ptr %s.addr, align 8
  %7 = load i8, ptr %6, align 1
  %8 = load ptr, ptr %B.addr, align 8
  %p2 = getelementptr inbounds %struct.luaL_Buffer, ptr %8, i32 0, i32 0
  %9 = load ptr, ptr %p2, align 8
  %incdec.ptr3 = getelementptr inbounds i8, ptr %9, i32 1
  store ptr %incdec.ptr3, ptr %p2, align 8
  store i8 %7, ptr %9, align 1
  br label %while.cond, !llvm.loop !16

while.end:                                        ; preds = %while.cond
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_addstring(ptr noundef %B, ptr noundef %s) #0 {
entry:
  %B.addr = alloca ptr, align 8
  %s.addr = alloca ptr, align 8
  store ptr %B, ptr %B.addr, align 8
  store ptr %s, ptr %s.addr, align 8
  %0 = load ptr, ptr %B.addr, align 8
  %1 = load ptr, ptr %s.addr, align 8
  %2 = load ptr, ptr %s.addr, align 8
  %call = call i64 @strlen(ptr noundef %2)
  call void @luaL_addlstring(ptr noundef %0, ptr noundef %1, i64 noundef %call)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_pushresult(ptr noundef %B) #0 {
entry:
  %B.addr = alloca ptr, align 8
  store ptr %B, ptr %B.addr, align 8
  %0 = load ptr, ptr %B.addr, align 8
  %call = call i32 @emptybuffer(ptr noundef %0)
  %1 = load ptr, ptr %B.addr, align 8
  %L = getelementptr inbounds %struct.luaL_Buffer, ptr %1, i32 0, i32 2
  %2 = load ptr, ptr %L, align 8
  %3 = load ptr, ptr %B.addr, align 8
  %lvl = getelementptr inbounds %struct.luaL_Buffer, ptr %3, i32 0, i32 1
  %4 = load i32, ptr %lvl, align 8
  call void @lua_concat(ptr noundef %2, i32 noundef %4)
  %5 = load ptr, ptr %B.addr, align 8
  %lvl1 = getelementptr inbounds %struct.luaL_Buffer, ptr %5, i32 0, i32 1
  store i32 1, ptr %lvl1, align 8
  ret void
}

declare ptr @strchr(ptr noundef, i32 noundef) #1

declare void @lua_settable(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @luaL_prepbuffer(ptr noundef %B) #0 {
entry:
  %B.addr = alloca ptr, align 8
  store ptr %B, ptr %B.addr, align 8
  %0 = load ptr, ptr %B.addr, align 8
  %call = call i32 @emptybuffer(ptr noundef %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %B.addr, align 8
  call void @adjuststack(ptr noundef %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load ptr, ptr %B.addr, align 8
  %buffer = getelementptr inbounds %struct.luaL_Buffer, ptr %2, i32 0, i32 3
  %arraydecay = getelementptr inbounds [1024 x i8], ptr %buffer, i64 0, i64 0
  ret ptr %arraydecay
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @emptybuffer(ptr noundef %B) #0 {
entry:
  %retval = alloca i32, align 4
  %B.addr = alloca ptr, align 8
  %l = alloca i64, align 8
  store ptr %B, ptr %B.addr, align 8
  %0 = load ptr, ptr %B.addr, align 8
  %p = getelementptr inbounds %struct.luaL_Buffer, ptr %0, i32 0, i32 0
  %1 = load ptr, ptr %p, align 8
  %2 = load ptr, ptr %B.addr, align 8
  %buffer = getelementptr inbounds %struct.luaL_Buffer, ptr %2, i32 0, i32 3
  %arraydecay = getelementptr inbounds [1024 x i8], ptr %buffer, i64 0, i64 0
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %arraydecay to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i64 %sub.ptr.sub, ptr %l, align 8
  %3 = load i64, ptr %l, align 8
  %cmp = icmp eq i64 %3, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, ptr %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %4 = load ptr, ptr %B.addr, align 8
  %L = getelementptr inbounds %struct.luaL_Buffer, ptr %4, i32 0, i32 2
  %5 = load ptr, ptr %L, align 8
  %6 = load ptr, ptr %B.addr, align 8
  %buffer1 = getelementptr inbounds %struct.luaL_Buffer, ptr %6, i32 0, i32 3
  %arraydecay2 = getelementptr inbounds [1024 x i8], ptr %buffer1, i64 0, i64 0
  %7 = load i64, ptr %l, align 8
  call void @lua_pushlstring(ptr noundef %5, ptr noundef %arraydecay2, i64 noundef %7)
  %8 = load ptr, ptr %B.addr, align 8
  %buffer3 = getelementptr inbounds %struct.luaL_Buffer, ptr %8, i32 0, i32 3
  %arraydecay4 = getelementptr inbounds [1024 x i8], ptr %buffer3, i64 0, i64 0
  %9 = load ptr, ptr %B.addr, align 8
  %p5 = getelementptr inbounds %struct.luaL_Buffer, ptr %9, i32 0, i32 0
  store ptr %arraydecay4, ptr %p5, align 8
  %10 = load ptr, ptr %B.addr, align 8
  %lvl = getelementptr inbounds %struct.luaL_Buffer, ptr %10, i32 0, i32 1
  %11 = load i32, ptr %lvl, align 8
  %inc = add nsw i32 %11, 1
  store i32 %inc, ptr %lvl, align 8
  store i32 1, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %12 = load i32, ptr %retval, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal void @adjuststack(ptr noundef %B) #0 {
entry:
  %B.addr = alloca ptr, align 8
  %L = alloca ptr, align 8
  %toget = alloca i32, align 4
  %toplen = alloca i64, align 8
  %l = alloca i64, align 8
  store ptr %B, ptr %B.addr, align 8
  %0 = load ptr, ptr %B.addr, align 8
  %lvl = getelementptr inbounds %struct.luaL_Buffer, ptr %0, i32 0, i32 1
  %1 = load i32, ptr %lvl, align 8
  %cmp = icmp sgt i32 %1, 1
  br i1 %cmp, label %if.then, label %if.end16

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %B.addr, align 8
  %L1 = getelementptr inbounds %struct.luaL_Buffer, ptr %2, i32 0, i32 2
  %3 = load ptr, ptr %L1, align 8
  store ptr %3, ptr %L, align 8
  store i32 1, ptr %toget, align 4
  %4 = load ptr, ptr %L, align 8
  %call = call i64 @lua_objlen(ptr noundef %4, i32 noundef -1)
  store i64 %call, ptr %toplen, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then
  %5 = load ptr, ptr %L, align 8
  %6 = load i32, ptr %toget, align 4
  %add = add nsw i32 %6, 1
  %sub = sub nsw i32 0, %add
  %call2 = call i64 @lua_objlen(ptr noundef %5, i32 noundef %sub)
  store i64 %call2, ptr %l, align 8
  %7 = load ptr, ptr %B.addr, align 8
  %lvl3 = getelementptr inbounds %struct.luaL_Buffer, ptr %7, i32 0, i32 1
  %8 = load i32, ptr %lvl3, align 8
  %9 = load i32, ptr %toget, align 4
  %sub4 = sub nsw i32 %8, %9
  %add5 = add nsw i32 %sub4, 1
  %cmp6 = icmp sge i32 %add5, 10
  br i1 %cmp6, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.body
  %10 = load i64, ptr %toplen, align 8
  %11 = load i64, ptr %l, align 8
  %cmp7 = icmp ugt i64 %10, %11
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %lor.lhs.false, %do.body
  %12 = load i64, ptr %l, align 8
  %13 = load i64, ptr %toplen, align 8
  %add9 = add i64 %13, %12
  store i64 %add9, ptr %toplen, align 8
  %14 = load i32, ptr %toget, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, ptr %toget, align 4
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  br label %do.end

if.end:                                           ; preds = %if.then8
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %15 = load i32, ptr %toget, align 4
  %16 = load ptr, ptr %B.addr, align 8
  %lvl10 = getelementptr inbounds %struct.luaL_Buffer, ptr %16, i32 0, i32 1
  %17 = load i32, ptr %lvl10, align 8
  %cmp11 = icmp slt i32 %15, %17
  br i1 %cmp11, label %do.body, label %do.end, !llvm.loop !17

do.end:                                           ; preds = %do.cond, %if.else
  %18 = load ptr, ptr %L, align 8
  %19 = load i32, ptr %toget, align 4
  call void @lua_concat(ptr noundef %18, i32 noundef %19)
  %20 = load ptr, ptr %B.addr, align 8
  %lvl12 = getelementptr inbounds %struct.luaL_Buffer, ptr %20, i32 0, i32 1
  %21 = load i32, ptr %lvl12, align 8
  %22 = load i32, ptr %toget, align 4
  %sub13 = sub nsw i32 %21, %22
  %add14 = add nsw i32 %sub13, 1
  %23 = load ptr, ptr %B.addr, align 8
  %lvl15 = getelementptr inbounds %struct.luaL_Buffer, ptr %23, i32 0, i32 1
  store i32 %add14, ptr %lvl15, align 8
  br label %if.end16

if.end16:                                         ; preds = %do.end, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_addvalue(ptr noundef %B) #0 {
entry:
  %B.addr = alloca ptr, align 8
  %L = alloca ptr, align 8
  %vl = alloca i64, align 8
  %s = alloca ptr, align 8
  store ptr %B, ptr %B.addr, align 8
  %0 = load ptr, ptr %B.addr, align 8
  %L1 = getelementptr inbounds %struct.luaL_Buffer, ptr %0, i32 0, i32 2
  %1 = load ptr, ptr %L1, align 8
  store ptr %1, ptr %L, align 8
  %2 = load ptr, ptr %L, align 8
  %call = call ptr @lua_tolstring(ptr noundef %2, i32 noundef -1, ptr noundef %vl)
  store ptr %call, ptr %s, align 8
  %3 = load i64, ptr %vl, align 8
  %4 = load ptr, ptr %B.addr, align 8
  %p = getelementptr inbounds %struct.luaL_Buffer, ptr %4, i32 0, i32 0
  %5 = load ptr, ptr %p, align 8
  %6 = load ptr, ptr %B.addr, align 8
  %buffer = getelementptr inbounds %struct.luaL_Buffer, ptr %6, i32 0, i32 3
  %arraydecay = getelementptr inbounds [1024 x i8], ptr %buffer, i64 0, i64 0
  %sub.ptr.lhs.cast = ptrtoint ptr %5 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %arraydecay to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub = sub nsw i64 1024, %sub.ptr.sub
  %cmp = icmp ule i64 %3, %sub
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %7 = load ptr, ptr %B.addr, align 8
  %p2 = getelementptr inbounds %struct.luaL_Buffer, ptr %7, i32 0, i32 0
  %8 = load ptr, ptr %p2, align 8
  %9 = load ptr, ptr %s, align 8
  %10 = load i64, ptr %vl, align 8
  %11 = load ptr, ptr %B.addr, align 8
  %p3 = getelementptr inbounds %struct.luaL_Buffer, ptr %11, i32 0, i32 0
  %12 = load ptr, ptr %p3, align 8
  %13 = call i64 @llvm.objectsize.i64.p0(ptr %12, i1 false, i1 true, i1 false)
  %call4 = call ptr @__memcpy_chk(ptr noundef %8, ptr noundef %9, i64 noundef %10, i64 noundef %13) #6
  %14 = load i64, ptr %vl, align 8
  %15 = load ptr, ptr %B.addr, align 8
  %p5 = getelementptr inbounds %struct.luaL_Buffer, ptr %15, i32 0, i32 0
  %16 = load ptr, ptr %p5, align 8
  %add.ptr = getelementptr inbounds i8, ptr %16, i64 %14
  store ptr %add.ptr, ptr %p5, align 8
  %17 = load ptr, ptr %L, align 8
  call void @lua_settop(ptr noundef %17, i32 noundef -2)
  br label %if.end8

if.else:                                          ; preds = %entry
  %18 = load ptr, ptr %B.addr, align 8
  %call6 = call i32 @emptybuffer(ptr noundef %18)
  %tobool = icmp ne i32 %call6, 0
  br i1 %tobool, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.else
  %19 = load ptr, ptr %L, align 8
  call void @lua_insert(ptr noundef %19, i32 noundef -2)
  br label %if.end

if.end:                                           ; preds = %if.then7, %if.else
  %20 = load ptr, ptr %B.addr, align 8
  %lvl = getelementptr inbounds %struct.luaL_Buffer, ptr %20, i32 0, i32 1
  %21 = load i32, ptr %lvl, align 8
  %inc = add nsw i32 %21, 1
  store i32 %inc, ptr %lvl, align 8
  %22 = load ptr, ptr %B.addr, align 8
  call void @adjuststack(ptr noundef %22)
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: nounwind
declare ptr @__memcpy_chk(ptr noundef, ptr noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.objectsize.i64.p0(ptr, i1 immarg, i1 immarg, i1 immarg) #4

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_ref(ptr noundef %L, i32 noundef %t) #0 {
entry:
  %retval = alloca i32, align 4
  %L.addr = alloca ptr, align 8
  %t.addr = alloca i32, align 4
  %ref = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %t.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, ptr %t.addr, align 4
  %cmp1 = icmp sle i32 %1, -10000
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %2 = load i32, ptr %t.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %3 = load ptr, ptr %L.addr, align 8
  %call = call i32 @lua_gettop(ptr noundef %3)
  %4 = load i32, ptr %t.addr, align 4
  %add = add nsw i32 %call, %4
  %add2 = add nsw i32 %add, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ %add2, %cond.false ]
  store i32 %cond, ptr %t.addr, align 4
  %5 = load ptr, ptr %L.addr, align 8
  %call3 = call i32 @lua_type(ptr noundef %5, i32 noundef -1)
  %cmp4 = icmp eq i32 %call3, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %6 = load ptr, ptr %L.addr, align 8
  call void @lua_settop(ptr noundef %6, i32 noundef -2)
  store i32 -1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %7 = load ptr, ptr %L.addr, align 8
  %8 = load i32, ptr %t.addr, align 4
  call void @lua_rawgeti(ptr noundef %7, i32 noundef %8, i32 noundef 0)
  %9 = load ptr, ptr %L.addr, align 8
  %call5 = call i64 @lua_tointeger(ptr noundef %9, i32 noundef -1)
  %conv = trunc i64 %call5 to i32
  store i32 %conv, ptr %ref, align 4
  %10 = load ptr, ptr %L.addr, align 8
  call void @lua_settop(ptr noundef %10, i32 noundef -2)
  %11 = load i32, ptr %ref, align 4
  %cmp6 = icmp ne i32 %11, 0
  br i1 %cmp6, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.end
  %12 = load ptr, ptr %L.addr, align 8
  %13 = load i32, ptr %t.addr, align 4
  %14 = load i32, ptr %ref, align 4
  call void @lua_rawgeti(ptr noundef %12, i32 noundef %13, i32 noundef %14)
  %15 = load ptr, ptr %L.addr, align 8
  %16 = load i32, ptr %t.addr, align 4
  call void @lua_rawseti(ptr noundef %15, i32 noundef %16, i32 noundef 0)
  br label %if.end11

if.else:                                          ; preds = %if.end
  %17 = load ptr, ptr %L.addr, align 8
  %18 = load i32, ptr %t.addr, align 4
  %call9 = call i64 @lua_objlen(ptr noundef %17, i32 noundef %18)
  %conv10 = trunc i64 %call9 to i32
  store i32 %conv10, ptr %ref, align 4
  %19 = load i32, ptr %ref, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, ptr %ref, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then8
  %20 = load ptr, ptr %L.addr, align 8
  %21 = load i32, ptr %t.addr, align 4
  %22 = load i32, ptr %ref, align 4
  call void @lua_rawseti(ptr noundef %20, i32 noundef %21, i32 noundef %22)
  %23 = load i32, ptr %ref, align 4
  store i32 %23, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end11, %if.then
  %24 = load i32, ptr %retval, align 4
  ret i32 %24
}

declare void @lua_rawgeti(ptr noundef, i32 noundef, i32 noundef) #1

declare void @lua_rawseti(ptr noundef, i32 noundef, i32 noundef) #1

declare i64 @lua_objlen(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @luaL_unref(ptr noundef %L, i32 noundef %t, i32 noundef %ref) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %t.addr = alloca i32, align 4
  %ref.addr = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store i32 %t, ptr %t.addr, align 4
  store i32 %ref, ptr %ref.addr, align 4
  %0 = load i32, ptr %ref.addr, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %t.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  br i1 %cmp1, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %2 = load i32, ptr %t.addr, align 4
  %cmp2 = icmp sle i32 %2, -10000
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %if.then
  %3 = load i32, ptr %t.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %4 = load ptr, ptr %L.addr, align 8
  %call = call i32 @lua_gettop(ptr noundef %4)
  %5 = load i32, ptr %t.addr, align 4
  %add = add nsw i32 %call, %5
  %add3 = add nsw i32 %add, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ %add3, %cond.false ]
  store i32 %cond, ptr %t.addr, align 4
  %6 = load ptr, ptr %L.addr, align 8
  %7 = load i32, ptr %t.addr, align 4
  call void @lua_rawgeti(ptr noundef %6, i32 noundef %7, i32 noundef 0)
  %8 = load ptr, ptr %L.addr, align 8
  %9 = load i32, ptr %t.addr, align 4
  %10 = load i32, ptr %ref.addr, align 4
  call void @lua_rawseti(ptr noundef %8, i32 noundef %9, i32 noundef %10)
  %11 = load ptr, ptr %L.addr, align 8
  %12 = load i32, ptr %ref.addr, align 4
  %conv = sext i32 %12 to i64
  call void @lua_pushinteger(ptr noundef %11, i64 noundef %conv)
  %13 = load ptr, ptr %L.addr, align 8
  %14 = load i32, ptr %t.addr, align 4
  call void @lua_rawseti(ptr noundef %13, i32 noundef %14, i32 noundef 0)
  br label %if.end

if.end:                                           ; preds = %cond.end, %entry
  ret void
}

declare void @lua_pushinteger(ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_loadfile(ptr noundef %L, ptr noundef %filename) #0 {
entry:
  %retval = alloca i32, align 4
  %L.addr = alloca ptr, align 8
  %filename.addr = alloca ptr, align 8
  %lf = alloca %struct.LoadF, align 8
  %status = alloca i32, align 4
  %readstatus = alloca i32, align 4
  %c = alloca i32, align 4
  %fnameindex = alloca i32, align 4
  store ptr %L, ptr %L.addr, align 8
  store ptr %filename, ptr %filename.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %call = call i32 @lua_gettop(ptr noundef %0)
  %add = add nsw i32 %call, 1
  store i32 %add, ptr %fnameindex, align 4
  %extraline = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 0
  store i32 0, ptr %extraline, align 8
  %1 = load ptr, ptr %filename.addr, align 8
  %cmp = icmp eq ptr %1, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %L.addr, align 8
  call void @lua_pushlstring(ptr noundef %2, ptr noundef @.str.15, i64 noundef 6)
  %3 = load ptr, ptr @__stdinp, align 8
  %f = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 1
  store ptr %3, ptr %f, align 8
  br label %if.end8

if.else:                                          ; preds = %entry
  %4 = load ptr, ptr %L.addr, align 8
  %5 = load ptr, ptr %filename.addr, align 8
  %call1 = call ptr (ptr, ptr, ...) @lua_pushfstring(ptr noundef %4, ptr noundef @.str.16, ptr noundef %5)
  %6 = load ptr, ptr %filename.addr, align 8
  %call2 = call ptr @"\01_fopen"(ptr noundef %6, ptr noundef @.str.17)
  %f3 = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 1
  store ptr %call2, ptr %f3, align 8
  %f4 = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 1
  %7 = load ptr, ptr %f4, align 8
  %cmp5 = icmp eq ptr %7, null
  br i1 %cmp5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.else
  %8 = load ptr, ptr %L.addr, align 8
  %9 = load i32, ptr %fnameindex, align 4
  %call7 = call i32 @errfile(ptr noundef %8, ptr noundef @.str.18, i32 noundef %9)
  store i32 %call7, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  %f9 = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 1
  %10 = load ptr, ptr %f9, align 8
  %call10 = call i32 @getc(ptr noundef %10)
  store i32 %call10, ptr %c, align 4
  %11 = load i32, ptr %c, align 4
  %cmp11 = icmp eq i32 %11, 35
  br i1 %cmp11, label %if.then12, label %if.end23

if.then12:                                        ; preds = %if.end8
  %extraline13 = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 0
  store i32 1, ptr %extraline13, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then12
  %f14 = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 1
  %12 = load ptr, ptr %f14, align 8
  %call15 = call i32 @getc(ptr noundef %12)
  store i32 %call15, ptr %c, align 4
  %cmp16 = icmp ne i32 %call15, -1
  br i1 %cmp16, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %13 = load i32, ptr %c, align 4
  %cmp17 = icmp ne i32 %13, 10
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %14 = phi i1 [ false, %while.cond ], [ %cmp17, %land.rhs ]
  br i1 %14, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  br label %while.cond, !llvm.loop !18

while.end:                                        ; preds = %land.end
  %15 = load i32, ptr %c, align 4
  %cmp18 = icmp eq i32 %15, 10
  br i1 %cmp18, label %if.then19, label %if.end22

if.then19:                                        ; preds = %while.end
  %f20 = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 1
  %16 = load ptr, ptr %f20, align 8
  %call21 = call i32 @getc(ptr noundef %16)
  store i32 %call21, ptr %c, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then19, %while.end
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.end8
  %17 = load i32, ptr %c, align 4
  %18 = load i8, ptr @.str.19, align 1
  %conv = sext i8 %18 to i32
  %cmp24 = icmp eq i32 %17, %conv
  br i1 %cmp24, label %land.lhs.true, label %if.end49

land.lhs.true:                                    ; preds = %if.end23
  %19 = load ptr, ptr %filename.addr, align 8
  %tobool = icmp ne ptr %19, null
  br i1 %tobool, label %if.then26, label %if.end49

if.then26:                                        ; preds = %land.lhs.true
  %20 = load ptr, ptr %filename.addr, align 8
  %f27 = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 1
  %21 = load ptr, ptr %f27, align 8
  %call28 = call ptr @"\01_freopen"(ptr noundef %20, ptr noundef @.str.20, ptr noundef %21)
  %f29 = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 1
  store ptr %call28, ptr %f29, align 8
  %f30 = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 1
  %22 = load ptr, ptr %f30, align 8
  %cmp31 = icmp eq ptr %22, null
  br i1 %cmp31, label %if.then33, label %if.end35

if.then33:                                        ; preds = %if.then26
  %23 = load ptr, ptr %L.addr, align 8
  %24 = load i32, ptr %fnameindex, align 4
  %call34 = call i32 @errfile(ptr noundef %23, ptr noundef @.str.21, i32 noundef %24)
  store i32 %call34, ptr %retval, align 4
  br label %return

if.end35:                                         ; preds = %if.then26
  br label %while.cond36

while.cond36:                                     ; preds = %while.body46, %if.end35
  %f37 = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 1
  %25 = load ptr, ptr %f37, align 8
  %call38 = call i32 @getc(ptr noundef %25)
  store i32 %call38, ptr %c, align 4
  %cmp39 = icmp ne i32 %call38, -1
  br i1 %cmp39, label %land.rhs41, label %land.end45

land.rhs41:                                       ; preds = %while.cond36
  %26 = load i32, ptr %c, align 4
  %27 = load i8, ptr @.str.19, align 1
  %conv42 = sext i8 %27 to i32
  %cmp43 = icmp ne i32 %26, %conv42
  br label %land.end45

land.end45:                                       ; preds = %land.rhs41, %while.cond36
  %28 = phi i1 [ false, %while.cond36 ], [ %cmp43, %land.rhs41 ]
  br i1 %28, label %while.body46, label %while.end47

while.body46:                                     ; preds = %land.end45
  br label %while.cond36, !llvm.loop !19

while.end47:                                      ; preds = %land.end45
  %extraline48 = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 0
  store i32 0, ptr %extraline48, align 8
  br label %if.end49

if.end49:                                         ; preds = %while.end47, %land.lhs.true, %if.end23
  %29 = load i32, ptr %c, align 4
  %f50 = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 1
  %30 = load ptr, ptr %f50, align 8
  %call51 = call i32 @ungetc(i32 noundef %29, ptr noundef %30)
  %31 = load ptr, ptr %L.addr, align 8
  %32 = load ptr, ptr %L.addr, align 8
  %call52 = call ptr @lua_tolstring(ptr noundef %32, i32 noundef -1, ptr noundef null)
  %call53 = call i32 @lua_load(ptr noundef %31, ptr noundef @getF, ptr noundef %lf, ptr noundef %call52)
  store i32 %call53, ptr %status, align 4
  %f54 = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 1
  %33 = load ptr, ptr %f54, align 8
  %call55 = call i32 @ferror(ptr noundef %33)
  store i32 %call55, ptr %readstatus, align 4
  %34 = load ptr, ptr %filename.addr, align 8
  %tobool56 = icmp ne ptr %34, null
  br i1 %tobool56, label %if.then57, label %if.end60

if.then57:                                        ; preds = %if.end49
  %f58 = getelementptr inbounds %struct.LoadF, ptr %lf, i32 0, i32 1
  %35 = load ptr, ptr %f58, align 8
  %call59 = call i32 @fclose(ptr noundef %35)
  br label %if.end60

if.end60:                                         ; preds = %if.then57, %if.end49
  %36 = load i32, ptr %readstatus, align 4
  %tobool61 = icmp ne i32 %36, 0
  br i1 %tobool61, label %if.then62, label %if.end64

if.then62:                                        ; preds = %if.end60
  %37 = load ptr, ptr %L.addr, align 8
  %38 = load i32, ptr %fnameindex, align 4
  call void @lua_settop(ptr noundef %37, i32 noundef %38)
  %39 = load ptr, ptr %L.addr, align 8
  %40 = load i32, ptr %fnameindex, align 4
  %call63 = call i32 @errfile(ptr noundef %39, ptr noundef @.str.22, i32 noundef %40)
  store i32 %call63, ptr %retval, align 4
  br label %return

if.end64:                                         ; preds = %if.end60
  %41 = load ptr, ptr %L.addr, align 8
  %42 = load i32, ptr %fnameindex, align 4
  call void @lua_remove(ptr noundef %41, i32 noundef %42)
  %43 = load i32, ptr %status, align 4
  store i32 %43, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end64, %if.then62, %if.then33, %if.then6
  %44 = load i32, ptr %retval, align 4
  ret i32 %44
}

declare ptr @"\01_fopen"(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @errfile(ptr noundef %L, ptr noundef %what, i32 noundef %fnameindex) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %what.addr = alloca ptr, align 8
  %fnameindex.addr = alloca i32, align 4
  %serr = alloca ptr, align 8
  %filename = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %what, ptr %what.addr, align 8
  store i32 %fnameindex, ptr %fnameindex.addr, align 4
  %call = call ptr @__error()
  %0 = load i32, ptr %call, align 4
  %call1 = call ptr @"\01_strerror"(i32 noundef %0)
  store ptr %call1, ptr %serr, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load i32, ptr %fnameindex.addr, align 4
  %call2 = call ptr @lua_tolstring(ptr noundef %1, i32 noundef %2, ptr noundef null)
  %add.ptr = getelementptr inbounds i8, ptr %call2, i64 1
  store ptr %add.ptr, ptr %filename, align 8
  %3 = load ptr, ptr %L.addr, align 8
  %4 = load ptr, ptr %what.addr, align 8
  %5 = load ptr, ptr %filename, align 8
  %6 = load ptr, ptr %serr, align 8
  %call3 = call ptr (ptr, ptr, ...) @lua_pushfstring(ptr noundef %3, ptr noundef @.str.23, ptr noundef %4, ptr noundef %5, ptr noundef %6)
  %7 = load ptr, ptr %L.addr, align 8
  %8 = load i32, ptr %fnameindex.addr, align 4
  call void @lua_remove(ptr noundef %7, i32 noundef %8)
  ret i32 6
}

declare i32 @getc(ptr noundef) #1

declare ptr @"\01_freopen"(ptr noundef, ptr noundef, ptr noundef) #1

declare i32 @ungetc(i32 noundef, ptr noundef) #1

declare i32 @lua_load(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @getF(ptr noundef %L, ptr noundef %ud, ptr noundef %size) #0 {
entry:
  %retval = alloca ptr, align 8
  %L.addr = alloca ptr, align 8
  %ud.addr = alloca ptr, align 8
  %size.addr = alloca ptr, align 8
  %lf = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %ud, ptr %ud.addr, align 8
  store ptr %size, ptr %size.addr, align 8
  %0 = load ptr, ptr %ud.addr, align 8
  store ptr %0, ptr %lf, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load ptr, ptr %lf, align 8
  %extraline = getelementptr inbounds %struct.LoadF, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %extraline, align 8
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %lf, align 8
  %extraline1 = getelementptr inbounds %struct.LoadF, ptr %4, i32 0, i32 0
  store i32 0, ptr %extraline1, align 8
  %5 = load ptr, ptr %size.addr, align 8
  store i64 1, ptr %5, align 8
  store ptr @.str.24, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %6 = load ptr, ptr %lf, align 8
  %f = getelementptr inbounds %struct.LoadF, ptr %6, i32 0, i32 1
  %7 = load ptr, ptr %f, align 8
  %call = call i32 @feof(ptr noundef %7)
  %tobool2 = icmp ne i32 %call, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store ptr null, ptr %retval, align 8
  br label %return

if.end4:                                          ; preds = %if.end
  %8 = load ptr, ptr %lf, align 8
  %buff = getelementptr inbounds %struct.LoadF, ptr %8, i32 0, i32 2
  %arraydecay = getelementptr inbounds [1024 x i8], ptr %buff, i64 0, i64 0
  %9 = load ptr, ptr %lf, align 8
  %f5 = getelementptr inbounds %struct.LoadF, ptr %9, i32 0, i32 1
  %10 = load ptr, ptr %f5, align 8
  %call6 = call i64 @fread(ptr noundef %arraydecay, i64 noundef 1, i64 noundef 1024, ptr noundef %10)
  %11 = load ptr, ptr %size.addr, align 8
  store i64 %call6, ptr %11, align 8
  %12 = load ptr, ptr %size.addr, align 8
  %13 = load i64, ptr %12, align 8
  %cmp = icmp ugt i64 %13, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end4
  %14 = load ptr, ptr %lf, align 8
  %buff7 = getelementptr inbounds %struct.LoadF, ptr %14, i32 0, i32 2
  %arraydecay8 = getelementptr inbounds [1024 x i8], ptr %buff7, i64 0, i64 0
  br label %cond.end

cond.false:                                       ; preds = %if.end4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi ptr [ %arraydecay8, %cond.true ], [ null, %cond.false ]
  store ptr %cond, ptr %retval, align 8
  br label %return

return:                                           ; preds = %cond.end, %if.then3, %if.then
  %15 = load ptr, ptr %retval, align 8
  ret ptr %15
}

declare i32 @ferror(ptr noundef) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_loadbuffer(ptr noundef %L, ptr noundef %buff, i64 noundef %size, ptr noundef %name) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %buff.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %name.addr = alloca ptr, align 8
  %ls = alloca %struct.LoadS, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %buff, ptr %buff.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  store ptr %name, ptr %name.addr, align 8
  %0 = load ptr, ptr %buff.addr, align 8
  %s = getelementptr inbounds %struct.LoadS, ptr %ls, i32 0, i32 0
  store ptr %0, ptr %s, align 8
  %1 = load i64, ptr %size.addr, align 8
  %size1 = getelementptr inbounds %struct.LoadS, ptr %ls, i32 0, i32 1
  store i64 %1, ptr %size1, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %3 = load ptr, ptr %name.addr, align 8
  %call = call i32 @lua_load(ptr noundef %2, ptr noundef @getS, ptr noundef %ls, ptr noundef %3)
  ret i32 %call
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @getS(ptr noundef %L, ptr noundef %ud, ptr noundef %size) #0 {
entry:
  %retval = alloca ptr, align 8
  %L.addr = alloca ptr, align 8
  %ud.addr = alloca ptr, align 8
  %size.addr = alloca ptr, align 8
  %ls = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %ud, ptr %ud.addr, align 8
  store ptr %size, ptr %size.addr, align 8
  %0 = load ptr, ptr %ud.addr, align 8
  store ptr %0, ptr %ls, align 8
  %1 = load ptr, ptr %L.addr, align 8
  %2 = load ptr, ptr %ls, align 8
  %size1 = getelementptr inbounds %struct.LoadS, ptr %2, i32 0, i32 1
  %3 = load i64, ptr %size1, align 8
  %cmp = icmp eq i64 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %4 = load ptr, ptr %ls, align 8
  %size2 = getelementptr inbounds %struct.LoadS, ptr %4, i32 0, i32 1
  %5 = load i64, ptr %size2, align 8
  %6 = load ptr, ptr %size.addr, align 8
  store i64 %5, ptr %6, align 8
  %7 = load ptr, ptr %ls, align 8
  %size3 = getelementptr inbounds %struct.LoadS, ptr %7, i32 0, i32 1
  store i64 0, ptr %size3, align 8
  %8 = load ptr, ptr %ls, align 8
  %s = getelementptr inbounds %struct.LoadS, ptr %8, i32 0, i32 0
  %9 = load ptr, ptr %s, align 8
  store ptr %9, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %10 = load ptr, ptr %retval, align 8
  ret ptr %10
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @luaL_loadstring(ptr noundef %L, ptr noundef %s) #0 {
entry:
  %L.addr = alloca ptr, align 8
  %s.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  store ptr %s, ptr %s.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr %s.addr, align 8
  %2 = load ptr, ptr %s.addr, align 8
  %call = call i64 @strlen(ptr noundef %2)
  %3 = load ptr, ptr %s.addr, align 8
  %call1 = call i32 @luaL_loadbuffer(ptr noundef %0, ptr noundef %1, i64 noundef %call, ptr noundef %3)
  ret i32 %call1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @luaL_newstate() #0 {
entry:
  %L = alloca ptr, align 8
  %call = call ptr @lua_newstate(ptr noundef @l_alloc, ptr noundef null)
  store ptr %call, ptr %L, align 8
  %0 = load ptr, ptr %L, align 8
  %1 = load ptr, ptr %L, align 8
  call void @lua_setallocf(ptr noundef %0, ptr noundef @l_alloc, ptr noundef %1)
  %2 = load ptr, ptr %L, align 8
  %tobool = icmp ne ptr %2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load ptr, ptr %L, align 8
  %call1 = call ptr @lua_atpanic(ptr noundef %3, ptr noundef @panic)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load ptr, ptr %L, align 8
  ret ptr %4
}

declare ptr @lua_newstate(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal ptr @l_alloc(ptr noundef %ud, ptr noundef %ptr, i64 noundef %osize, i64 noundef %nsize) #0 {
entry:
  %retval = alloca ptr, align 8
  %ud.addr = alloca ptr, align 8
  %ptr.addr = alloca ptr, align 8
  %osize.addr = alloca i64, align 8
  %nsize.addr = alloca i64, align 8
  %L = alloca ptr, align 8
  %nptr = alloca ptr, align 8
  store ptr %ud, ptr %ud.addr, align 8
  store ptr %ptr, ptr %ptr.addr, align 8
  store i64 %osize, ptr %osize.addr, align 8
  store i64 %nsize, ptr %nsize.addr, align 8
  %0 = load ptr, ptr %ud.addr, align 8
  store ptr %0, ptr %L, align 8
  %1 = load i64, ptr %nsize.addr, align 8
  %cmp = icmp eq i64 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %ptr.addr, align 8
  call void @free(ptr noundef %2)
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i64, ptr %nsize.addr, align 8
  %4 = load i64, ptr %osize.addr, align 8
  %cmp1 = icmp ugt i64 %3, %4
  br i1 %cmp1, label %land.lhs.true, label %if.end8

land.lhs.true:                                    ; preds = %if.end
  %5 = load ptr, ptr %L, align 8
  %cmp2 = icmp ne ptr %5, null
  br i1 %cmp2, label %if.then3, label %if.end8

if.then3:                                         ; preds = %land.lhs.true
  %6 = load ptr, ptr %L, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %6, i32 0, i32 6
  %7 = load ptr, ptr %l_G, align 8
  %memlimit = getelementptr inbounds %struct.global_State, ptr %7, i32 0, i32 16
  %8 = load i64, ptr %memlimit, align 8
  %cmp4 = icmp ugt i64 %8, 0
  br i1 %cmp4, label %land.lhs.true5, label %if.end7

land.lhs.true5:                                   ; preds = %if.then3
  %9 = load ptr, ptr %L, align 8
  %10 = load i64, ptr %nsize.addr, align 8
  %11 = load i64, ptr %osize.addr, align 8
  %sub = sub i64 %10, %11
  %call = call i32 @l_check_memlimit(ptr noundef %9, i64 noundef %sub)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then6, label %if.end7

if.then6:                                         ; preds = %land.lhs.true5
  store ptr null, ptr %retval, align 8
  br label %return

if.end7:                                          ; preds = %land.lhs.true5, %if.then3
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %land.lhs.true, %if.end
  %12 = load ptr, ptr %ptr.addr, align 8
  %13 = load i64, ptr %nsize.addr, align 8
  %call9 = call ptr @realloc(ptr noundef %12, i64 noundef %13) #7
  store ptr %call9, ptr %nptr, align 8
  %14 = load ptr, ptr %nptr, align 8
  %cmp10 = icmp eq ptr %14, null
  br i1 %cmp10, label %land.lhs.true11, label %if.end15

land.lhs.true11:                                  ; preds = %if.end8
  %15 = load ptr, ptr %L, align 8
  %cmp12 = icmp ne ptr %15, null
  br i1 %cmp12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %land.lhs.true11
  %16 = load ptr, ptr %L, align 8
  call void @luaC_fullgc(ptr noundef %16)
  %17 = load ptr, ptr %ptr.addr, align 8
  %18 = load i64, ptr %nsize.addr, align 8
  %call14 = call ptr @realloc(ptr noundef %17, i64 noundef %18) #7
  store ptr %call14, ptr %nptr, align 8
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %land.lhs.true11, %if.end8
  %19 = load ptr, ptr %nptr, align 8
  store ptr %19, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end15, %if.then6, %if.then
  %20 = load ptr, ptr %retval, align 8
  ret ptr %20
}

declare void @lua_setallocf(ptr noundef, ptr noundef, ptr noundef) #1

declare ptr @lua_atpanic(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @panic(ptr noundef %L) #0 {
entry:
  %L.addr = alloca ptr, align 8
  store ptr %L, ptr %L.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %1 = load ptr, ptr @__stderrp, align 8
  %2 = load ptr, ptr %L.addr, align 8
  %call = call ptr @lua_tolstring(ptr noundef %2, i32 noundef -1, ptr noundef null)
  %call1 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.25, ptr noundef %call)
  ret i32 0
}

declare ptr @"\01_strerror"(i32 noundef) #1

declare ptr @__error() #1

declare i32 @feof(ptr noundef) #1

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

declare void @free(ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define internal i32 @l_check_memlimit(ptr noundef %L, i64 noundef %needbytes) #0 {
entry:
  %retval = alloca i32, align 4
  %L.addr = alloca ptr, align 8
  %needbytes.addr = alloca i64, align 8
  %g = alloca ptr, align 8
  %cycle_count = alloca i32, align 4
  %limit = alloca i64, align 8
  store ptr %L, ptr %L.addr, align 8
  store i64 %needbytes, ptr %needbytes.addr, align 8
  %0 = load ptr, ptr %L.addr, align 8
  %l_G = getelementptr inbounds %struct.lua_State, ptr %0, i32 0, i32 6
  %1 = load ptr, ptr %l_G, align 8
  store ptr %1, ptr %g, align 8
  store i32 0, ptr %cycle_count, align 4
  %2 = load ptr, ptr %g, align 8
  %memlimit = getelementptr inbounds %struct.global_State, ptr %2, i32 0, i32 16
  %3 = load i64, ptr %memlimit, align 8
  %4 = load i64, ptr %needbytes.addr, align 8
  %sub = sub i64 %3, %4
  store i64 %sub, ptr %limit, align 8
  %5 = load i64, ptr %needbytes.addr, align 8
  %6 = load ptr, ptr %g, align 8
  %memlimit1 = getelementptr inbounds %struct.global_State, ptr %6, i32 0, i32 16
  %7 = load i64, ptr %memlimit1, align 8
  %cmp = icmp ugt i64 %5, %7
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %8 = load ptr, ptr %L.addr, align 8
  %l_G2 = getelementptr inbounds %struct.lua_State, ptr %8, i32 0, i32 6
  %9 = load ptr, ptr %l_G2, align 8
  %gcflags = getelementptr inbounds %struct.global_State, ptr %9, i32 0, i32 5
  %10 = load i8, ptr %gcflags, align 2
  %conv = zext i8 %10 to i32
  %and = and i32 %conv, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.end13, label %if.then3

if.then3:                                         ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end12, %if.then3
  %11 = load ptr, ptr %g, align 8
  %totalbytes = getelementptr inbounds %struct.global_State, ptr %11, i32 0, i32 15
  %12 = load i64, ptr %totalbytes, align 8
  %13 = load i64, ptr %limit, align 8
  %cmp4 = icmp uge i64 %12, %13
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %14 = load ptr, ptr %g, align 8
  %gcstate = getelementptr inbounds %struct.global_State, ptr %14, i32 0, i32 4
  %15 = load i8, ptr %gcstate, align 1
  %conv6 = zext i8 %15 to i32
  %cmp7 = icmp eq i32 %conv6, 0
  br i1 %cmp7, label %land.lhs.true, label %if.end12

land.lhs.true:                                    ; preds = %while.body
  %16 = load i32, ptr %cycle_count, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, ptr %cycle_count, align 4
  %cmp9 = icmp sgt i32 %inc, 1
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %land.lhs.true
  br label %while.end

if.end12:                                         ; preds = %land.lhs.true, %while.body
  %17 = load ptr, ptr %L.addr, align 8
  call void @luaC_step(ptr noundef %17)
  br label %while.cond, !llvm.loop !20

while.end:                                        ; preds = %if.then11, %while.cond
  br label %if.end13

if.end13:                                         ; preds = %while.end, %if.end
  %18 = load ptr, ptr %g, align 8
  %totalbytes14 = getelementptr inbounds %struct.global_State, ptr %18, i32 0, i32 15
  %19 = load i64, ptr %totalbytes14, align 8
  %20 = load i64, ptr %limit, align 8
  %cmp15 = icmp uge i64 %19, %20
  %21 = zext i1 %cmp15 to i64
  %cond = select i1 %cmp15, i32 1, i32 0
  store i32 %cond, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end13, %if.then
  %22 = load i32, ptr %retval, align 4
  ret i32 %22
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
!5 = !{!"clang version 17.0.6 (https://github.com/llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)"}
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
