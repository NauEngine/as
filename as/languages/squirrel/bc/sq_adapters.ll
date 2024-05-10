; ModuleID = '/Users/alexzelenshikov/Work/NAU_ENGINE/as_proto/cmake-build-debug_withdebugllvm/as/languages/squirrel/sq_adapters.bc'
source_filename = "sq_adapters.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

%struct.tagSQObject = type { i32, %union.tagSQObjectValue }
%union.tagSQObjectValue = type { ptr }

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushobject_apapter(ptr noundef %sq_vm, ptr noundef %func) #0 {
entry:
  %sq_vm.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %agg.tmp = alloca %struct.tagSQObject, align 8
  store ptr %sq_vm, ptr %sq_vm.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  %0 = load ptr, ptr %sq_vm.addr, align 8
  %1 = load ptr, ptr %func.addr, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %agg.tmp, ptr align 8 %1, i64 16, i1 false)
  %2 = load [2 x i64], ptr %agg.tmp, align 8
  call void @sq_pushobject(ptr noundef %0, [2 x i64] %2)
  ret void
}

declare void @sq_pushobject(ptr noundef, [2 x i64]) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define noundef i64 @_Z8call_fooP4SQVMP11tagSQObjectid(ptr noundef %sq_vm, ptr noundef %func, i32 noundef %a, double noundef %b) #0 {
entry:
  %sq_vm.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %a.addr = alloca i32, align 4
  %b.addr = alloca double, align 8
  %agg.tmp = alloca %struct.tagSQObject, align 8
  %result = alloca i64, align 8
  store ptr %sq_vm, ptr %sq_vm.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  store i32 %a, ptr %a.addr, align 4
  store double %b, ptr %b.addr, align 8
  %0 = load ptr, ptr %sq_vm.addr, align 8
  %1 = load ptr, ptr %func.addr, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %agg.tmp, ptr align 8 %1, i64 16, i1 false)
  %2 = load [2 x i64], ptr %agg.tmp, align 8
  call void @sq_pushobject(ptr noundef %0, [2 x i64] %2)
  %3 = load ptr, ptr %sq_vm.addr, align 8
  call void @sq_pushroottable(ptr noundef %3)
  %4 = load ptr, ptr %sq_vm.addr, align 8
  %5 = load i32, ptr %a.addr, align 4
  %conv = sext i32 %5 to i64
  call void @sq_pushinteger(ptr noundef %4, i64 noundef %conv)
  %6 = load ptr, ptr %sq_vm.addr, align 8
  %7 = load double, ptr %b.addr, align 8
  %conv1 = fptrunc double %7 to float
  call void @sq_pushfloat(ptr noundef %6, float noundef %conv1)
  %8 = load ptr, ptr %sq_vm.addr, align 8
  %call = call i64 @sq_call(ptr noundef %8, i64 noundef 3, i64 noundef 1, i64 noundef 1)
  %9 = load ptr, ptr %sq_vm.addr, align 8
  %call2 = call i64 @sq_getinteger(ptr noundef %9, i64 noundef -1, ptr noundef %result)
  %10 = load i64, ptr %result, align 8
  ret i64 %10
}

declare void @sq_pushroottable(ptr noundef) #1

declare void @sq_pushinteger(ptr noundef, i64 noundef) #1

declare void @sq_pushfloat(ptr noundef, float noundef) #1

declare i64 @sq_call(ptr noundef, i64 noundef, i64 noundef, i64 noundef) #1

declare i64 @sq_getinteger(ptr noundef, i64 noundef, ptr noundef) #1

attributes #0 = { mustprogress noinline optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 14, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"clang version 17.0.6 (https://github.com/llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)"}
