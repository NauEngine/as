; ModuleID = '/Users/alexzelenshikov/Work/NAU_ENGINE/as_proto/cmake-build-debug_withdebugllvm/as/languages/lua/test_adapter.bc'
source_filename = "test_adapter.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@lua_state = global ptr null, align 8
@.str = private unnamed_addr constant [5 x i8] c"test\00", align 1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i32 @adapter(i32 noundef %a, double noundef %b) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca double, align 8
  store i32 %a, ptr %a.addr, align 4
  store double %b, ptr %b.addr, align 8
  %0 = load ptr, ptr @lua_state, align 8
  %1 = load i32, ptr %a.addr, align 4
  %conv = sext i32 %1 to i64
  call void @lua_pushinteger(ptr noundef %0, i64 noundef %conv)
  %2 = load ptr, ptr @lua_state, align 8
  %3 = load double, ptr %b.addr, align 8
  call void @lua_pushnumber(ptr noundef %2, double noundef %3)
  %4 = load ptr, ptr @lua_state, align 8
  call void @lua_call(ptr noundef %4, i32 noundef 1, i32 noundef 1)
  %5 = load ptr, ptr @lua_state, align 8
  %call = call i64 @lua_tointeger(ptr noundef %5, i32 noundef -1)
  %conv1 = trunc i64 %call to i32
  ret i32 %conv1
}

declare void @lua_pushinteger(ptr noundef, i64 noundef) #1

declare void @lua_pushnumber(ptr noundef, double noundef) #1

declare void @lua_call(ptr noundef, i32 noundef, i32 noundef) #1

declare i64 @lua_tointeger(ptr noundef, i32 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @_Z6call_iP6Logger(ptr noundef %logger) #0 {
entry:
  %logger.addr = alloca ptr, align 8
  store ptr %logger, ptr %logger.addr, align 8
  %0 = load ptr, ptr %logger.addr, align 8
  %vtable = load ptr, ptr %0, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 0
  %1 = load ptr, ptr %vfn, align 8
  call void %1(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef @.str)
  ret void
}

attributes #0 = { mustprogress noinline optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 14, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"clang version 17.0.6 (https://github.com/llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)"}
