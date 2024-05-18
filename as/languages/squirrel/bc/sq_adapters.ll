; ModuleID = '/Users/alexzelenshikov/Work/NAU_ENGINE/as_proto/cmake-build-debug/as/languages/squirrel/sq_adapters.bc'
source_filename = "sq_adapters.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

%struct.tagSQObject = type { i32, %union.tagSQObjectValue }
%union.tagSQObjectValue = type { ptr }

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushobject_apapter(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.tagSQObject, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %4, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %7, i64 16, i1 false)
  %8 = load [2 x i64], ptr %5, align 8
  call void @sq_pushobject(ptr noundef %6, [2 x i64] %8)
  ret void
}

declare void @sq_pushobject(ptr noundef, [2 x i64]) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define noundef i64 @_Z8call_fooP4SQVMP11tagSQObjectid(ptr noundef %0, ptr noundef %1, i32 noundef %2, double noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  %9 = alloca %struct.tagSQObject, align 8
  %10 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store double %3, ptr %8, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = load ptr, ptr %6, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %12, i64 16, i1 false)
  %13 = load [2 x i64], ptr %9, align 8
  call void @sq_pushobject(ptr noundef %11, [2 x i64] %13)
  %14 = load ptr, ptr %5, align 8
  call void @sq_pushroottable(ptr noundef %14)
  %15 = load ptr, ptr %5, align 8
  %16 = load i32, ptr %7, align 4
  %17 = sext i32 %16 to i64
  call void @sq_pushinteger(ptr noundef %15, i64 noundef %17)
  %18 = load ptr, ptr %5, align 8
  %19 = load double, ptr %8, align 8
  %20 = fptrunc double %19 to float
  call void @sq_pushfloat(ptr noundef %18, float noundef %20)
  %21 = load ptr, ptr %5, align 8
  %22 = call i64 @sq_call(ptr noundef %21, i64 noundef 3, i64 noundef 1, i64 noundef 1)
  %23 = load ptr, ptr %5, align 8
  %24 = call i64 @sq_getinteger(ptr noundef %23, i64 noundef -1, ptr noundef %10)
  %25 = load i64, ptr %10, align 8
  ret i64 %25
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
!5 = !{!"Homebrew clang version 17.0.2"}
