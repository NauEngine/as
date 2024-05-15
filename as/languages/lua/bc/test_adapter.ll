; ModuleID = '/Users/alexzelenshikov/Work/NAU_ENGINE/as_proto/cmake-build-debug_withdebugllvm/as/languages/lua/test_adapter.bc'
source_filename = "test_adapter.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@.str = private unnamed_addr constant [7 x i8] c"Logger\00", align 1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define noundef i32 @_Z6warn_AP9lua_State(ptr noundef %state) #0 {
entry:
  %state.addr = alloca ptr, align 8
  %obj = alloca ptr, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store ptr %state, ptr %state.addr, align 8
  %0 = load ptr, ptr %state.addr, align 8
  %call = call ptr @luaL_checkudata(ptr noundef %0, i32 noundef 1, ptr noundef @.str)
  %1 = load ptr, ptr %call, align 8
  store ptr %1, ptr %obj, align 8
  %2 = load ptr, ptr %state.addr, align 8
  %call1 = call i64 @luaL_checkinteger(ptr noundef %2, i32 noundef 2)
  %conv = trunc i64 %call1 to i32
  store i32 %conv, ptr %a, align 4
  %3 = load ptr, ptr %state.addr, align 8
  %call2 = call i64 @luaL_checkinteger(ptr noundef %3, i32 noundef 3)
  %conv3 = trunc i64 %call2 to i32
  store i32 %conv3, ptr %b, align 4
  %4 = load ptr, ptr %obj, align 8
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %b, align 4
  %vtable = load ptr, ptr %4, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 0
  %7 = load ptr, ptr %vfn, align 8
  call void %7(ptr noundef nonnull align 8 dereferenceable(8) %4, i32 noundef %5, i32 noundef %6)
  ret i32 0
}

declare ptr @luaL_checkudata(ptr noundef, i32 noundef, ptr noundef) #1

declare i64 @luaL_checkinteger(ptr noundef, i32 noundef) #1

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
