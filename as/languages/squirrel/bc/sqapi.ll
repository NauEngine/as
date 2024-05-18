; ModuleID = '/Users/alexzelenshikov/Work/NAU_ENGINE/as_proto/cmake-build-debug/as/languages/squirrel/sqapi.bc'
source_filename = "squirrel/squirrel/sqapi.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

%struct.SQVM = type { %struct.SQCollectable, %class.sqvector, i64, i64, ptr, %struct.SQObjectPtr, %struct.SQObjectPtr, %struct.SQObjectPtr, i8, ptr, %struct.SQObjectPtr, %struct.SQObjectPtr, ptr, i64, i64, %class.sqvector.0, %class.sqvector.1, ptr, ptr, ptr, i64, i64, ptr, i64, i64, i64, i64 }
%struct.SQCollectable = type { %struct.SQRefCounted, ptr, ptr, ptr }
%struct.SQRefCounted = type { ptr, i64, ptr }
%class.sqvector = type { ptr, i64, i64 }
%struct.SQObjectPtr = type { %struct.tagSQObject }
%struct.tagSQObject = type { i32, %union.tagSQObjectValue }
%union.tagSQObjectValue = type { ptr }
%class.sqvector.0 = type { ptr, i64, i64 }
%class.sqvector.1 = type { ptr, i64, i64 }
%struct.SQSharedState = type { ptr, %struct.SQObjectPtr, ptr, ptr, ptr, %struct.RefTable, %struct.SQObjectPtr, %struct.SQObjectPtr, %struct.SQObjectPtr, ptr, %struct.SQObjectPtr, %struct.SQObjectPtr, %struct.SQObjectPtr, %struct.SQObjectPtr, %struct.SQObjectPtr, %struct.SQObjectPtr, %struct.SQObjectPtr, %struct.SQObjectPtr, %struct.SQObjectPtr, %struct.SQObjectPtr, %struct.SQObjectPtr, ptr, ptr, ptr, i8, i8, ptr, ptr, ptr, i64 }
%struct.RefTable = type { i64, i64, ptr, ptr, ptr }
%struct.SQFunctionProto = type { %struct.SQCollectable, %struct.SQObjectPtr, %struct.SQObjectPtr, i64, i8, i64, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i64, ptr, i64, [1 x %struct.SQInstruction] }
%struct.SQInstruction = type { i32, i8, i8, i8, i8 }
%struct.SQClosure = type { %struct.SQCollectable, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.SQString = type <{ %struct.SQRefCounted, ptr, ptr, i64, i64, [1 x i8], [7 x i8] }>
%struct.SQUserData = type { %struct.SQDelegable, i64, ptr, ptr }
%struct.SQDelegable = type { %struct.SQCollectable, ptr }
%struct.SQArray = type { %struct.SQCollectable, %class.sqvector }
%struct.SQNativeClosure = type { %struct.SQCollectable, i64, %class.sqvector.2, ptr, i64, ptr, ptr, %struct.SQObjectPtr }
%class.sqvector.2 = type { ptr, i64, i64 }
%struct.SQWeakRef = type { %struct.SQRefCounted, %struct.tagSQObject }
%struct.SQInstance = type { %struct.SQDelegable, ptr, ptr, ptr, i64, [1 x %struct.SQObjectPtr] }
%struct.SQClass = type { %struct.SQCollectable, ptr, ptr, %class.sqvector.3, %class.sqvector.3, [18 x %struct.SQObjectPtr], %struct.SQObjectPtr, ptr, ptr, i8, i64, i64 }
%class.sqvector.3 = type { ptr, i64, i64 }
%struct.SQTable = type { %struct.SQDelegable, ptr, ptr, i64, i64 }
%struct.SQClassMember = type { %struct.SQObjectPtr, %struct.SQObjectPtr }
%"struct.SQVM::CallInfo" = type { ptr, ptr, %struct.SQObjectPtr, ptr, i32, i32, i32, i32, i32, i64 }
%struct.SQOuter = type { %struct.SQCollectable, ptr, i64, %struct.SQObjectPtr, ptr }
%struct.SQOuterVar = type { i32, %struct.SQObjectPtr, %struct.SQObjectPtr }
%struct.tagSQMemberHandle = type { i64, i64 }
%struct.BufState = type { ptr, i64, i64 }

@.str = private unnamed_addr constant [19 x i8] c"unexpected type %s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"invalid base type\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"invalid param type\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"not enough params in the stack\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"empty array\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"negative size\00", align 1
@.str.6 = private unnamed_addr constant [19 x i8] c"index out of range\00", align 1
@.str.7 = private unnamed_addr constant [28 x i8] c"the object is not a closure\00", align 1
@.str.8 = private unnamed_addr constant [34 x i8] c"the object is not a nativeclosure\00", align 1
@.str.9 = private unnamed_addr constant [24 x i8] c"native closure expected\00", align 1
@.str.10 = private unnamed_addr constant [17 x i8] c"invalid typemask\00", align 1
@.str.11 = private unnamed_addr constant [28 x i8] c"the target is not a closure\00", align 1
@.str.12 = private unnamed_addr constant [20 x i8] c"invalid environment\00", align 1
@.str.13 = private unnamed_addr constant [17 x i8] c"closure expected\00", align 1
@.str.14 = private unnamed_addr constant [13 x i8] c"invalid type\00", align 1
@.str.15 = private unnamed_addr constant [36 x i8] c"clear only works on table and array\00", align 1
@.str.16 = private unnamed_addr constant [29 x i8] c"invalid type, expected table\00", align 1
@.str.17 = private unnamed_addr constant [20 x i8] c"invalid object type\00", align 1
@.str.18 = private unnamed_addr constant [35 x i8] c"the object is not a class instance\00", align 1
@.str.19 = private unnamed_addr constant [26 x i8] c"the object is not a class\00", align 1
@.str.20 = private unnamed_addr constant [20 x i8] c"the class is locked\00", align 1
@.str.21 = private unnamed_addr constant [17 x i8] c"invalid type tag\00", align 1
@__func__.sq_pop = private unnamed_addr constant [7 x i8] c"sq_pop\00", align 1
@.str.22 = private unnamed_addr constant [10 x i8] c"sqapi.cpp\00", align 1
@.str.23 = private unnamed_addr constant [23 x i8] c"v->_top >= nelemstopop\00", align 1
@__func__.sq_poptop = private unnamed_addr constant [10 x i8] c"sq_poptop\00", align 1
@.str.24 = private unnamed_addr constant [13 x i8] c"v->_top >= 1\00", align 1
@.str.25 = private unnamed_addr constant [24 x i8] c"null is not a valid key\00", align 1
@.str.26 = private unnamed_addr constant [9 x i8] c"null key\00", align 1
@.str.27 = private unnamed_addr constant [52 x i8] c"rawset works only on array/table/class and instance\00", align 1
@.str.28 = private unnamed_addr constant [35 x i8] c"new member only works with classes\00", align 1
@.str.29 = private unnamed_addr constant [15 x i8] c"delegate cycle\00", align 1
@.str.30 = private unnamed_addr constant [11 x i8] c"wrong type\00", align 1
@.str.31 = private unnamed_addr constant [32 x i8] c"invalid index type for an array\00", align 1
@.str.32 = private unnamed_addr constant [52 x i8] c"rawget works only on array/table/instance and class\00", align 1
@.str.33 = private unnamed_addr constant [24 x i8] c"the index doesn't exist\00", align 1
@.str.34 = private unnamed_addr constant [42 x i8] c"cannot resize stack while in a metamethod\00", align 1
@.str.35 = private unnamed_addr constant [31 x i8] c"only generators can be resumed\00", align 1
@.str.36 = private unnamed_addr constant [32 x i8] c"only closure can be tail called\00", align 1
@.str.37 = private unnamed_addr constant [33 x i8] c"generators cannot be tail called\00", align 1
@.str.38 = private unnamed_addr constant [48 x i8] c"cannot resume a vm that is not running any code\00", align 1
@.str.39 = private unnamed_addr constant [57 x i8] c"a closure with free variables bound cannot be serialized\00", align 1
@.str.40 = private unnamed_addr constant [9 x i8] c"io error\00", align 1
@.str.41 = private unnamed_addr constant [15 x i8] c"invalid stream\00", align 1
@.str.42 = private unnamed_addr constant [30 x i8] c"no closure in the calls stack\00", align 1
@.str.43 = private unnamed_addr constant [8 x i8] c"@NATIVE\00", align 1
@.str.44 = private unnamed_addr constant [23 x i8] c"invalid free var index\00", align 1
@.str.45 = private unnamed_addr constant [12 x i8] c"wrong index\00", align 1
@.str.46 = private unnamed_addr constant [39 x i8] c"wrong type(expected class or instance)\00", align 1
@.str.47 = private unnamed_addr constant [29 x i8] c"the object must be a weakref\00", align 1
@.str.48 = private unnamed_addr constant [41 x i8] c"the type doesn't have a default delegate\00", align 1
@.str.49 = private unnamed_addr constant [27 x i8] c"cannot iterate a generator\00", align 1
@__func__._ZN11SQObjectPtrC2EP4SQVM = private unnamed_addr constant [12 x i8] c"SQObjectPtr\00", align 1
@.str.50 = private unnamed_addr constant [11 x i8] c"sqobject.h\00", align 1
@.str.51 = private unnamed_addr constant [14 x i8] c"_unVal.pTable\00", align 1
@_ZTV9SQClosure = external unnamed_addr constant { [8 x ptr] }, align 8
@_ZTV13SQCollectable = linkonce_odr unnamed_addr constant { [8 x ptr] } { [8 x ptr] [ptr null, ptr @_ZTI13SQCollectable, ptr @_ZN13SQCollectableD1Ev, ptr @_ZN13SQCollectableD0Ev, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual] }, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global ptr
@_ZTS13SQCollectable = linkonce_odr hidden constant [16 x i8] c"13SQCollectable\00", align 1
@_ZTI12SQRefCounted = external constant ptr
@_ZTI13SQCollectable = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTS13SQCollectable to i64), i64 -9223372036854775808) to ptr), ptr @_ZTI12SQRefCounted }, align 8
@_ZTV12SQRefCounted = external unnamed_addr constant { [5 x ptr] }, align 8
@_ZTV10SQUserData = external unnamed_addr constant { [9 x ptr] }, align 8
@_ZTV11SQDelegable = external unnamed_addr constant { [9 x ptr] }, align 8
@_ZTV7SQArray = external unnamed_addr constant { [8 x ptr] }, align 8
@.str.52 = private unnamed_addr constant [47 x i8] c"wrong argument type, expected '%s' got '%.50s'\00", align 1
@_ZTV15SQNativeClosure = external unnamed_addr constant { [8 x ptr] }, align 8

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define noundef i64 @_Z18sq_aux_invalidtypeP4SQVM15tagSQObjectType(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i64 100, ptr %5, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.SQVM, ptr %6, i32 0, i32 19
  %8 = load ptr, ptr %7, align 8
  %9 = load i64, ptr %5, align 8
  %10 = call noundef ptr @_ZN13SQSharedState13GetScratchPadEx(ptr noundef nonnull align 8 dereferenceable(384) %8, i64 noundef %9)
  %11 = load i64, ptr %5, align 8
  %12 = load i32, ptr %4, align 4
  %13 = call noundef ptr @_Z11IdType2Name15tagSQObjectType(i32 noundef %12)
  %14 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %10, i64 noundef %11, ptr noundef @.str, ptr noundef %13)
  %15 = load ptr, ptr %3, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.SQVM, ptr %16, i32 0, i32 19
  %18 = load ptr, ptr %17, align 8
  %19 = call noundef ptr @_ZN13SQSharedState13GetScratchPadEx(ptr noundef nonnull align 8 dereferenceable(384) %18, i64 noundef -1)
  %20 = call i64 @sq_throwerror(ptr noundef %15, ptr noundef %19)
  ret i64 %20
}

declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...) #1

declare noundef ptr @_ZN13SQSharedState13GetScratchPadEx(ptr noundef nonnull align 8 dereferenceable(384), i64 noundef) #1

declare noundef ptr @_Z11IdType2Name15tagSQObjectType(i32 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_throwerror(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.SQVM, ptr %5, i32 0, i32 19
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = call noundef ptr @_ZN8SQString6CreateEP13SQSharedStatePKcx(ptr noundef %7, ptr noundef %8, i64 noundef -1)
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.SQVM, ptr %10, i32 0, i32 6
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP8SQString(ptr noundef nonnull align 8 dereferenceable(16) %11, ptr noundef %9)
  ret i64 -1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_open(i64 noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store i64 %0, ptr %3, align 8
  %6 = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef 384)
  store ptr %6, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call noundef ptr @_ZN13SQSharedStateC1Ev(ptr noundef nonnull align 8 dereferenceable(384) %7)
  %9 = load ptr, ptr %4, align 8
  call void @_ZN13SQSharedState4InitEv(ptr noundef nonnull align 8 dereferenceable(384) %9)
  %10 = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef 344)
  store ptr %10, ptr %5, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = call noundef ptr @_ZN4SQVMC1EP13SQSharedState(ptr noundef nonnull align 8 dereferenceable(344) %11, ptr noundef %12)
  %14 = load ptr, ptr %5, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.SQSharedState, ptr %15, i32 0, i32 10
  %17 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP4SQVM(ptr noundef nonnull align 8 dereferenceable(16) %16, ptr noundef %14)
  %18 = load ptr, ptr %5, align 8
  %19 = load i64, ptr %3, align 8
  %20 = call noundef zeroext i1 @_ZN4SQVM4InitEPS_x(ptr noundef nonnull align 8 dereferenceable(344) %18, ptr noundef null, i64 noundef %19)
  br i1 %20, label %21, label %23

21:                                               ; preds = %1
  %22 = load ptr, ptr %5, align 8
  store ptr %22, ptr %2, align 8
  br label %30

23:                                               ; preds = %1
  %24 = load ptr, ptr %5, align 8
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds ptr, ptr %25, i64 0
  %27 = load ptr, ptr %26, align 8
  %28 = call noundef ptr %27(ptr noundef nonnull align 8 dereferenceable(344) %24) #10
  %29 = load ptr, ptr %5, align 8
  call void @_Z10sq_vm_freePvy(ptr noundef %29, i64 noundef 344)
  store ptr null, ptr %2, align 8
  br label %30

30:                                               ; preds = %23, %21
  %31 = load ptr, ptr %2, align 8
  ret ptr %31
}

declare noundef ptr @_Z12sq_vm_mallocy(i64 noundef) #1

declare noundef ptr @_ZN13SQSharedStateC1Ev(ptr noundef nonnull returned align 8 dereferenceable(384)) unnamed_addr #1

declare void @_ZN13SQSharedState4InitEv(ptr noundef nonnull align 8 dereferenceable(384)) #1

declare noundef ptr @_ZN4SQVMC1EP13SQSharedState(ptr noundef nonnull returned align 8 dereferenceable(344), ptr noundef) unnamed_addr #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP4SQVM(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca %union.tagSQObjectValue, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  store i32 %9, ptr %5, align 4
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 8 %10, i64 8, i1 false)
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  store i32 134221824, ptr %11, align 8
  %12 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  store i64 0, ptr %12, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  store ptr %13, ptr %14, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.SQRefCounted, ptr %16, i32 0, i32 1
  %18 = load i64, ptr %17, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr %17, align 8
  %20 = load i32, ptr %5, align 4
  %21 = and i32 %20, 134217728
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %34

23:                                               ; preds = %2
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds %struct.SQRefCounted, ptr %24, i32 0, i32 1
  %26 = load i64, ptr %25, align 8
  %27 = add i64 %26, -1
  store i64 %27, ptr %25, align 8
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %29, label %34

29:                                               ; preds = %23
  %30 = load ptr, ptr %6, align 8
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds ptr, ptr %31, i64 2
  %33 = load ptr, ptr %32, align 8
  call void %33(ptr noundef nonnull align 8 dereferenceable(24) %30)
  br label %34

34:                                               ; preds = %29, %23, %2
  ret ptr %7
}

declare noundef zeroext i1 @_ZN4SQVM4InitEPS_x(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef, i64 noundef) #1

declare void @_Z10sq_vm_freePvy(ptr noundef, i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_newthread(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.SQObjectPtr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.SQVM, ptr %11, i32 0, i32 19
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %6, align 8
  %14 = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef 344)
  store ptr %14, ptr %7, align 8
  %15 = load ptr, ptr %7, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = call noundef ptr @_ZN4SQVMC1EP13SQSharedState(ptr noundef nonnull align 8 dereferenceable(344) %15, ptr noundef %16)
  %18 = load ptr, ptr %7, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = load i64, ptr %5, align 8
  %21 = call noundef zeroext i1 @_ZN4SQVM4InitEPS_x(ptr noundef nonnull align 8 dereferenceable(344) %18, ptr noundef %19, i64 noundef %20)
  br i1 %21, label %22, label %34

22:                                               ; preds = %2
  %23 = load ptr, ptr %4, align 8
  %24 = load ptr, ptr %7, align 8
  %25 = call noundef ptr @_ZN11SQObjectPtrC1EP4SQVM(ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef %24)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %23, ptr noundef nonnull align 8 dereferenceable(16) %8)
          to label %26 unwind label %29

26:                                               ; preds = %22
  %27 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #10
  %28 = load ptr, ptr %7, align 8
  store ptr %28, ptr %3, align 8
  br label %41

29:                                               ; preds = %22
  %30 = landingpad { ptr, i32 }
          cleanup
  %31 = extractvalue { ptr, i32 } %30, 0
  store ptr %31, ptr %9, align 8
  %32 = extractvalue { ptr, i32 } %30, 1
  store i32 %32, ptr %10, align 4
  %33 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #10
  br label %43

34:                                               ; preds = %2
  %35 = load ptr, ptr %7, align 8
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds ptr, ptr %36, i64 0
  %38 = load ptr, ptr %37, align 8
  %39 = call noundef ptr %38(ptr noundef nonnull align 8 dereferenceable(344) %35) #10
  %40 = load ptr, ptr %7, align 8
  call void @_Z10sq_vm_freePvy(ptr noundef %40, i64 noundef 344)
  store ptr null, ptr %3, align 8
  br label %41

41:                                               ; preds = %34, %26
  %42 = load ptr, ptr %3, align 8
  ret ptr %42

43:                                               ; preds = %29
  %44 = load ptr, ptr %9, align 8
  %45 = load i32, ptr %10, align 4
  %46 = insertvalue { ptr, i32 } poison, ptr %44, 0
  %47 = insertvalue { ptr, i32 } %46, i32 %45, 1
  resume { ptr, i32 } %47
}

declare void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP4SQVM(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN11SQObjectPtrC2EP4SQVM(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %6)
  ret ptr %5
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN11SQObjectPtrD2Ev(ptr noundef nonnull align 8 dereferenceable(16) %3) #10
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define i64 @sq_getvmstate(ptr noundef %0) #4 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.SQVM, ptr %4, i32 0, i32 23
  %6 = load i64, ptr %5, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  store i64 2, ptr %2, align 8
  br label %16

9:                                                ; preds = %1
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.SQVM, ptr %10, i32 0, i32 13
  %12 = load i64, ptr %11, align 8
  %13 = icmp ne i64 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %9
  store i64 1, ptr %2, align 8
  br label %16

15:                                               ; preds = %9
  store i64 0, ptr %2, align 8
  br label %16

16:                                               ; preds = %15, %14, %8
  %17 = load i64, ptr %2, align 8
  ret i64 %17
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_seterrorhandler(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.tagSQObject, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %4, i64 noundef -1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %5, i64 16, i1 false)
  %6 = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 0
  %7 = load i32, ptr %6, align 8
  %8 = icmp eq i32 %7, 134217984
  br i1 %8, label %17, label %9

9:                                                ; preds = %1
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = icmp eq i32 %11, 134218240
  br i1 %12, label %17, label %13

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = icmp eq i32 %15, 16777217
  br i1 %16, label %17, label %22

17:                                               ; preds = %13, %9, %1
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds %struct.SQVM, ptr %18, i32 0, i32 7
  %20 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %19, ptr noundef nonnull align 8 dereferenceable(16) %3)
  %21 = load ptr, ptr %2, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %21)
  br label %22

22:                                               ; preds = %17, %13
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load i64, ptr %4, align 8
  %6 = icmp sge i64 %5, 0
  br i1 %6, label %7, label %16

7:                                                ; preds = %2
  %8 = load ptr, ptr %3, align 8
  %9 = load i64, ptr %4, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.SQVM, ptr %10, i32 0, i32 3
  %12 = load i64, ptr %11, align 8
  %13 = add nsw i64 %9, %12
  %14 = sub nsw i64 %13, 1
  %15 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetAtEx(ptr noundef nonnull align 8 dereferenceable(344) %8, i64 noundef %14)
  br label %20

16:                                               ; preds = %2
  %17 = load ptr, ptr %3, align 8
  %18 = load i64, ptr %4, align 8
  %19 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %17, i64 noundef %18)
  br label %20

20:                                               ; preds = %16, %7
  %21 = phi ptr [ %15, %7 ], [ %19, %16 ]
  ret ptr %21
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca %union.tagSQObjectValue, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  store i32 %9, ptr %5, align 4
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 8 %10, i64 8, i1 false)
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.tagSQObject, ptr %11, i32 0, i32 1
  %13 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 8 %12, i64 8, i1 false)
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  store i32 %16, ptr %17, align 8
  %18 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = and i32 %19, 134217728
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %28

22:                                               ; preds = %2
  %23 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.SQRefCounted, ptr %24, i32 0, i32 1
  %26 = load i64, ptr %25, align 8
  %27 = add i64 %26, 1
  store i64 %27, ptr %25, align 8
  br label %28

28:                                               ; preds = %22, %2
  %29 = load i32, ptr %5, align 4
  %30 = and i32 %29, 134217728
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %43

32:                                               ; preds = %28
  %33 = load ptr, ptr %6, align 8
  %34 = getelementptr inbounds %struct.SQRefCounted, ptr %33, i32 0, i32 1
  %35 = load i64, ptr %34, align 8
  %36 = add i64 %35, -1
  store i64 %36, ptr %34, align 8
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %38, label %43

38:                                               ; preds = %32
  %39 = load ptr, ptr %6, align 8
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds ptr, ptr %40, i64 2
  %42 = load ptr, ptr %41, align 8
  call void %42(ptr noundef nonnull align 8 dereferenceable(24) %39)
  br label %43

43:                                               ; preds = %38, %32, %28
  ret ptr %7
}

declare void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_setnativedebughook(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.SQVM, ptr %6, i32 0, i32 9
  store ptr %5, ptr %7, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.SQVM, ptr %8, i32 0, i32 10
  call void @_ZN11SQObjectPtr4NullEv(ptr noundef nonnull align 8 dereferenceable(16) %9)
  %10 = load ptr, ptr %4, align 8
  %11 = icmp ne ptr %10, null
  %12 = zext i1 %11 to i64
  %13 = select i1 %11, i1 true, i1 false
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.SQVM, ptr %14, i32 0, i32 8
  %16 = zext i1 %13 to i8
  store i8 %16, ptr %15, align 8
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN11SQObjectPtr4NullEv(ptr noundef nonnull align 8 dereferenceable(16) %0) #0 align 2 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca %union.tagSQObjectValue, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 0
  %7 = load i32, ptr %6, align 8
  store i32 %7, ptr %3, align 4
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %8, i64 8, i1 false)
  %9 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 0
  store i32 16777217, ptr %9, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  store i64 0, ptr %10, align 8
  %11 = load i32, ptr %3, align 4
  %12 = and i32 %11, 134217728
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %25

14:                                               ; preds = %1
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.SQRefCounted, ptr %15, i32 0, i32 1
  %17 = load i64, ptr %16, align 8
  %18 = add i64 %17, -1
  store i64 %18, ptr %16, align 8
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %20, label %25

20:                                               ; preds = %14
  %21 = load ptr, ptr %4, align 8
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds ptr, ptr %22, i64 2
  %24 = load ptr, ptr %23, align 8
  call void %24(ptr noundef nonnull align 8 dereferenceable(24) %21)
  br label %25

25:                                               ; preds = %20, %14, %1
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_setdebughook(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.tagSQObject, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %4, i64 noundef -1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %5, i64 16, i1 false)
  %6 = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 0
  %7 = load i32, ptr %6, align 8
  %8 = icmp eq i32 %7, 134217984
  br i1 %8, label %17, label %9

9:                                                ; preds = %1
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = icmp eq i32 %11, 134218240
  br i1 %12, label %17, label %13

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = icmp eq i32 %15, 16777217
  br i1 %16, label %17, label %31

17:                                               ; preds = %13, %9, %1
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds %struct.SQVM, ptr %18, i32 0, i32 10
  %20 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %19, ptr noundef nonnull align 8 dereferenceable(16) %3)
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds %struct.SQVM, ptr %21, i32 0, i32 9
  store ptr null, ptr %22, align 8
  %23 = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 0
  %24 = load i32, ptr %23, align 8
  %25 = icmp eq i32 %24, 16777217
  %26 = xor i1 %25, true
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.SQVM, ptr %27, i32 0, i32 8
  %29 = zext i1 %26 to i8
  store i8 %29, ptr %28, align 8
  %30 = load ptr, ptr %2, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %30)
  br label %31

31:                                               ; preds = %17, %13
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_close(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.SQVM, ptr %4, i32 0, i32 19
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.SQSharedState, ptr %7, i32 0, i32 10
  %9 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds ptr, ptr %11, i64 5
  %13 = load ptr, ptr %12, align 8
  call void %13(ptr noundef nonnull align 8 dereferenceable(344) %10)
  %14 = load ptr, ptr %3, align 8
  %15 = call noundef ptr @_ZN13SQSharedStateD1Ev(ptr noundef nonnull align 8 dereferenceable(384) %14) #10
  %16 = load ptr, ptr %3, align 8
  call void @_Z10sq_vm_freePvy(ptr noundef %16, i64 noundef 384)
  ret void
}

; Function Attrs: nounwind
declare noundef ptr @_ZN13SQSharedStateD1Ev(ptr noundef nonnull returned align 8 dereferenceable(384)) unnamed_addr #6

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define i64 @sq_getversion() #4 {
  ret i64 320
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_compile(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i64 noundef %4) #0 personality ptr @__gxx_personality_v0 {
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i64, align 8
  %12 = alloca %struct.SQObjectPtr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct.SQObjectPtr, align 8
  %16 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store i64 %4, ptr %11, align 8
  %17 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %12)
  %18 = load ptr, ptr %7, align 8
  %19 = load ptr, ptr %8, align 8
  %20 = load ptr, ptr %9, align 8
  %21 = load ptr, ptr %10, align 8
  %22 = load i64, ptr %11, align 8
  %23 = icmp ne i64 %22, 0
  %24 = zext i1 %23 to i64
  %25 = select i1 %23, i1 true, i1 false
  %26 = load ptr, ptr %7, align 8
  %27 = getelementptr inbounds %struct.SQVM, ptr %26, i32 0, i32 19
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds %struct.SQSharedState, ptr %28, i32 0, i32 24
  %30 = load i8, ptr %29, align 8
  %31 = trunc i8 %30 to i1
  %32 = invoke noundef zeroext i1 @_Z7CompileP4SQVMPFxPvES1_PKcR11SQObjectPtrbb(ptr noundef %18, ptr noundef %19, ptr noundef %20, ptr noundef %21, ptr noundef nonnull align 8 dereferenceable(16) %12, i1 noundef zeroext %25, i1 noundef zeroext %31)
          to label %33 unwind label %53

33:                                               ; preds = %5
  br i1 %32, label %34, label %62

34:                                               ; preds = %33
  %35 = load ptr, ptr %7, align 8
  %36 = load ptr, ptr %7, align 8
  %37 = getelementptr inbounds %struct.SQVM, ptr %36, i32 0, i32 19
  %38 = load ptr, ptr %37, align 8
  %39 = getelementptr inbounds %struct.tagSQObject, ptr %12, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds %struct.SQVM, ptr %41, i32 0, i32 5
  %43 = getelementptr inbounds %struct.tagSQObject, ptr %42, i32 0, i32 1
  %44 = load ptr, ptr %43, align 8
  %45 = invoke noundef ptr @_ZN12SQRefCounted10GetWeakRefE15tagSQObjectType(ptr noundef nonnull align 8 dereferenceable(24) %44, i32 noundef 167772192)
          to label %46 unwind label %53

46:                                               ; preds = %34
  %47 = invoke noundef ptr @_ZN9SQClosure6CreateEP13SQSharedStateP15SQFunctionProtoP9SQWeakRef(ptr noundef %38, ptr noundef %40, ptr noundef %45)
          to label %48 unwind label %53

48:                                               ; preds = %46
  %49 = invoke noundef ptr @_ZN11SQObjectPtrC1EP9SQClosure(ptr noundef nonnull align 8 dereferenceable(16) %15, ptr noundef %47)
          to label %50 unwind label %53

50:                                               ; preds = %48
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %35, ptr noundef nonnull align 8 dereferenceable(16) %15)
          to label %51 unwind label %57

51:                                               ; preds = %50
  %52 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %15) #10
  store i64 0, ptr %6, align 8
  store i32 1, ptr %16, align 4
  br label %63

53:                                               ; preds = %48, %46, %34, %5
  %54 = landingpad { ptr, i32 }
          cleanup
  %55 = extractvalue { ptr, i32 } %54, 0
  store ptr %55, ptr %13, align 8
  %56 = extractvalue { ptr, i32 } %54, 1
  store i32 %56, ptr %14, align 4
  br label %66

57:                                               ; preds = %50
  %58 = landingpad { ptr, i32 }
          cleanup
  %59 = extractvalue { ptr, i32 } %58, 0
  store ptr %59, ptr %13, align 8
  %60 = extractvalue { ptr, i32 } %58, 1
  store i32 %60, ptr %14, align 4
  %61 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %15) #10
  br label %66

62:                                               ; preds = %33
  store i64 -1, ptr %6, align 8
  store i32 1, ptr %16, align 4
  br label %63

63:                                               ; preds = %62, %51
  %64 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %12) #10
  %65 = load i64, ptr %6, align 8
  ret i64 %65

66:                                               ; preds = %57, %53
  %67 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %12) #10
  br label %68

68:                                               ; preds = %66
  %69 = load ptr, ptr %13, align 8
  %70 = load i32, ptr %14, align 4
  %71 = insertvalue { ptr, i32 } poison, ptr %69, 0
  %72 = insertvalue { ptr, i32 } %71, i32 %70, 1
  resume { ptr, i32 } %72
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN11SQObjectPtrC2Ev(ptr noundef nonnull align 8 dereferenceable(16) %3)
  ret ptr %3
}

declare noundef zeroext i1 @_Z7CompileP4SQVMPFxPvES1_PKcR11SQObjectPtrbb(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef nonnull align 8 dereferenceable(16), i1 noundef zeroext, i1 noundef zeroext) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN9SQClosure6CreateEP13SQSharedStateP15SQFunctionProtoP9SQWeakRef(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.SQFunctionProto, ptr %11, i32 0, i32 16
  %13 = load i64, ptr %12, align 8
  %14 = mul i64 %13, 16
  %15 = add i64 96, %14
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.SQFunctionProto, ptr %16, i32 0, i32 18
  %18 = load i64, ptr %17, align 8
  %19 = mul i64 %18, 16
  %20 = add i64 %15, %19
  store i64 %20, ptr %7, align 8
  %21 = load i64, ptr %7, align 8
  %22 = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef %21)
  store ptr %22, ptr %8, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = load ptr, ptr %5, align 8
  %26 = call noundef ptr @_ZN9SQClosureC1EP13SQSharedStateP15SQFunctionProto(ptr noundef nonnull align 8 dereferenceable(96) %23, ptr noundef %24, ptr noundef %25)
  %27 = load ptr, ptr %8, align 8
  %28 = getelementptr inbounds %struct.SQClosure, ptr %27, i64 1
  %29 = load ptr, ptr %8, align 8
  %30 = getelementptr inbounds %struct.SQClosure, ptr %29, i32 0, i32 5
  store ptr %28, ptr %30, align 8
  %31 = load ptr, ptr %8, align 8
  %32 = getelementptr inbounds %struct.SQClosure, ptr %31, i32 0, i32 5
  %33 = load ptr, ptr %32, align 8
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds %struct.SQFunctionProto, ptr %34, i32 0, i32 16
  %36 = load i64, ptr %35, align 8
  %37 = getelementptr inbounds %struct.SQObjectPtr, ptr %33, i64 %36
  %38 = load ptr, ptr %8, align 8
  %39 = getelementptr inbounds %struct.SQClosure, ptr %38, i32 0, i32 6
  store ptr %37, ptr %39, align 8
  %40 = load ptr, ptr %6, align 8
  %41 = load ptr, ptr %8, align 8
  %42 = getelementptr inbounds %struct.SQClosure, ptr %41, i32 0, i32 2
  store ptr %40, ptr %42, align 8
  %43 = load ptr, ptr %8, align 8
  %44 = getelementptr inbounds %struct.SQClosure, ptr %43, i32 0, i32 2
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr inbounds %struct.SQRefCounted, ptr %45, i32 0, i32 1
  %47 = load i64, ptr %46, align 8
  %48 = add i64 %47, 1
  store i64 %48, ptr %46, align 8
  store i64 0, ptr %9, align 8
  br label %49

49:                                               ; preds = %62, %3
  %50 = load i64, ptr %9, align 8
  %51 = load ptr, ptr %5, align 8
  %52 = getelementptr inbounds %struct.SQFunctionProto, ptr %51, i32 0, i32 16
  %53 = load i64, ptr %52, align 8
  %54 = icmp slt i64 %50, %53
  br i1 %54, label %55, label %65

55:                                               ; preds = %49
  %56 = load ptr, ptr %8, align 8
  %57 = getelementptr inbounds %struct.SQClosure, ptr %56, i32 0, i32 5
  %58 = load ptr, ptr %57, align 8
  %59 = load i64, ptr %9, align 8
  %60 = getelementptr inbounds %struct.SQObjectPtr, ptr %58, i64 %59
  %61 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %60)
  br label %62

62:                                               ; preds = %55
  %63 = load i64, ptr %9, align 8
  %64 = add nsw i64 %63, 1
  store i64 %64, ptr %9, align 8
  br label %49, !llvm.loop !6

65:                                               ; preds = %49
  store i64 0, ptr %10, align 8
  br label %66

66:                                               ; preds = %79, %65
  %67 = load i64, ptr %10, align 8
  %68 = load ptr, ptr %5, align 8
  %69 = getelementptr inbounds %struct.SQFunctionProto, ptr %68, i32 0, i32 18
  %70 = load i64, ptr %69, align 8
  %71 = icmp slt i64 %67, %70
  br i1 %71, label %72, label %82

72:                                               ; preds = %66
  %73 = load ptr, ptr %8, align 8
  %74 = getelementptr inbounds %struct.SQClosure, ptr %73, i32 0, i32 6
  %75 = load ptr, ptr %74, align 8
  %76 = load i64, ptr %10, align 8
  %77 = getelementptr inbounds %struct.SQObjectPtr, ptr %75, i64 %76
  %78 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %77)
  br label %79

79:                                               ; preds = %72
  %80 = load i64, ptr %10, align 8
  %81 = add nsw i64 %80, 1
  store i64 %81, ptr %10, align 8
  br label %66, !llvm.loop !8

82:                                               ; preds = %66
  %83 = load ptr, ptr %8, align 8
  ret ptr %83
}

declare noundef ptr @_ZN12SQRefCounted10GetWeakRefE15tagSQObjectType(ptr noundef nonnull align 8 dereferenceable(24), i32 noundef) #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP9SQClosure(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN11SQObjectPtrC2EP9SQClosure(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_enabledebuginfo(ptr noundef %0, i64 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load i64, ptr %4, align 8
  %6 = icmp ne i64 %5, 0
  %7 = zext i1 %6 to i64
  %8 = select i1 %6, i1 true, i1 false
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.SQVM, ptr %9, i32 0, i32 19
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %struct.SQSharedState, ptr %11, i32 0, i32 24
  %13 = zext i1 %8 to i8
  store i8 %13, ptr %12, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_notifyallexceptions(ptr noundef %0, i64 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load i64, ptr %4, align 8
  %6 = icmp ne i64 %5, 0
  %7 = zext i1 %6 to i64
  %8 = select i1 %6, i1 true, i1 false
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.SQVM, ptr %9, i32 0, i32 19
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %struct.SQSharedState, ptr %11, i32 0, i32 25
  %13 = zext i1 %8 to i8
  store i8 %13, ptr %12, align 1
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_addref(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 0
  %7 = load i32, ptr %6, align 8
  %8 = and i32 %7, 134217728
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %11, label %10

10:                                               ; preds = %2
  br label %17

11:                                               ; preds = %2
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.SQVM, ptr %12, i32 0, i32 19
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %struct.SQSharedState, ptr %14, i32 0, i32 5
  %16 = load ptr, ptr %4, align 8
  call void @_ZN8RefTable6AddRefER11tagSQObject(ptr noundef nonnull align 8 dereferenceable(40) %15, ptr noundef nonnull align 8 dereferenceable(16) %16)
  br label %17

17:                                               ; preds = %11, %10
  ret void
}

declare void @_ZN8RefTable6AddRefER11tagSQObject(ptr noundef nonnull align 8 dereferenceable(40), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getrefcount(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = and i32 %8, 134217728
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %2
  store i64 0, ptr %3, align 8
  br label %19

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.SQVM, ptr %13, i32 0, i32 19
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.SQSharedState, ptr %15, i32 0, i32 5
  %17 = load ptr, ptr %5, align 8
  %18 = call noundef i64 @_ZN8RefTable11GetRefCountER11tagSQObject(ptr noundef nonnull align 8 dereferenceable(40) %16, ptr noundef nonnull align 8 dereferenceable(16) %17)
  store i64 %18, ptr %3, align 8
  br label %19

19:                                               ; preds = %12, %11
  %20 = load i64, ptr %3, align 8
  ret i64 %20
}

declare noundef i64 @_ZN8RefTable11GetRefCountER11tagSQObject(ptr noundef nonnull align 8 dereferenceable(40), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_release(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = and i32 %8, 134217728
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %2
  store i64 1, ptr %3, align 8
  br label %19

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.SQVM, ptr %13, i32 0, i32 19
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.SQSharedState, ptr %15, i32 0, i32 5
  %17 = load ptr, ptr %5, align 8
  %18 = call noundef i64 @_ZN8RefTable7ReleaseER11tagSQObject(ptr noundef nonnull align 8 dereferenceable(40) %16, ptr noundef nonnull align 8 dereferenceable(16) %17)
  store i64 %18, ptr %3, align 8
  br label %19

19:                                               ; preds = %12, %11
  %20 = load i64, ptr %3, align 8
  ret i64 %20
}

declare noundef i64 @_ZN8RefTable7ReleaseER11tagSQObject(ptr noundef nonnull align 8 dereferenceable(40), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define i64 @sq_getvmrefcount(ptr noundef %0, ptr noundef %1) #4 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = and i32 %8, 134217728
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %2
  store i64 0, ptr %3, align 8
  br label %18

12:                                               ; preds = %2
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.SQRefCounted, ptr %15, i32 0, i32 1
  %17 = load i64, ptr %16, align 8
  store i64 %17, ptr %3, align 8
  br label %18

18:                                               ; preds = %12, %11
  %19 = load i64, ptr %3, align 8
  ret i64 %19
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_objtostring(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = icmp eq i32 %6, 134217744
  br i1 %7, label %8, label %14

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %9, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %struct.SQString, ptr %11, i32 0, i32 5
  %13 = getelementptr inbounds [1 x i8], ptr %12, i64 0, i64 0
  store ptr %13, ptr %2, align 8
  br label %15

14:                                               ; preds = %1
  store ptr null, ptr %2, align 8
  br label %15

15:                                               ; preds = %14, %8
  %16 = load ptr, ptr %2, align 8
  ret ptr %16
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define i64 @sq_objtointeger(ptr noundef %0) #4 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = and i32 %6, 67108864
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %25

9:                                                ; preds = %1
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 83886084
  br i1 %13, label %14, label %19

14:                                               ; preds = %9
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.tagSQObject, ptr %15, i32 0, i32 1
  %17 = load float, ptr %16, align 8
  %18 = fptosi float %17 to i64
  br label %23

19:                                               ; preds = %9
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.tagSQObject, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  br label %23

23:                                               ; preds = %19, %14
  %24 = phi i64 [ %18, %14 ], [ %22, %19 ]
  store i64 %24, ptr %2, align 8
  br label %26

25:                                               ; preds = %1
  store i64 0, ptr %2, align 8
  br label %26

26:                                               ; preds = %25, %23
  %27 = load i64, ptr %2, align 8
  ret i64 %27
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define float @sq_objtofloat(ptr noundef %0) #4 {
  %2 = alloca float, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = and i32 %6, 67108864
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %25

9:                                                ; preds = %1
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 83886082
  br i1 %13, label %14, label %19

14:                                               ; preds = %9
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.tagSQObject, ptr %15, i32 0, i32 1
  %17 = load i64, ptr %16, align 8
  %18 = sitofp i64 %17 to float
  br label %23

19:                                               ; preds = %9
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.tagSQObject, ptr %20, i32 0, i32 1
  %22 = load float, ptr %21, align 8
  br label %23

23:                                               ; preds = %19, %14
  %24 = phi float [ %18, %14 ], [ %22, %19 ]
  store float %24, ptr %2, align 4
  br label %26

25:                                               ; preds = %1
  store float 0.000000e+00, ptr %2, align 4
  br label %26

26:                                               ; preds = %25, %23
  %27 = load float, ptr %2, align 4
  ret float %27
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define i64 @sq_objtobool(ptr noundef %0) #4 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = icmp eq i32 %6, 16777224
  br i1 %7, label %8, label %12

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %9, i32 0, i32 1
  %11 = load i64, ptr %10, align 8
  store i64 %11, ptr %2, align 8
  br label %13

12:                                               ; preds = %1
  store i64 0, ptr %2, align 8
  br label %13

13:                                               ; preds = %12, %8
  %14 = load i64, ptr %2, align 8
  ret i64 %14
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_objtouserpointer(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = icmp eq i32 %6, 2048
  br i1 %7, label %8, label %12

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %9, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %2, align 8
  br label %13

12:                                               ; preds = %1
  store ptr null, ptr %2, align 8
  br label %13

13:                                               ; preds = %12, %8
  %14 = load ptr, ptr %2, align 8
  ret ptr %14
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushnull(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @_ZN4SQVM8PushNullEv(ptr noundef nonnull align 8 dereferenceable(344) %3)
  ret void
}

declare void @_ZN4SQVM8PushNullEv(ptr noundef nonnull align 8 dereferenceable(344)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushstring(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.SQObjectPtr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %28

12:                                               ; preds = %3
  %13 = load ptr, ptr %4, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.SQVM, ptr %14, i32 0, i32 19
  %16 = load ptr, ptr %15, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = load i64, ptr %6, align 8
  %19 = call noundef ptr @_ZN8SQString6CreateEP13SQSharedStatePKcx(ptr noundef %16, ptr noundef %17, i64 noundef %18)
  %20 = call noundef ptr @_ZN11SQObjectPtrC1EP8SQString(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef %19)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %13, ptr noundef nonnull align 8 dereferenceable(16) %7)
          to label %21 unwind label %23

21:                                               ; preds = %12
  %22 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  br label %30

23:                                               ; preds = %12
  %24 = landingpad { ptr, i32 }
          cleanup
  %25 = extractvalue { ptr, i32 } %24, 0
  store ptr %25, ptr %8, align 8
  %26 = extractvalue { ptr, i32 } %24, 1
  store i32 %26, ptr %9, align 4
  %27 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  br label %31

28:                                               ; preds = %3
  %29 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM8PushNullEv(ptr noundef nonnull align 8 dereferenceable(344) %29)
  br label %30

30:                                               ; preds = %28, %21
  ret void

31:                                               ; preds = %23
  %32 = load ptr, ptr %8, align 8
  %33 = load i32, ptr %9, align 4
  %34 = insertvalue { ptr, i32 } poison, ptr %32, 0
  %35 = insertvalue { ptr, i32 } %34, i32 %33, 1
  resume { ptr, i32 } %35
}

declare noundef ptr @_ZN8SQString6CreateEP13SQSharedStatePKcx(ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP8SQString(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN11SQObjectPtrC2EP8SQString(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushinteger(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.SQObjectPtr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load i64, ptr %4, align 8
  %10 = call noundef ptr @_ZN11SQObjectPtrC1Ex(ptr noundef nonnull align 8 dereferenceable(16) %5, i64 noundef %9)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %8, ptr noundef nonnull align 8 dereferenceable(16) %5)
          to label %11 unwind label %13

11:                                               ; preds = %2
  %12 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  ret void

13:                                               ; preds = %2
  %14 = landingpad { ptr, i32 }
          cleanup
  %15 = extractvalue { ptr, i32 } %14, 0
  store ptr %15, ptr %6, align 8
  %16 = extractvalue { ptr, i32 } %14, 1
  store i32 %16, ptr %7, align 4
  %17 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  br label %18

18:                                               ; preds = %13
  %19 = load ptr, ptr %6, align 8
  %20 = load i32, ptr %7, align 4
  %21 = insertvalue { ptr, i32 } poison, ptr %19, 0
  %22 = insertvalue { ptr, i32 } %21, i32 %20, 1
  resume { ptr, i32 } %22
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1Ex(ptr noundef nonnull returned align 8 dereferenceable(16) %0, i64 noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = call noundef ptr @_ZN11SQObjectPtrC2Ex(ptr noundef nonnull align 8 dereferenceable(16) %5, i64 noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushbool(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.SQObjectPtr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load i64, ptr %4, align 8
  %10 = icmp ne i64 %9, 0
  %11 = zext i1 %10 to i64
  %12 = select i1 %10, i1 true, i1 false
  %13 = call noundef ptr @_ZN11SQObjectPtrC1Eb(ptr noundef nonnull align 8 dereferenceable(16) %5, i1 noundef zeroext %12)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %8, ptr noundef nonnull align 8 dereferenceable(16) %5)
          to label %14 unwind label %16

14:                                               ; preds = %2
  %15 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  ret void

16:                                               ; preds = %2
  %17 = landingpad { ptr, i32 }
          cleanup
  %18 = extractvalue { ptr, i32 } %17, 0
  store ptr %18, ptr %6, align 8
  %19 = extractvalue { ptr, i32 } %17, 1
  store i32 %19, ptr %7, align 4
  %20 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  br label %21

21:                                               ; preds = %16
  %22 = load ptr, ptr %6, align 8
  %23 = load i32, ptr %7, align 4
  %24 = insertvalue { ptr, i32 } poison, ptr %22, 0
  %25 = insertvalue { ptr, i32 } %24, i32 %23, 1
  resume { ptr, i32 } %25
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1Eb(ptr noundef nonnull returned align 8 dereferenceable(16) %0, i1 noundef zeroext %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  %5 = zext i1 %1 to i8
  store i8 %5, ptr %4, align 1
  %6 = load ptr, ptr %3, align 8
  %7 = load i8, ptr %4, align 1
  %8 = trunc i8 %7 to i1
  %9 = call noundef ptr @_ZN11SQObjectPtrC2Eb(ptr noundef nonnull align 8 dereferenceable(16) %6, i1 noundef zeroext %8)
  ret ptr %6
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushfloat(ptr noundef %0, float noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca float, align 4
  %5 = alloca %struct.SQObjectPtr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store float %1, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = load float, ptr %4, align 4
  %10 = call noundef ptr @_ZN11SQObjectPtrC1Ef(ptr noundef nonnull align 8 dereferenceable(16) %5, float noundef %9)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %8, ptr noundef nonnull align 8 dereferenceable(16) %5)
          to label %11 unwind label %13

11:                                               ; preds = %2
  %12 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  ret void

13:                                               ; preds = %2
  %14 = landingpad { ptr, i32 }
          cleanup
  %15 = extractvalue { ptr, i32 } %14, 0
  store ptr %15, ptr %6, align 8
  %16 = extractvalue { ptr, i32 } %14, 1
  store i32 %16, ptr %7, align 4
  %17 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  br label %18

18:                                               ; preds = %13
  %19 = load ptr, ptr %6, align 8
  %20 = load i32, ptr %7, align 4
  %21 = insertvalue { ptr, i32 } poison, ptr %19, 0
  %22 = insertvalue { ptr, i32 } %21, i32 %20, 1
  resume { ptr, i32 } %22
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1Ef(ptr noundef nonnull returned align 8 dereferenceable(16) %0, float noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca float, align 4
  store ptr %0, ptr %3, align 8
  store float %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load float, ptr %4, align 4
  %7 = call noundef ptr @_ZN11SQObjectPtrC2Ef(ptr noundef nonnull align 8 dereferenceable(16) %5, float noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushuserpointer(ptr noundef %0, ptr noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.SQObjectPtr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call noundef ptr @_ZN11SQObjectPtrC1EPv(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %9)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %8, ptr noundef nonnull align 8 dereferenceable(16) %5)
          to label %11 unwind label %13

11:                                               ; preds = %2
  %12 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  ret void

13:                                               ; preds = %2
  %14 = landingpad { ptr, i32 }
          cleanup
  %15 = extractvalue { ptr, i32 } %14, 0
  store ptr %15, ptr %6, align 8
  %16 = extractvalue { ptr, i32 } %14, 1
  store i32 %16, ptr %7, align 4
  %17 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  br label %18

18:                                               ; preds = %13
  %19 = load ptr, ptr %6, align 8
  %20 = load i32, ptr %7, align 4
  %21 = insertvalue { ptr, i32 } poison, ptr %19, 0
  %22 = insertvalue { ptr, i32 } %21, i32 %20, 1
  resume { ptr, i32 } %22
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EPv(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN11SQObjectPtrC2EPv(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushthread(ptr noundef %0, ptr noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.SQObjectPtr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call noundef ptr @_ZN11SQObjectPtrC1EP4SQVM(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %9)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %8, ptr noundef nonnull align 8 dereferenceable(16) %5)
          to label %11 unwind label %13

11:                                               ; preds = %2
  %12 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  ret void

13:                                               ; preds = %2
  %14 = landingpad { ptr, i32 }
          cleanup
  %15 = extractvalue { ptr, i32 } %14, 0
  store ptr %15, ptr %6, align 8
  %16 = extractvalue { ptr, i32 } %14, 1
  store i32 %16, ptr %7, align 4
  %17 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  br label %18

18:                                               ; preds = %13
  %19 = load ptr, ptr %6, align 8
  %20 = load i32, ptr %7, align 4
  %21 = insertvalue { ptr, i32 } poison, ptr %19, 0
  %22 = insertvalue { ptr, i32 } %21, i32 %20, 1
  resume { ptr, i32 } %22
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_newuserdata(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca %struct.SQObjectPtr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.SQVM, ptr %9, i32 0, i32 19
  %11 = load ptr, ptr %10, align 8
  %12 = load i64, ptr %4, align 8
  %13 = add i64 %12, 8
  %14 = call noundef ptr @_ZN10SQUserData6CreateEP13SQSharedStatex(ptr noundef %11, i64 noundef %13)
  store ptr %14, ptr %5, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = call noundef ptr @_ZN11SQObjectPtrC1EP10SQUserData(ptr noundef nonnull align 8 dereferenceable(16) %6, ptr noundef %16)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %15, ptr noundef nonnull align 8 dereferenceable(16) %6)
          to label %18 unwind label %26

18:                                               ; preds = %2
  %19 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %6) #10
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds %struct.SQUserData, ptr %20, i64 1
  %22 = ptrtoint ptr %21 to i64
  %23 = add i64 %22, 7
  %24 = and i64 %23, -8
  %25 = inttoptr i64 %24 to ptr
  ret ptr %25

26:                                               ; preds = %2
  %27 = landingpad { ptr, i32 }
          cleanup
  %28 = extractvalue { ptr, i32 } %27, 0
  store ptr %28, ptr %7, align 8
  %29 = extractvalue { ptr, i32 } %27, 1
  store i32 %29, ptr %8, align 4
  %30 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %6) #10
  br label %31

31:                                               ; preds = %26
  %32 = load ptr, ptr %7, align 8
  %33 = load i32, ptr %8, align 4
  %34 = insertvalue { ptr, i32 } poison, ptr %32, 0
  %35 = insertvalue { ptr, i32 } %34, i32 %33, 1
  resume { ptr, i32 } %35
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN10SQUserData6CreateEP13SQSharedStatex(ptr noundef %0, i64 noundef %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = load i64, ptr %4, align 8
  %7 = add i64 80, %6
  %8 = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef %7)
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = call noundef ptr @_ZN10SQUserDataC1EP13SQSharedState(ptr noundef nonnull align 8 dereferenceable(80) %9, ptr noundef %10)
  %12 = load i64, ptr %4, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.SQUserData, ptr %13, i32 0, i32 1
  store i64 %12, ptr %14, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.SQUserData, ptr %15, i32 0, i32 3
  store ptr null, ptr %16, align 8
  %17 = load ptr, ptr %5, align 8
  ret ptr %17
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP10SQUserData(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN11SQObjectPtrC2EP10SQUserData(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_newtable(ptr noundef %0) #0 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.SQObjectPtr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.SQVM, ptr %7, i32 0, i32 19
  %9 = load ptr, ptr %8, align 8
  %10 = call noundef ptr @_ZN7SQTable6CreateEP13SQSharedStatex(ptr noundef %9, i64 noundef 0)
  %11 = call noundef ptr @_ZN11SQObjectPtrC1EP7SQTable(ptr noundef nonnull align 8 dereferenceable(16) %3, ptr noundef %10)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %6, ptr noundef nonnull align 8 dereferenceable(16) %3)
          to label %12 unwind label %14

12:                                               ; preds = %1
  %13 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %3) #10
  ret void

14:                                               ; preds = %1
  %15 = landingpad { ptr, i32 }
          cleanup
  %16 = extractvalue { ptr, i32 } %15, 0
  store ptr %16, ptr %4, align 8
  %17 = extractvalue { ptr, i32 } %15, 1
  store i32 %17, ptr %5, align 4
  %18 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %3) #10
  br label %19

19:                                               ; preds = %14
  %20 = load ptr, ptr %4, align 8
  %21 = load i32, ptr %5, align 4
  %22 = insertvalue { ptr, i32 } poison, ptr %20, 0
  %23 = insertvalue { ptr, i32 } %22, i32 %21, 1
  resume { ptr, i32 } %23
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7SQTable6CreateEP13SQSharedStatex(ptr noundef %0, i64 noundef %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef 88)
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load i64, ptr %4, align 8
  %10 = call noundef ptr @_ZN7SQTableC1EP13SQSharedStatex(ptr noundef nonnull align 8 dereferenceable(88) %7, ptr noundef %8, i64 noundef %9)
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.SQDelegable, ptr %11, i32 0, i32 1
  store ptr null, ptr %12, align 8
  %13 = load ptr, ptr %5, align 8
  ret ptr %13
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP7SQTable(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN11SQObjectPtrC2EP7SQTable(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_newtableex(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.SQObjectPtr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.SQVM, ptr %9, i32 0, i32 19
  %11 = load ptr, ptr %10, align 8
  %12 = load i64, ptr %4, align 8
  %13 = call noundef ptr @_ZN7SQTable6CreateEP13SQSharedStatex(ptr noundef %11, i64 noundef %12)
  %14 = call noundef ptr @_ZN11SQObjectPtrC1EP7SQTable(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %13)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %8, ptr noundef nonnull align 8 dereferenceable(16) %5)
          to label %15 unwind label %17

15:                                               ; preds = %2
  %16 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  ret void

17:                                               ; preds = %2
  %18 = landingpad { ptr, i32 }
          cleanup
  %19 = extractvalue { ptr, i32 } %18, 0
  store ptr %19, ptr %6, align 8
  %20 = extractvalue { ptr, i32 } %18, 1
  store i32 %20, ptr %7, align 4
  %21 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  br label %22

22:                                               ; preds = %17
  %23 = load ptr, ptr %6, align 8
  %24 = load i32, ptr %7, align 4
  %25 = insertvalue { ptr, i32 } poison, ptr %23, 0
  %26 = insertvalue { ptr, i32 } %25, i32 %24, 1
  resume { ptr, i32 } %26
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_newarray(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.SQObjectPtr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.SQVM, ptr %9, i32 0, i32 19
  %11 = load ptr, ptr %10, align 8
  %12 = load i64, ptr %4, align 8
  %13 = call noundef ptr @_ZN7SQArray6CreateEP13SQSharedStatex(ptr noundef %11, i64 noundef %12)
  %14 = call noundef ptr @_ZN11SQObjectPtrC1EP7SQArray(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %13)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %8, ptr noundef nonnull align 8 dereferenceable(16) %5)
          to label %15 unwind label %17

15:                                               ; preds = %2
  %16 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  ret void

17:                                               ; preds = %2
  %18 = landingpad { ptr, i32 }
          cleanup
  %19 = extractvalue { ptr, i32 } %18, 0
  store ptr %19, ptr %6, align 8
  %20 = extractvalue { ptr, i32 } %18, 1
  store i32 %20, ptr %7, align 4
  %21 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  br label %22

22:                                               ; preds = %17
  %23 = load ptr, ptr %6, align 8
  %24 = load i32, ptr %7, align 4
  %25 = insertvalue { ptr, i32 } poison, ptr %23, 0
  %26 = insertvalue { ptr, i32 } %25, i32 %24, 1
  resume { ptr, i32 } %26
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7SQArray6CreateEP13SQSharedStatex(ptr noundef %0, i64 noundef %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef 72)
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load i64, ptr %4, align 8
  %10 = call noundef ptr @_ZN7SQArrayC1EP13SQSharedStatex(ptr noundef nonnull align 8 dereferenceable(72) %7, ptr noundef %8, i64 noundef %9)
  %11 = load ptr, ptr %5, align 8
  ret ptr %11
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP7SQArray(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN11SQObjectPtrC2EP7SQArray(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_newclass(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %struct.SQObjectPtr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr null, ptr %6, align 8
  %12 = load i64, ptr %5, align 8
  %13 = icmp ne i64 %12, 0
  br i1 %13, label %14, label %28

14:                                               ; preds = %2
  %15 = load ptr, ptr %4, align 8
  %16 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %15, i64 noundef -1)
  store ptr %16, ptr %7, align 8
  %17 = load ptr, ptr %7, align 8
  %18 = getelementptr inbounds %struct.tagSQObject, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = icmp ne i32 %19, 134234112
  br i1 %20, label %21, label %24

21:                                               ; preds = %14
  %22 = load ptr, ptr %4, align 8
  %23 = call i64 @sq_throwerror(ptr noundef %22, ptr noundef @.str.1)
  store i64 %23, ptr %3, align 8
  br label %49

24:                                               ; preds = %14
  %25 = load ptr, ptr %7, align 8
  %26 = getelementptr inbounds %struct.tagSQObject, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  store ptr %27, ptr %6, align 8
  br label %28

28:                                               ; preds = %24, %2
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds %struct.SQVM, ptr %29, i32 0, i32 19
  %31 = load ptr, ptr %30, align 8
  %32 = load ptr, ptr %6, align 8
  %33 = call noundef ptr @_ZN7SQClass6CreateEP13SQSharedStatePS_(ptr noundef %31, ptr noundef %32)
  store ptr %33, ptr %8, align 8
  %34 = load ptr, ptr %6, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %38

36:                                               ; preds = %28
  %37 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %37)
  br label %38

38:                                               ; preds = %36, %28
  %39 = load ptr, ptr %4, align 8
  %40 = load ptr, ptr %8, align 8
  %41 = call noundef ptr @_ZN11SQObjectPtrC1EP7SQClass(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef %40)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %39, ptr noundef nonnull align 8 dereferenceable(16) %9)
          to label %42 unwind label %44

42:                                               ; preds = %38
  %43 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9) #10
  store i64 0, ptr %3, align 8
  br label %49

44:                                               ; preds = %38
  %45 = landingpad { ptr, i32 }
          cleanup
  %46 = extractvalue { ptr, i32 } %45, 0
  store ptr %46, ptr %10, align 8
  %47 = extractvalue { ptr, i32 } %45, 1
  store i32 %47, ptr %11, align 4
  %48 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9) #10
  br label %51

49:                                               ; preds = %42, %21
  %50 = load i64, ptr %3, align 8
  ret i64 %50

51:                                               ; preds = %44
  %52 = load ptr, ptr %10, align 8
  %53 = load i32, ptr %11, align 4
  %54 = insertvalue { ptr, i32 } poison, ptr %52, 0
  %55 = insertvalue { ptr, i32 } %54, i32 %53, 1
  resume { ptr, i32 } %55
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7SQClass6CreateEP13SQSharedStatePS_(ptr noundef %0, ptr noundef %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef 456)
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call noundef ptr @_ZN7SQClassC1EP13SQSharedStatePS_(ptr noundef nonnull align 8 dereferenceable(456) %7, ptr noundef %8, ptr noundef %9)
  %11 = load ptr, ptr %5, align 8
  ret ptr %11
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP7SQClass(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN11SQObjectPtrC2EP7SQClass(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_instanceof(ptr noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %6, i64 noundef -1)
  store ptr %7, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %8, i64 noundef -2)
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = icmp ne i32 %12, 167804928
  br i1 %13, label %19, label %14

14:                                               ; preds = %1
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.tagSQObject, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp ne i32 %17, 134234112
  br i1 %18, label %19, label %22

19:                                               ; preds = %14, %1
  %20 = load ptr, ptr %3, align 8
  %21 = call i64 @sq_throwerror(ptr noundef %20, ptr noundef @.str.2)
  store i64 %21, ptr %2, align 8
  br label %33

22:                                               ; preds = %14
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds %struct.tagSQObject, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = call noundef zeroext i1 @_ZN10SQInstance10InstanceOfEP7SQClass(ptr noundef nonnull align 8 dereferenceable(104) %25, ptr noundef %28)
  %30 = zext i1 %29 to i64
  %31 = select i1 %29, i32 1, i32 0
  %32 = sext i32 %31 to i64
  store i64 %32, ptr %2, align 8
  br label %33

33:                                               ; preds = %22, %19
  %34 = load i64, ptr %2, align 8
  ret i64 %34
}

declare noundef zeroext i1 @_ZN10SQInstance10InstanceOfEP7SQClass(ptr noundef nonnull align 8 dereferenceable(104), ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_arrayappend(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call i64 @sq_gettop(ptr noundef %7)
  %9 = icmp slt i64 %8, 2
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = load ptr, ptr %4, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %11, ptr noundef @.str.3)
  store i64 -1, ptr %3, align 8
  br label %24

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8
  %14 = load i64, ptr %5, align 8
  %15 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %13, i64 noundef %14, i32 noundef 134217792, ptr noundef %6)
  br i1 %15, label %17, label %16

16:                                               ; preds = %12
  store i64 -1, ptr %3, align 8
  br label %24

17:                                               ; preds = %12
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %21, i64 noundef -1)
  call void @_ZN7SQArray6AppendERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(72) %20, ptr noundef nonnull align 8 dereferenceable(16) %22)
  %23 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %23)
  store i64 0, ptr %3, align 8
  br label %24

24:                                               ; preds = %17, %16, %10
  %25 = load i64, ptr %3, align 8
  ret i64 %25
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define i64 @sq_gettop(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 2
  %5 = load i64, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.SQVM, ptr %6, i32 0, i32 3
  %8 = load i64, ptr %7, align 8
  %9 = sub nsw i64 %5, %8
  ret i64 %9
}

declare void @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef, ...) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define internal noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %0, i64 noundef %1, i32 noundef %2, ptr noundef %3) #0 personality ptr @__gxx_personality_v0 {
  %5 = alloca i1, align 1
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca %struct.SQObjectPtr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i64 %1, ptr %7, align 8
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = load i64, ptr %7, align 8
  %15 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %13, i64 noundef %14)
  %16 = load ptr, ptr %9, align 8
  store ptr %15, ptr %16, align 8
  %17 = load ptr, ptr %9, align 8
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = load i32, ptr %8, align 4
  %22 = icmp ne i32 %20, %21
  br i1 %22, label %23, label %44

23:                                               ; preds = %4
  %24 = load ptr, ptr %6, align 8
  %25 = load ptr, ptr %9, align 8
  %26 = load ptr, ptr %25, align 8
  %27 = call noundef ptr @_ZN4SQVM11PrintObjValERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %24, ptr noundef nonnull align 8 dereferenceable(16) %26)
  %28 = call noundef ptr @_ZN11SQObjectPtrC1EP8SQString(ptr noundef nonnull align 8 dereferenceable(16) %10, ptr noundef %27)
  %29 = load ptr, ptr %6, align 8
  %30 = load i32, ptr %8, align 4
  %31 = invoke noundef ptr @_Z11IdType2Name15tagSQObjectType(i32 noundef %30)
          to label %32 unwind label %39

32:                                               ; preds = %23
  %33 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds %struct.SQString, ptr %34, i32 0, i32 5
  %36 = getelementptr inbounds [1 x i8], ptr %35, i64 0, i64 0
  invoke void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %29, ptr noundef @.str.52, ptr noundef %31, ptr noundef %36)
          to label %37 unwind label %39

37:                                               ; preds = %32
  store i1 false, ptr %5, align 1
  %38 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10) #10
  br label %45

39:                                               ; preds = %32, %23
  %40 = landingpad { ptr, i32 }
          cleanup
  %41 = extractvalue { ptr, i32 } %40, 0
  store ptr %41, ptr %11, align 8
  %42 = extractvalue { ptr, i32 } %40, 1
  store i32 %42, ptr %12, align 4
  %43 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10) #10
  br label %47

44:                                               ; preds = %4
  store i1 true, ptr %5, align 1
  br label %45

45:                                               ; preds = %44, %37
  %46 = load i1, ptr %5, align 1
  ret i1 %46

47:                                               ; preds = %39
  %48 = load ptr, ptr %11, align 8
  %49 = load i32, ptr %12, align 4
  %50 = insertvalue { ptr, i32 } poison, ptr %48, 0
  %51 = insertvalue { ptr, i32 } %50, i32 %49, 1
  resume { ptr, i32 } %51
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7SQArray6AppendERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(72) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) #0 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.SQObjectPtr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.SQArray, ptr %8, i32 0, i32 1
  %10 = load ptr, ptr %4, align 8
  %11 = call noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef nonnull align 8 dereferenceable(16) %10)
  %12 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN8sqvectorI11SQObjectPtrE9push_backERKS0_(ptr noundef nonnull align 8 dereferenceable(24) %9, ptr noundef nonnull align 8 dereferenceable(16) %5)
          to label %13 unwind label %15

13:                                               ; preds = %2
  %14 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  ret void

15:                                               ; preds = %2
  %16 = landingpad { ptr, i32 }
          cleanup
  %17 = extractvalue { ptr, i32 } %16, 0
  store ptr %17, ptr %6, align 8
  %18 = extractvalue { ptr, i32 } %16, 1
  store i32 %18, ptr %7, align 4
  %19 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  br label %20

20:                                               ; preds = %15
  %21 = load ptr, ptr %6, align 8
  %22 = load i32, ptr %7, align 4
  %23 = insertvalue { ptr, i32 } poison, ptr %21, 0
  %24 = insertvalue { ptr, i32 } %23, i32 %22, 1
  resume { ptr, i32 } %24
}

declare noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344), i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_arraypop(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = call i64 @sq_gettop(ptr noundef %9)
  %11 = icmp slt i64 %10, 1
  br i1 %11, label %12, label %14

12:                                               ; preds = %3
  %13 = load ptr, ptr %5, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %13, ptr noundef @.str.3)
  store i64 -1, ptr %4, align 8
  br label %41

14:                                               ; preds = %3
  %15 = load ptr, ptr %5, align 8
  %16 = load i64, ptr %6, align 8
  %17 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %15, i64 noundef %16, i32 noundef 134217792, ptr noundef %8)
  br i1 %17, label %19, label %18

18:                                               ; preds = %14
  store i64 -1, ptr %4, align 8
  br label %41

19:                                               ; preds = %14
  %20 = load ptr, ptr %8, align 8
  %21 = getelementptr inbounds %struct.tagSQObject, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = call noundef i64 @_ZNK7SQArray4SizeEv(ptr noundef nonnull align 8 dereferenceable(72) %22)
  %24 = icmp sgt i64 %23, 0
  br i1 %24, label %25, label %38

25:                                               ; preds = %19
  %26 = load i64, ptr %7, align 8
  %27 = icmp ne i64 %26, 0
  br i1 %27, label %28, label %34

28:                                               ; preds = %25
  %29 = load ptr, ptr %5, align 8
  %30 = load ptr, ptr %8, align 8
  %31 = getelementptr inbounds %struct.tagSQObject, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN7SQArray3TopEv(ptr noundef nonnull align 8 dereferenceable(72) %32)
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %29, ptr noundef nonnull align 8 dereferenceable(16) %33)
  br label %34

34:                                               ; preds = %28, %25
  %35 = load ptr, ptr %8, align 8
  %36 = getelementptr inbounds %struct.tagSQObject, ptr %35, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  call void @_ZN7SQArray3PopEv(ptr noundef nonnull align 8 dereferenceable(72) %37)
  store i64 0, ptr %4, align 8
  br label %41

38:                                               ; preds = %19
  %39 = load ptr, ptr %5, align 8
  %40 = call i64 @sq_throwerror(ptr noundef %39, ptr noundef @.str.4)
  store i64 %40, ptr %4, align 8
  br label %41

41:                                               ; preds = %38, %34, %18, %12
  %42 = load i64, ptr %4, align 8
  ret i64 %42
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNK7SQArray4SizeEv(ptr noundef nonnull align 8 dereferenceable(72) %0) #0 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQArray, ptr %3, i32 0, i32 1
  %5 = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %4)
  ret i64 %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN7SQArray3TopEv(ptr noundef nonnull align 8 dereferenceable(72) %0) #0 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQArray, ptr %3, i32 0, i32 1
  %5 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrE3topEv(ptr noundef nonnull align 8 dereferenceable(24) %4)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7SQArray3PopEv(ptr noundef nonnull align 8 dereferenceable(72) %0) #0 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQArray, ptr %3, i32 0, i32 1
  call void @_ZN8sqvectorI11SQObjectPtrE8pop_backEv(ptr noundef nonnull align 8 dereferenceable(24) %4)
  call void @_ZN7SQArray14ShrinkIfNeededEv(ptr noundef nonnull align 8 dereferenceable(72) %3)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_arrayresize(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = call i64 @sq_gettop(ptr noundef %9)
  %11 = icmp slt i64 %10, 1
  br i1 %11, label %12, label %14

12:                                               ; preds = %3
  %13 = load ptr, ptr %5, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %13, ptr noundef @.str.3)
  store i64 -1, ptr %4, align 8
  br label %30

14:                                               ; preds = %3
  %15 = load ptr, ptr %5, align 8
  %16 = load i64, ptr %6, align 8
  %17 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %15, i64 noundef %16, i32 noundef 134217792, ptr noundef %8)
  br i1 %17, label %19, label %18

18:                                               ; preds = %14
  store i64 -1, ptr %4, align 8
  br label %30

19:                                               ; preds = %14
  %20 = load i64, ptr %7, align 8
  %21 = icmp sge i64 %20, 0
  br i1 %21, label %22, label %27

22:                                               ; preds = %19
  %23 = load ptr, ptr %8, align 8
  %24 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = load i64, ptr %7, align 8
  call void @_ZN7SQArray6ResizeEx(ptr noundef nonnull align 8 dereferenceable(72) %25, i64 noundef %26)
  store i64 0, ptr %4, align 8
  br label %30

27:                                               ; preds = %19
  %28 = load ptr, ptr %5, align 8
  %29 = call i64 @sq_throwerror(ptr noundef %28, ptr noundef @.str.5)
  store i64 %29, ptr %4, align 8
  br label %30

30:                                               ; preds = %27, %22, %18, %12
  %31 = load i64, ptr %4, align 8
  ret i64 %31
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7SQArray6ResizeEx(ptr noundef nonnull align 8 dereferenceable(72) %0, i64 noundef %1) #0 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.SQObjectPtr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5)
  %10 = load i64, ptr %4, align 8
  invoke void @_ZN7SQArray6ResizeExR11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(72) %8, i64 noundef %10, ptr noundef nonnull align 8 dereferenceable(16) %5)
          to label %11 unwind label %13

11:                                               ; preds = %2
  %12 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  ret void

13:                                               ; preds = %2
  %14 = landingpad { ptr, i32 }
          cleanup
  %15 = extractvalue { ptr, i32 } %14, 0
  store ptr %15, ptr %6, align 8
  %16 = extractvalue { ptr, i32 } %14, 1
  store i32 %16, ptr %7, align 4
  %17 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  br label %18

18:                                               ; preds = %13
  %19 = load ptr, ptr %6, align 8
  %20 = load i32, ptr %7, align 4
  %21 = insertvalue { ptr, i32 } poison, ptr %19, 0
  %22 = insertvalue { ptr, i32 } %21, i32 %20, 1
  resume { ptr, i32 } %22
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_arrayreverse(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.SQObjectPtr, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = call i64 @sq_gettop(ptr noundef %14)
  %16 = icmp slt i64 %15, 1
  br i1 %16, label %17, label %19

17:                                               ; preds = %2
  %18 = load ptr, ptr %4, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %18, ptr noundef @.str.3)
  store i64 -1, ptr %3, align 8
  br label %86

19:                                               ; preds = %2
  %20 = load ptr, ptr %4, align 8
  %21 = load i64, ptr %5, align 8
  %22 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %20, i64 noundef %21, i32 noundef 134217792, ptr noundef %6)
  br i1 %22, label %24, label %23

23:                                               ; preds = %19
  store i64 -1, ptr %3, align 8
  br label %86

24:                                               ; preds = %19
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds %struct.tagSQObject, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  store ptr %27, ptr %7, align 8
  %28 = load ptr, ptr %7, align 8
  %29 = call noundef i64 @_ZNK7SQArray4SizeEv(ptr noundef nonnull align 8 dereferenceable(72) %28)
  %30 = icmp sgt i64 %29, 0
  br i1 %30, label %31, label %85

31:                                               ; preds = %24
  %32 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8)
  %33 = load ptr, ptr %7, align 8
  %34 = invoke noundef i64 @_ZNK7SQArray4SizeEv(ptr noundef nonnull align 8 dereferenceable(72) %33)
          to label %35 unwind label %78

35:                                               ; preds = %31
  store i64 %34, ptr %9, align 8
  %36 = load i64, ptr %9, align 8
  %37 = ashr i64 %36, 1
  store i64 %37, ptr %12, align 8
  %38 = load i64, ptr %9, align 8
  %39 = sub nsw i64 %38, 1
  store i64 %39, ptr %9, align 8
  store i64 0, ptr %13, align 8
  br label %40

40:                                               ; preds = %75, %35
  %41 = load i64, ptr %13, align 8
  %42 = load i64, ptr %12, align 8
  %43 = icmp slt i64 %41, %42
  br i1 %43, label %44, label %83

44:                                               ; preds = %40
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds %struct.SQArray, ptr %45, i32 0, i32 1
  %47 = load i64, ptr %13, align 8
  %48 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrEixEy(ptr noundef nonnull align 8 dereferenceable(24) %46, i64 noundef %47)
          to label %49 unwind label %78

49:                                               ; preds = %44
  %50 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull align 8 dereferenceable(16) %48)
          to label %51 unwind label %78

51:                                               ; preds = %49
  %52 = load ptr, ptr %7, align 8
  %53 = getelementptr inbounds %struct.SQArray, ptr %52, i32 0, i32 1
  %54 = load i64, ptr %9, align 8
  %55 = load i64, ptr %13, align 8
  %56 = sub nsw i64 %54, %55
  %57 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrEixEy(ptr noundef nonnull align 8 dereferenceable(24) %53, i64 noundef %56)
          to label %58 unwind label %78

58:                                               ; preds = %51
  %59 = load ptr, ptr %7, align 8
  %60 = getelementptr inbounds %struct.SQArray, ptr %59, i32 0, i32 1
  %61 = load i64, ptr %13, align 8
  %62 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrEixEy(ptr noundef nonnull align 8 dereferenceable(24) %60, i64 noundef %61)
          to label %63 unwind label %78

63:                                               ; preds = %58
  %64 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %62, ptr noundef nonnull align 8 dereferenceable(16) %57)
          to label %65 unwind label %78

65:                                               ; preds = %63
  %66 = load ptr, ptr %7, align 8
  %67 = getelementptr inbounds %struct.SQArray, ptr %66, i32 0, i32 1
  %68 = load i64, ptr %9, align 8
  %69 = load i64, ptr %13, align 8
  %70 = sub nsw i64 %68, %69
  %71 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrEixEy(ptr noundef nonnull align 8 dereferenceable(24) %67, i64 noundef %70)
          to label %72 unwind label %78

72:                                               ; preds = %65
  %73 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %71, ptr noundef nonnull align 8 dereferenceable(16) %8)
          to label %74 unwind label %78

74:                                               ; preds = %72
  br label %75

75:                                               ; preds = %74
  %76 = load i64, ptr %13, align 8
  %77 = add nsw i64 %76, 1
  store i64 %77, ptr %13, align 8
  br label %40, !llvm.loop !9

78:                                               ; preds = %72, %65, %63, %58, %51, %49, %44, %31
  %79 = landingpad { ptr, i32 }
          cleanup
  %80 = extractvalue { ptr, i32 } %79, 0
  store ptr %80, ptr %10, align 8
  %81 = extractvalue { ptr, i32 } %79, 1
  store i32 %81, ptr %11, align 4
  %82 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #10
  br label %88

83:                                               ; preds = %40
  store i64 0, ptr %3, align 8
  %84 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #10
  br label %86

85:                                               ; preds = %24
  store i64 0, ptr %3, align 8
  br label %86

86:                                               ; preds = %85, %83, %23, %17
  %87 = load i64, ptr %3, align 8
  ret i64 %87

88:                                               ; preds = %78
  %89 = load ptr, ptr %10, align 8
  %90 = load i32, ptr %11, align 4
  %91 = insertvalue { ptr, i32 } poison, ptr %89, 0
  %92 = insertvalue { ptr, i32 } %91, i32 %90, 1
  resume { ptr, i32 } %92
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrEixEy(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #4 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = load i64, ptr %4, align 8
  %9 = getelementptr inbounds %struct.SQObjectPtr, ptr %7, i64 %8
  ret ptr %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca %union.tagSQObjectValue, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  store i32 %9, ptr %5, align 4
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 8 %10, i64 8, i1 false)
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.tagSQObject, ptr %11, i32 0, i32 1
  %13 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 8 %12, i64 8, i1 false)
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  store i32 %16, ptr %17, align 8
  %18 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = and i32 %19, 134217728
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %28

22:                                               ; preds = %2
  %23 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.SQRefCounted, ptr %24, i32 0, i32 1
  %26 = load i64, ptr %25, align 8
  %27 = add i64 %26, 1
  store i64 %27, ptr %25, align 8
  br label %28

28:                                               ; preds = %22, %2
  %29 = load i32, ptr %5, align 4
  %30 = and i32 %29, 134217728
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %43

32:                                               ; preds = %28
  %33 = load ptr, ptr %6, align 8
  %34 = getelementptr inbounds %struct.SQRefCounted, ptr %33, i32 0, i32 1
  %35 = load i64, ptr %34, align 8
  %36 = add i64 %35, -1
  store i64 %36, ptr %34, align 8
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %38, label %43

38:                                               ; preds = %32
  %39 = load ptr, ptr %6, align 8
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds ptr, ptr %40, i64 2
  %42 = load ptr, ptr %41, align 8
  call void %42(ptr noundef nonnull align 8 dereferenceable(24) %39)
  br label %43

43:                                               ; preds = %38, %32, %28
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_arrayremove(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = call i64 @sq_gettop(ptr noundef %9)
  %11 = icmp slt i64 %10, 1
  br i1 %11, label %12, label %14

12:                                               ; preds = %3
  %13 = load ptr, ptr %5, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %13, ptr noundef @.str.3)
  store i64 -1, ptr %4, align 8
  br label %31

14:                                               ; preds = %3
  %15 = load ptr, ptr %5, align 8
  %16 = load i64, ptr %6, align 8
  %17 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %15, i64 noundef %16, i32 noundef 134217792, ptr noundef %8)
  br i1 %17, label %19, label %18

18:                                               ; preds = %14
  store i64 -1, ptr %4, align 8
  br label %31

19:                                               ; preds = %14
  %20 = load ptr, ptr %8, align 8
  %21 = getelementptr inbounds %struct.tagSQObject, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = load i64, ptr %7, align 8
  %24 = call noundef zeroext i1 @_ZN7SQArray6RemoveEx(ptr noundef nonnull align 8 dereferenceable(72) %22, i64 noundef %23)
  br i1 %24, label %25, label %26

25:                                               ; preds = %19
  br label %29

26:                                               ; preds = %19
  %27 = load ptr, ptr %5, align 8
  %28 = call i64 @sq_throwerror(ptr noundef %27, ptr noundef @.str.6)
  br label %29

29:                                               ; preds = %26, %25
  %30 = phi i64 [ 0, %25 ], [ %28, %26 ]
  store i64 %30, ptr %4, align 8
  br label %31

31:                                               ; preds = %29, %18, %12
  %32 = load i64, ptr %4, align 8
  ret i64 %32
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZN7SQArray6RemoveEx(ptr noundef nonnull align 8 dereferenceable(72) %0, i64 noundef %1) #0 align 2 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load i64, ptr %5, align 8
  %8 = icmp slt i64 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %2
  %10 = load i64, ptr %5, align 8
  %11 = getelementptr inbounds %struct.SQArray, ptr %6, i32 0, i32 1
  %12 = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %11)
  %13 = icmp sge i64 %10, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %9, %2
  store i1 false, ptr %3, align 1
  br label %18

15:                                               ; preds = %9
  %16 = getelementptr inbounds %struct.SQArray, ptr %6, i32 0, i32 1
  %17 = load i64, ptr %5, align 8
  call void @_ZN8sqvectorI11SQObjectPtrE6removeEy(ptr noundef nonnull align 8 dereferenceable(24) %16, i64 noundef %17)
  call void @_ZN7SQArray14ShrinkIfNeededEv(ptr noundef nonnull align 8 dereferenceable(72) %6)
  store i1 true, ptr %3, align 1
  br label %18

18:                                               ; preds = %15, %14
  %19 = load i1, ptr %3, align 1
  ret i1 %19
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_arrayinsert(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = call i64 @sq_gettop(ptr noundef %10)
  %12 = icmp slt i64 %11, 1
  br i1 %12, label %13, label %15

13:                                               ; preds = %3
  %14 = load ptr, ptr %5, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %14, ptr noundef @.str.3)
  store i64 -1, ptr %4, align 8
  br label %36

15:                                               ; preds = %3
  %16 = load ptr, ptr %5, align 8
  %17 = load i64, ptr %6, align 8
  %18 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %16, i64 noundef %17, i32 noundef 134217792, ptr noundef %8)
  br i1 %18, label %20, label %19

19:                                               ; preds = %15
  store i64 -1, ptr %4, align 8
  br label %36

20:                                               ; preds = %15
  %21 = load ptr, ptr %8, align 8
  %22 = getelementptr inbounds %struct.tagSQObject, ptr %21, i32 0, i32 1
  %23 = load ptr, ptr %22, align 8
  %24 = load i64, ptr %7, align 8
  %25 = load ptr, ptr %5, align 8
  %26 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %25, i64 noundef -1)
  %27 = call noundef zeroext i1 @_ZN7SQArray6InsertExRK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(72) %23, i64 noundef %24, ptr noundef nonnull align 8 dereferenceable(16) %26)
  br i1 %27, label %28, label %29

28:                                               ; preds = %20
  br label %32

29:                                               ; preds = %20
  %30 = load ptr, ptr %5, align 8
  %31 = call i64 @sq_throwerror(ptr noundef %30, ptr noundef @.str.6)
  br label %32

32:                                               ; preds = %29, %28
  %33 = phi i64 [ 0, %28 ], [ %31, %29 ]
  store i64 %33, ptr %9, align 8
  %34 = load ptr, ptr %5, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %34)
  %35 = load i64, ptr %9, align 8
  store i64 %35, ptr %4, align 8
  br label %36

36:                                               ; preds = %32, %19, %13
  %37 = load i64, ptr %4, align 8
  ret i64 %37
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZN7SQArray6InsertExRK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(72) %0, i64 noundef %1, ptr noundef nonnull align 8 dereferenceable(16) %2) #0 align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.SQObjectPtr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = load i64, ptr %6, align 8
  %13 = icmp slt i64 %12, 0
  br i1 %13, label %19, label %14

14:                                               ; preds = %3
  %15 = load i64, ptr %6, align 8
  %16 = getelementptr inbounds %struct.SQArray, ptr %11, i32 0, i32 1
  %17 = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %16)
  %18 = icmp sgt i64 %15, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %14, %3
  store i1 false, ptr %4, align 1
  br label %32

20:                                               ; preds = %14
  %21 = getelementptr inbounds %struct.SQArray, ptr %11, i32 0, i32 1
  %22 = load i64, ptr %6, align 8
  %23 = load ptr, ptr %7, align 8
  %24 = call noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull align 8 dereferenceable(16) %23)
  invoke void @_ZN8sqvectorI11SQObjectPtrE6insertEyRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %21, i64 noundef %22, ptr noundef nonnull align 8 dereferenceable(16) %8)
          to label %25 unwind label %27

25:                                               ; preds = %20
  %26 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #10
  store i1 true, ptr %4, align 1
  br label %32

27:                                               ; preds = %20
  %28 = landingpad { ptr, i32 }
          cleanup
  %29 = extractvalue { ptr, i32 } %28, 0
  store ptr %29, ptr %9, align 8
  %30 = extractvalue { ptr, i32 } %28, 1
  store i32 %30, ptr %10, align 4
  %31 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #10
  br label %34

32:                                               ; preds = %25, %19
  %33 = load i1, ptr %4, align 1
  ret i1 %33

34:                                               ; preds = %27
  %35 = load ptr, ptr %9, align 8
  %36 = load i32, ptr %10, align 4
  %37 = insertvalue { ptr, i32 } poison, ptr %35, 0
  %38 = insertvalue { ptr, i32 } %37, i32 %36, 1
  resume { ptr, i32 } %38
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_newclosure(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca %struct.SQObjectPtr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.SQVM, ptr %12, i32 0, i32 19
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = load i64, ptr %6, align 8
  %17 = call noundef ptr @_ZN15SQNativeClosure6CreateEP13SQSharedStatePFxP4SQVMEx(ptr noundef %14, ptr noundef %15, i64 noundef %16)
  store ptr %17, ptr %7, align 8
  %18 = load ptr, ptr %7, align 8
  %19 = getelementptr inbounds %struct.SQNativeClosure, ptr %18, i32 0, i32 1
  store i64 0, ptr %19, align 8
  store i64 0, ptr %8, align 8
  br label %20

20:                                               ; preds = %34, %3
  %21 = load i64, ptr %8, align 8
  %22 = load i64, ptr %6, align 8
  %23 = icmp ult i64 %21, %22
  br i1 %23, label %24, label %37

24:                                               ; preds = %20
  %25 = load ptr, ptr %4, align 8
  %26 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM3TopEv(ptr noundef nonnull align 8 dereferenceable(344) %25)
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds %struct.SQNativeClosure, ptr %27, i32 0, i32 3
  %29 = load ptr, ptr %28, align 8
  %30 = load i64, ptr %8, align 8
  %31 = getelementptr inbounds %struct.SQObjectPtr, ptr %29, i64 %30
  %32 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %31, ptr noundef nonnull align 8 dereferenceable(16) %26)
  %33 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %33)
  br label %34

34:                                               ; preds = %24
  %35 = load i64, ptr %8, align 8
  %36 = add i64 %35, 1
  store i64 %36, ptr %8, align 8
  br label %20, !llvm.loop !10

37:                                               ; preds = %20
  %38 = load ptr, ptr %4, align 8
  %39 = load ptr, ptr %7, align 8
  %40 = call noundef ptr @_ZN11SQObjectPtrC1EP15SQNativeClosure(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef %39)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %38, ptr noundef nonnull align 8 dereferenceable(16) %9)
          to label %41 unwind label %43

41:                                               ; preds = %37
  %42 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9) #10
  ret void

43:                                               ; preds = %37
  %44 = landingpad { ptr, i32 }
          cleanup
  %45 = extractvalue { ptr, i32 } %44, 0
  store ptr %45, ptr %10, align 8
  %46 = extractvalue { ptr, i32 } %44, 1
  store i32 %46, ptr %11, align 4
  %47 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9) #10
  br label %48

48:                                               ; preds = %43
  %49 = load ptr, ptr %10, align 8
  %50 = load i32, ptr %11, align 4
  %51 = insertvalue { ptr, i32 } poison, ptr %49, 0
  %52 = insertvalue { ptr, i32 } %51, i32 %50, 1
  resume { ptr, i32 } %52
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN15SQNativeClosure6CreateEP13SQSharedStatePFxP4SQVMEx(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %10 = load i64, ptr %6, align 8
  %11 = mul i64 %10, 16
  %12 = add i64 128, %11
  store i64 %12, ptr %7, align 8
  %13 = load i64, ptr %7, align 8
  %14 = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef %13)
  store ptr %14, ptr %8, align 8
  %15 = load ptr, ptr %8, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = call noundef ptr @_ZN15SQNativeClosureC1EP13SQSharedStatePFxP4SQVME(ptr noundef nonnull align 8 dereferenceable(128) %15, ptr noundef %16, ptr noundef %17)
  %19 = load ptr, ptr %8, align 8
  %20 = getelementptr inbounds %struct.SQNativeClosure, ptr %19, i64 1
  %21 = load ptr, ptr %8, align 8
  %22 = getelementptr inbounds %struct.SQNativeClosure, ptr %21, i32 0, i32 3
  store ptr %20, ptr %22, align 8
  %23 = load i64, ptr %6, align 8
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr inbounds %struct.SQNativeClosure, ptr %24, i32 0, i32 4
  store i64 %23, ptr %25, align 8
  store i64 0, ptr %9, align 8
  br label %26

26:                                               ; preds = %39, %3
  %27 = load i64, ptr %9, align 8
  %28 = load ptr, ptr %8, align 8
  %29 = getelementptr inbounds %struct.SQNativeClosure, ptr %28, i32 0, i32 4
  %30 = load i64, ptr %29, align 8
  %31 = icmp slt i64 %27, %30
  br i1 %31, label %32, label %42

32:                                               ; preds = %26
  %33 = load ptr, ptr %8, align 8
  %34 = getelementptr inbounds %struct.SQNativeClosure, ptr %33, i32 0, i32 3
  %35 = load ptr, ptr %34, align 8
  %36 = load i64, ptr %9, align 8
  %37 = getelementptr inbounds %struct.SQObjectPtr, ptr %35, i64 %36
  %38 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %37)
  br label %39

39:                                               ; preds = %32
  %40 = load i64, ptr %9, align 8
  %41 = add nsw i64 %40, 1
  store i64 %41, ptr %9, align 8
  br label %26, !llvm.loop !11

42:                                               ; preds = %26
  %43 = load ptr, ptr %8, align 8
  ret ptr %43
}

declare noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM3TopEv(ptr noundef nonnull align 8 dereferenceable(344)) #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP15SQNativeClosure(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN11SQObjectPtrC2EP15SQNativeClosure(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getclosureinfo(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca %struct.tagSQObject, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store i64 %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %14 = load ptr, ptr %6, align 8
  %15 = load i64, ptr %7, align 8
  %16 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %14, i64 noundef %15)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 %16, i64 16, i1 false)
  %17 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  %19 = icmp eq i32 %18, 134217984
  br i1 %19, label %20, label %34

20:                                               ; preds = %4
  %21 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %11, align 8
  %23 = load ptr, ptr %11, align 8
  %24 = getelementptr inbounds %struct.SQClosure, ptr %23, i32 0, i32 4
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %12, align 8
  %26 = load ptr, ptr %12, align 8
  %27 = getelementptr inbounds %struct.SQFunctionProto, ptr %26, i32 0, i32 12
  %28 = load i64, ptr %27, align 8
  %29 = load ptr, ptr %8, align 8
  store i64 %28, ptr %29, align 8
  %30 = load ptr, ptr %12, align 8
  %31 = getelementptr inbounds %struct.SQFunctionProto, ptr %30, i32 0, i32 16
  %32 = load i64, ptr %31, align 8
  %33 = load ptr, ptr %9, align 8
  store i64 %32, ptr %33, align 8
  store i64 0, ptr %5, align 8
  br label %53

34:                                               ; preds = %4
  %35 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 0
  %36 = load i32, ptr %35, align 8
  %37 = icmp eq i32 %36, 134218240
  br i1 %37, label %38, label %49

38:                                               ; preds = %34
  %39 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  store ptr %40, ptr %13, align 8
  %41 = load ptr, ptr %13, align 8
  %42 = getelementptr inbounds %struct.SQNativeClosure, ptr %41, i32 0, i32 1
  %43 = load i64, ptr %42, align 8
  %44 = load ptr, ptr %8, align 8
  store i64 %43, ptr %44, align 8
  %45 = load ptr, ptr %13, align 8
  %46 = getelementptr inbounds %struct.SQNativeClosure, ptr %45, i32 0, i32 4
  %47 = load i64, ptr %46, align 8
  %48 = load ptr, ptr %9, align 8
  store i64 %47, ptr %48, align 8
  store i64 0, ptr %5, align 8
  br label %53

49:                                               ; preds = %34
  br label %50

50:                                               ; preds = %49
  %51 = load ptr, ptr %6, align 8
  %52 = call i64 @sq_throwerror(ptr noundef %51, ptr noundef @.str.7)
  store i64 %52, ptr %5, align 8
  br label %53

53:                                               ; preds = %50, %38, %20
  %54 = load i64, ptr %5, align 8
  ret i64 %54
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setnativeclosurename(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.tagSQObject, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load i64, ptr %6, align 8
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %10, i64 noundef %11)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 8 %12, i64 16, i1 false)
  %13 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  %15 = icmp eq i32 %14, 134218240
  br i1 %15, label %16, label %27

16:                                               ; preds = %3
  %17 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %9, align 8
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds %struct.SQVM, ptr %19, i32 0, i32 19
  %21 = load ptr, ptr %20, align 8
  %22 = load ptr, ptr %7, align 8
  %23 = call noundef ptr @_ZN8SQString6CreateEP13SQSharedStatePKcx(ptr noundef %21, ptr noundef %22, i64 noundef -1)
  %24 = load ptr, ptr %9, align 8
  %25 = getelementptr inbounds %struct.SQNativeClosure, ptr %24, i32 0, i32 7
  %26 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP8SQString(ptr noundef nonnull align 8 dereferenceable(16) %25, ptr noundef %23)
  store i64 0, ptr %4, align 8
  br label %30

27:                                               ; preds = %3
  %28 = load ptr, ptr %5, align 8
  %29 = call i64 @sq_throwerror(ptr noundef %28, ptr noundef @.str.8)
  store i64 %29, ptr %4, align 8
  br label %30

30:                                               ; preds = %27, %16
  %31 = load i64, ptr %4, align 8
  ret i64 %31
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP8SQString(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca %union.tagSQObjectValue, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  store i32 %9, ptr %5, align 4
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 8 %10, i64 8, i1 false)
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  store i32 134217744, ptr %11, align 8
  %12 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  store i64 0, ptr %12, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  store ptr %13, ptr %14, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.SQRefCounted, ptr %16, i32 0, i32 1
  %18 = load i64, ptr %17, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr %17, align 8
  %20 = load i32, ptr %5, align 4
  %21 = and i32 %20, 134217728
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %34

23:                                               ; preds = %2
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds %struct.SQRefCounted, ptr %24, i32 0, i32 1
  %26 = load i64, ptr %25, align 8
  %27 = add i64 %26, -1
  store i64 %27, ptr %25, align 8
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %29, label %34

29:                                               ; preds = %23
  %30 = load ptr, ptr %6, align 8
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds ptr, ptr %31, i64 2
  %33 = load ptr, ptr %32, align 8
  call void %33(ptr noundef nonnull align 8 dereferenceable(24) %30)
  br label %34

34:                                               ; preds = %29, %23, %2
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setparamscheck(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 personality ptr @__gxx_personality_v0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.tagSQObject, align 8
  %9 = alloca ptr, align 8
  %10 = alloca %class.sqvector.2, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %15, i64 noundef -1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 8 %16, i64 16, i1 false)
  %17 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  %19 = icmp eq i32 %18, 134218240
  br i1 %19, label %23, label %20

20:                                               ; preds = %3
  %21 = load ptr, ptr %5, align 8
  %22 = call i64 @sq_throwerror(ptr noundef %21, ptr noundef @.str.9)
  store i64 %22, ptr %4, align 8
  br label %66

23:                                               ; preds = %3
  %24 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %9, align 8
  %26 = load i64, ptr %6, align 8
  %27 = load ptr, ptr %9, align 8
  %28 = getelementptr inbounds %struct.SQNativeClosure, ptr %27, i32 0, i32 1
  store i64 %26, ptr %28, align 8
  %29 = load ptr, ptr %7, align 8
  %30 = icmp ne ptr %29, null
  br i1 %30, label %31, label %53

31:                                               ; preds = %23
  %32 = call noundef ptr @_ZN8sqvectorIxEC1Ev(ptr noundef nonnull align 8 dereferenceable(24) %10)
  %33 = load ptr, ptr %7, align 8
  %34 = invoke noundef zeroext i1 @_Z15CompileTypemaskR8sqvectorIxEPKc(ptr noundef nonnull align 8 dereferenceable(24) %10, ptr noundef %33)
          to label %35 unwind label %40

35:                                               ; preds = %31
  br i1 %34, label %45, label %36

36:                                               ; preds = %35
  %37 = load ptr, ptr %5, align 8
  %38 = invoke i64 @sq_throwerror(ptr noundef %37, ptr noundef @.str.10)
          to label %39 unwind label %40

39:                                               ; preds = %36
  store i64 %38, ptr %4, align 8
  store i32 1, ptr %13, align 4
  br label %49

40:                                               ; preds = %45, %36, %31
  %41 = landingpad { ptr, i32 }
          cleanup
  %42 = extractvalue { ptr, i32 } %41, 0
  store ptr %42, ptr %11, align 8
  %43 = extractvalue { ptr, i32 } %41, 1
  store i32 %43, ptr %12, align 4
  %44 = call noundef ptr @_ZN8sqvectorIxED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %10) #10
  br label %68

45:                                               ; preds = %35
  %46 = load ptr, ptr %9, align 8
  %47 = getelementptr inbounds %struct.SQNativeClosure, ptr %46, i32 0, i32 2
  invoke void @_ZN8sqvectorIxE4copyERKS0_(ptr noundef nonnull align 8 dereferenceable(24) %47, ptr noundef nonnull align 8 dereferenceable(24) %10)
          to label %48 unwind label %40

48:                                               ; preds = %45
  store i32 0, ptr %13, align 4
  br label %49

49:                                               ; preds = %48, %39
  %50 = call noundef ptr @_ZN8sqvectorIxED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %10) #10
  %51 = load i32, ptr %13, align 4
  switch i32 %51, label %73 [
    i32 0, label %52
    i32 1, label %66
  ]

52:                                               ; preds = %49
  br label %56

53:                                               ; preds = %23
  %54 = load ptr, ptr %9, align 8
  %55 = getelementptr inbounds %struct.SQNativeClosure, ptr %54, i32 0, i32 2
  store i64 0, ptr %14, align 8
  call void @_ZN8sqvectorIxE6resizeEyRKx(ptr noundef nonnull align 8 dereferenceable(24) %55, i64 noundef 0, ptr noundef nonnull align 8 dereferenceable(8) %14)
  br label %56

56:                                               ; preds = %53, %52
  %57 = load i64, ptr %6, align 8
  %58 = icmp eq i64 %57, -99999
  br i1 %58, label %59, label %65

59:                                               ; preds = %56
  %60 = load ptr, ptr %9, align 8
  %61 = getelementptr inbounds %struct.SQNativeClosure, ptr %60, i32 0, i32 2
  %62 = call noundef i64 @_ZNK8sqvectorIxE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %61)
  %63 = load ptr, ptr %9, align 8
  %64 = getelementptr inbounds %struct.SQNativeClosure, ptr %63, i32 0, i32 1
  store i64 %62, ptr %64, align 8
  br label %65

65:                                               ; preds = %59, %56
  store i64 0, ptr %4, align 8
  br label %66

66:                                               ; preds = %65, %49, %20
  %67 = load i64, ptr %4, align 8
  ret i64 %67

68:                                               ; preds = %40
  %69 = load ptr, ptr %11, align 8
  %70 = load i32, ptr %12, align 4
  %71 = insertvalue { ptr, i32 } poison, ptr %69, 0
  %72 = insertvalue { ptr, i32 } %71, i32 %70, 1
  resume { ptr, i32 } %72

73:                                               ; preds = %49
  unreachable
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorIxEC1Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN8sqvectorIxEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %3)
  ret ptr %3
}

declare noundef zeroext i1 @_Z15CompileTypemaskR8sqvectorIxEPKc(ptr noundef nonnull align 8 dereferenceable(24), ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorIxE4copyERKS0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %class.sqvector.2, ptr %7, i32 0, i32 1
  %9 = load i64, ptr %8, align 8
  %10 = icmp ne i64 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %2
  store i64 0, ptr %5, align 8
  call void @_ZN8sqvectorIxE6resizeEyRKx(ptr noundef nonnull align 8 dereferenceable(24) %7, i64 noundef 0, ptr noundef nonnull align 8 dereferenceable(8) %5)
  br label %12

12:                                               ; preds = %11, %2
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %class.sqvector.2, ptr %13, i32 0, i32 1
  %15 = load i64, ptr %14, align 8
  %16 = getelementptr inbounds %class.sqvector.2, ptr %7, i32 0, i32 2
  %17 = load i64, ptr %16, align 8
  %18 = icmp ugt i64 %15, %17
  br i1 %18, label %19, label %23

19:                                               ; preds = %12
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %class.sqvector.2, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  call void @_ZN8sqvectorIxE8_reallocEy(ptr noundef nonnull align 8 dereferenceable(24) %7, i64 noundef %22)
  br label %23

23:                                               ; preds = %19, %12
  store i64 0, ptr %6, align 8
  br label %24

24:                                               ; preds = %41, %23
  %25 = load i64, ptr %6, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %class.sqvector.2, ptr %26, i32 0, i32 1
  %28 = load i64, ptr %27, align 8
  %29 = icmp ult i64 %25, %28
  br i1 %29, label %30, label %44

30:                                               ; preds = %24
  %31 = getelementptr inbounds %class.sqvector.2, ptr %7, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = load i64, ptr %6, align 8
  %34 = getelementptr inbounds i64, ptr %32, i64 %33
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds %class.sqvector.2, ptr %35, i32 0, i32 0
  %37 = load ptr, ptr %36, align 8
  %38 = load i64, ptr %6, align 8
  %39 = getelementptr inbounds i64, ptr %37, i64 %38
  %40 = load i64, ptr %39, align 8
  store i64 %40, ptr %34, align 8
  br label %41

41:                                               ; preds = %30
  %42 = load i64, ptr %6, align 8
  %43 = add i64 %42, 1
  store i64 %43, ptr %6, align 8
  br label %24, !llvm.loop !12

44:                                               ; preds = %24
  %45 = load ptr, ptr %4, align 8
  %46 = getelementptr inbounds %class.sqvector.2, ptr %45, i32 0, i32 1
  %47 = load i64, ptr %46, align 8
  %48 = getelementptr inbounds %class.sqvector.2, ptr %7, i32 0, i32 1
  store i64 %47, ptr %48, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorIxED1Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN8sqvectorIxED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #10
  ret ptr %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorIxE6resizeEyRKx(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, ptr noundef nonnull align 8 dereferenceable(8) %2) #0 align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load i64, ptr %5, align 8
  %10 = getelementptr inbounds %class.sqvector.2, ptr %8, i32 0, i32 2
  %11 = load i64, ptr %10, align 8
  %12 = icmp ugt i64 %9, %11
  br i1 %12, label %13, label %15

13:                                               ; preds = %3
  %14 = load i64, ptr %5, align 8
  call void @_ZN8sqvectorIxE8_reallocEy(ptr noundef nonnull align 8 dereferenceable(24) %8, i64 noundef %14)
  br label %15

15:                                               ; preds = %13, %3
  %16 = load i64, ptr %5, align 8
  %17 = getelementptr inbounds %class.sqvector.2, ptr %8, i32 0, i32 1
  %18 = load i64, ptr %17, align 8
  %19 = icmp ugt i64 %16, %18
  br i1 %19, label %20, label %38

20:                                               ; preds = %15
  br label %21

21:                                               ; preds = %26, %20
  %22 = getelementptr inbounds %class.sqvector.2, ptr %8, i32 0, i32 1
  %23 = load i64, ptr %22, align 8
  %24 = load i64, ptr %5, align 8
  %25 = icmp ult i64 %23, %24
  br i1 %25, label %26, label %37

26:                                               ; preds = %21
  %27 = getelementptr inbounds %class.sqvector.2, ptr %8, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds %class.sqvector.2, ptr %8, i32 0, i32 1
  %30 = load i64, ptr %29, align 8
  %31 = getelementptr inbounds i64, ptr %28, i64 %30
  %32 = load ptr, ptr %6, align 8
  %33 = load i64, ptr %32, align 8
  store i64 %33, ptr %31, align 8
  %34 = getelementptr inbounds %class.sqvector.2, ptr %8, i32 0, i32 1
  %35 = load i64, ptr %34, align 8
  %36 = add i64 %35, 1
  store i64 %36, ptr %34, align 8
  br label %21, !llvm.loop !13

37:                                               ; preds = %21
  br label %56

38:                                               ; preds = %15
  %39 = load i64, ptr %5, align 8
  store i64 %39, ptr %7, align 8
  br label %40

40:                                               ; preds = %50, %38
  %41 = load i64, ptr %7, align 8
  %42 = getelementptr inbounds %class.sqvector.2, ptr %8, i32 0, i32 1
  %43 = load i64, ptr %42, align 8
  %44 = icmp ult i64 %41, %43
  br i1 %44, label %45, label %53

45:                                               ; preds = %40
  %46 = getelementptr inbounds %class.sqvector.2, ptr %8, i32 0, i32 0
  %47 = load ptr, ptr %46, align 8
  %48 = load i64, ptr %7, align 8
  %49 = getelementptr inbounds i64, ptr %47, i64 %48
  br label %50

50:                                               ; preds = %45
  %51 = load i64, ptr %7, align 8
  %52 = add i64 %51, 1
  store i64 %52, ptr %7, align 8
  br label %40, !llvm.loop !14

53:                                               ; preds = %40
  %54 = load i64, ptr %5, align 8
  %55 = getelementptr inbounds %class.sqvector.2, ptr %8, i32 0, i32 1
  store i64 %54, ptr %55, align 8
  br label %56

56:                                               ; preds = %53, %37
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNK8sqvectorIxE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.sqvector.2, ptr %3, i32 0, i32 1
  %5 = load i64, ptr %4, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_bindenv(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %struct.SQObjectPtr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = load i64, ptr %5, align 8
  %16 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %14, i64 noundef %15)
  store ptr %16, ptr %6, align 8
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds %struct.tagSQObject, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = icmp eq i32 %19, 134218240
  br i1 %20, label %29, label %21

21:                                               ; preds = %2
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds %struct.tagSQObject, ptr %22, i32 0, i32 0
  %24 = load i32, ptr %23, align 8
  %25 = icmp eq i32 %24, 134217984
  br i1 %25, label %29, label %26

26:                                               ; preds = %21
  %27 = load ptr, ptr %4, align 8
  %28 = call i64 @sq_throwerror(ptr noundef %27, ptr noundef @.str.11)
  store i64 %28, ptr %3, align 8
  br label %193

29:                                               ; preds = %21, %2
  %30 = load ptr, ptr %4, align 8
  %31 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %30, i64 noundef -1)
  store ptr %31, ptr %7, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds %struct.tagSQObject, ptr %32, i32 0, i32 0
  %34 = load i32, ptr %33, align 8
  %35 = icmp eq i32 %34, 167772192
  br i1 %35, label %54, label %36

36:                                               ; preds = %29
  %37 = load ptr, ptr %7, align 8
  %38 = getelementptr inbounds %struct.tagSQObject, ptr %37, i32 0, i32 0
  %39 = load i32, ptr %38, align 8
  %40 = icmp eq i32 %39, 134217792
  br i1 %40, label %54, label %41

41:                                               ; preds = %36
  %42 = load ptr, ptr %7, align 8
  %43 = getelementptr inbounds %struct.tagSQObject, ptr %42, i32 0, i32 0
  %44 = load i32, ptr %43, align 8
  %45 = icmp eq i32 %44, 134234112
  br i1 %45, label %54, label %46

46:                                               ; preds = %41
  %47 = load ptr, ptr %7, align 8
  %48 = getelementptr inbounds %struct.tagSQObject, ptr %47, i32 0, i32 0
  %49 = load i32, ptr %48, align 8
  %50 = icmp eq i32 %49, 167804928
  br i1 %50, label %54, label %51

51:                                               ; preds = %46
  %52 = load ptr, ptr %4, align 8
  %53 = call i64 @sq_throwerror(ptr noundef %52, ptr noundef @.str.12)
  store i64 %53, ptr %3, align 8
  br label %193

54:                                               ; preds = %46, %41, %36, %29
  %55 = load ptr, ptr %7, align 8
  %56 = getelementptr inbounds %struct.tagSQObject, ptr %55, i32 0, i32 1
  %57 = load ptr, ptr %56, align 8
  %58 = load ptr, ptr %7, align 8
  %59 = getelementptr inbounds %struct.tagSQObject, ptr %58, i32 0, i32 0
  %60 = load i32, ptr %59, align 8
  %61 = call noundef ptr @_ZN12SQRefCounted10GetWeakRefE15tagSQObjectType(ptr noundef nonnull align 8 dereferenceable(24) %57, i32 noundef %60)
  store ptr %61, ptr %8, align 8
  %62 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9)
  %63 = load ptr, ptr %6, align 8
  %64 = getelementptr inbounds %struct.tagSQObject, ptr %63, i32 0, i32 0
  %65 = load i32, ptr %64, align 8
  %66 = icmp eq i32 %65, 134217984
  br i1 %66, label %67, label %140

67:                                               ; preds = %54
  %68 = load ptr, ptr %6, align 8
  %69 = getelementptr inbounds %struct.tagSQObject, ptr %68, i32 0, i32 1
  %70 = load ptr, ptr %69, align 8
  %71 = invoke noundef ptr @_ZN9SQClosure5CloneEv(ptr noundef nonnull align 8 dereferenceable(96) %70)
          to label %72 unwind label %98

72:                                               ; preds = %67
  store ptr %71, ptr %10, align 8
  %73 = load ptr, ptr %10, align 8
  %74 = getelementptr inbounds %struct.SQClosure, ptr %73, i32 0, i32 1
  %75 = load ptr, ptr %74, align 8
  %76 = icmp ne ptr %75, null
  br i1 %76, label %77, label %106

77:                                               ; preds = %72
  %78 = load ptr, ptr %10, align 8
  %79 = getelementptr inbounds %struct.SQClosure, ptr %78, i32 0, i32 1
  %80 = load ptr, ptr %79, align 8
  %81 = getelementptr inbounds %struct.SQRefCounted, ptr %80, i32 0, i32 1
  %82 = load i64, ptr %81, align 8
  %83 = add i64 %82, -1
  store i64 %83, ptr %81, align 8
  %84 = load ptr, ptr %10, align 8
  %85 = getelementptr inbounds %struct.SQClosure, ptr %84, i32 0, i32 1
  %86 = load ptr, ptr %85, align 8
  %87 = getelementptr inbounds %struct.SQRefCounted, ptr %86, i32 0, i32 1
  %88 = load i64, ptr %87, align 8
  %89 = icmp eq i64 %88, 0
  br i1 %89, label %90, label %103

90:                                               ; preds = %77
  %91 = load ptr, ptr %10, align 8
  %92 = getelementptr inbounds %struct.SQClosure, ptr %91, i32 0, i32 1
  %93 = load ptr, ptr %92, align 8
  %94 = load ptr, ptr %93, align 8
  %95 = getelementptr inbounds ptr, ptr %94, i64 2
  %96 = load ptr, ptr %95, align 8
  invoke void %96(ptr noundef nonnull align 8 dereferenceable(40) %93)
          to label %97 unwind label %98

97:                                               ; preds = %90
  br label %103

98:                                               ; preds = %189, %187, %174, %163, %140, %136, %90, %67
  %99 = landingpad { ptr, i32 }
          cleanup
  %100 = extractvalue { ptr, i32 } %99, 0
  store ptr %100, ptr %11, align 8
  %101 = extractvalue { ptr, i32 } %99, 1
  store i32 %101, ptr %12, align 4
  %102 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9) #10
  br label %195

103:                                              ; preds = %97, %77
  %104 = load ptr, ptr %10, align 8
  %105 = getelementptr inbounds %struct.SQClosure, ptr %104, i32 0, i32 1
  store ptr null, ptr %105, align 8
  br label %106

106:                                              ; preds = %103, %72
  %107 = load ptr, ptr %8, align 8
  %108 = load ptr, ptr %10, align 8
  %109 = getelementptr inbounds %struct.SQClosure, ptr %108, i32 0, i32 1
  store ptr %107, ptr %109, align 8
  %110 = load ptr, ptr %10, align 8
  %111 = getelementptr inbounds %struct.SQClosure, ptr %110, i32 0, i32 1
  %112 = load ptr, ptr %111, align 8
  %113 = getelementptr inbounds %struct.SQRefCounted, ptr %112, i32 0, i32 1
  %114 = load i64, ptr %113, align 8
  %115 = add i64 %114, 1
  store i64 %115, ptr %113, align 8
  %116 = load ptr, ptr %6, align 8
  %117 = getelementptr inbounds %struct.tagSQObject, ptr %116, i32 0, i32 1
  %118 = load ptr, ptr %117, align 8
  %119 = getelementptr inbounds %struct.SQClosure, ptr %118, i32 0, i32 3
  %120 = load ptr, ptr %119, align 8
  %121 = icmp ne ptr %120, null
  br i1 %121, label %122, label %136

122:                                              ; preds = %106
  %123 = load ptr, ptr %6, align 8
  %124 = getelementptr inbounds %struct.tagSQObject, ptr %123, i32 0, i32 1
  %125 = load ptr, ptr %124, align 8
  %126 = getelementptr inbounds %struct.SQClosure, ptr %125, i32 0, i32 3
  %127 = load ptr, ptr %126, align 8
  %128 = load ptr, ptr %10, align 8
  %129 = getelementptr inbounds %struct.SQClosure, ptr %128, i32 0, i32 3
  store ptr %127, ptr %129, align 8
  %130 = load ptr, ptr %10, align 8
  %131 = getelementptr inbounds %struct.SQClosure, ptr %130, i32 0, i32 3
  %132 = load ptr, ptr %131, align 8
  %133 = getelementptr inbounds %struct.SQRefCounted, ptr %132, i32 0, i32 1
  %134 = load i64, ptr %133, align 8
  %135 = add i64 %134, 1
  store i64 %135, ptr %133, align 8
  br label %136

136:                                              ; preds = %122, %106
  %137 = load ptr, ptr %10, align 8
  %138 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP9SQClosure(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef %137)
          to label %139 unwind label %98

139:                                              ; preds = %136
  br label %187

140:                                              ; preds = %54
  %141 = load ptr, ptr %6, align 8
  %142 = getelementptr inbounds %struct.tagSQObject, ptr %141, i32 0, i32 1
  %143 = load ptr, ptr %142, align 8
  %144 = invoke noundef ptr @_ZN15SQNativeClosure5CloneEv(ptr noundef nonnull align 8 dereferenceable(128) %143)
          to label %145 unwind label %98

145:                                              ; preds = %140
  store ptr %144, ptr %13, align 8
  %146 = load ptr, ptr %13, align 8
  %147 = getelementptr inbounds %struct.SQNativeClosure, ptr %146, i32 0, i32 5
  %148 = load ptr, ptr %147, align 8
  %149 = icmp ne ptr %148, null
  br i1 %149, label %150, label %174

150:                                              ; preds = %145
  %151 = load ptr, ptr %13, align 8
  %152 = getelementptr inbounds %struct.SQNativeClosure, ptr %151, i32 0, i32 5
  %153 = load ptr, ptr %152, align 8
  %154 = getelementptr inbounds %struct.SQRefCounted, ptr %153, i32 0, i32 1
  %155 = load i64, ptr %154, align 8
  %156 = add i64 %155, -1
  store i64 %156, ptr %154, align 8
  %157 = load ptr, ptr %13, align 8
  %158 = getelementptr inbounds %struct.SQNativeClosure, ptr %157, i32 0, i32 5
  %159 = load ptr, ptr %158, align 8
  %160 = getelementptr inbounds %struct.SQRefCounted, ptr %159, i32 0, i32 1
  %161 = load i64, ptr %160, align 8
  %162 = icmp eq i64 %161, 0
  br i1 %162, label %163, label %171

163:                                              ; preds = %150
  %164 = load ptr, ptr %13, align 8
  %165 = getelementptr inbounds %struct.SQNativeClosure, ptr %164, i32 0, i32 5
  %166 = load ptr, ptr %165, align 8
  %167 = load ptr, ptr %166, align 8
  %168 = getelementptr inbounds ptr, ptr %167, i64 2
  %169 = load ptr, ptr %168, align 8
  invoke void %169(ptr noundef nonnull align 8 dereferenceable(40) %166)
          to label %170 unwind label %98

170:                                              ; preds = %163
  br label %171

171:                                              ; preds = %170, %150
  %172 = load ptr, ptr %13, align 8
  %173 = getelementptr inbounds %struct.SQNativeClosure, ptr %172, i32 0, i32 5
  store ptr null, ptr %173, align 8
  br label %174

174:                                              ; preds = %171, %145
  %175 = load ptr, ptr %8, align 8
  %176 = load ptr, ptr %13, align 8
  %177 = getelementptr inbounds %struct.SQNativeClosure, ptr %176, i32 0, i32 5
  store ptr %175, ptr %177, align 8
  %178 = load ptr, ptr %13, align 8
  %179 = getelementptr inbounds %struct.SQNativeClosure, ptr %178, i32 0, i32 5
  %180 = load ptr, ptr %179, align 8
  %181 = getelementptr inbounds %struct.SQRefCounted, ptr %180, i32 0, i32 1
  %182 = load i64, ptr %181, align 8
  %183 = add i64 %182, 1
  store i64 %183, ptr %181, align 8
  %184 = load ptr, ptr %13, align 8
  %185 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP15SQNativeClosure(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef %184)
          to label %186 unwind label %98

186:                                              ; preds = %174
  br label %187

187:                                              ; preds = %186, %139
  %188 = load ptr, ptr %4, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %188)
          to label %189 unwind label %98

189:                                              ; preds = %187
  %190 = load ptr, ptr %4, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %190, ptr noundef nonnull align 8 dereferenceable(16) %9)
          to label %191 unwind label %98

191:                                              ; preds = %189
  store i64 0, ptr %3, align 8
  %192 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9) #10
  br label %193

193:                                              ; preds = %191, %51, %26
  %194 = load i64, ptr %3, align 8
  ret i64 %194

195:                                              ; preds = %98
  %196 = load ptr, ptr %11, align 8
  %197 = load i32, ptr %12, align 4
  %198 = insertvalue { ptr, i32 } poison, ptr %196, 0
  %199 = insertvalue { ptr, i32 } %198, i32 %197, 1
  resume { ptr, i32 } %199
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN9SQClosure5CloneEv(ptr noundef nonnull align 8 dereferenceable(96) %0) #0 align 2 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.SQClosure, ptr %7, i32 0, i32 4
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %3, align 8
  %10 = getelementptr inbounds %struct.SQCollectable, ptr %7, i32 0, i32 3
  %11 = load ptr, ptr %10, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.SQClosure, ptr %7, i32 0, i32 2
  %14 = load ptr, ptr %13, align 8
  %15 = call noundef ptr @_ZN9SQClosure6CreateEP13SQSharedStateP15SQFunctionProtoP9SQWeakRef(ptr noundef %11, ptr noundef %12, ptr noundef %14)
  store ptr %15, ptr %4, align 8
  %16 = getelementptr inbounds %struct.SQClosure, ptr %7, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.SQClosure, ptr %18, i32 0, i32 1
  store ptr %17, ptr %19, align 8
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %struct.SQClosure, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %31

24:                                               ; preds = %1
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.SQClosure, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %struct.SQRefCounted, ptr %27, i32 0, i32 1
  %29 = load i64, ptr %28, align 8
  %30 = add i64 %29, 1
  store i64 %30, ptr %28, align 8
  br label %31

31:                                               ; preds = %24, %1
  store i64 0, ptr %5, align 8
  br label %32

32:                                               ; preds = %49, %31
  %33 = load i64, ptr %5, align 8
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds %struct.SQFunctionProto, ptr %34, i32 0, i32 16
  %36 = load i64, ptr %35, align 8
  %37 = icmp slt i64 %33, %36
  br i1 %37, label %38, label %52

38:                                               ; preds = %32
  %39 = getelementptr inbounds %struct.SQClosure, ptr %7, i32 0, i32 5
  %40 = load ptr, ptr %39, align 8
  %41 = load i64, ptr %5, align 8
  %42 = getelementptr inbounds %struct.SQObjectPtr, ptr %40, i64 %41
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds %struct.SQClosure, ptr %43, i32 0, i32 5
  %45 = load ptr, ptr %44, align 8
  %46 = load i64, ptr %5, align 8
  %47 = getelementptr inbounds %struct.SQObjectPtr, ptr %45, i64 %46
  %48 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %47, ptr noundef nonnull align 8 dereferenceable(16) %42)
  br label %49

49:                                               ; preds = %38
  %50 = load i64, ptr %5, align 8
  %51 = add nsw i64 %50, 1
  store i64 %51, ptr %5, align 8
  br label %32, !llvm.loop !15

52:                                               ; preds = %32
  store i64 0, ptr %6, align 8
  br label %53

53:                                               ; preds = %70, %52
  %54 = load i64, ptr %6, align 8
  %55 = load ptr, ptr %3, align 8
  %56 = getelementptr inbounds %struct.SQFunctionProto, ptr %55, i32 0, i32 18
  %57 = load i64, ptr %56, align 8
  %58 = icmp slt i64 %54, %57
  br i1 %58, label %59, label %73

59:                                               ; preds = %53
  %60 = getelementptr inbounds %struct.SQClosure, ptr %7, i32 0, i32 6
  %61 = load ptr, ptr %60, align 8
  %62 = load i64, ptr %6, align 8
  %63 = getelementptr inbounds %struct.SQObjectPtr, ptr %61, i64 %62
  %64 = load ptr, ptr %4, align 8
  %65 = getelementptr inbounds %struct.SQClosure, ptr %64, i32 0, i32 6
  %66 = load ptr, ptr %65, align 8
  %67 = load i64, ptr %6, align 8
  %68 = getelementptr inbounds %struct.SQObjectPtr, ptr %66, i64 %67
  %69 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %68, ptr noundef nonnull align 8 dereferenceable(16) %63)
  br label %70

70:                                               ; preds = %59
  %71 = load i64, ptr %6, align 8
  %72 = add nsw i64 %71, 1
  store i64 %72, ptr %6, align 8
  br label %53, !llvm.loop !16

73:                                               ; preds = %53
  %74 = load ptr, ptr %4, align 8
  ret ptr %74
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP9SQClosure(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca %union.tagSQObjectValue, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  store i32 %9, ptr %5, align 4
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 8 %10, i64 8, i1 false)
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  store i32 134217984, ptr %11, align 8
  %12 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  store i64 0, ptr %12, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  store ptr %13, ptr %14, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.SQRefCounted, ptr %16, i32 0, i32 1
  %18 = load i64, ptr %17, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr %17, align 8
  %20 = load i32, ptr %5, align 4
  %21 = and i32 %20, 134217728
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %34

23:                                               ; preds = %2
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds %struct.SQRefCounted, ptr %24, i32 0, i32 1
  %26 = load i64, ptr %25, align 8
  %27 = add i64 %26, -1
  store i64 %27, ptr %25, align 8
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %29, label %34

29:                                               ; preds = %23
  %30 = load ptr, ptr %6, align 8
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds ptr, ptr %31, i64 2
  %33 = load ptr, ptr %32, align 8
  call void %33(ptr noundef nonnull align 8 dereferenceable(24) %30)
  br label %34

34:                                               ; preds = %29, %23, %2
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN15SQNativeClosure5CloneEv(ptr noundef nonnull align 8 dereferenceable(128) %0) #0 align 2 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.SQCollectable, ptr %5, i32 0, i32 3
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr inbounds %struct.SQNativeClosure, ptr %5, i32 0, i32 6
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds %struct.SQNativeClosure, ptr %5, i32 0, i32 4
  %11 = load i64, ptr %10, align 8
  %12 = call noundef ptr @_ZN15SQNativeClosure6CreateEP13SQSharedStatePFxP4SQVMEx(ptr noundef %7, ptr noundef %9, i64 noundef %11)
  store ptr %12, ptr %3, align 8
  %13 = getelementptr inbounds %struct.SQNativeClosure, ptr %5, i32 0, i32 5
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.SQNativeClosure, ptr %15, i32 0, i32 5
  store ptr %14, ptr %16, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.SQNativeClosure, ptr %17, i32 0, i32 5
  %19 = load ptr, ptr %18, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %28

21:                                               ; preds = %1
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.SQNativeClosure, ptr %22, i32 0, i32 5
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.SQRefCounted, ptr %24, i32 0, i32 1
  %26 = load i64, ptr %25, align 8
  %27 = add i64 %26, 1
  store i64 %27, ptr %25, align 8
  br label %28

28:                                               ; preds = %21, %1
  %29 = getelementptr inbounds %struct.SQNativeClosure, ptr %5, i32 0, i32 7
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds %struct.SQNativeClosure, ptr %30, i32 0, i32 7
  %32 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %31, ptr noundef nonnull align 8 dereferenceable(16) %29)
  store i64 0, ptr %4, align 8
  br label %33

33:                                               ; preds = %49, %28
  %34 = load i64, ptr %4, align 8
  %35 = getelementptr inbounds %struct.SQNativeClosure, ptr %5, i32 0, i32 4
  %36 = load i64, ptr %35, align 8
  %37 = icmp slt i64 %34, %36
  br i1 %37, label %38, label %52

38:                                               ; preds = %33
  %39 = getelementptr inbounds %struct.SQNativeClosure, ptr %5, i32 0, i32 3
  %40 = load ptr, ptr %39, align 8
  %41 = load i64, ptr %4, align 8
  %42 = getelementptr inbounds %struct.SQObjectPtr, ptr %40, i64 %41
  %43 = load ptr, ptr %3, align 8
  %44 = getelementptr inbounds %struct.SQNativeClosure, ptr %43, i32 0, i32 3
  %45 = load ptr, ptr %44, align 8
  %46 = load i64, ptr %4, align 8
  %47 = getelementptr inbounds %struct.SQObjectPtr, ptr %45, i64 %46
  %48 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %47, ptr noundef nonnull align 8 dereferenceable(16) %42)
  br label %49

49:                                               ; preds = %38
  %50 = load i64, ptr %4, align 8
  %51 = add nsw i64 %50, 1
  store i64 %51, ptr %4, align 8
  br label %33, !llvm.loop !17

52:                                               ; preds = %33
  %53 = load ptr, ptr %3, align 8
  %54 = getelementptr inbounds %struct.SQNativeClosure, ptr %53, i32 0, i32 2
  %55 = getelementptr inbounds %struct.SQNativeClosure, ptr %5, i32 0, i32 2
  call void @_ZN8sqvectorIxE4copyERKS0_(ptr noundef nonnull align 8 dereferenceable(24) %54, ptr noundef nonnull align 8 dereferenceable(24) %55)
  %56 = getelementptr inbounds %struct.SQNativeClosure, ptr %5, i32 0, i32 1
  %57 = load i64, ptr %56, align 8
  %58 = load ptr, ptr %3, align 8
  %59 = getelementptr inbounds %struct.SQNativeClosure, ptr %58, i32 0, i32 1
  store i64 %57, ptr %59, align 8
  %60 = load ptr, ptr %3, align 8
  ret ptr %60
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP15SQNativeClosure(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca %union.tagSQObjectValue, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  store i32 %9, ptr %5, align 4
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 8 %10, i64 8, i1 false)
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  store i32 134218240, ptr %11, align 8
  %12 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  store i64 0, ptr %12, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  store ptr %13, ptr %14, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.SQRefCounted, ptr %16, i32 0, i32 1
  %18 = load i64, ptr %17, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr %17, align 8
  %20 = load i32, ptr %5, align 4
  %21 = and i32 %20, 134217728
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %34

23:                                               ; preds = %2
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds %struct.SQRefCounted, ptr %24, i32 0, i32 1
  %26 = load i64, ptr %25, align 8
  %27 = add i64 %26, -1
  store i64 %27, ptr %25, align 8
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %29, label %34

29:                                               ; preds = %23
  %30 = load ptr, ptr %6, align 8
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds ptr, ptr %31, i64 2
  %33 = load ptr, ptr %32, align 8
  call void %33(ptr noundef nonnull align 8 dereferenceable(24) %30)
  br label %34

34:                                               ; preds = %29, %23, %2
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getclosurename(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %7, i64 noundef %8)
  store ptr %9, ptr %6, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 134218240
  br i1 %13, label %22, label %14

14:                                               ; preds = %2
  %15 = load ptr, ptr %6, align 8
  %16 = getelementptr inbounds %struct.tagSQObject, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp eq i32 %17, 134217984
  br i1 %18, label %22, label %19

19:                                               ; preds = %14
  %20 = load ptr, ptr %4, align 8
  %21 = call i64 @sq_throwerror(ptr noundef %20, ptr noundef @.str.11)
  store i64 %21, ptr %3, align 8
  br label %42

22:                                               ; preds = %14, %2
  %23 = load ptr, ptr %6, align 8
  %24 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  %26 = icmp eq i32 %25, 134218240
  br i1 %26, label %27, label %33

27:                                               ; preds = %22
  %28 = load ptr, ptr %4, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr inbounds %struct.tagSQObject, ptr %29, i32 0, i32 1
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds %struct.SQNativeClosure, ptr %31, i32 0, i32 7
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %28, ptr noundef nonnull align 8 dereferenceable(16) %32)
  br label %41

33:                                               ; preds = %22
  %34 = load ptr, ptr %4, align 8
  %35 = load ptr, ptr %6, align 8
  %36 = getelementptr inbounds %struct.tagSQObject, ptr %35, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr inbounds %struct.SQClosure, ptr %37, i32 0, i32 4
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds %struct.SQFunctionProto, ptr %39, i32 0, i32 2
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %34, ptr noundef nonnull align 8 dereferenceable(16) %40)
  br label %41

41:                                               ; preds = %33, %27
  store i64 0, ptr %3, align 8
  br label %42

42:                                               ; preds = %41, %19
  %43 = load i64, ptr %3, align 8
  ret i64 %43
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setclosureroot(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.tagSQObject, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load i64, ptr %5, align 8
  %10 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %8, i64 noundef %9)
  store ptr %10, ptr %6, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %11, i64 noundef -1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %12, i64 16, i1 false)
  %13 = load ptr, ptr %6, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = icmp eq i32 %15, 134217984
  br i1 %16, label %20, label %17

17:                                               ; preds = %2
  %18 = load ptr, ptr %4, align 8
  %19 = call i64 @sq_throwerror(ptr noundef %18, ptr noundef @.str.13)
  store i64 %19, ptr %3, align 8
  br label %35

20:                                               ; preds = %2
  %21 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %22 = load i32, ptr %21, align 8
  %23 = icmp eq i32 %22, 167772192
  br i1 %23, label %24, label %32

24:                                               ; preds = %20
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds %struct.tagSQObject, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = call noundef ptr @_ZN12SQRefCounted10GetWeakRefE15tagSQObjectType(ptr noundef nonnull align 8 dereferenceable(24) %29, i32 noundef 167772192)
  call void @_ZN9SQClosure7SetRootEP9SQWeakRef(ptr noundef nonnull align 8 dereferenceable(96) %27, ptr noundef %30)
  %31 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %31)
  store i64 0, ptr %3, align 8
  br label %35

32:                                               ; preds = %20
  %33 = load ptr, ptr %4, align 8
  %34 = call i64 @sq_throwerror(ptr noundef %33, ptr noundef @.str.14)
  store i64 %34, ptr %3, align 8
  br label %35

35:                                               ; preds = %32, %24, %17
  %36 = load i64, ptr %3, align 8
  ret i64 %36
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN9SQClosure7SetRootEP9SQWeakRef(ptr noundef nonnull align 8 dereferenceable(96) %0, ptr noundef %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.SQClosure, ptr %5, i32 0, i32 2
  %7 = load ptr, ptr %6, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %28

9:                                                ; preds = %2
  %10 = getelementptr inbounds %struct.SQClosure, ptr %5, i32 0, i32 2
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %struct.SQRefCounted, ptr %11, i32 0, i32 1
  %13 = load i64, ptr %12, align 8
  %14 = add i64 %13, -1
  store i64 %14, ptr %12, align 8
  %15 = getelementptr inbounds %struct.SQClosure, ptr %5, i32 0, i32 2
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.SQRefCounted, ptr %16, i32 0, i32 1
  %18 = load i64, ptr %17, align 8
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %20, label %26

20:                                               ; preds = %9
  %21 = getelementptr inbounds %struct.SQClosure, ptr %5, i32 0, i32 2
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr inbounds ptr, ptr %23, i64 2
  %25 = load ptr, ptr %24, align 8
  call void %25(ptr noundef nonnull align 8 dereferenceable(40) %22)
  br label %26

26:                                               ; preds = %20, %9
  %27 = getelementptr inbounds %struct.SQClosure, ptr %5, i32 0, i32 2
  store ptr null, ptr %27, align 8
  br label %28

28:                                               ; preds = %26, %2
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds %struct.SQClosure, ptr %5, i32 0, i32 2
  store ptr %29, ptr %30, align 8
  %31 = getelementptr inbounds %struct.SQClosure, ptr %5, i32 0, i32 2
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds %struct.SQRefCounted, ptr %32, i32 0, i32 1
  %34 = load i64, ptr %33, align 8
  %35 = add i64 %34, 1
  store i64 %35, ptr %33, align 8
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getclosureroot(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.SQObjectPtr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load i64, ptr %5, align 8
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %10, i64 noundef %11)
  store ptr %12, ptr %6, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = icmp eq i32 %15, 134217984
  br i1 %16, label %20, label %17

17:                                               ; preds = %2
  %18 = load ptr, ptr %4, align 8
  %19 = call i64 @sq_throwerror(ptr noundef %18, ptr noundef @.str.13)
  store i64 %19, ptr %3, align 8
  br label %36

20:                                               ; preds = %2
  %21 = load ptr, ptr %4, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds %struct.tagSQObject, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.SQClosure, ptr %24, i32 0, i32 2
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds %struct.SQWeakRef, ptr %26, i32 0, i32 1
  %28 = call noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull align 8 dereferenceable(16) %27)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %21, ptr noundef nonnull align 8 dereferenceable(16) %7)
          to label %29 unwind label %31

29:                                               ; preds = %20
  %30 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  store i64 0, ptr %3, align 8
  br label %36

31:                                               ; preds = %20
  %32 = landingpad { ptr, i32 }
          cleanup
  %33 = extractvalue { ptr, i32 } %32, 0
  store ptr %33, ptr %8, align 8
  %34 = extractvalue { ptr, i32 } %32, 1
  store i32 %34, ptr %9, align 4
  %35 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  br label %38

36:                                               ; preds = %29, %17
  %37 = load i64, ptr %3, align 8
  ret i64 %37

38:                                               ; preds = %31
  %39 = load ptr, ptr %8, align 8
  %40 = load i32, ptr %9, align 4
  %41 = insertvalue { ptr, i32 } poison, ptr %39, 0
  %42 = insertvalue { ptr, i32 } %41, i32 %40, 1
  resume { ptr, i32 } %42
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN11SQObjectPtrC2ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef nonnull align 8 dereferenceable(16) %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_clear(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %7, i64 noundef %8)
  store ptr %9, ptr %6, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  switch i32 %12, label %21 [
    i32 167772192, label %13
    i32 134217792, label %17
  ]

13:                                               ; preds = %2
  %14 = load ptr, ptr %6, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  call void @_ZN7SQTable5ClearEv(ptr noundef nonnull align 8 dereferenceable(88) %16)
  br label %24

17:                                               ; preds = %2
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  call void @_ZN7SQArray6ResizeEx(ptr noundef nonnull align 8 dereferenceable(72) %20, i64 noundef 0)
  br label %24

21:                                               ; preds = %2
  %22 = load ptr, ptr %4, align 8
  %23 = call i64 @sq_throwerror(ptr noundef %22, ptr noundef @.str.15)
  store i64 %23, ptr %3, align 8
  br label %25

24:                                               ; preds = %17, %13
  store i64 0, ptr %3, align 8
  br label %25

25:                                               ; preds = %24, %21
  %26 = load i64, ptr %3, align 8
  ret i64 %26
}

declare void @_ZN7SQTable5ClearEv(ptr noundef nonnull align 8 dereferenceable(88)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushroottable(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.SQVM, ptr %4, i32 0, i32 5
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %3, ptr noundef nonnull align 8 dereferenceable(16) %5)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushregistrytable(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.SQVM, ptr %4, i32 0, i32 19
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds %struct.SQSharedState, ptr %6, i32 0, i32 6
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %3, ptr noundef nonnull align 8 dereferenceable(16) %7)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushconsttable(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.SQVM, ptr %4, i32 0, i32 19
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds %struct.SQSharedState, ptr %6, i32 0, i32 7
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %3, ptr noundef nonnull align 8 dereferenceable(16) %7)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setroottable(ptr noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %struct.tagSQObject, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %5, i64 noundef -1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %6, i64 16, i1 false)
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = icmp eq i32 %8, 167772192
  br i1 %9, label %14, label %10

10:                                               ; preds = %1
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 16777217
  br i1 %13, label %14, label %19

14:                                               ; preds = %10, %1
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.SQVM, ptr %15, i32 0, i32 5
  %17 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %16, ptr noundef nonnull align 8 dereferenceable(16) %4)
  %18 = load ptr, ptr %3, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %18)
  store i64 0, ptr %2, align 8
  br label %22

19:                                               ; preds = %10
  %20 = load ptr, ptr %3, align 8
  %21 = call i64 @sq_throwerror(ptr noundef %20, ptr noundef @.str.14)
  store i64 %21, ptr %2, align 8
  br label %22

22:                                               ; preds = %19, %14
  %23 = load i64, ptr %2, align 8
  ret i64 %23
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setconsttable(ptr noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %struct.tagSQObject, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %5, i64 noundef -1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %6, i64 16, i1 false)
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = icmp eq i32 %8, 167772192
  br i1 %9, label %10, label %17

10:                                               ; preds = %1
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds %struct.SQVM, ptr %11, i32 0, i32 19
  %13 = load ptr, ptr %12, align 8
  %14 = getelementptr inbounds %struct.SQSharedState, ptr %13, i32 0, i32 7
  %15 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %14, ptr noundef nonnull align 8 dereferenceable(16) %4)
  %16 = load ptr, ptr %3, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %16)
  store i64 0, ptr %2, align 8
  br label %20

17:                                               ; preds = %1
  %18 = load ptr, ptr %3, align 8
  %19 = call i64 @sq_throwerror(ptr noundef %18, ptr noundef @.str.16)
  store i64 %19, ptr %2, align 8
  br label %20

20:                                               ; preds = %17, %10
  %21 = load i64, ptr %2, align 8
  ret i64 %21
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_setforeignptr(ptr noundef %0, ptr noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.SQVM, ptr %6, i32 0, i32 18
  store ptr %5, ptr %7, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_getforeignptr(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 18
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_setsharedforeignptr(ptr noundef %0, ptr noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.SQVM, ptr %6, i32 0, i32 19
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds %struct.SQSharedState, ptr %8, i32 0, i32 26
  store ptr %5, ptr %9, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_getsharedforeignptr(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 19
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %struct.SQSharedState, ptr %5, i32 0, i32 26
  %7 = load ptr, ptr %6, align 8
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_setvmreleasehook(ptr noundef %0, ptr noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.SQVM, ptr %6, i32 0, i32 22
  store ptr %5, ptr %7, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_getvmreleasehook(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 22
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_setsharedreleasehook(ptr noundef %0, ptr noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.SQVM, ptr %6, i32 0, i32 19
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds %struct.SQSharedState, ptr %8, i32 0, i32 27
  store ptr %5, ptr %9, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_getsharedreleasehook(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 19
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %struct.SQSharedState, ptr %5, i32 0, i32 27
  %7 = load ptr, ptr %6, align 8
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_push(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load i64, ptr %4, align 8
  %8 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %6, i64 noundef %7)
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %5, ptr noundef nonnull align 8 dereferenceable(16) %8)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i32 @sq_gettype(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %5, i64 noundef %6)
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_typeof(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.SQObjectPtr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = load i64, ptr %5, align 8
  %13 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %11, i64 noundef %12)
  store ptr %13, ptr %6, align 8
  %14 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7)
  %15 = load ptr, ptr %4, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = invoke noundef zeroext i1 @_ZN4SQVM6TypeOfERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(344) %15, ptr noundef nonnull align 8 dereferenceable(16) %16, ptr noundef nonnull align 8 dereferenceable(16) %7)
          to label %18 unwind label %20

18:                                               ; preds = %2
  br i1 %17, label %25, label %19

19:                                               ; preds = %18
  store i64 -1, ptr %3, align 8
  store i32 1, ptr %10, align 4
  br label %28

20:                                               ; preds = %25, %2
  %21 = landingpad { ptr, i32 }
          cleanup
  %22 = extractvalue { ptr, i32 } %21, 0
  store ptr %22, ptr %8, align 8
  %23 = extractvalue { ptr, i32 } %21, 1
  store i32 %23, ptr %9, align 4
  %24 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  br label %31

25:                                               ; preds = %18
  %26 = load ptr, ptr %4, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %26, ptr noundef nonnull align 8 dereferenceable(16) %7)
          to label %27 unwind label %20

27:                                               ; preds = %25
  store i64 0, ptr %3, align 8
  store i32 1, ptr %10, align 4
  br label %28

28:                                               ; preds = %27, %19
  %29 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  %30 = load i64, ptr %3, align 8
  ret i64 %30

31:                                               ; preds = %20
  %32 = load ptr, ptr %8, align 8
  %33 = load i32, ptr %9, align 4
  %34 = insertvalue { ptr, i32 } poison, ptr %32, 0
  %35 = insertvalue { ptr, i32 } %34, i32 %33, 1
  resume { ptr, i32 } %35
}

declare noundef zeroext i1 @_ZN4SQVM6TypeOfERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_tostring(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.SQObjectPtr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = load i64, ptr %5, align 8
  %13 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %11, i64 noundef %12)
  store ptr %13, ptr %6, align 8
  %14 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7)
  %15 = load ptr, ptr %4, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = invoke noundef zeroext i1 @_ZN4SQVM8ToStringERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(344) %15, ptr noundef nonnull align 8 dereferenceable(16) %16, ptr noundef nonnull align 8 dereferenceable(16) %7)
          to label %18 unwind label %20

18:                                               ; preds = %2
  br i1 %17, label %25, label %19

19:                                               ; preds = %18
  store i64 -1, ptr %3, align 8
  store i32 1, ptr %10, align 4
  br label %28

20:                                               ; preds = %25, %2
  %21 = landingpad { ptr, i32 }
          cleanup
  %22 = extractvalue { ptr, i32 } %21, 0
  store ptr %22, ptr %8, align 8
  %23 = extractvalue { ptr, i32 } %21, 1
  store i32 %23, ptr %9, align 4
  %24 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  br label %31

25:                                               ; preds = %18
  %26 = load ptr, ptr %4, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %26, ptr noundef nonnull align 8 dereferenceable(16) %7)
          to label %27 unwind label %20

27:                                               ; preds = %25
  store i64 0, ptr %3, align 8
  store i32 1, ptr %10, align 4
  br label %28

28:                                               ; preds = %27, %19
  %29 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  %30 = load i64, ptr %3, align 8
  ret i64 %30

31:                                               ; preds = %20
  %32 = load ptr, ptr %8, align 8
  %33 = load i32, ptr %9, align 4
  %34 = insertvalue { ptr, i32 } poison, ptr %32, 0
  %35 = insertvalue { ptr, i32 } %34, i32 %33, 1
  resume { ptr, i32 } %35
}

declare noundef zeroext i1 @_ZN4SQVM8ToStringERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_tobool(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load i64, ptr %5, align 8
  %10 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %8, i64 noundef %9)
  store ptr %10, ptr %7, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = call noundef zeroext i1 @_ZN4SQVM7IsFalseER11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(16) %11)
  %13 = zext i1 %12 to i64
  %14 = select i1 %12, i32 0, i32 1
  %15 = sext i32 %14 to i64
  %16 = load ptr, ptr %6, align 8
  store i64 %15, ptr %16, align 8
  ret void
}

declare noundef zeroext i1 @_ZN4SQVM7IsFalseER11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getinteger(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i64, ptr %6, align 8
  %11 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %9, i64 noundef %10)
  store ptr %11, ptr %8, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = getelementptr inbounds %struct.tagSQObject, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  %15 = and i32 %14, 67108864
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %34

17:                                               ; preds = %3
  %18 = load ptr, ptr %8, align 8
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = icmp eq i32 %20, 83886084
  br i1 %21, label %22, label %27

22:                                               ; preds = %17
  %23 = load ptr, ptr %8, align 8
  %24 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 1
  %25 = load float, ptr %24, align 8
  %26 = fptosi float %25 to i64
  br label %31

27:                                               ; preds = %17
  %28 = load ptr, ptr %8, align 8
  %29 = getelementptr inbounds %struct.tagSQObject, ptr %28, i32 0, i32 1
  %30 = load i64, ptr %29, align 8
  br label %31

31:                                               ; preds = %27, %22
  %32 = phi i64 [ %26, %22 ], [ %30, %27 ]
  %33 = load ptr, ptr %7, align 8
  store i64 %32, ptr %33, align 8
  store i64 0, ptr %4, align 8
  br label %47

34:                                               ; preds = %3
  %35 = load ptr, ptr %8, align 8
  %36 = getelementptr inbounds %struct.tagSQObject, ptr %35, i32 0, i32 0
  %37 = load i32, ptr %36, align 8
  %38 = icmp eq i32 %37, 16777224
  br i1 %38, label %39, label %46

39:                                               ; preds = %34
  %40 = load ptr, ptr %8, align 8
  %41 = call noundef zeroext i1 @_ZN4SQVM7IsFalseER11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(16) %40)
  %42 = zext i1 %41 to i64
  %43 = select i1 %41, i32 0, i32 1
  %44 = sext i32 %43 to i64
  %45 = load ptr, ptr %7, align 8
  store i64 %44, ptr %45, align 8
  store i64 0, ptr %4, align 8
  br label %47

46:                                               ; preds = %34
  store i64 -1, ptr %4, align 8
  br label %47

47:                                               ; preds = %46, %39, %31
  %48 = load i64, ptr %4, align 8
  ret i64 %48
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getfloat(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i64, ptr %6, align 8
  %11 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %9, i64 noundef %10)
  store ptr %11, ptr %8, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = getelementptr inbounds %struct.tagSQObject, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  %15 = and i32 %14, 67108864
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %34

17:                                               ; preds = %3
  %18 = load ptr, ptr %8, align 8
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = icmp eq i32 %20, 83886082
  br i1 %21, label %22, label %27

22:                                               ; preds = %17
  %23 = load ptr, ptr %8, align 8
  %24 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 1
  %25 = load i64, ptr %24, align 8
  %26 = sitofp i64 %25 to float
  br label %31

27:                                               ; preds = %17
  %28 = load ptr, ptr %8, align 8
  %29 = getelementptr inbounds %struct.tagSQObject, ptr %28, i32 0, i32 1
  %30 = load float, ptr %29, align 8
  br label %31

31:                                               ; preds = %27, %22
  %32 = phi float [ %26, %22 ], [ %30, %27 ]
  %33 = load ptr, ptr %7, align 8
  store float %32, ptr %33, align 4
  store i64 0, ptr %4, align 8
  br label %35

34:                                               ; preds = %3
  store i64 -1, ptr %4, align 8
  br label %35

35:                                               ; preds = %34, %31
  %36 = load i64, ptr %4, align 8
  ret i64 %36
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getbool(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i64, ptr %6, align 8
  %11 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %9, i64 noundef %10)
  store ptr %11, ptr %8, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = getelementptr inbounds %struct.tagSQObject, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  %15 = icmp eq i32 %14, 16777224
  br i1 %15, label %16, label %21

16:                                               ; preds = %3
  %17 = load ptr, ptr %8, align 8
  %18 = getelementptr inbounds %struct.tagSQObject, ptr %17, i32 0, i32 1
  %19 = load i64, ptr %18, align 8
  %20 = load ptr, ptr %7, align 8
  store i64 %19, ptr %20, align 8
  store i64 0, ptr %4, align 8
  br label %22

21:                                               ; preds = %3
  store i64 -1, ptr %4, align 8
  br label %22

22:                                               ; preds = %21, %16
  %23 = load i64, ptr %4, align 8
  ret i64 %23
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getstringandsize(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store i64 %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr null, ptr %10, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = load i64, ptr %7, align 8
  %13 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %11, i64 noundef %12, i32 noundef 134217744, ptr noundef %10)
  br i1 %13, label %15, label %14

14:                                               ; preds = %4
  store i64 -1, ptr %5, align 8
  br label %28

15:                                               ; preds = %4
  %16 = load ptr, ptr %10, align 8
  %17 = getelementptr inbounds %struct.tagSQObject, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.SQString, ptr %18, i32 0, i32 5
  %20 = getelementptr inbounds [1 x i8], ptr %19, i64 0, i64 0
  %21 = load ptr, ptr %8, align 8
  store ptr %20, ptr %21, align 8
  %22 = load ptr, ptr %10, align 8
  %23 = getelementptr inbounds %struct.tagSQObject, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.SQString, ptr %24, i32 0, i32 3
  %26 = load i64, ptr %25, align 8
  %27 = load ptr, ptr %9, align 8
  store i64 %26, ptr %27, align 8
  store i64 0, ptr %5, align 8
  br label %28

28:                                               ; preds = %15, %14
  %29 = load i64, ptr %5, align 8
  ret i64 %29
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getstring(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr null, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i64, ptr %6, align 8
  %11 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %9, i64 noundef %10, i32 noundef 134217744, ptr noundef %8)
  br i1 %11, label %13, label %12

12:                                               ; preds = %3
  store i64 -1, ptr %4, align 8
  br label %20

13:                                               ; preds = %3
  %14 = load ptr, ptr %8, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.SQString, ptr %16, i32 0, i32 5
  %18 = getelementptr inbounds [1 x i8], ptr %17, i64 0, i64 0
  %19 = load ptr, ptr %7, align 8
  store ptr %18, ptr %19, align 8
  store i64 0, ptr %4, align 8
  br label %20

20:                                               ; preds = %13, %12
  %21 = load i64, ptr %4, align 8
  ret i64 %21
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getthread(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr null, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i64, ptr %6, align 8
  %11 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %9, i64 noundef %10, i32 noundef 134221824, ptr noundef %8)
  br i1 %11, label %13, label %12

12:                                               ; preds = %3
  store i64 -1, ptr %4, align 8
  br label %18

13:                                               ; preds = %3
  %14 = load ptr, ptr %8, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = load ptr, ptr %7, align 8
  store ptr %16, ptr %17, align 8
  store i64 0, ptr %4, align 8
  br label %18

18:                                               ; preds = %13, %12
  %19 = load i64, ptr %4, align 8
  ret i64 %19
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_clone(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %7, i64 noundef %8)
  store ptr %9, ptr %6, align 8
  %10 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM8PushNullEv(ptr noundef nonnull align 8 dereferenceable(344) %10)
  %11 = load ptr, ptr %4, align 8
  %12 = load ptr, ptr %6, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %13, i64 noundef -1)
  %15 = call noundef zeroext i1 @_ZN4SQVM5CloneERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(344) %11, ptr noundef nonnull align 8 dereferenceable(16) %12, ptr noundef nonnull align 8 dereferenceable(16) %14)
  br i1 %15, label %18, label %16

16:                                               ; preds = %2
  %17 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %17)
  store i64 -1, ptr %3, align 8
  br label %19

18:                                               ; preds = %2
  store i64 0, ptr %3, align 8
  br label %19

19:                                               ; preds = %18, %16
  %20 = load i64, ptr %3, align 8
  ret i64 %20
}

declare noundef zeroext i1 @_ZN4SQVM5CloneERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getsize(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load i64, ptr %5, align 8
  %10 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %8, i64 noundef %9)
  store ptr %10, ptr %6, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = getelementptr inbounds %struct.tagSQObject, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %12, align 8
  store i32 %13, ptr %7, align 4
  %14 = load i32, ptr %7, align 4
  switch i32 %14, label %51 [
    i32 134217744, label %15
    i32 167772192, label %21
    i32 134217792, label %26
    i32 167772288, label %31
    i32 167804928, label %37
    i32 134234112, label %45
  ]

15:                                               ; preds = %2
  %16 = load ptr, ptr %6, align 8
  %17 = getelementptr inbounds %struct.tagSQObject, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.SQString, ptr %18, i32 0, i32 3
  %20 = load i64, ptr %19, align 8
  store i64 %20, ptr %3, align 8
  br label %55

21:                                               ; preds = %2
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds %struct.tagSQObject, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = call noundef i64 @_ZN7SQTable9CountUsedEv(ptr noundef nonnull align 8 dereferenceable(88) %24)
  store i64 %25, ptr %3, align 8
  br label %55

26:                                               ; preds = %2
  %27 = load ptr, ptr %6, align 8
  %28 = getelementptr inbounds %struct.tagSQObject, ptr %27, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = call noundef i64 @_ZNK7SQArray4SizeEv(ptr noundef nonnull align 8 dereferenceable(72) %29)
  store i64 %30, ptr %3, align 8
  br label %55

31:                                               ; preds = %2
  %32 = load ptr, ptr %6, align 8
  %33 = getelementptr inbounds %struct.tagSQObject, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds %struct.SQUserData, ptr %34, i32 0, i32 1
  %36 = load i64, ptr %35, align 8
  store i64 %36, ptr %3, align 8
  br label %55

37:                                               ; preds = %2
  %38 = load ptr, ptr %6, align 8
  %39 = getelementptr inbounds %struct.tagSQObject, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds %struct.SQInstance, ptr %40, i32 0, i32 1
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds %struct.SQClass, ptr %42, i32 0, i32 11
  %44 = load i64, ptr %43, align 8
  store i64 %44, ptr %3, align 8
  br label %55

45:                                               ; preds = %2
  %46 = load ptr, ptr %6, align 8
  %47 = getelementptr inbounds %struct.tagSQObject, ptr %46, i32 0, i32 1
  %48 = load ptr, ptr %47, align 8
  %49 = getelementptr inbounds %struct.SQClass, ptr %48, i32 0, i32 11
  %50 = load i64, ptr %49, align 8
  store i64 %50, ptr %3, align 8
  br label %55

51:                                               ; preds = %2
  %52 = load ptr, ptr %4, align 8
  %53 = load i32, ptr %7, align 4
  %54 = call noundef i64 @_Z18sq_aux_invalidtypeP4SQVM15tagSQObjectType(ptr noundef %52, i32 noundef %53)
  store i64 %54, ptr %3, align 8
  br label %55

55:                                               ; preds = %51, %45, %37, %31, %26, %21, %15
  %56 = load i64, ptr %3, align 8
  ret i64 %56
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZN7SQTable9CountUsedEv(ptr noundef nonnull align 8 dereferenceable(88) %0) #4 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQTable, ptr %3, i32 0, i32 4
  %5 = load i64, ptr %4, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_gethash(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load i64, ptr %4, align 8
  %8 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %6, i64 noundef %7)
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = call noundef i64 @_Z7HashObjRK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %9)
  ret i64 %10
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i64 @_Z7HashObjRK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %0) #4 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  switch i32 %6, label %22 [
    i32 134217744, label %7
    i32 83886084, label %13
    i32 16777224, label %18
    i32 83886082, label %18
  ]

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds %struct.SQString, ptr %10, i32 0, i32 4
  %12 = load i64, ptr %11, align 8
  store i64 %12, ptr %2, align 8
  br label %28

13:                                               ; preds = %1
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %14, i32 0, i32 1
  %16 = load float, ptr %15, align 8
  %17 = fptosi float %16 to i64
  store i64 %17, ptr %2, align 8
  br label %28

18:                                               ; preds = %1, %1
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.tagSQObject, ptr %19, i32 0, i32 1
  %21 = load i64, ptr %20, align 8
  store i64 %21, ptr %2, align 8
  br label %28

22:                                               ; preds = %1
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = ptrtoint ptr %25 to i64
  %27 = ashr i64 %26, 3
  store i64 %27, ptr %2, align 8
  br label %28

28:                                               ; preds = %22, %18, %13, %7
  %29 = load i64, ptr %2, align 8
  ret i64 %29
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getuserdata(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store i64 %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr null, ptr %10, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = load i64, ptr %7, align 8
  %13 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %11, i64 noundef %12, i32 noundef 167772288, ptr noundef %10)
  br i1 %13, label %15, label %14

14:                                               ; preds = %4
  store i64 -1, ptr %5, align 8
  br label %35

15:                                               ; preds = %4
  %16 = load ptr, ptr %10, align 8
  %17 = getelementptr inbounds %struct.tagSQObject, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.SQUserData, ptr %18, i64 1
  %20 = ptrtoint ptr %19 to i64
  %21 = add i64 %20, 7
  %22 = and i64 %21, -8
  %23 = inttoptr i64 %22 to ptr
  %24 = load ptr, ptr %8, align 8
  store ptr %23, ptr %24, align 8
  %25 = load ptr, ptr %9, align 8
  %26 = icmp ne ptr %25, null
  br i1 %26, label %27, label %34

27:                                               ; preds = %15
  %28 = load ptr, ptr %10, align 8
  %29 = getelementptr inbounds %struct.tagSQObject, ptr %28, i32 0, i32 1
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds %struct.SQUserData, ptr %30, i32 0, i32 3
  %32 = load ptr, ptr %31, align 8
  %33 = load ptr, ptr %9, align 8
  store ptr %32, ptr %33, align 8
  br label %34

34:                                               ; preds = %27, %15
  store i64 0, ptr %5, align 8
  br label %35

35:                                               ; preds = %34, %14
  %36 = load i64, ptr %5, align 8
  ret i64 %36
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_settypetag(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i64, ptr %6, align 8
  %11 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %9, i64 noundef %10)
  store ptr %11, ptr %8, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = getelementptr inbounds %struct.tagSQObject, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  switch i32 %14, label %27 [
    i32 167772288, label %15
    i32 134234112, label %21
  ]

15:                                               ; preds = %3
  %16 = load ptr, ptr %7, align 8
  %17 = load ptr, ptr %8, align 8
  %18 = getelementptr inbounds %struct.tagSQObject, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.SQUserData, ptr %19, i32 0, i32 3
  store ptr %16, ptr %20, align 8
  br label %30

21:                                               ; preds = %3
  %22 = load ptr, ptr %7, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %struct.SQClass, ptr %25, i32 0, i32 7
  store ptr %22, ptr %26, align 8
  br label %30

27:                                               ; preds = %3
  %28 = load ptr, ptr %5, align 8
  %29 = call i64 @sq_throwerror(ptr noundef %28, ptr noundef @.str.17)
  store i64 %29, ptr %4, align 8
  br label %31

30:                                               ; preds = %21, %15
  store i64 0, ptr %4, align 8
  br label %31

31:                                               ; preds = %30, %27
  %32 = load i64, ptr %4, align 8
  ret i64 %32
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define i64 @sq_getobjtypetag(ptr noundef %0, ptr noundef %1) #4 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  switch i32 %8, label %32 [
    i32 167804928, label %9
    i32 167772288, label %18
    i32 134234112, label %25
  ]

9:                                                ; preds = %2
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds %struct.SQInstance, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %struct.SQClass, ptr %14, i32 0, i32 7
  %16 = load ptr, ptr %15, align 8
  %17 = load ptr, ptr %5, align 8
  store ptr %16, ptr %17, align 8
  br label %33

18:                                               ; preds = %2
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.tagSQObject, ptr %19, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds %struct.SQUserData, ptr %21, i32 0, i32 3
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %5, align 8
  store ptr %23, ptr %24, align 8
  br label %33

25:                                               ; preds = %2
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.tagSQObject, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds %struct.SQClass, ptr %28, i32 0, i32 7
  %30 = load ptr, ptr %29, align 8
  %31 = load ptr, ptr %5, align 8
  store ptr %30, ptr %31, align 8
  br label %33

32:                                               ; preds = %2
  store i64 -1, ptr %3, align 8
  br label %34

33:                                               ; preds = %25, %18, %9
  store i64 0, ptr %3, align 8
  br label %34

34:                                               ; preds = %33, %32
  %35 = load i64, ptr %3, align 8
  ret i64 %35
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_gettypetag(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i64, ptr %6, align 8
  %11 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %9, i64 noundef %10)
  store ptr %11, ptr %8, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = call i64 @sq_getobjtypetag(ptr noundef %12, ptr noundef %13)
  %15 = icmp slt i64 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %3
  store i64 -1, ptr %4, align 8
  br label %18

17:                                               ; preds = %3
  store i64 0, ptr %4, align 8
  br label %18

18:                                               ; preds = %17, %16
  %19 = load i64, ptr %4, align 8
  ret i64 %19
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getuserpointer(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr null, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i64, ptr %6, align 8
  %11 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %9, i64 noundef %10, i32 noundef 2048, ptr noundef %8)
  br i1 %11, label %13, label %12

12:                                               ; preds = %3
  store i64 -1, ptr %4, align 8
  br label %18

13:                                               ; preds = %3
  %14 = load ptr, ptr %8, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = load ptr, ptr %7, align 8
  store ptr %16, ptr %17, align 8
  store i64 0, ptr %4, align 8
  br label %18

18:                                               ; preds = %13, %12
  %19 = load i64, ptr %4, align 8
  ret i64 %19
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setinstanceup(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i64, ptr %6, align 8
  %11 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %9, i64 noundef %10)
  store ptr %11, ptr %8, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = getelementptr inbounds %struct.tagSQObject, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  %15 = icmp ne i32 %14, 167804928
  br i1 %15, label %16, label %19

16:                                               ; preds = %3
  %17 = load ptr, ptr %5, align 8
  %18 = call i64 @sq_throwerror(ptr noundef %17, ptr noundef @.str.18)
  store i64 %18, ptr %4, align 8
  br label %25

19:                                               ; preds = %3
  %20 = load ptr, ptr %7, align 8
  %21 = load ptr, ptr %8, align 8
  %22 = getelementptr inbounds %struct.tagSQObject, ptr %21, i32 0, i32 1
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr inbounds %struct.SQInstance, ptr %23, i32 0, i32 2
  store ptr %20, ptr %24, align 8
  store i64 0, ptr %4, align 8
  br label %25

25:                                               ; preds = %19, %16
  %26 = load i64, ptr %4, align 8
  ret i64 %26
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setclassudsize(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i64, ptr %6, align 8
  %11 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %9, i64 noundef %10)
  store ptr %11, ptr %8, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = getelementptr inbounds %struct.tagSQObject, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  %15 = icmp ne i32 %14, 134234112
  br i1 %15, label %16, label %19

16:                                               ; preds = %3
  %17 = load ptr, ptr %5, align 8
  %18 = call i64 @sq_throwerror(ptr noundef %17, ptr noundef @.str.19)
  store i64 %18, ptr %4, align 8
  br label %35

19:                                               ; preds = %3
  %20 = load ptr, ptr %8, align 8
  %21 = getelementptr inbounds %struct.tagSQObject, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds %struct.SQClass, ptr %22, i32 0, i32 9
  %24 = load i8, ptr %23, align 8
  %25 = trunc i8 %24 to i1
  br i1 %25, label %26, label %29

26:                                               ; preds = %19
  %27 = load ptr, ptr %5, align 8
  %28 = call i64 @sq_throwerror(ptr noundef %27, ptr noundef @.str.20)
  store i64 %28, ptr %4, align 8
  br label %35

29:                                               ; preds = %19
  %30 = load i64, ptr %7, align 8
  %31 = load ptr, ptr %8, align 8
  %32 = getelementptr inbounds %struct.tagSQObject, ptr %31, i32 0, i32 1
  %33 = load ptr, ptr %32, align 8
  %34 = getelementptr inbounds %struct.SQClass, ptr %33, i32 0, i32 11
  store i64 %30, ptr %34, align 8
  store i64 0, ptr %4, align 8
  br label %35

35:                                               ; preds = %29, %26, %16
  %36 = load i64, ptr %4, align 8
  ret i64 %36
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getinstanceup(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3, i64 noundef %4) #0 {
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  store i64 %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store i64 %4, ptr %11, align 8
  %14 = load ptr, ptr %7, align 8
  %15 = load i64, ptr %8, align 8
  %16 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %14, i64 noundef %15)
  store ptr %16, ptr %12, align 8
  %17 = load ptr, ptr %12, align 8
  %18 = getelementptr inbounds %struct.tagSQObject, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = icmp ne i32 %19, 167804928
  br i1 %20, label %21, label %30

21:                                               ; preds = %5
  %22 = load i64, ptr %11, align 8
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %27

24:                                               ; preds = %21
  %25 = load ptr, ptr %7, align 8
  %26 = call i64 @sq_throwerror(ptr noundef %25, ptr noundef @.str.18)
  br label %28

27:                                               ; preds = %21
  br label %28

28:                                               ; preds = %27, %24
  %29 = phi i64 [ %26, %24 ], [ -1, %27 ]
  store i64 %29, ptr %6, align 8
  br label %69

30:                                               ; preds = %5
  %31 = load ptr, ptr %12, align 8
  %32 = getelementptr inbounds %struct.tagSQObject, ptr %31, i32 0, i32 1
  %33 = load ptr, ptr %32, align 8
  %34 = getelementptr inbounds %struct.SQInstance, ptr %33, i32 0, i32 2
  %35 = load ptr, ptr %34, align 8
  %36 = load ptr, ptr %9, align 8
  store ptr %35, ptr %36, align 8
  %37 = load ptr, ptr %10, align 8
  %38 = icmp ne ptr %37, null
  br i1 %38, label %39, label %68

39:                                               ; preds = %30
  %40 = load ptr, ptr %12, align 8
  %41 = getelementptr inbounds %struct.tagSQObject, ptr %40, i32 0, i32 1
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds %struct.SQInstance, ptr %42, i32 0, i32 1
  %44 = load ptr, ptr %43, align 8
  store ptr %44, ptr %13, align 8
  br label %45

45:                                               ; preds = %56, %39
  %46 = load ptr, ptr %13, align 8
  %47 = getelementptr inbounds %struct.SQClass, ptr %46, i32 0, i32 7
  %48 = load ptr, ptr %47, align 8
  %49 = load ptr, ptr %10, align 8
  %50 = icmp eq ptr %48, %49
  br i1 %50, label %51, label %52

51:                                               ; preds = %45
  store i64 0, ptr %6, align 8
  br label %69

52:                                               ; preds = %45
  %53 = load ptr, ptr %13, align 8
  %54 = getelementptr inbounds %struct.SQClass, ptr %53, i32 0, i32 2
  %55 = load ptr, ptr %54, align 8
  store ptr %55, ptr %13, align 8
  br label %56

56:                                               ; preds = %52
  %57 = load ptr, ptr %13, align 8
  %58 = icmp ne ptr %57, null
  br i1 %58, label %45, label %59, !llvm.loop !18

59:                                               ; preds = %56
  %60 = load i64, ptr %11, align 8
  %61 = icmp ne i64 %60, 0
  br i1 %61, label %62, label %65

62:                                               ; preds = %59
  %63 = load ptr, ptr %7, align 8
  %64 = call i64 @sq_throwerror(ptr noundef %63, ptr noundef @.str.21)
  br label %66

65:                                               ; preds = %59
  br label %66

66:                                               ; preds = %65, %62
  %67 = phi i64 [ %64, %62 ], [ -1, %65 ]
  store i64 %67, ptr %6, align 8
  br label %69

68:                                               ; preds = %30
  store i64 0, ptr %6, align 8
  br label %69

69:                                               ; preds = %68, %66, %51, %28
  %70 = load i64, ptr %6, align 8
  ret i64 %70
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_settop(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = call i64 @sq_gettop(ptr noundef %6)
  store i64 %7, ptr %5, align 8
  %8 = load i64, ptr %5, align 8
  %9 = load i64, ptr %4, align 8
  %10 = icmp sgt i64 %8, %9
  br i1 %10, label %11, label %16

11:                                               ; preds = %2
  %12 = load ptr, ptr %3, align 8
  %13 = load i64, ptr %5, align 8
  %14 = load i64, ptr %4, align 8
  %15 = sub nsw i64 %13, %14
  call void @sq_pop(ptr noundef %12, i64 noundef %15)
  br label %25

16:                                               ; preds = %2
  br label %17

17:                                               ; preds = %22, %16
  %18 = load i64, ptr %5, align 8
  %19 = add nsw i64 %18, 1
  store i64 %19, ptr %5, align 8
  %20 = load i64, ptr %4, align 8
  %21 = icmp slt i64 %18, %20
  br i1 %21, label %22, label %24

22:                                               ; preds = %17
  %23 = load ptr, ptr %3, align 8
  call void @sq_pushnull(ptr noundef %23)
  br label %17, !llvm.loop !19

24:                                               ; preds = %17
  br label %25

25:                                               ; preds = %24, %11
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pop(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.SQVM, ptr %5, i32 0, i32 2
  %7 = load i64, ptr %6, align 8
  %8 = load i64, ptr %4, align 8
  %9 = icmp sge i64 %7, %8
  %10 = xor i1 %9, true
  br i1 %10, label %11, label %13

11:                                               ; preds = %2
  call void @__assert_rtn(ptr noundef @__func__.sq_pop, ptr noundef @.str.22, i32 noundef 843, ptr noundef @.str.23) #11
  unreachable

12:                                               ; No predecessors!
  br label %14

13:                                               ; preds = %2
  br label %14

14:                                               ; preds = %13, %12
  %15 = load ptr, ptr %3, align 8
  %16 = load i64, ptr %4, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %15, i64 noundef %16)
  ret void
}

; Function Attrs: cold noreturn
declare void @__assert_rtn(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #7

declare void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344), i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_poptop(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 2
  %5 = load i64, ptr %4, align 8
  %6 = icmp sge i64 %5, 1
  %7 = xor i1 %6, true
  br i1 %7, label %8, label %10

8:                                                ; preds = %1
  call void @__assert_rtn(ptr noundef @__func__.sq_poptop, ptr noundef @.str.22, i32 noundef 849, ptr noundef @.str.24) #11
  unreachable

9:                                                ; No predecessors!
  br label %11

10:                                               ; preds = %1
  br label %11

11:                                               ; preds = %10, %9
  %12 = load ptr, ptr %2, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %12)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_remove(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  call void @_ZN4SQVM6RemoveEx(ptr noundef nonnull align 8 dereferenceable(344) %5, i64 noundef %6)
  ret void
}

declare void @_ZN4SQVM6RemoveEx(ptr noundef nonnull align 8 dereferenceable(344), i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_cmp(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %5, i64 noundef -1)
  %7 = load ptr, ptr %2, align 8
  %8 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %7, i64 noundef -2)
  %9 = call noundef zeroext i1 @_ZN4SQVM6ObjCmpERK11SQObjectPtrS2_Rx(ptr noundef nonnull align 8 dereferenceable(344) %4, ptr noundef nonnull align 8 dereferenceable(16) %6, ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull align 8 dereferenceable(8) %3)
  %10 = load i64, ptr %3, align 8
  ret i64 %10
}

declare noundef zeroext i1 @_ZN4SQVM6ObjCmpERK11SQObjectPtrS2_Rx(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(8)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_newslot(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = call i64 @sq_gettop(ptr noundef %10)
  %12 = icmp slt i64 %11, 3
  br i1 %12, label %13, label %15

13:                                               ; preds = %3
  %14 = load ptr, ptr %5, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %14, ptr noundef @.str.3)
  store i64 -1, ptr %4, align 8
  br label %51

15:                                               ; preds = %3
  %16 = load ptr, ptr %5, align 8
  %17 = load i64, ptr %6, align 8
  %18 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %16, i64 noundef %17)
  store ptr %18, ptr %8, align 8
  %19 = load ptr, ptr %8, align 8
  %20 = getelementptr inbounds %struct.tagSQObject, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = icmp eq i32 %21, 167772192
  br i1 %22, label %28, label %23

23:                                               ; preds = %15
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr inbounds %struct.tagSQObject, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = icmp eq i32 %26, 134234112
  br i1 %27, label %28, label %50

28:                                               ; preds = %23, %15
  %29 = load ptr, ptr %5, align 8
  %30 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %29, i64 noundef -2)
  store ptr %30, ptr %9, align 8
  %31 = load ptr, ptr %9, align 8
  %32 = getelementptr inbounds %struct.tagSQObject, ptr %31, i32 0, i32 0
  %33 = load i32, ptr %32, align 8
  %34 = icmp eq i32 %33, 16777217
  br i1 %34, label %35, label %38

35:                                               ; preds = %28
  %36 = load ptr, ptr %5, align 8
  %37 = call i64 @sq_throwerror(ptr noundef %36, ptr noundef @.str.25)
  store i64 %37, ptr %4, align 8
  br label %51

38:                                               ; preds = %28
  %39 = load ptr, ptr %5, align 8
  %40 = load ptr, ptr %8, align 8
  %41 = load ptr, ptr %9, align 8
  %42 = load ptr, ptr %5, align 8
  %43 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %42, i64 noundef -1)
  %44 = load i64, ptr %7, align 8
  %45 = icmp ne i64 %44, 0
  %46 = zext i1 %45 to i64
  %47 = select i1 %45, i1 true, i1 false
  %48 = call noundef zeroext i1 @_ZN4SQVM7NewSlotERK11SQObjectPtrS2_S2_b(ptr noundef nonnull align 8 dereferenceable(344) %39, ptr noundef nonnull align 8 dereferenceable(16) %40, ptr noundef nonnull align 8 dereferenceable(16) %41, ptr noundef nonnull align 8 dereferenceable(16) %43, i1 noundef zeroext %47)
  %49 = load ptr, ptr %5, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %49, i64 noundef 2)
  br label %50

50:                                               ; preds = %38, %23
  store i64 0, ptr %4, align 8
  br label %51

51:                                               ; preds = %50, %35, %13
  %52 = load i64, ptr %4, align 8
  ret i64 %52
}

declare noundef zeroext i1 @_ZN4SQVM7NewSlotERK11SQObjectPtrS2_S2_b(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), i1 noundef zeroext) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_deleteslot(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 personality ptr @__gxx_personality_v0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca %struct.SQObjectPtr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = call i64 @sq_gettop(ptr noundef %14)
  %16 = icmp slt i64 %15, 2
  br i1 %16, label %17, label %19

17:                                               ; preds = %3
  %18 = load ptr, ptr %5, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %18, ptr noundef @.str.3)
  store i64 -1, ptr %4, align 8
  br label %64

19:                                               ; preds = %3
  %20 = load ptr, ptr %5, align 8
  %21 = load i64, ptr %6, align 8
  %22 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %20, i64 noundef %21, i32 noundef 167772192, ptr noundef %8)
  br i1 %22, label %24, label %23

23:                                               ; preds = %19
  store i64 -1, ptr %4, align 8
  br label %64

24:                                               ; preds = %19
  %25 = load ptr, ptr %5, align 8
  %26 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %25, i64 noundef -1)
  store ptr %26, ptr %9, align 8
  %27 = load ptr, ptr %9, align 8
  %28 = getelementptr inbounds %struct.tagSQObject, ptr %27, i32 0, i32 0
  %29 = load i32, ptr %28, align 8
  %30 = icmp eq i32 %29, 16777217
  br i1 %30, label %31, label %34

31:                                               ; preds = %24
  %32 = load ptr, ptr %5, align 8
  %33 = call i64 @sq_throwerror(ptr noundef %32, ptr noundef @.str.25)
  store i64 %33, ptr %4, align 8
  br label %64

34:                                               ; preds = %24
  %35 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10)
  %36 = load ptr, ptr %5, align 8
  %37 = load ptr, ptr %8, align 8
  %38 = load ptr, ptr %9, align 8
  %39 = invoke noundef zeroext i1 @_ZN4SQVM10DeleteSlotERK11SQObjectPtrS2_RS0_(ptr noundef nonnull align 8 dereferenceable(344) %36, ptr noundef nonnull align 8 dereferenceable(16) %37, ptr noundef nonnull align 8 dereferenceable(16) %38, ptr noundef nonnull align 8 dereferenceable(16) %10)
          to label %40 unwind label %44

40:                                               ; preds = %34
  br i1 %39, label %49, label %41

41:                                               ; preds = %40
  %42 = load ptr, ptr %5, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %42)
          to label %43 unwind label %44

43:                                               ; preds = %41
  store i64 -1, ptr %4, align 8
  store i32 1, ptr %13, align 4
  br label %62

44:                                               ; preds = %58, %55, %52, %41, %34
  %45 = landingpad { ptr, i32 }
          cleanup
  %46 = extractvalue { ptr, i32 } %45, 0
  store ptr %46, ptr %11, align 8
  %47 = extractvalue { ptr, i32 } %45, 1
  store i32 %47, ptr %12, align 4
  %48 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10) #10
  br label %66

49:                                               ; preds = %40
  %50 = load i64, ptr %7, align 8
  %51 = icmp ne i64 %50, 0
  br i1 %51, label %52, label %58

52:                                               ; preds = %49
  %53 = load ptr, ptr %5, align 8
  %54 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %53, i64 noundef -1)
          to label %55 unwind label %44

55:                                               ; preds = %52
  %56 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %54, ptr noundef nonnull align 8 dereferenceable(16) %10)
          to label %57 unwind label %44

57:                                               ; preds = %55
  br label %61

58:                                               ; preds = %49
  %59 = load ptr, ptr %5, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %59)
          to label %60 unwind label %44

60:                                               ; preds = %58
  br label %61

61:                                               ; preds = %60, %57
  store i64 0, ptr %4, align 8
  store i32 1, ptr %13, align 4
  br label %62

62:                                               ; preds = %61, %43
  %63 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10) #10
  br label %64

64:                                               ; preds = %62, %31, %23, %17
  %65 = load i64, ptr %4, align 8
  ret i64 %65

66:                                               ; preds = %44
  %67 = load ptr, ptr %11, align 8
  %68 = load i32, ptr %12, align 4
  %69 = insertvalue { ptr, i32 } poison, ptr %67, 0
  %70 = insertvalue { ptr, i32 } %69, i32 %68, 1
  resume { ptr, i32 } %70
}

declare noundef zeroext i1 @_ZN4SQVM10DeleteSlotERK11SQObjectPtrS2_RS0_(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_set(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %7, i64 noundef %8)
  store ptr %9, ptr %6, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %12, i64 noundef -2)
  %14 = load ptr, ptr %4, align 8
  %15 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %14, i64 noundef -1)
  %16 = call noundef zeroext i1 @_ZN4SQVM3SetERK11SQObjectPtrS2_S2_x(ptr noundef nonnull align 8 dereferenceable(344) %10, ptr noundef nonnull align 8 dereferenceable(16) %11, ptr noundef nonnull align 8 dereferenceable(16) %13, ptr noundef nonnull align 8 dereferenceable(16) %15, i64 noundef 666)
  br i1 %16, label %17, label %19

17:                                               ; preds = %2
  %18 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %18, i64 noundef 2)
  store i64 0, ptr %3, align 8
  br label %20

19:                                               ; preds = %2
  store i64 -1, ptr %3, align 8
  br label %20

20:                                               ; preds = %19, %17
  %21 = load i64, ptr %3, align 8
  ret i64 %21
}

declare noundef zeroext i1 @_ZN4SQVM3SetERK11SQObjectPtrS2_S2_x(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_rawset(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load i64, ptr %5, align 8
  %10 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %8, i64 noundef %9)
  store ptr %10, ptr %6, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %11, i64 noundef -2)
  store ptr %12, ptr %7, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = icmp eq i32 %15, 16777217
  br i1 %16, label %17, label %21

17:                                               ; preds = %2
  %18 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %18, i64 noundef 2)
  %19 = load ptr, ptr %4, align 8
  %20 = call i64 @sq_throwerror(ptr noundef %19, ptr noundef @.str.26)
  store i64 %20, ptr %3, align 8
  br label %75

21:                                               ; preds = %2
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds %struct.tagSQObject, ptr %22, i32 0, i32 0
  %24 = load i32, ptr %23, align 8
  switch i32 %24, label %67 [
    i32 167772192, label %25
    i32 134234112, label %34
    i32 167804928, label %46
    i32 134217792, label %57
  ]

25:                                               ; preds = %21
  %26 = load ptr, ptr %6, align 8
  %27 = getelementptr inbounds %struct.tagSQObject, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %7, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %30, i64 noundef -1)
  %32 = call noundef zeroext i1 @_ZN7SQTable7NewSlotERK11SQObjectPtrS2_(ptr noundef nonnull align 8 dereferenceable(88) %28, ptr noundef nonnull align 8 dereferenceable(16) %29, ptr noundef nonnull align 8 dereferenceable(16) %31)
  %33 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %33, i64 noundef 2)
  store i64 0, ptr %3, align 8
  br label %75

34:                                               ; preds = %21
  %35 = load ptr, ptr %6, align 8
  %36 = getelementptr inbounds %struct.tagSQObject, ptr %35, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds %struct.SQVM, ptr %38, i32 0, i32 19
  %40 = load ptr, ptr %39, align 8
  %41 = load ptr, ptr %7, align 8
  %42 = load ptr, ptr %4, align 8
  %43 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %42, i64 noundef -1)
  %44 = call noundef zeroext i1 @_ZN7SQClass7NewSlotEP13SQSharedStateRK11SQObjectPtrS4_b(ptr noundef nonnull align 8 dereferenceable(456) %37, ptr noundef %40, ptr noundef nonnull align 8 dereferenceable(16) %41, ptr noundef nonnull align 8 dereferenceable(16) %43, i1 noundef zeroext false)
  %45 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %45, i64 noundef 2)
  store i64 0, ptr %3, align 8
  br label %75

46:                                               ; preds = %21
  %47 = load ptr, ptr %6, align 8
  %48 = getelementptr inbounds %struct.tagSQObject, ptr %47, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  %50 = load ptr, ptr %7, align 8
  %51 = load ptr, ptr %4, align 8
  %52 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %51, i64 noundef -1)
  %53 = call noundef zeroext i1 @_ZN10SQInstance3SetERK11SQObjectPtrS2_(ptr noundef nonnull align 8 dereferenceable(104) %49, ptr noundef nonnull align 8 dereferenceable(16) %50, ptr noundef nonnull align 8 dereferenceable(16) %52)
  br i1 %53, label %54, label %56

54:                                               ; preds = %46
  %55 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %55, i64 noundef 2)
  store i64 0, ptr %3, align 8
  br label %75

56:                                               ; preds = %46
  br label %71

57:                                               ; preds = %21
  %58 = load ptr, ptr %4, align 8
  %59 = load ptr, ptr %6, align 8
  %60 = load ptr, ptr %7, align 8
  %61 = load ptr, ptr %4, align 8
  %62 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %61, i64 noundef -1)
  %63 = call noundef zeroext i1 @_ZN4SQVM3SetERK11SQObjectPtrS2_S2_x(ptr noundef nonnull align 8 dereferenceable(344) %58, ptr noundef nonnull align 8 dereferenceable(16) %59, ptr noundef nonnull align 8 dereferenceable(16) %60, ptr noundef nonnull align 8 dereferenceable(16) %62, i64 noundef 0)
  br i1 %63, label %64, label %66

64:                                               ; preds = %57
  %65 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %65, i64 noundef 2)
  store i64 0, ptr %3, align 8
  br label %75

66:                                               ; preds = %57
  br label %71

67:                                               ; preds = %21
  %68 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %68, i64 noundef 2)
  %69 = load ptr, ptr %4, align 8
  %70 = call i64 @sq_throwerror(ptr noundef %69, ptr noundef @.str.27)
  store i64 %70, ptr %3, align 8
  br label %75

71:                                               ; preds = %66, %56
  %72 = load ptr, ptr %4, align 8
  %73 = load ptr, ptr %4, align 8
  %74 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %73, i64 noundef -2)
  call void @_ZN4SQVM14Raise_IdxErrorERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %72, ptr noundef nonnull align 8 dereferenceable(16) %74)
  store i64 -1, ptr %3, align 8
  br label %75

75:                                               ; preds = %71, %67, %64, %54, %34, %25, %17
  %76 = load i64, ptr %3, align 8
  ret i64 %76
}

declare noundef zeroext i1 @_ZN7SQTable7NewSlotERK11SQObjectPtrS2_(ptr noundef nonnull align 8 dereferenceable(88), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

declare noundef zeroext i1 @_ZN7SQClass7NewSlotEP13SQSharedStateRK11SQObjectPtrS4_b(ptr noundef nonnull align 8 dereferenceable(456), ptr noundef, ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), i1 noundef zeroext) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZN10SQInstance3SetERK11SQObjectPtrS2_(ptr noundef nonnull align 8 dereferenceable(104) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull align 8 dereferenceable(16) %2) #0 align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.SQObjectPtr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8)
  %14 = getelementptr inbounds %struct.SQInstance, ptr %12, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.SQClass, ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = invoke noundef zeroext i1 @_ZN7SQTable3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(88) %17, ptr noundef nonnull align 8 dereferenceable(16) %18, ptr noundef nonnull align 8 dereferenceable(16) %8)
          to label %20 unwind label %35

20:                                               ; preds = %3
  br i1 %19, label %21, label %40

21:                                               ; preds = %20
  %22 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %23 = load i64, ptr %22, align 8
  %24 = and i64 %23, 33554432
  %25 = icmp ne i64 %24, 0
  br i1 %25, label %26, label %40

26:                                               ; preds = %21
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds %struct.SQInstance, ptr %12, i32 0, i32 5
  %29 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %30 = load i64, ptr %29, align 8
  %31 = and i64 %30, 16777215
  %32 = getelementptr inbounds [1 x %struct.SQObjectPtr], ptr %28, i64 0, i64 %31
  %33 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %32, ptr noundef nonnull align 8 dereferenceable(16) %27)
          to label %34 unwind label %35

34:                                               ; preds = %26
  store i1 true, ptr %4, align 1
  store i32 1, ptr %11, align 4
  br label %41

35:                                               ; preds = %26, %3
  %36 = landingpad { ptr, i32 }
          cleanup
  %37 = extractvalue { ptr, i32 } %36, 0
  store ptr %37, ptr %9, align 8
  %38 = extractvalue { ptr, i32 } %36, 1
  store i32 %38, ptr %10, align 4
  %39 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #10
  br label %44

40:                                               ; preds = %21, %20
  store i1 false, ptr %4, align 1
  store i32 1, ptr %11, align 4
  br label %41

41:                                               ; preds = %40, %34
  %42 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #10
  %43 = load i1, ptr %4, align 1
  ret i1 %43

44:                                               ; preds = %35
  %45 = load ptr, ptr %9, align 8
  %46 = load i32, ptr %10, align 4
  %47 = insertvalue { ptr, i32 } poison, ptr %45, 0
  %48 = insertvalue { ptr, i32 } %47, i32 %46, 1
  resume { ptr, i32 } %48
}

declare void @_ZN4SQVM14Raise_IdxErrorERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_newmember(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load i64, ptr %6, align 8
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %10, i64 noundef %11)
  store ptr %12, ptr %8, align 8
  %13 = load ptr, ptr %8, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = icmp ne i32 %15, 134234112
  br i1 %16, label %17, label %20

17:                                               ; preds = %3
  %18 = load ptr, ptr %5, align 8
  %19 = call i64 @sq_throwerror(ptr noundef %18, ptr noundef @.str.28)
  store i64 %19, ptr %4, align 8
  br label %47

20:                                               ; preds = %3
  %21 = load ptr, ptr %5, align 8
  %22 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %21, i64 noundef -3)
  store ptr %22, ptr %9, align 8
  %23 = load ptr, ptr %9, align 8
  %24 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  %26 = icmp eq i32 %25, 16777217
  br i1 %26, label %27, label %30

27:                                               ; preds = %20
  %28 = load ptr, ptr %5, align 8
  %29 = call i64 @sq_throwerror(ptr noundef %28, ptr noundef @.str.26)
  store i64 %29, ptr %4, align 8
  br label %47

30:                                               ; preds = %20
  %31 = load ptr, ptr %5, align 8
  %32 = load ptr, ptr %8, align 8
  %33 = load ptr, ptr %9, align 8
  %34 = load ptr, ptr %5, align 8
  %35 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %34, i64 noundef -2)
  %36 = load ptr, ptr %5, align 8
  %37 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %36, i64 noundef -1)
  %38 = load i64, ptr %7, align 8
  %39 = icmp ne i64 %38, 0
  %40 = zext i1 %39 to i64
  %41 = select i1 %39, i1 true, i1 false
  %42 = call noundef zeroext i1 @_ZN4SQVM8NewSlotAERK11SQObjectPtrS2_S2_S2_bb(ptr noundef nonnull align 8 dereferenceable(344) %31, ptr noundef nonnull align 8 dereferenceable(16) %32, ptr noundef nonnull align 8 dereferenceable(16) %33, ptr noundef nonnull align 8 dereferenceable(16) %35, ptr noundef nonnull align 8 dereferenceable(16) %37, i1 noundef zeroext %41, i1 noundef zeroext false)
  br i1 %42, label %45, label %43

43:                                               ; preds = %30
  %44 = load ptr, ptr %5, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %44, i64 noundef 3)
  store i64 -1, ptr %4, align 8
  br label %47

45:                                               ; preds = %30
  %46 = load ptr, ptr %5, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %46, i64 noundef 3)
  store i64 0, ptr %4, align 8
  br label %47

47:                                               ; preds = %45, %43, %27, %17
  %48 = load i64, ptr %4, align 8
  ret i64 %48
}

declare noundef zeroext i1 @_ZN4SQVM8NewSlotAERK11SQObjectPtrS2_S2_S2_bb(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), i1 noundef zeroext, i1 noundef zeroext) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_rawnewmember(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load i64, ptr %6, align 8
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %10, i64 noundef %11)
  store ptr %12, ptr %8, align 8
  %13 = load ptr, ptr %8, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = icmp ne i32 %15, 134234112
  br i1 %16, label %17, label %20

17:                                               ; preds = %3
  %18 = load ptr, ptr %5, align 8
  %19 = call i64 @sq_throwerror(ptr noundef %18, ptr noundef @.str.28)
  store i64 %19, ptr %4, align 8
  br label %47

20:                                               ; preds = %3
  %21 = load ptr, ptr %5, align 8
  %22 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %21, i64 noundef -3)
  store ptr %22, ptr %9, align 8
  %23 = load ptr, ptr %9, align 8
  %24 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  %26 = icmp eq i32 %25, 16777217
  br i1 %26, label %27, label %30

27:                                               ; preds = %20
  %28 = load ptr, ptr %5, align 8
  %29 = call i64 @sq_throwerror(ptr noundef %28, ptr noundef @.str.26)
  store i64 %29, ptr %4, align 8
  br label %47

30:                                               ; preds = %20
  %31 = load ptr, ptr %5, align 8
  %32 = load ptr, ptr %8, align 8
  %33 = load ptr, ptr %9, align 8
  %34 = load ptr, ptr %5, align 8
  %35 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %34, i64 noundef -2)
  %36 = load ptr, ptr %5, align 8
  %37 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %36, i64 noundef -1)
  %38 = load i64, ptr %7, align 8
  %39 = icmp ne i64 %38, 0
  %40 = zext i1 %39 to i64
  %41 = select i1 %39, i1 true, i1 false
  %42 = call noundef zeroext i1 @_ZN4SQVM8NewSlotAERK11SQObjectPtrS2_S2_S2_bb(ptr noundef nonnull align 8 dereferenceable(344) %31, ptr noundef nonnull align 8 dereferenceable(16) %32, ptr noundef nonnull align 8 dereferenceable(16) %33, ptr noundef nonnull align 8 dereferenceable(16) %35, ptr noundef nonnull align 8 dereferenceable(16) %37, i1 noundef zeroext %41, i1 noundef zeroext true)
  br i1 %42, label %45, label %43

43:                                               ; preds = %30
  %44 = load ptr, ptr %5, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %44, i64 noundef 3)
  store i64 -1, ptr %4, align 8
  br label %47

45:                                               ; preds = %30
  %46 = load ptr, ptr %5, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %46, i64 noundef 3)
  store i64 0, ptr %4, align 8
  br label %47

47:                                               ; preds = %45, %43, %27, %17
  %48 = load i64, ptr %4, align 8
  ret i64 %48
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setdelegate(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = load i64, ptr %5, align 8
  %11 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %9, i64 noundef %10)
  store ptr %11, ptr %6, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %12, i64 noundef -1)
  store ptr %13, ptr %7, align 8
  %14 = load ptr, ptr %6, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  store i32 %16, ptr %8, align 4
  %17 = load i32, ptr %8, align 4
  switch i32 %17, label %84 [
    i32 167772192, label %18
    i32 167772288, label %53
  ]

18:                                               ; preds = %2
  %19 = load ptr, ptr %7, align 8
  %20 = getelementptr inbounds %struct.tagSQObject, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = icmp eq i32 %21, 167772192
  br i1 %22, label %23, label %36

23:                                               ; preds = %18
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds %struct.tagSQObject, ptr %24, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds %struct.tagSQObject, ptr %27, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = call noundef zeroext i1 @_ZN11SQDelegable11SetDelegateEP7SQTable(ptr noundef nonnull align 8 dereferenceable(56) %26, ptr noundef %29)
  br i1 %30, label %34, label %31

31:                                               ; preds = %23
  %32 = load ptr, ptr %4, align 8
  %33 = call i64 @sq_throwerror(ptr noundef %32, ptr noundef @.str.29)
  store i64 %33, ptr %3, align 8
  br label %89

34:                                               ; preds = %23
  %35 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %35)
  br label %52

36:                                               ; preds = %18
  %37 = load ptr, ptr %7, align 8
  %38 = getelementptr inbounds %struct.tagSQObject, ptr %37, i32 0, i32 0
  %39 = load i32, ptr %38, align 8
  %40 = icmp eq i32 %39, 16777217
  br i1 %40, label %41, label %47

41:                                               ; preds = %36
  %42 = load ptr, ptr %6, align 8
  %43 = getelementptr inbounds %struct.tagSQObject, ptr %42, i32 0, i32 1
  %44 = load ptr, ptr %43, align 8
  %45 = call noundef zeroext i1 @_ZN11SQDelegable11SetDelegateEP7SQTable(ptr noundef nonnull align 8 dereferenceable(56) %44, ptr noundef null)
  %46 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %46)
  br label %51

47:                                               ; preds = %36
  %48 = load ptr, ptr %4, align 8
  %49 = load i32, ptr %8, align 4
  %50 = call noundef i64 @_Z18sq_aux_invalidtypeP4SQVM15tagSQObjectType(ptr noundef %48, i32 noundef %49)
  store i64 %50, ptr %3, align 8
  br label %89

51:                                               ; preds = %41
  br label %52

52:                                               ; preds = %51, %34
  br label %88

53:                                               ; preds = %2
  %54 = load ptr, ptr %7, align 8
  %55 = getelementptr inbounds %struct.tagSQObject, ptr %54, i32 0, i32 0
  %56 = load i32, ptr %55, align 8
  %57 = icmp eq i32 %56, 167772192
  br i1 %57, label %58, label %67

58:                                               ; preds = %53
  %59 = load ptr, ptr %6, align 8
  %60 = getelementptr inbounds %struct.tagSQObject, ptr %59, i32 0, i32 1
  %61 = load ptr, ptr %60, align 8
  %62 = load ptr, ptr %7, align 8
  %63 = getelementptr inbounds %struct.tagSQObject, ptr %62, i32 0, i32 1
  %64 = load ptr, ptr %63, align 8
  %65 = call noundef zeroext i1 @_ZN11SQDelegable11SetDelegateEP7SQTable(ptr noundef nonnull align 8 dereferenceable(56) %61, ptr noundef %64)
  %66 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %66)
  br label %83

67:                                               ; preds = %53
  %68 = load ptr, ptr %7, align 8
  %69 = getelementptr inbounds %struct.tagSQObject, ptr %68, i32 0, i32 0
  %70 = load i32, ptr %69, align 8
  %71 = icmp eq i32 %70, 16777217
  br i1 %71, label %72, label %78

72:                                               ; preds = %67
  %73 = load ptr, ptr %6, align 8
  %74 = getelementptr inbounds %struct.tagSQObject, ptr %73, i32 0, i32 1
  %75 = load ptr, ptr %74, align 8
  %76 = call noundef zeroext i1 @_ZN11SQDelegable11SetDelegateEP7SQTable(ptr noundef nonnull align 8 dereferenceable(56) %75, ptr noundef null)
  %77 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %77)
  br label %82

78:                                               ; preds = %67
  %79 = load ptr, ptr %4, align 8
  %80 = load i32, ptr %8, align 4
  %81 = call noundef i64 @_Z18sq_aux_invalidtypeP4SQVM15tagSQObjectType(ptr noundef %79, i32 noundef %80)
  store i64 %81, ptr %3, align 8
  br label %89

82:                                               ; preds = %72
  br label %83

83:                                               ; preds = %82, %58
  br label %88

84:                                               ; preds = %2
  %85 = load ptr, ptr %4, align 8
  %86 = load i32, ptr %8, align 4
  %87 = call noundef i64 @_Z18sq_aux_invalidtypeP4SQVM15tagSQObjectType(ptr noundef %85, i32 noundef %86)
  store i64 %87, ptr %3, align 8
  br label %89

88:                                               ; preds = %83, %52
  store i64 0, ptr %3, align 8
  br label %89

89:                                               ; preds = %88, %84, %78, %47, %31
  %90 = load i64, ptr %3, align 8
  ret i64 %90
}

declare noundef zeroext i1 @_ZN11SQDelegable11SetDelegateEP7SQTable(ptr noundef nonnull align 8 dereferenceable(56), ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_rawdeleteslot(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 personality ptr @__gxx_personality_v0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca %struct.SQObjectPtr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = call i64 @sq_gettop(ptr noundef %13)
  %15 = icmp slt i64 %14, 2
  br i1 %15, label %16, label %18

16:                                               ; preds = %3
  %17 = load ptr, ptr %5, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %17, ptr noundef @.str.3)
  store i64 -1, ptr %4, align 8
  br label %58

18:                                               ; preds = %3
  %19 = load ptr, ptr %5, align 8
  %20 = load i64, ptr %6, align 8
  %21 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %19, i64 noundef %20, i32 noundef 167772192, ptr noundef %8)
  br i1 %21, label %23, label %22

22:                                               ; preds = %18
  store i64 -1, ptr %4, align 8
  br label %58

23:                                               ; preds = %18
  %24 = load ptr, ptr %5, align 8
  %25 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %24, i64 noundef -1)
  store ptr %25, ptr %9, align 8
  %26 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10)
  %27 = load ptr, ptr %8, align 8
  %28 = getelementptr inbounds %struct.tagSQObject, ptr %27, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = load ptr, ptr %9, align 8
  %31 = invoke noundef zeroext i1 @_ZN7SQTable3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(88) %29, ptr noundef nonnull align 8 dereferenceable(16) %30, ptr noundef nonnull align 8 dereferenceable(16) %10)
          to label %32 unwind label %39

32:                                               ; preds = %23
  br i1 %31, label %33, label %44

33:                                               ; preds = %32
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds %struct.tagSQObject, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = load ptr, ptr %9, align 8
  invoke void @_ZN7SQTable6RemoveERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(88) %36, ptr noundef nonnull align 8 dereferenceable(16) %37)
          to label %38 unwind label %39

38:                                               ; preds = %33
  br label %44

39:                                               ; preds = %53, %50, %47, %33, %23
  %40 = landingpad { ptr, i32 }
          cleanup
  %41 = extractvalue { ptr, i32 } %40, 0
  store ptr %41, ptr %11, align 8
  %42 = extractvalue { ptr, i32 } %40, 1
  store i32 %42, ptr %12, align 4
  %43 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10) #10
  br label %60

44:                                               ; preds = %38, %32
  %45 = load i64, ptr %7, align 8
  %46 = icmp ne i64 %45, 0
  br i1 %46, label %47, label %53

47:                                               ; preds = %44
  %48 = load ptr, ptr %5, align 8
  %49 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %48, i64 noundef -1)
          to label %50 unwind label %39

50:                                               ; preds = %47
  %51 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %49, ptr noundef nonnull align 8 dereferenceable(16) %10)
          to label %52 unwind label %39

52:                                               ; preds = %50
  br label %56

53:                                               ; preds = %44
  %54 = load ptr, ptr %5, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %54)
          to label %55 unwind label %39

55:                                               ; preds = %53
  br label %56

56:                                               ; preds = %55, %52
  store i64 0, ptr %4, align 8
  %57 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10) #10
  br label %58

58:                                               ; preds = %56, %22, %16
  %59 = load i64, ptr %4, align 8
  ret i64 %59

60:                                               ; preds = %39
  %61 = load ptr, ptr %11, align 8
  %62 = load i32, ptr %12, align 4
  %63 = insertvalue { ptr, i32 } poison, ptr %61, 0
  %64 = insertvalue { ptr, i32 } %63, i32 %62, 1
  resume { ptr, i32 } %64
}

declare noundef zeroext i1 @_ZN7SQTable3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(88), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

declare void @_ZN7SQTable6RemoveERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(88), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getdelegate(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.SQObjectPtr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load i64, ptr %5, align 8
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %10, i64 noundef %11)
  store ptr %12, ptr %6, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  switch i32 %15, label %40 [
    i32 167772192, label %16
    i32 167772288, label %16
  ]

16:                                               ; preds = %2, %2
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds %struct.tagSQObject, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.SQDelegable, ptr %19, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %25, label %23

23:                                               ; preds = %16
  %24 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM8PushNullEv(ptr noundef nonnull align 8 dereferenceable(344) %24)
  br label %43

25:                                               ; preds = %16
  %26 = load ptr, ptr %4, align 8
  %27 = load ptr, ptr %6, align 8
  %28 = getelementptr inbounds %struct.tagSQObject, ptr %27, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds %struct.SQDelegable, ptr %29, i32 0, i32 1
  %31 = load ptr, ptr %30, align 8
  %32 = call noundef ptr @_ZN11SQObjectPtrC1EP7SQTable(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef %31)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %26, ptr noundef nonnull align 8 dereferenceable(16) %7)
          to label %33 unwind label %35

33:                                               ; preds = %25
  %34 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  br label %43

35:                                               ; preds = %25
  %36 = landingpad { ptr, i32 }
          cleanup
  %37 = extractvalue { ptr, i32 } %36, 0
  store ptr %37, ptr %8, align 8
  %38 = extractvalue { ptr, i32 } %36, 1
  store i32 %38, ptr %9, align 4
  %39 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  br label %46

40:                                               ; preds = %2
  %41 = load ptr, ptr %4, align 8
  %42 = call i64 @sq_throwerror(ptr noundef %41, ptr noundef @.str.30)
  store i64 %42, ptr %3, align 8
  br label %44

43:                                               ; preds = %33, %23
  store i64 0, ptr %3, align 8
  br label %44

44:                                               ; preds = %43, %40
  %45 = load i64, ptr %3, align 8
  ret i64 %45

46:                                               ; preds = %35
  %47 = load ptr, ptr %8, align 8
  %48 = load i32, ptr %9, align 4
  %49 = insertvalue { ptr, i32 } poison, ptr %47, 0
  %50 = insertvalue { ptr, i32 } %49, i32 %48, 1
  resume { ptr, i32 } %50
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_get(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load i64, ptr %5, align 8
  %10 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %8, i64 noundef %9)
  store ptr %10, ptr %6, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %11, i64 noundef -1)
  store ptr %12, ptr %7, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = load ptr, ptr %6, align 8
  %15 = load ptr, ptr %7, align 8
  %16 = load ptr, ptr %7, align 8
  %17 = call noundef zeroext i1 @_ZN4SQVM3GetERK11SQObjectPtrS2_RS0_yx(ptr noundef nonnull align 8 dereferenceable(344) %13, ptr noundef nonnull align 8 dereferenceable(16) %14, ptr noundef nonnull align 8 dereferenceable(16) %15, ptr noundef nonnull align 8 dereferenceable(16) %16, i64 noundef 0, i64 noundef 666)
  br i1 %17, label %18, label %19

18:                                               ; preds = %2
  store i64 0, ptr %3, align 8
  br label %21

19:                                               ; preds = %2
  %20 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %20)
  store i64 -1, ptr %3, align 8
  br label %21

21:                                               ; preds = %19, %18
  %22 = load i64, ptr %3, align 8
  ret i64 %22
}

declare noundef zeroext i1 @_ZN4SQVM3GetERK11SQObjectPtrS2_RS0_yx(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), i64 noundef, i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_rawget(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load i64, ptr %5, align 8
  %10 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %8, i64 noundef %9)
  store ptr %10, ptr %6, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %11, i64 noundef -1)
  store ptr %12, ptr %7, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  switch i32 %15, label %77 [
    i32 167772192, label %16
    i32 134234112, label %25
    i32 167804928, label %34
    i32 134217792, label %43
  ]

16:                                               ; preds = %2
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds %struct.tagSQObject, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %7, align 8
  %21 = load ptr, ptr %7, align 8
  %22 = call noundef zeroext i1 @_ZN7SQTable3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(88) %19, ptr noundef nonnull align 8 dereferenceable(16) %20, ptr noundef nonnull align 8 dereferenceable(16) %21)
  br i1 %22, label %23, label %24

23:                                               ; preds = %16
  store i64 0, ptr %3, align 8
  br label %85

24:                                               ; preds = %16
  br label %81

25:                                               ; preds = %2
  %26 = load ptr, ptr %6, align 8
  %27 = getelementptr inbounds %struct.tagSQObject, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %7, align 8
  %30 = load ptr, ptr %7, align 8
  %31 = call noundef zeroext i1 @_ZN7SQClass3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(456) %28, ptr noundef nonnull align 8 dereferenceable(16) %29, ptr noundef nonnull align 8 dereferenceable(16) %30)
  br i1 %31, label %32, label %33

32:                                               ; preds = %25
  store i64 0, ptr %3, align 8
  br label %85

33:                                               ; preds = %25
  br label %81

34:                                               ; preds = %2
  %35 = load ptr, ptr %6, align 8
  %36 = getelementptr inbounds %struct.tagSQObject, ptr %35, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  %38 = load ptr, ptr %7, align 8
  %39 = load ptr, ptr %7, align 8
  %40 = call noundef zeroext i1 @_ZN10SQInstance3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(104) %37, ptr noundef nonnull align 8 dereferenceable(16) %38, ptr noundef nonnull align 8 dereferenceable(16) %39)
  br i1 %40, label %41, label %42

41:                                               ; preds = %34
  store i64 0, ptr %3, align 8
  br label %85

42:                                               ; preds = %34
  br label %81

43:                                               ; preds = %2
  %44 = load ptr, ptr %7, align 8
  %45 = getelementptr inbounds %struct.tagSQObject, ptr %44, i32 0, i32 0
  %46 = load i32, ptr %45, align 8
  %47 = and i32 %46, 67108864
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %72

49:                                               ; preds = %43
  %50 = load ptr, ptr %6, align 8
  %51 = getelementptr inbounds %struct.tagSQObject, ptr %50, i32 0, i32 1
  %52 = load ptr, ptr %51, align 8
  %53 = load ptr, ptr %7, align 8
  %54 = getelementptr inbounds %struct.tagSQObject, ptr %53, i32 0, i32 0
  %55 = load i32, ptr %54, align 8
  %56 = icmp eq i32 %55, 83886084
  br i1 %56, label %57, label %62

57:                                               ; preds = %49
  %58 = load ptr, ptr %7, align 8
  %59 = getelementptr inbounds %struct.tagSQObject, ptr %58, i32 0, i32 1
  %60 = load float, ptr %59, align 8
  %61 = fptosi float %60 to i64
  br label %66

62:                                               ; preds = %49
  %63 = load ptr, ptr %7, align 8
  %64 = getelementptr inbounds %struct.tagSQObject, ptr %63, i32 0, i32 1
  %65 = load i64, ptr %64, align 8
  br label %66

66:                                               ; preds = %62, %57
  %67 = phi i64 [ %61, %57 ], [ %65, %62 ]
  %68 = load ptr, ptr %7, align 8
  %69 = call noundef zeroext i1 @_ZN7SQArray3GetExR11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(72) %52, i64 noundef %67, ptr noundef nonnull align 8 dereferenceable(16) %68)
  br i1 %69, label %70, label %71

70:                                               ; preds = %66
  store i64 0, ptr %3, align 8
  br label %85

71:                                               ; preds = %66
  br label %76

72:                                               ; preds = %43
  %73 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %73)
  %74 = load ptr, ptr %4, align 8
  %75 = call i64 @sq_throwerror(ptr noundef %74, ptr noundef @.str.31)
  store i64 %75, ptr %3, align 8
  br label %85

76:                                               ; preds = %71
  br label %81

77:                                               ; preds = %2
  %78 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %78)
  %79 = load ptr, ptr %4, align 8
  %80 = call i64 @sq_throwerror(ptr noundef %79, ptr noundef @.str.32)
  store i64 %80, ptr %3, align 8
  br label %85

81:                                               ; preds = %76, %42, %33, %24
  %82 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %82)
  %83 = load ptr, ptr %4, align 8
  %84 = call i64 @sq_throwerror(ptr noundef %83, ptr noundef @.str.33)
  store i64 %84, ptr %3, align 8
  br label %85

85:                                               ; preds = %81, %77, %72, %70, %41, %32, %23
  %86 = load i64, ptr %3, align 8
  ret i64 %86
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZN7SQClass3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(456) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull align 8 dereferenceable(16) %2) #0 align 2 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %struct.tagSQObject, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds %struct.SQClass, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = load ptr, ptr %7, align 8
  %15 = call noundef zeroext i1 @_ZN7SQTable3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(88) %12, ptr noundef nonnull align 8 dereferenceable(16) %13, ptr noundef nonnull align 8 dereferenceable(16) %14)
  br i1 %15, label %16, label %55

16:                                               ; preds = %3
  %17 = load ptr, ptr %7, align 8
  %18 = getelementptr inbounds %struct.tagSQObject, ptr %17, i32 0, i32 1
  %19 = load i64, ptr %18, align 8
  %20 = and i64 %19, 33554432
  %21 = icmp ne i64 %20, 0
  br i1 %21, label %22, label %44

22:                                               ; preds = %16
  %23 = getelementptr inbounds %struct.SQClass, ptr %10, i32 0, i32 3
  %24 = load ptr, ptr %7, align 8
  %25 = getelementptr inbounds %struct.tagSQObject, ptr %24, i32 0, i32 1
  %26 = load i64, ptr %25, align 8
  %27 = and i64 %26, 16777215
  %28 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNK8sqvectorI13SQClassMemberEixEy(ptr noundef nonnull align 8 dereferenceable(24) %23, i64 noundef %27)
  %29 = getelementptr inbounds %struct.SQClassMember, ptr %28, i32 0, i32 0
  store ptr %29, ptr %8, align 8
  %30 = load ptr, ptr %8, align 8
  %31 = getelementptr inbounds %struct.tagSQObject, ptr %30, i32 0, i32 0
  %32 = load i32, ptr %31, align 8
  %33 = icmp ne i32 %32, 134283264
  br i1 %33, label %34, label %36

34:                                               ; preds = %22
  %35 = load ptr, ptr %8, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %35, i64 16, i1 false)
  br label %41

36:                                               ; preds = %22
  %37 = load ptr, ptr %8, align 8
  %38 = getelementptr inbounds %struct.tagSQObject, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds %struct.SQWeakRef, ptr %39, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %40, i64 16, i1 false)
  br label %41

41:                                               ; preds = %36, %34
  %42 = load ptr, ptr %7, align 8
  %43 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %42, ptr noundef nonnull align 8 dereferenceable(16) %9)
  br label %54

44:                                               ; preds = %16
  %45 = getelementptr inbounds %struct.SQClass, ptr %10, i32 0, i32 4
  %46 = load ptr, ptr %7, align 8
  %47 = getelementptr inbounds %struct.tagSQObject, ptr %46, i32 0, i32 1
  %48 = load i64, ptr %47, align 8
  %49 = and i64 %48, 16777215
  %50 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNK8sqvectorI13SQClassMemberEixEy(ptr noundef nonnull align 8 dereferenceable(24) %45, i64 noundef %49)
  %51 = getelementptr inbounds %struct.SQClassMember, ptr %50, i32 0, i32 0
  %52 = load ptr, ptr %7, align 8
  %53 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %52, ptr noundef nonnull align 8 dereferenceable(16) %51)
  br label %54

54:                                               ; preds = %44, %41
  store i1 true, ptr %4, align 1
  br label %56

55:                                               ; preds = %3
  store i1 false, ptr %4, align 1
  br label %56

56:                                               ; preds = %55, %54
  %57 = load i1, ptr %4, align 1
  ret i1 %57
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZN10SQInstance3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(104) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull align 8 dereferenceable(16) %2) #0 align 2 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %struct.tagSQObject, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds %struct.SQInstance, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds %struct.SQClass, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %6, align 8
  %16 = load ptr, ptr %7, align 8
  %17 = call noundef zeroext i1 @_ZN7SQTable3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(88) %14, ptr noundef nonnull align 8 dereferenceable(16) %15, ptr noundef nonnull align 8 dereferenceable(16) %16)
  br i1 %17, label %18, label %58

18:                                               ; preds = %3
  %19 = load ptr, ptr %7, align 8
  %20 = getelementptr inbounds %struct.tagSQObject, ptr %19, i32 0, i32 1
  %21 = load i64, ptr %20, align 8
  %22 = and i64 %21, 33554432
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %45

24:                                               ; preds = %18
  %25 = getelementptr inbounds %struct.SQInstance, ptr %10, i32 0, i32 5
  %26 = load ptr, ptr %7, align 8
  %27 = getelementptr inbounds %struct.tagSQObject, ptr %26, i32 0, i32 1
  %28 = load i64, ptr %27, align 8
  %29 = and i64 %28, 16777215
  %30 = getelementptr inbounds [1 x %struct.SQObjectPtr], ptr %25, i64 0, i64 %29
  store ptr %30, ptr %8, align 8
  %31 = load ptr, ptr %8, align 8
  %32 = getelementptr inbounds %struct.tagSQObject, ptr %31, i32 0, i32 0
  %33 = load i32, ptr %32, align 8
  %34 = icmp ne i32 %33, 134283264
  br i1 %34, label %35, label %37

35:                                               ; preds = %24
  %36 = load ptr, ptr %8, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %36, i64 16, i1 false)
  br label %42

37:                                               ; preds = %24
  %38 = load ptr, ptr %8, align 8
  %39 = getelementptr inbounds %struct.tagSQObject, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds %struct.SQWeakRef, ptr %40, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %41, i64 16, i1 false)
  br label %42

42:                                               ; preds = %37, %35
  %43 = load ptr, ptr %7, align 8
  %44 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %43, ptr noundef nonnull align 8 dereferenceable(16) %9)
  br label %57

45:                                               ; preds = %18
  %46 = getelementptr inbounds %struct.SQInstance, ptr %10, i32 0, i32 1
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr inbounds %struct.SQClass, ptr %47, i32 0, i32 4
  %49 = load ptr, ptr %7, align 8
  %50 = getelementptr inbounds %struct.tagSQObject, ptr %49, i32 0, i32 1
  %51 = load i64, ptr %50, align 8
  %52 = and i64 %51, 16777215
  %53 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNK8sqvectorI13SQClassMemberEixEy(ptr noundef nonnull align 8 dereferenceable(24) %48, i64 noundef %52)
  %54 = getelementptr inbounds %struct.SQClassMember, ptr %53, i32 0, i32 0
  %55 = load ptr, ptr %7, align 8
  %56 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %55, ptr noundef nonnull align 8 dereferenceable(16) %54)
  br label %57

57:                                               ; preds = %45, %42
  store i1 true, ptr %4, align 1
  br label %59

58:                                               ; preds = %3
  store i1 false, ptr %4, align 1
  br label %59

59:                                               ; preds = %58, %57
  %60 = load i1, ptr %4, align 1
  ret i1 %60
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZN7SQArray3GetExR11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(72) %0, i64 noundef %1, ptr noundef nonnull align 8 dereferenceable(16) %2) #0 align 2 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %struct.tagSQObject, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load i64, ptr %6, align 8
  %12 = icmp sge i64 %11, 0
  br i1 %12, label %13, label %36

13:                                               ; preds = %3
  %14 = load i64, ptr %6, align 8
  %15 = getelementptr inbounds %struct.SQArray, ptr %10, i32 0, i32 1
  %16 = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %15)
  %17 = icmp slt i64 %14, %16
  br i1 %17, label %18, label %36

18:                                               ; preds = %13
  %19 = getelementptr inbounds %struct.SQArray, ptr %10, i32 0, i32 1
  %20 = load i64, ptr %6, align 8
  %21 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrEixEy(ptr noundef nonnull align 8 dereferenceable(24) %19, i64 noundef %20)
  store ptr %21, ptr %8, align 8
  %22 = load ptr, ptr %8, align 8
  %23 = getelementptr inbounds %struct.tagSQObject, ptr %22, i32 0, i32 0
  %24 = load i32, ptr %23, align 8
  %25 = icmp ne i32 %24, 134283264
  br i1 %25, label %26, label %28

26:                                               ; preds = %18
  %27 = load ptr, ptr %8, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %27, i64 16, i1 false)
  br label %33

28:                                               ; preds = %18
  %29 = load ptr, ptr %8, align 8
  %30 = getelementptr inbounds %struct.tagSQObject, ptr %29, i32 0, i32 1
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds %struct.SQWeakRef, ptr %31, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %32, i64 16, i1 false)
  br label %33

33:                                               ; preds = %28, %26
  %34 = load ptr, ptr %7, align 8
  %35 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %34, ptr noundef nonnull align 8 dereferenceable(16) %9)
  store i1 true, ptr %4, align 1
  br label %37

36:                                               ; preds = %13, %3
  store i1 false, ptr %4, align 1
  br label %37

37:                                               ; preds = %36, %33
  %38 = load i1, ptr %4, align 1
  ret i1 %38
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getstackobj(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %7, i64 noundef %8)
  %10 = load ptr, ptr %6, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 %9, i64 16, i1 false)
  ret i64 0
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_getlocal(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.SQVM, ptr %16, i32 0, i32 13
  %18 = load i64, ptr %17, align 8
  store i64 %18, ptr %8, align 8
  %19 = load i64, ptr %8, align 8
  %20 = load i64, ptr %6, align 8
  %21 = sub i64 %19, %20
  %22 = sub i64 %21, 1
  store i64 %22, ptr %9, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds %struct.SQVM, ptr %23, i32 0, i32 3
  %25 = load i64, ptr %24, align 8
  store i64 %25, ptr %10, align 8
  %26 = load i64, ptr %9, align 8
  %27 = load i64, ptr %8, align 8
  %28 = icmp ult i64 %26, %27
  br i1 %28, label %29, label %120

29:                                               ; preds = %3
  store i64 0, ptr %11, align 8
  br label %30

30:                                               ; preds = %49, %29
  %31 = load i64, ptr %11, align 8
  %32 = load i64, ptr %6, align 8
  %33 = icmp ult i64 %31, %32
  br i1 %33, label %34, label %52

34:                                               ; preds = %30
  %35 = load ptr, ptr %5, align 8
  %36 = getelementptr inbounds %struct.SQVM, ptr %35, i32 0, i32 12
  %37 = load ptr, ptr %36, align 8
  %38 = load i64, ptr %8, align 8
  %39 = load i64, ptr %11, align 8
  %40 = sub i64 %38, %39
  %41 = sub i64 %40, 1
  %42 = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %37, i64 %41
  store ptr %42, ptr %12, align 8
  %43 = load ptr, ptr %12, align 8
  %44 = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %43, i32 0, i32 5
  %45 = load i32, ptr %44, align 4
  %46 = sext i32 %45 to i64
  %47 = load i64, ptr %10, align 8
  %48 = sub nsw i64 %47, %46
  store i64 %48, ptr %10, align 8
  br label %49

49:                                               ; preds = %34
  %50 = load i64, ptr %11, align 8
  %51 = add i64 %50, 1
  store i64 %51, ptr %11, align 8
  br label %30, !llvm.loop !20

52:                                               ; preds = %30
  %53 = load ptr, ptr %5, align 8
  %54 = getelementptr inbounds %struct.SQVM, ptr %53, i32 0, i32 12
  %55 = load ptr, ptr %54, align 8
  %56 = load i64, ptr %9, align 8
  %57 = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %55, i64 %56
  store ptr %57, ptr %13, align 8
  %58 = load ptr, ptr %13, align 8
  %59 = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %58, i32 0, i32 2
  %60 = getelementptr inbounds %struct.tagSQObject, ptr %59, i32 0, i32 0
  %61 = load i32, ptr %60, align 8
  %62 = icmp ne i32 %61, 134217984
  br i1 %62, label %63, label %64

63:                                               ; preds = %52
  store ptr null, ptr %4, align 8
  br label %121

64:                                               ; preds = %52
  %65 = load ptr, ptr %13, align 8
  %66 = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %65, i32 0, i32 2
  %67 = getelementptr inbounds %struct.tagSQObject, ptr %66, i32 0, i32 1
  %68 = load ptr, ptr %67, align 8
  store ptr %68, ptr %14, align 8
  %69 = load ptr, ptr %14, align 8
  %70 = getelementptr inbounds %struct.SQClosure, ptr %69, i32 0, i32 4
  %71 = load ptr, ptr %70, align 8
  store ptr %71, ptr %15, align 8
  %72 = load ptr, ptr %15, align 8
  %73 = getelementptr inbounds %struct.SQFunctionProto, ptr %72, i32 0, i32 16
  %74 = load i64, ptr %73, align 8
  %75 = load i64, ptr %7, align 8
  %76 = icmp sgt i64 %74, %75
  br i1 %76, label %77, label %98

77:                                               ; preds = %64
  %78 = load ptr, ptr %5, align 8
  %79 = load ptr, ptr %14, align 8
  %80 = getelementptr inbounds %struct.SQClosure, ptr %79, i32 0, i32 5
  %81 = load ptr, ptr %80, align 8
  %82 = load i64, ptr %7, align 8
  %83 = getelementptr inbounds %struct.SQObjectPtr, ptr %81, i64 %82
  %84 = getelementptr inbounds %struct.tagSQObject, ptr %83, i32 0, i32 1
  %85 = load ptr, ptr %84, align 8
  %86 = getelementptr inbounds %struct.SQOuter, ptr %85, i32 0, i32 1
  %87 = load ptr, ptr %86, align 8
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %78, ptr noundef nonnull align 8 dereferenceable(16) %87)
  %88 = load ptr, ptr %15, align 8
  %89 = getelementptr inbounds %struct.SQFunctionProto, ptr %88, i32 0, i32 17
  %90 = load ptr, ptr %89, align 8
  %91 = load i64, ptr %7, align 8
  %92 = getelementptr inbounds %struct.SQOuterVar, ptr %90, i64 %91
  %93 = getelementptr inbounds %struct.SQOuterVar, ptr %92, i32 0, i32 1
  %94 = getelementptr inbounds %struct.tagSQObject, ptr %93, i32 0, i32 1
  %95 = load ptr, ptr %94, align 8
  %96 = getelementptr inbounds %struct.SQString, ptr %95, i32 0, i32 5
  %97 = getelementptr inbounds [1 x i8], ptr %96, i64 0, i64 0
  store ptr %97, ptr %4, align 8
  br label %121

98:                                               ; preds = %64
  %99 = load ptr, ptr %15, align 8
  %100 = getelementptr inbounds %struct.SQFunctionProto, ptr %99, i32 0, i32 16
  %101 = load i64, ptr %100, align 8
  %102 = load i64, ptr %7, align 8
  %103 = sub i64 %102, %101
  store i64 %103, ptr %7, align 8
  %104 = load ptr, ptr %15, align 8
  %105 = load ptr, ptr %5, align 8
  %106 = load i64, ptr %10, align 8
  %107 = load i64, ptr %7, align 8
  %108 = load ptr, ptr %13, align 8
  %109 = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %108, i32 0, i32 0
  %110 = load ptr, ptr %109, align 8
  %111 = load ptr, ptr %15, align 8
  %112 = getelementptr inbounds %struct.SQFunctionProto, ptr %111, i32 0, i32 21
  %113 = getelementptr inbounds [1 x %struct.SQInstruction], ptr %112, i64 0, i64 0
  %114 = ptrtoint ptr %110 to i64
  %115 = ptrtoint ptr %113 to i64
  %116 = sub i64 %114, %115
  %117 = sdiv exact i64 %116, 8
  %118 = sub nsw i64 %117, 1
  %119 = call noundef ptr @_ZN15SQFunctionProto8GetLocalEP4SQVMyyy(ptr noundef nonnull align 8 dereferenceable(232) %104, ptr noundef %105, i64 noundef %106, i64 noundef %107, i64 noundef %118)
  store ptr %119, ptr %4, align 8
  br label %121

120:                                              ; preds = %3
  store ptr null, ptr %4, align 8
  br label %121

121:                                              ; preds = %120, %98, %77, %63
  %122 = load ptr, ptr %4, align 8
  ret ptr %122
}

declare noundef ptr @_ZN15SQFunctionProto8GetLocalEP4SQVMyyy(ptr noundef nonnull align 8 dereferenceable(232), ptr noundef, i64 noundef, i64 noundef, i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushobject(ptr noundef %0, [2 x i64] %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca %struct.tagSQObject, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.SQObjectPtr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store [2 x i64] %1, ptr %3, align 8
  store ptr %0, ptr %4, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = call noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef nonnull align 8 dereferenceable(16) %3)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %8, ptr noundef nonnull align 8 dereferenceable(16) %5)
          to label %10 unwind label %12

10:                                               ; preds = %2
  %11 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  ret void

12:                                               ; preds = %2
  %13 = landingpad { ptr, i32 }
          cleanup
  %14 = extractvalue { ptr, i32 } %13, 0
  store ptr %14, ptr %6, align 8
  %15 = extractvalue { ptr, i32 } %13, 1
  store i32 %15, ptr %7, align 4
  %16 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #10
  br label %17

17:                                               ; preds = %12
  %18 = load ptr, ptr %6, align 8
  %19 = load i32, ptr %7, align 4
  %20 = insertvalue { ptr, i32 } poison, ptr %18, 0
  %21 = insertvalue { ptr, i32 } %20, i32 %19, 1
  resume { ptr, i32 } %21
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_resetobject(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 1
  store ptr null, ptr %4, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 0
  store i32 16777217, ptr %6, align 8
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_throwobject(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %3, i64 noundef -1)
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.SQVM, ptr %5, i32 0, i32 6
  %7 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %6, ptr noundef nonnull align 8 dereferenceable(16) %4)
  %8 = load ptr, ptr %2, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %8)
  ret i64 -1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_reseterror(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 6
  call void @_ZN11SQObjectPtr4NullEv(ptr noundef nonnull align 8 dereferenceable(16) %4)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_getlasterror(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.SQVM, ptr %4, i32 0, i32 6
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %3, ptr noundef nonnull align 8 dereferenceable(16) %5)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_reservestack(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca %struct.SQObjectPtr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.SQVM, ptr %9, i32 0, i32 2
  %11 = load i64, ptr %10, align 8
  %12 = load i64, ptr %5, align 8
  %13 = add i64 %11, %12
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.SQVM, ptr %14, i32 0, i32 1
  %16 = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %15)
  %17 = icmp ugt i64 %13, %16
  br i1 %17, label %18, label %50

18:                                               ; preds = %2
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.SQVM, ptr %19, i32 0, i32 21
  %21 = load i64, ptr %20, align 8
  %22 = icmp ne i64 %21, 0
  br i1 %22, label %23, label %26

23:                                               ; preds = %18
  %24 = load ptr, ptr %4, align 8
  %25 = call i64 @sq_throwerror(ptr noundef %24, ptr noundef @.str.34)
  store i64 %25, ptr %3, align 8
  br label %51

26:                                               ; preds = %18
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.SQVM, ptr %27, i32 0, i32 1
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds %struct.SQVM, ptr %29, i32 0, i32 1
  %31 = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %30)
  %32 = load ptr, ptr %4, align 8
  %33 = getelementptr inbounds %struct.SQVM, ptr %32, i32 0, i32 2
  %34 = load i64, ptr %33, align 8
  %35 = load i64, ptr %5, align 8
  %36 = add nsw i64 %34, %35
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.SQVM, ptr %37, i32 0, i32 1
  %39 = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %38)
  %40 = sub i64 %36, %39
  %41 = add i64 %31, %40
  %42 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %6)
  invoke void @_ZN8sqvectorI11SQObjectPtrE6resizeEyRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %28, i64 noundef %41, ptr noundef nonnull align 8 dereferenceable(16) %6)
          to label %43 unwind label %45

43:                                               ; preds = %26
  %44 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %6) #10
  br label %50

45:                                               ; preds = %26
  %46 = landingpad { ptr, i32 }
          cleanup
  %47 = extractvalue { ptr, i32 } %46, 0
  store ptr %47, ptr %7, align 8
  %48 = extractvalue { ptr, i32 } %46, 1
  store i32 %48, ptr %8, align 4
  %49 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %6) #10
  br label %53

50:                                               ; preds = %43, %2
  store i64 0, ptr %3, align 8
  br label %51

51:                                               ; preds = %50, %23
  %52 = load i64, ptr %3, align 8
  ret i64 %52

53:                                               ; preds = %45
  %54 = load ptr, ptr %7, align 8
  %55 = load i32, ptr %8, align 4
  %56 = insertvalue { ptr, i32 } poison, ptr %54, 0
  %57 = insertvalue { ptr, i32 } %56, i32 %55, 1
  resume { ptr, i32 } %57
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.sqvector, ptr %3, i32 0, i32 1
  %5 = load i64, ptr %4, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorI11SQObjectPtrE6resizeEyRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, ptr noundef nonnull align 8 dereferenceable(16) %2) #0 align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load i64, ptr %5, align 8
  %10 = getelementptr inbounds %class.sqvector, ptr %8, i32 0, i32 2
  %11 = load i64, ptr %10, align 8
  %12 = icmp ugt i64 %9, %11
  br i1 %12, label %13, label %15

13:                                               ; preds = %3
  %14 = load i64, ptr %5, align 8
  call void @_ZN8sqvectorI11SQObjectPtrE8_reallocEy(ptr noundef nonnull align 8 dereferenceable(24) %8, i64 noundef %14)
  br label %15

15:                                               ; preds = %13, %3
  %16 = load i64, ptr %5, align 8
  %17 = getelementptr inbounds %class.sqvector, ptr %8, i32 0, i32 1
  %18 = load i64, ptr %17, align 8
  %19 = icmp ugt i64 %16, %18
  br i1 %19, label %20, label %38

20:                                               ; preds = %15
  br label %21

21:                                               ; preds = %26, %20
  %22 = getelementptr inbounds %class.sqvector, ptr %8, i32 0, i32 1
  %23 = load i64, ptr %22, align 8
  %24 = load i64, ptr %5, align 8
  %25 = icmp ult i64 %23, %24
  br i1 %25, label %26, label %37

26:                                               ; preds = %21
  %27 = getelementptr inbounds %class.sqvector, ptr %8, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds %class.sqvector, ptr %8, i32 0, i32 1
  %30 = load i64, ptr %29, align 8
  %31 = getelementptr inbounds %struct.SQObjectPtr, ptr %28, i64 %30
  %32 = load ptr, ptr %6, align 8
  %33 = call noundef ptr @_ZN11SQObjectPtrC1ERKS_(ptr noundef nonnull align 8 dereferenceable(16) %31, ptr noundef nonnull align 8 dereferenceable(16) %32)
  %34 = getelementptr inbounds %class.sqvector, ptr %8, i32 0, i32 1
  %35 = load i64, ptr %34, align 8
  %36 = add i64 %35, 1
  store i64 %36, ptr %34, align 8
  br label %21, !llvm.loop !21

37:                                               ; preds = %21
  br label %57

38:                                               ; preds = %15
  %39 = load i64, ptr %5, align 8
  store i64 %39, ptr %7, align 8
  br label %40

40:                                               ; preds = %51, %38
  %41 = load i64, ptr %7, align 8
  %42 = getelementptr inbounds %class.sqvector, ptr %8, i32 0, i32 1
  %43 = load i64, ptr %42, align 8
  %44 = icmp ult i64 %41, %43
  br i1 %44, label %45, label %54

45:                                               ; preds = %40
  %46 = getelementptr inbounds %class.sqvector, ptr %8, i32 0, i32 0
  %47 = load ptr, ptr %46, align 8
  %48 = load i64, ptr %7, align 8
  %49 = getelementptr inbounds %struct.SQObjectPtr, ptr %47, i64 %48
  %50 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %49) #10
  br label %51

51:                                               ; preds = %45
  %52 = load i64, ptr %7, align 8
  %53 = add i64 %52, 1
  store i64 %53, ptr %7, align 8
  br label %40, !llvm.loop !22

54:                                               ; preds = %40
  %55 = load i64, ptr %5, align 8
  %56 = getelementptr inbounds %class.sqvector, ptr %8, i32 0, i32 1
  store i64 %55, ptr %56, align 8
  br label %57

57:                                               ; preds = %54, %37
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_resume(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %8, i64 noundef -1)
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %9, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = icmp eq i32 %11, 134218752
  br i1 %12, label %13, label %35

13:                                               ; preds = %3
  %14 = load ptr, ptr %5, align 8
  call void @_ZN4SQVM8PushNullEv(ptr noundef nonnull align 8 dereferenceable(344) %14)
  %15 = load ptr, ptr %5, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %16, i64 noundef -2)
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.SQVM, ptr %18, i32 0, i32 2
  %20 = load i64, ptr %19, align 8
  %21 = load ptr, ptr %5, align 8
  %22 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %21, i64 noundef -1)
  %23 = load i64, ptr %7, align 8
  %24 = call noundef zeroext i1 @_ZN4SQVM7ExecuteER11SQObjectPtrxxS1_yNS_13ExecutionTypeE(ptr noundef nonnull align 8 dereferenceable(344) %15, ptr noundef nonnull align 8 dereferenceable(16) %17, i64 noundef 0, i64 noundef %20, ptr noundef nonnull align 8 dereferenceable(16) %22, i64 noundef %23, i32 noundef 1)
  br i1 %24, label %29, label %25

25:                                               ; preds = %13
  %26 = load ptr, ptr %5, align 8
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds %struct.SQVM, ptr %27, i32 0, i32 6
  call void @_ZN4SQVM11Raise_ErrorERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %26, ptr noundef nonnull align 8 dereferenceable(16) %28)
  store i64 -1, ptr %4, align 8
  br label %38

29:                                               ; preds = %13
  %30 = load i64, ptr %6, align 8
  %31 = icmp ne i64 %30, 0
  br i1 %31, label %34, label %32

32:                                               ; preds = %29
  %33 = load ptr, ptr %5, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %33)
  br label %34

34:                                               ; preds = %32, %29
  store i64 0, ptr %4, align 8
  br label %38

35:                                               ; preds = %3
  %36 = load ptr, ptr %5, align 8
  %37 = call i64 @sq_throwerror(ptr noundef %36, ptr noundef @.str.35)
  store i64 %37, ptr %4, align 8
  br label %38

38:                                               ; preds = %35, %34, %25
  %39 = load i64, ptr %4, align 8
  ret i64 %39
}

declare noundef zeroext i1 @_ZN4SQVM7ExecuteER11SQObjectPtrxxS1_yNS_13ExecutionTypeE(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), i64 noundef, i64 noundef, ptr noundef nonnull align 8 dereferenceable(16), i64 noundef, i32 noundef) #1

declare void @_ZN4SQVM11Raise_ErrorERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_call(ptr noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3) #0 personality ptr @__gxx_personality_v0 {
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca %struct.SQObjectPtr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i64 %1, ptr %7, align 8
  store i64 %2, ptr %8, align 8
  store i64 %3, ptr %9, align 8
  %14 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10)
  %15 = load ptr, ptr %6, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = load i64, ptr %7, align 8
  %18 = add nsw i64 %17, 1
  %19 = sub nsw i64 0, %18
  %20 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %16, i64 noundef %19)
          to label %21 unwind label %39

21:                                               ; preds = %4
  %22 = load i64, ptr %7, align 8
  %23 = load ptr, ptr %6, align 8
  %24 = getelementptr inbounds %struct.SQVM, ptr %23, i32 0, i32 2
  %25 = load i64, ptr %24, align 8
  %26 = load i64, ptr %7, align 8
  %27 = sub nsw i64 %25, %26
  %28 = load i64, ptr %9, align 8
  %29 = icmp ne i64 %28, 0
  %30 = zext i1 %29 to i64
  %31 = select i1 %29, i1 true, i1 false
  %32 = zext i1 %31 to i64
  %33 = invoke noundef zeroext i1 @_ZN4SQVM4CallER11SQObjectPtrxxS1_y(ptr noundef nonnull align 8 dereferenceable(344) %15, ptr noundef nonnull align 8 dereferenceable(16) %20, i64 noundef %22, i64 noundef %27, ptr noundef nonnull align 8 dereferenceable(16) %10, i64 noundef %32)
          to label %34 unwind label %39

34:                                               ; preds = %21
  br i1 %33, label %44, label %35

35:                                               ; preds = %34
  %36 = load ptr, ptr %6, align 8
  %37 = load i64, ptr %7, align 8
  invoke void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %36, i64 noundef %37)
          to label %38 unwind label %39

38:                                               ; preds = %35
  store i64 -1, ptr %5, align 8
  store i32 1, ptr %13, align 4
  br label %60

39:                                               ; preds = %56, %49, %35, %21, %4
  %40 = landingpad { ptr, i32 }
          cleanup
  %41 = extractvalue { ptr, i32 } %40, 0
  store ptr %41, ptr %11, align 8
  %42 = extractvalue { ptr, i32 } %40, 1
  store i32 %42, ptr %12, align 4
  %43 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10) #10
  br label %63

44:                                               ; preds = %34
  %45 = load ptr, ptr %6, align 8
  %46 = getelementptr inbounds %struct.SQVM, ptr %45, i32 0, i32 23
  %47 = load i64, ptr %46, align 8
  %48 = icmp ne i64 %47, 0
  br i1 %48, label %53, label %49

49:                                               ; preds = %44
  %50 = load ptr, ptr %6, align 8
  %51 = load i64, ptr %7, align 8
  invoke void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %50, i64 noundef %51)
          to label %52 unwind label %39

52:                                               ; preds = %49
  br label %53

53:                                               ; preds = %52, %44
  %54 = load i64, ptr %8, align 8
  %55 = icmp ne i64 %54, 0
  br i1 %55, label %56, label %59

56:                                               ; preds = %53
  %57 = load ptr, ptr %6, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %57, ptr noundef nonnull align 8 dereferenceable(16) %10)
          to label %58 unwind label %39

58:                                               ; preds = %56
  br label %59

59:                                               ; preds = %58, %53
  store i64 0, ptr %5, align 8
  store i32 1, ptr %13, align 4
  br label %60

60:                                               ; preds = %59, %38
  %61 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10) #10
  %62 = load i64, ptr %5, align 8
  ret i64 %62

63:                                               ; preds = %39
  %64 = load ptr, ptr %11, align 8
  %65 = load i32, ptr %12, align 4
  %66 = insertvalue { ptr, i32 } poison, ptr %64, 0
  %67 = insertvalue { ptr, i32 } %66, i32 %65, 1
  resume { ptr, i32 } %67
}

declare noundef zeroext i1 @_ZN4SQVM4CallER11SQObjectPtrxxS1_y(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), i64 noundef, i64 noundef, ptr noundef nonnull align 8 dereferenceable(16), i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_tailcall(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = load i64, ptr %5, align 8
  %11 = add nsw i64 %10, 1
  %12 = sub nsw i64 0, %11
  %13 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %9, i64 noundef %12)
  store ptr %13, ptr %6, align 8
  %14 = load ptr, ptr %6, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = icmp ne i32 %16, 134217984
  br i1 %17, label %18, label %21

18:                                               ; preds = %2
  %19 = load ptr, ptr %4, align 8
  %20 = call i64 @sq_throwerror(ptr noundef %19, ptr noundef @.str.36)
  store i64 %20, ptr %3, align 8
  br label %51

21:                                               ; preds = %2
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds %struct.tagSQObject, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %7, align 8
  %25 = load ptr, ptr %7, align 8
  %26 = getelementptr inbounds %struct.SQClosure, ptr %25, i32 0, i32 4
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %struct.SQFunctionProto, ptr %27, i32 0, i32 4
  %29 = load i8, ptr %28, align 8
  %30 = trunc i8 %29 to i1
  br i1 %30, label %31, label %34

31:                                               ; preds = %21
  %32 = load ptr, ptr %4, align 8
  %33 = call i64 @sq_throwerror(ptr noundef %32, ptr noundef @.str.37)
  store i64 %33, ptr %3, align 8
  br label %51

34:                                               ; preds = %21
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds %struct.SQVM, ptr %35, i32 0, i32 2
  %37 = load i64, ptr %36, align 8
  %38 = load i64, ptr %5, align 8
  %39 = sub nsw i64 %37, %38
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.SQVM, ptr %40, i32 0, i32 3
  %42 = load i64, ptr %41, align 8
  %43 = sub nsw i64 %39, %42
  store i64 %43, ptr %8, align 8
  %44 = load ptr, ptr %4, align 8
  %45 = load ptr, ptr %7, align 8
  %46 = load i64, ptr %8, align 8
  %47 = load i64, ptr %5, align 8
  %48 = call noundef zeroext i1 @_ZN4SQVM8TailCallEP9SQClosurexx(ptr noundef nonnull align 8 dereferenceable(344) %44, ptr noundef %45, i64 noundef %46, i64 noundef %47)
  br i1 %48, label %50, label %49

49:                                               ; preds = %34
  store i64 -1, ptr %3, align 8
  br label %51

50:                                               ; preds = %34
  store i64 -777, ptr %3, align 8
  br label %51

51:                                               ; preds = %50, %49, %31, %18
  %52 = load i64, ptr %3, align 8
  ret i64 %52
}

declare noundef zeroext i1 @_ZN4SQVM8TailCallEP9SQClosurexx(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef, i64 noundef, i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_suspendvm(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef i64 @_ZN4SQVM7SuspendEv(ptr noundef nonnull align 8 dereferenceable(344) %3)
  ret i64 %4
}

declare noundef i64 @_ZN4SQVM7SuspendEv(ptr noundef nonnull align 8 dereferenceable(344)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_wakeupvm(ptr noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4) #0 personality ptr @__gxx_personality_v0 {
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca %struct.SQObjectPtr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i64, align 8
  %17 = alloca %struct.SQObjectPtr, align 8
  store ptr %0, ptr %7, align 8
  store i64 %1, ptr %8, align 8
  store i64 %2, ptr %9, align 8
  store i64 %3, ptr %10, align 8
  store i64 %4, ptr %11, align 8
  %18 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %12)
  %19 = load ptr, ptr %7, align 8
  %20 = getelementptr inbounds %struct.SQVM, ptr %19, i32 0, i32 23
  %21 = load i64, ptr %20, align 8
  %22 = icmp ne i64 %21, 0
  br i1 %22, label %31, label %23

23:                                               ; preds = %5
  %24 = load ptr, ptr %7, align 8
  %25 = invoke i64 @sq_throwerror(ptr noundef %24, ptr noundef @.str.38)
          to label %26 unwind label %27

26:                                               ; preds = %23
  store i64 %25, ptr %6, align 8
  store i32 1, ptr %15, align 4
  br label %101

27:                                               ; preds = %75, %72, %62, %56, %53, %43, %40, %23
  %28 = landingpad { ptr, i32 }
          cleanup
  %29 = extractvalue { ptr, i32 } %28, 0
  store ptr %29, ptr %13, align 8
  %30 = extractvalue { ptr, i32 } %28, 1
  store i32 %30, ptr %14, align 4
  br label %104

31:                                               ; preds = %5
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds %struct.SQVM, ptr %32, i32 0, i32 25
  %34 = load i64, ptr %33, align 8
  store i64 %34, ptr %16, align 8
  %35 = load i64, ptr %8, align 8
  %36 = icmp ne i64 %35, 0
  br i1 %36, label %37, label %59

37:                                               ; preds = %31
  %38 = load i64, ptr %16, align 8
  %39 = icmp ne i64 %38, -1
  br i1 %39, label %40, label %56

40:                                               ; preds = %37
  %41 = load ptr, ptr %7, align 8
  %42 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %41, i64 noundef -1)
          to label %43 unwind label %27

43:                                               ; preds = %40
  %44 = load ptr, ptr %7, align 8
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds %struct.SQVM, ptr %45, i32 0, i32 3
  %47 = load i64, ptr %46, align 8
  %48 = load ptr, ptr %7, align 8
  %49 = getelementptr inbounds %struct.SQVM, ptr %48, i32 0, i32 25
  %50 = load i64, ptr %49, align 8
  %51 = add nsw i64 %47, %50
  %52 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetAtEx(ptr noundef nonnull align 8 dereferenceable(344) %44, i64 noundef %51)
          to label %53 unwind label %27

53:                                               ; preds = %43
  %54 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %52, ptr noundef nonnull align 8 dereferenceable(16) %42)
          to label %55 unwind label %27

55:                                               ; preds = %53
  br label %56

56:                                               ; preds = %55, %37
  %57 = load ptr, ptr %7, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %57)
          to label %58 unwind label %27

58:                                               ; preds = %56
  br label %75

59:                                               ; preds = %31
  %60 = load i64, ptr %16, align 8
  %61 = icmp ne i64 %60, -1
  br i1 %61, label %62, label %74

62:                                               ; preds = %59
  %63 = load ptr, ptr %7, align 8
  %64 = load ptr, ptr %7, align 8
  %65 = getelementptr inbounds %struct.SQVM, ptr %64, i32 0, i32 3
  %66 = load i64, ptr %65, align 8
  %67 = load ptr, ptr %7, align 8
  %68 = getelementptr inbounds %struct.SQVM, ptr %67, i32 0, i32 25
  %69 = load i64, ptr %68, align 8
  %70 = add nsw i64 %66, %69
  %71 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetAtEx(ptr noundef nonnull align 8 dereferenceable(344) %63, i64 noundef %70)
          to label %72 unwind label %27

72:                                               ; preds = %62
  invoke void @_ZN11SQObjectPtr4NullEv(ptr noundef nonnull align 8 dereferenceable(16) %71)
          to label %73 unwind label %27

73:                                               ; preds = %72
  br label %74

74:                                               ; preds = %73, %59
  br label %75

75:                                               ; preds = %74, %58
  %76 = invoke noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %17)
          to label %77 unwind label %27

77:                                               ; preds = %75
  %78 = load ptr, ptr %7, align 8
  %79 = load i64, ptr %10, align 8
  %80 = load i64, ptr %11, align 8
  %81 = icmp ne i64 %80, 0
  %82 = zext i1 %81 to i64
  %83 = select i1 %81, i32 3, i32 2
  %84 = invoke noundef zeroext i1 @_ZN4SQVM7ExecuteER11SQObjectPtrxxS1_yNS_13ExecutionTypeE(ptr noundef nonnull align 8 dereferenceable(344) %78, ptr noundef nonnull align 8 dereferenceable(16) %17, i64 noundef -1, i64 noundef -1, ptr noundef nonnull align 8 dereferenceable(16) %12, i64 noundef %79, i32 noundef %83)
          to label %85 unwind label %87

85:                                               ; preds = %77
  br i1 %84, label %92, label %86

86:                                               ; preds = %85
  store i64 -1, ptr %6, align 8
  store i32 1, ptr %15, align 4
  br label %99

87:                                               ; preds = %95, %77
  %88 = landingpad { ptr, i32 }
          cleanup
  %89 = extractvalue { ptr, i32 } %88, 0
  store ptr %89, ptr %13, align 8
  %90 = extractvalue { ptr, i32 } %88, 1
  store i32 %90, ptr %14, align 4
  %91 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %17) #10
  br label %104

92:                                               ; preds = %85
  %93 = load i64, ptr %9, align 8
  %94 = icmp ne i64 %93, 0
  br i1 %94, label %95, label %98

95:                                               ; preds = %92
  %96 = load ptr, ptr %7, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %96, ptr noundef nonnull align 8 dereferenceable(16) %12)
          to label %97 unwind label %87

97:                                               ; preds = %95
  br label %98

98:                                               ; preds = %97, %92
  store i64 0, ptr %6, align 8
  store i32 1, ptr %15, align 4
  br label %99

99:                                               ; preds = %98, %86
  %100 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %17) #10
  br label %101

101:                                              ; preds = %99, %26
  %102 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %12) #10
  %103 = load i64, ptr %6, align 8
  ret i64 %103

104:                                              ; preds = %87, %27
  %105 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %12) #10
  br label %106

106:                                              ; preds = %104
  %107 = load ptr, ptr %13, align 8
  %108 = load i32, ptr %14, align 4
  %109 = insertvalue { ptr, i32 } poison, ptr %107, 0
  %110 = insertvalue { ptr, i32 } %109, i32 %108, 1
  resume { ptr, i32 } %110
}

declare noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetAtEx(ptr noundef nonnull align 8 dereferenceable(344), i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_setreleasehook(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load i64, ptr %5, align 8
  %10 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %8, i64 noundef %9)
  store ptr %10, ptr %7, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = getelementptr inbounds %struct.tagSQObject, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %12, align 8
  switch i32 %13, label %32 [
    i32 167772288, label %14
    i32 167804928, label %20
    i32 134234112, label %26
  ]

14:                                               ; preds = %3
  %15 = load ptr, ptr %6, align 8
  %16 = load ptr, ptr %7, align 8
  %17 = getelementptr inbounds %struct.tagSQObject, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.SQUserData, ptr %18, i32 0, i32 2
  store ptr %15, ptr %19, align 8
  br label %33

20:                                               ; preds = %3
  %21 = load ptr, ptr %6, align 8
  %22 = load ptr, ptr %7, align 8
  %23 = getelementptr inbounds %struct.tagSQObject, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.SQInstance, ptr %24, i32 0, i32 3
  store ptr %21, ptr %25, align 8
  br label %33

26:                                               ; preds = %3
  %27 = load ptr, ptr %6, align 8
  %28 = load ptr, ptr %7, align 8
  %29 = getelementptr inbounds %struct.tagSQObject, ptr %28, i32 0, i32 1
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds %struct.SQClass, ptr %30, i32 0, i32 8
  store ptr %27, ptr %31, align 8
  br label %33

32:                                               ; preds = %3
  br label %33

33:                                               ; preds = %32, %26, %20, %14
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_getreleasehook(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %7, i64 noundef %8)
  store ptr %9, ptr %6, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  switch i32 %12, label %31 [
    i32 167772288, label %13
    i32 167804928, label %19
    i32 134234112, label %25
  ]

13:                                               ; preds = %2
  %14 = load ptr, ptr %6, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.SQUserData, ptr %16, i32 0, i32 2
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %3, align 8
  br label %32

19:                                               ; preds = %2
  %20 = load ptr, ptr %6, align 8
  %21 = getelementptr inbounds %struct.tagSQObject, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds %struct.SQInstance, ptr %22, i32 0, i32 3
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %3, align 8
  br label %32

25:                                               ; preds = %2
  %26 = load ptr, ptr %6, align 8
  %27 = getelementptr inbounds %struct.tagSQObject, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds %struct.SQClass, ptr %28, i32 0, i32 8
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %3, align 8
  br label %32

31:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %32

32:                                               ; preds = %31, %25, %19, %13
  %33 = load ptr, ptr %3, align 8
  ret ptr %33
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_setcompilererrorhandler(ptr noundef %0, ptr noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.SQVM, ptr %6, i32 0, i32 19
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds %struct.SQSharedState, ptr %8, i32 0, i32 21
  store ptr %5, ptr %9, align 8
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_writeclosure(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i16, align 2
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr null, ptr %8, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %10, i64 noundef -1, i32 noundef 134217984, ptr noundef %8)
  br i1 %11, label %13, label %12

12:                                               ; preds = %3
  store i64 -1, ptr %4, align 8
  br label %43

13:                                               ; preds = %3
  store i16 -1286, ptr %9, align 2
  %14 = load ptr, ptr %8, align 8
  %15 = getelementptr inbounds %struct.tagSQObject, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.SQClosure, ptr %16, i32 0, i32 4
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.SQFunctionProto, ptr %18, i32 0, i32 16
  %20 = load i64, ptr %19, align 8
  %21 = icmp ne i64 %20, 0
  br i1 %21, label %22, label %25

22:                                               ; preds = %13
  %23 = load ptr, ptr %5, align 8
  %24 = call i64 @sq_throwerror(ptr noundef %23, ptr noundef @.str.39)
  store i64 %24, ptr %4, align 8
  br label %43

25:                                               ; preds = %13
  %26 = load ptr, ptr %6, align 8
  %27 = load ptr, ptr %7, align 8
  %28 = call noundef i64 %26(ptr noundef %27, ptr noundef %9, i64 noundef 2)
  %29 = icmp ne i64 %28, 2
  br i1 %29, label %30, label %33

30:                                               ; preds = %25
  %31 = load ptr, ptr %5, align 8
  %32 = call i64 @sq_throwerror(ptr noundef %31, ptr noundef @.str.40)
  store i64 %32, ptr %4, align 8
  br label %43

33:                                               ; preds = %25
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds %struct.tagSQObject, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = load ptr, ptr %5, align 8
  %38 = load ptr, ptr %7, align 8
  %39 = load ptr, ptr %6, align 8
  %40 = call noundef zeroext i1 @_ZN9SQClosure4SaveEP4SQVMPvPFxS2_S2_xE(ptr noundef nonnull align 8 dereferenceable(96) %36, ptr noundef %37, ptr noundef %38, ptr noundef %39)
  br i1 %40, label %42, label %41

41:                                               ; preds = %33
  store i64 -1, ptr %4, align 8
  br label %43

42:                                               ; preds = %33
  store i64 0, ptr %4, align 8
  br label %43

43:                                               ; preds = %42, %41, %30, %22, %12
  %44 = load i64, ptr %4, align 8
  ret i64 %44
}

declare noundef zeroext i1 @_ZN9SQClosure4SaveEP4SQVMPvPFxS2_S2_xE(ptr noundef nonnull align 8 dereferenceable(96), ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_readclosure(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 personality ptr @__gxx_personality_v0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.SQObjectPtr, align 8
  %9 = alloca i16, align 2
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %13 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8)
  %14 = load ptr, ptr %6, align 8
  %15 = load ptr, ptr %7, align 8
  %16 = invoke noundef i64 %14(ptr noundef %15, ptr noundef %9, i64 noundef 2)
          to label %17 unwind label %23

17:                                               ; preds = %3
  %18 = icmp ne i64 %16, 2
  br i1 %18, label %19, label %28

19:                                               ; preds = %17
  %20 = load ptr, ptr %5, align 8
  %21 = invoke i64 @sq_throwerror(ptr noundef %20, ptr noundef @.str.40)
          to label %22 unwind label %23

22:                                               ; preds = %19
  store i64 %21, ptr %4, align 8
  store i32 1, ptr %12, align 4
  br label %46

23:                                               ; preds = %43, %36, %32, %19, %3
  %24 = landingpad { ptr, i32 }
          cleanup
  %25 = extractvalue { ptr, i32 } %24, 0
  store ptr %25, ptr %10, align 8
  %26 = extractvalue { ptr, i32 } %24, 1
  store i32 %26, ptr %11, align 4
  %27 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #10
  br label %49

28:                                               ; preds = %17
  %29 = load i16, ptr %9, align 2
  %30 = zext i16 %29 to i32
  %31 = icmp ne i32 %30, 64250
  br i1 %31, label %32, label %36

32:                                               ; preds = %28
  %33 = load ptr, ptr %5, align 8
  %34 = invoke i64 @sq_throwerror(ptr noundef %33, ptr noundef @.str.41)
          to label %35 unwind label %23

35:                                               ; preds = %32
  store i64 %34, ptr %4, align 8
  store i32 1, ptr %12, align 4
  br label %46

36:                                               ; preds = %28
  %37 = load ptr, ptr %5, align 8
  %38 = load ptr, ptr %7, align 8
  %39 = load ptr, ptr %6, align 8
  %40 = invoke noundef zeroext i1 @_ZN9SQClosure4LoadEP4SQVMPvPFxS2_S2_xER11SQObjectPtr(ptr noundef %37, ptr noundef %38, ptr noundef %39, ptr noundef nonnull align 8 dereferenceable(16) %8)
          to label %41 unwind label %23

41:                                               ; preds = %36
  br i1 %40, label %43, label %42

42:                                               ; preds = %41
  store i64 -1, ptr %4, align 8
  store i32 1, ptr %12, align 4
  br label %46

43:                                               ; preds = %41
  %44 = load ptr, ptr %5, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %44, ptr noundef nonnull align 8 dereferenceable(16) %8)
          to label %45 unwind label %23

45:                                               ; preds = %43
  store i64 0, ptr %4, align 8
  store i32 1, ptr %12, align 4
  br label %46

46:                                               ; preds = %45, %42, %35, %22
  %47 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #10
  %48 = load i64, ptr %4, align 8
  ret i64 %48

49:                                               ; preds = %23
  %50 = load ptr, ptr %10, align 8
  %51 = load i32, ptr %11, align 4
  %52 = insertvalue { ptr, i32 } poison, ptr %50, 0
  %53 = insertvalue { ptr, i32 } %52, i32 %51, 1
  resume { ptr, i32 } %53
}

declare noundef zeroext i1 @_ZN9SQClosure4LoadEP4SQVMPvPFxS2_S2_xER11SQObjectPtr(ptr noundef, ptr noundef, ptr noundef, ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_getscratchpad(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.SQVM, ptr %5, i32 0, i32 19
  %7 = load ptr, ptr %6, align 8
  %8 = load i64, ptr %4, align 8
  %9 = call noundef ptr @_ZN13SQSharedState13GetScratchPadEx(ptr noundef nonnull align 8 dereferenceable(384) %7, i64 noundef %8)
  ret ptr %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_resurrectunreachable(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 19
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = call noundef i64 @_ZN13SQSharedState20ResurrectUnreachableEP4SQVM(ptr noundef nonnull align 8 dereferenceable(384) %5, ptr noundef %6)
  ret i64 0
}

declare noundef i64 @_ZN13SQSharedState20ResurrectUnreachableEP4SQVM(ptr noundef nonnull align 8 dereferenceable(384), ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_collectgarbage(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 19
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = call noundef i64 @_ZN13SQSharedState14CollectGarbageEP4SQVM(ptr noundef nonnull align 8 dereferenceable(384) %5, ptr noundef %6)
  ret i64 %7
}

declare noundef i64 @_ZN13SQSharedState14CollectGarbageEP4SQVM(ptr noundef nonnull align 8 dereferenceable(384), ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getcallee(ptr noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.SQVM, ptr %4, i32 0, i32 13
  %6 = load i64, ptr %5, align 8
  %7 = icmp sgt i64 %6, 1
  br i1 %7, label %8, label %19

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.SQVM, ptr %10, i32 0, i32 12
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.SQVM, ptr %13, i32 0, i32 13
  %15 = load i64, ptr %14, align 8
  %16 = sub nsw i64 %15, 2
  %17 = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %12, i64 %16
  %18 = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %17, i32 0, i32 2
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %9, ptr noundef nonnull align 8 dereferenceable(16) %18)
  store i64 0, ptr %2, align 8
  br label %22

19:                                               ; preds = %1
  %20 = load ptr, ptr %3, align 8
  %21 = call i64 @sq_throwerror(ptr noundef %20, ptr noundef @.str.42)
  store i64 %21, ptr %2, align 8
  br label %22

22:                                               ; preds = %19, %8
  %23 = load i64, ptr %2, align 8
  ret i64 %23
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_getfreevariable(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = load i64, ptr %5, align 8
  %15 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %13, i64 noundef %14)
  store ptr %15, ptr %7, align 8
  store ptr null, ptr %8, align 8
  %16 = load ptr, ptr %7, align 8
  %17 = getelementptr inbounds %struct.tagSQObject, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  switch i32 %18, label %71 [
    i32 134217984, label %19
    i32 134218240, label %54
  ]

19:                                               ; preds = %3
  %20 = load ptr, ptr %7, align 8
  %21 = getelementptr inbounds %struct.tagSQObject, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %9, align 8
  %23 = load ptr, ptr %9, align 8
  %24 = getelementptr inbounds %struct.SQClosure, ptr %23, i32 0, i32 4
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %10, align 8
  %26 = load ptr, ptr %10, align 8
  %27 = getelementptr inbounds %struct.SQFunctionProto, ptr %26, i32 0, i32 16
  %28 = load i64, ptr %27, align 8
  %29 = load i64, ptr %6, align 8
  %30 = icmp ugt i64 %28, %29
  br i1 %30, label %31, label %53

31:                                               ; preds = %19
  %32 = load ptr, ptr %4, align 8
  %33 = load ptr, ptr %9, align 8
  %34 = getelementptr inbounds %struct.SQClosure, ptr %33, i32 0, i32 5
  %35 = load ptr, ptr %34, align 8
  %36 = load i64, ptr %6, align 8
  %37 = getelementptr inbounds %struct.SQObjectPtr, ptr %35, i64 %36
  %38 = getelementptr inbounds %struct.tagSQObject, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds %struct.SQOuter, ptr %39, i32 0, i32 1
  %41 = load ptr, ptr %40, align 8
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %32, ptr noundef nonnull align 8 dereferenceable(16) %41)
  %42 = load ptr, ptr %10, align 8
  %43 = getelementptr inbounds %struct.SQFunctionProto, ptr %42, i32 0, i32 17
  %44 = load ptr, ptr %43, align 8
  %45 = load i64, ptr %6, align 8
  %46 = getelementptr inbounds %struct.SQOuterVar, ptr %44, i64 %45
  store ptr %46, ptr %11, align 8
  %47 = load ptr, ptr %11, align 8
  %48 = getelementptr inbounds %struct.SQOuterVar, ptr %47, i32 0, i32 1
  %49 = getelementptr inbounds %struct.tagSQObject, ptr %48, i32 0, i32 1
  %50 = load ptr, ptr %49, align 8
  %51 = getelementptr inbounds %struct.SQString, ptr %50, i32 0, i32 5
  %52 = getelementptr inbounds [1 x i8], ptr %51, i64 0, i64 0
  store ptr %52, ptr %8, align 8
  br label %53

53:                                               ; preds = %31, %19
  br label %72

54:                                               ; preds = %3
  %55 = load ptr, ptr %7, align 8
  %56 = getelementptr inbounds %struct.tagSQObject, ptr %55, i32 0, i32 1
  %57 = load ptr, ptr %56, align 8
  store ptr %57, ptr %12, align 8
  %58 = load ptr, ptr %12, align 8
  %59 = getelementptr inbounds %struct.SQNativeClosure, ptr %58, i32 0, i32 4
  %60 = load i64, ptr %59, align 8
  %61 = load i64, ptr %6, align 8
  %62 = icmp ugt i64 %60, %61
  br i1 %62, label %63, label %70

63:                                               ; preds = %54
  %64 = load ptr, ptr %4, align 8
  %65 = load ptr, ptr %12, align 8
  %66 = getelementptr inbounds %struct.SQNativeClosure, ptr %65, i32 0, i32 3
  %67 = load ptr, ptr %66, align 8
  %68 = load i64, ptr %6, align 8
  %69 = getelementptr inbounds %struct.SQObjectPtr, ptr %67, i64 %68
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %64, ptr noundef nonnull align 8 dereferenceable(16) %69)
  store ptr @.str.43, ptr %8, align 8
  br label %70

70:                                               ; preds = %63, %54
  br label %72

71:                                               ; preds = %3
  br label %72

72:                                               ; preds = %71, %70, %53
  %73 = load ptr, ptr %8, align 8
  ret ptr %73
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setfreevariable(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load i64, ptr %6, align 8
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %10, i64 noundef %11)
  store ptr %12, ptr %8, align 8
  %13 = load ptr, ptr %8, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  switch i32 %15, label %69 [
    i32 134217984, label %16
    i32 134218240, label %46
  ]

16:                                               ; preds = %3
  %17 = load ptr, ptr %8, align 8
  %18 = getelementptr inbounds %struct.tagSQObject, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.SQClosure, ptr %19, i32 0, i32 4
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %9, align 8
  %22 = load ptr, ptr %9, align 8
  %23 = getelementptr inbounds %struct.SQFunctionProto, ptr %22, i32 0, i32 16
  %24 = load i64, ptr %23, align 8
  %25 = load i64, ptr %7, align 8
  %26 = icmp ugt i64 %24, %25
  br i1 %26, label %27, label %42

27:                                               ; preds = %16
  %28 = load ptr, ptr %5, align 8
  %29 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %28, i64 noundef -1)
  %30 = load ptr, ptr %8, align 8
  %31 = getelementptr inbounds %struct.tagSQObject, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds %struct.SQClosure, ptr %32, i32 0, i32 5
  %34 = load ptr, ptr %33, align 8
  %35 = load i64, ptr %7, align 8
  %36 = getelementptr inbounds %struct.SQObjectPtr, ptr %34, i64 %35
  %37 = getelementptr inbounds %struct.tagSQObject, ptr %36, i32 0, i32 1
  %38 = load ptr, ptr %37, align 8
  %39 = getelementptr inbounds %struct.SQOuter, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  %41 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %40, ptr noundef nonnull align 8 dereferenceable(16) %29)
  br label %45

42:                                               ; preds = %16
  %43 = load ptr, ptr %5, align 8
  %44 = call i64 @sq_throwerror(ptr noundef %43, ptr noundef @.str.44)
  store i64 %44, ptr %4, align 8
  br label %77

45:                                               ; preds = %27
  br label %75

46:                                               ; preds = %3
  %47 = load ptr, ptr %8, align 8
  %48 = getelementptr inbounds %struct.tagSQObject, ptr %47, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds %struct.SQNativeClosure, ptr %49, i32 0, i32 4
  %51 = load i64, ptr %50, align 8
  %52 = load i64, ptr %7, align 8
  %53 = icmp ugt i64 %51, %52
  br i1 %53, label %54, label %65

54:                                               ; preds = %46
  %55 = load ptr, ptr %5, align 8
  %56 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %55, i64 noundef -1)
  %57 = load ptr, ptr %8, align 8
  %58 = getelementptr inbounds %struct.tagSQObject, ptr %57, i32 0, i32 1
  %59 = load ptr, ptr %58, align 8
  %60 = getelementptr inbounds %struct.SQNativeClosure, ptr %59, i32 0, i32 3
  %61 = load ptr, ptr %60, align 8
  %62 = load i64, ptr %7, align 8
  %63 = getelementptr inbounds %struct.SQObjectPtr, ptr %61, i64 %62
  %64 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %63, ptr noundef nonnull align 8 dereferenceable(16) %56)
  br label %68

65:                                               ; preds = %46
  %66 = load ptr, ptr %5, align 8
  %67 = call i64 @sq_throwerror(ptr noundef %66, ptr noundef @.str.44)
  store i64 %67, ptr %4, align 8
  br label %77

68:                                               ; preds = %54
  br label %75

69:                                               ; preds = %3
  %70 = load ptr, ptr %5, align 8
  %71 = load ptr, ptr %8, align 8
  %72 = getelementptr inbounds %struct.tagSQObject, ptr %71, i32 0, i32 0
  %73 = load i32, ptr %72, align 8
  %74 = call noundef i64 @_Z18sq_aux_invalidtypeP4SQVM15tagSQObjectType(ptr noundef %70, i32 noundef %73)
  store i64 %74, ptr %4, align 8
  br label %77

75:                                               ; preds = %68, %45
  %76 = load ptr, ptr %5, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %76)
  store i64 0, ptr %4, align 8
  br label %77

77:                                               ; preds = %75, %69, %65, %42
  %78 = load i64, ptr %4, align 8
  ret i64 %78
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setattributes(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %struct.SQObjectPtr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr null, ptr %6, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = load i64, ptr %5, align 8
  %15 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %13, i64 noundef %14, i32 noundef 134234112, ptr noundef %6)
  br i1 %15, label %17, label %16

16:                                               ; preds = %2
  store i64 -1, ptr %3, align 8
  br label %76

17:                                               ; preds = %2
  %18 = load ptr, ptr %4, align 8
  %19 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %18, i64 noundef -2)
  store ptr %19, ptr %7, align 8
  %20 = load ptr, ptr %4, align 8
  %21 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %20, i64 noundef -1)
  store ptr %21, ptr %8, align 8
  %22 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9)
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  %26 = icmp eq i32 %25, 16777217
  br i1 %26, label %27, label %50

27:                                               ; preds = %17
  %28 = load ptr, ptr %6, align 8
  %29 = getelementptr inbounds %struct.tagSQObject, ptr %28, i32 0, i32 1
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds %struct.SQClass, ptr %30, i32 0, i32 6
  %32 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef nonnull align 8 dereferenceable(16) %31)
          to label %33 unwind label %45

33:                                               ; preds = %27
  %34 = load ptr, ptr %8, align 8
  %35 = load ptr, ptr %6, align 8
  %36 = getelementptr inbounds %struct.tagSQObject, ptr %35, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr inbounds %struct.SQClass, ptr %37, i32 0, i32 6
  %39 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %38, ptr noundef nonnull align 8 dereferenceable(16) %34)
          to label %40 unwind label %45

40:                                               ; preds = %33
  %41 = load ptr, ptr %4, align 8
  invoke void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %41, i64 noundef 2)
          to label %42 unwind label %45

42:                                               ; preds = %40
  %43 = load ptr, ptr %4, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %43, ptr noundef nonnull align 8 dereferenceable(16) %9)
          to label %44 unwind label %45

44:                                               ; preds = %42
  store i64 0, ptr %3, align 8
  store i32 1, ptr %12, align 4
  br label %74

45:                                               ; preds = %70, %66, %64, %57, %50, %42, %40, %33, %27
  %46 = landingpad { ptr, i32 }
          cleanup
  %47 = extractvalue { ptr, i32 } %46, 0
  store ptr %47, ptr %10, align 8
  %48 = extractvalue { ptr, i32 } %46, 1
  store i32 %48, ptr %11, align 4
  %49 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9) #10
  br label %78

50:                                               ; preds = %17
  %51 = load ptr, ptr %6, align 8
  %52 = getelementptr inbounds %struct.tagSQObject, ptr %51, i32 0, i32 1
  %53 = load ptr, ptr %52, align 8
  %54 = load ptr, ptr %7, align 8
  %55 = invoke noundef zeroext i1 @_ZN7SQClass13GetAttributesERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(456) %53, ptr noundef nonnull align 8 dereferenceable(16) %54, ptr noundef nonnull align 8 dereferenceable(16) %9)
          to label %56 unwind label %45

56:                                               ; preds = %50
  br i1 %55, label %57, label %69

57:                                               ; preds = %56
  %58 = load ptr, ptr %6, align 8
  %59 = getelementptr inbounds %struct.tagSQObject, ptr %58, i32 0, i32 1
  %60 = load ptr, ptr %59, align 8
  %61 = load ptr, ptr %7, align 8
  %62 = load ptr, ptr %8, align 8
  %63 = invoke noundef zeroext i1 @_ZN7SQClass13SetAttributesERK11SQObjectPtrS2_(ptr noundef nonnull align 8 dereferenceable(456) %60, ptr noundef nonnull align 8 dereferenceable(16) %61, ptr noundef nonnull align 8 dereferenceable(16) %62)
          to label %64 unwind label %45

64:                                               ; preds = %57
  %65 = load ptr, ptr %4, align 8
  invoke void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %65, i64 noundef 2)
          to label %66 unwind label %45

66:                                               ; preds = %64
  %67 = load ptr, ptr %4, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %67, ptr noundef nonnull align 8 dereferenceable(16) %9)
          to label %68 unwind label %45

68:                                               ; preds = %66
  store i64 0, ptr %3, align 8
  store i32 1, ptr %12, align 4
  br label %74

69:                                               ; preds = %56
  br label %70

70:                                               ; preds = %69
  %71 = load ptr, ptr %4, align 8
  %72 = invoke i64 @sq_throwerror(ptr noundef %71, ptr noundef @.str.45)
          to label %73 unwind label %45

73:                                               ; preds = %70
  store i64 %72, ptr %3, align 8
  store i32 1, ptr %12, align 4
  br label %74

74:                                               ; preds = %73, %68, %44
  %75 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9) #10
  br label %76

76:                                               ; preds = %74, %16
  %77 = load i64, ptr %3, align 8
  ret i64 %77

78:                                               ; preds = %45
  %79 = load ptr, ptr %10, align 8
  %80 = load i32, ptr %11, align 4
  %81 = insertvalue { ptr, i32 } poison, ptr %79, 0
  %82 = insertvalue { ptr, i32 } %81, i32 %80, 1
  resume { ptr, i32 } %82
}

declare noundef zeroext i1 @_ZN7SQClass13GetAttributesERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(456), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

declare noundef zeroext i1 @_ZN7SQClass13SetAttributesERK11SQObjectPtrS2_(ptr noundef nonnull align 8 dereferenceable(456), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getattributes(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.SQObjectPtr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr null, ptr %6, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = load i64, ptr %5, align 8
  %14 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %12, i64 noundef %13, i32 noundef 134234112, ptr noundef %6)
  br i1 %14, label %16, label %15

15:                                               ; preds = %2
  store i64 -1, ptr %3, align 8
  br label %59

16:                                               ; preds = %2
  %17 = load ptr, ptr %4, align 8
  %18 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %17, i64 noundef -1)
  store ptr %18, ptr %7, align 8
  %19 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8)
  %20 = load ptr, ptr %7, align 8
  %21 = getelementptr inbounds %struct.tagSQObject, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %21, align 8
  %23 = icmp eq i32 %22, 16777217
  br i1 %23, label %24, label %40

24:                                               ; preds = %16
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds %struct.tagSQObject, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %struct.SQClass, ptr %27, i32 0, i32 6
  %29 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull align 8 dereferenceable(16) %28)
          to label %30 unwind label %35

30:                                               ; preds = %24
  %31 = load ptr, ptr %4, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %31)
          to label %32 unwind label %35

32:                                               ; preds = %30
  %33 = load ptr, ptr %4, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %33, ptr noundef nonnull align 8 dereferenceable(16) %8)
          to label %34 unwind label %35

34:                                               ; preds = %32
  store i64 0, ptr %3, align 8
  store i32 1, ptr %11, align 4
  br label %57

35:                                               ; preds = %53, %49, %47, %40, %32, %30, %24
  %36 = landingpad { ptr, i32 }
          cleanup
  %37 = extractvalue { ptr, i32 } %36, 0
  store ptr %37, ptr %9, align 8
  %38 = extractvalue { ptr, i32 } %36, 1
  store i32 %38, ptr %10, align 4
  %39 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #10
  br label %61

40:                                               ; preds = %16
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds %struct.tagSQObject, ptr %41, i32 0, i32 1
  %43 = load ptr, ptr %42, align 8
  %44 = load ptr, ptr %7, align 8
  %45 = invoke noundef zeroext i1 @_ZN7SQClass13GetAttributesERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(456) %43, ptr noundef nonnull align 8 dereferenceable(16) %44, ptr noundef nonnull align 8 dereferenceable(16) %8)
          to label %46 unwind label %35

46:                                               ; preds = %40
  br i1 %45, label %47, label %52

47:                                               ; preds = %46
  %48 = load ptr, ptr %4, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %48)
          to label %49 unwind label %35

49:                                               ; preds = %47
  %50 = load ptr, ptr %4, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %50, ptr noundef nonnull align 8 dereferenceable(16) %8)
          to label %51 unwind label %35

51:                                               ; preds = %49
  store i64 0, ptr %3, align 8
  store i32 1, ptr %11, align 4
  br label %57

52:                                               ; preds = %46
  br label %53

53:                                               ; preds = %52
  %54 = load ptr, ptr %4, align 8
  %55 = invoke i64 @sq_throwerror(ptr noundef %54, ptr noundef @.str.45)
          to label %56 unwind label %35

56:                                               ; preds = %53
  store i64 %55, ptr %3, align 8
  store i32 1, ptr %11, align 4
  br label %57

57:                                               ; preds = %56, %51, %34
  %58 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #10
  br label %59

59:                                               ; preds = %57, %15
  %60 = load i64, ptr %3, align 8
  ret i64 %60

61:                                               ; preds = %35
  %62 = load ptr, ptr %9, align 8
  %63 = load i32, ptr %10, align 4
  %64 = insertvalue { ptr, i32 } poison, ptr %62, 0
  %65 = insertvalue { ptr, i32 } %64, i32 %63, 1
  resume { ptr, i32 } %65
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getmemberhandle(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 personality ptr @__gxx_personality_v0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca %struct.SQObjectPtr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr null, ptr %8, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = load i64, ptr %6, align 8
  %17 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %15, i64 noundef %16, i32 noundef 134234112, ptr noundef %8)
  br i1 %17, label %19, label %18

18:                                               ; preds = %3
  store i64 -1, ptr %4, align 8
  br label %60

19:                                               ; preds = %3
  %20 = load ptr, ptr %5, align 8
  %21 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %20, i64 noundef -1)
  store ptr %21, ptr %9, align 8
  %22 = load ptr, ptr %8, align 8
  %23 = getelementptr inbounds %struct.tagSQObject, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.SQClass, ptr %24, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  store ptr %26, ptr %10, align 8
  %27 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %11)
  %28 = load ptr, ptr %10, align 8
  %29 = load ptr, ptr %9, align 8
  %30 = invoke noundef zeroext i1 @_ZN7SQTable3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(88) %28, ptr noundef nonnull align 8 dereferenceable(16) %29, ptr noundef nonnull align 8 dereferenceable(16) %11)
          to label %31 unwind label %49

31:                                               ; preds = %19
  br i1 %30, label %32, label %54

32:                                               ; preds = %31
  %33 = getelementptr inbounds %struct.tagSQObject, ptr %11, i32 0, i32 1
  %34 = load i64, ptr %33, align 8
  %35 = and i64 %34, 33554432
  %36 = icmp ne i64 %35, 0
  %37 = zext i1 %36 to i64
  %38 = select i1 %36, i32 0, i32 1
  %39 = sext i32 %38 to i64
  %40 = load ptr, ptr %7, align 8
  %41 = getelementptr inbounds %struct.tagSQMemberHandle, ptr %40, i32 0, i32 0
  store i64 %39, ptr %41, align 8
  %42 = getelementptr inbounds %struct.tagSQObject, ptr %11, i32 0, i32 1
  %43 = load i64, ptr %42, align 8
  %44 = and i64 %43, 16777215
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds %struct.tagSQMemberHandle, ptr %45, i32 0, i32 1
  store i64 %44, ptr %46, align 8
  %47 = load ptr, ptr %5, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %47)
          to label %48 unwind label %49

48:                                               ; preds = %32
  store i64 0, ptr %4, align 8
  store i32 1, ptr %14, align 4
  br label %58

49:                                               ; preds = %54, %32, %19
  %50 = landingpad { ptr, i32 }
          cleanup
  %51 = extractvalue { ptr, i32 } %50, 0
  store ptr %51, ptr %12, align 8
  %52 = extractvalue { ptr, i32 } %50, 1
  store i32 %52, ptr %13, align 4
  %53 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %11) #10
  br label %62

54:                                               ; preds = %31
  %55 = load ptr, ptr %5, align 8
  %56 = invoke i64 @sq_throwerror(ptr noundef %55, ptr noundef @.str.45)
          to label %57 unwind label %49

57:                                               ; preds = %54
  store i64 %56, ptr %4, align 8
  store i32 1, ptr %14, align 4
  br label %58

58:                                               ; preds = %57, %48
  %59 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %11) #10
  br label %60

60:                                               ; preds = %58, %18
  %61 = load i64, ptr %4, align 8
  ret i64 %61

62:                                               ; preds = %49
  %63 = load ptr, ptr %12, align 8
  %64 = load i32, ptr %13, align 4
  %65 = insertvalue { ptr, i32 } poison, ptr %63, 0
  %66 = insertvalue { ptr, i32 } %65, i32 %64, 1
  resume { ptr, i32 } %66
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define noundef i64 @_Z18_getmemberbyhandleP4SQVMR11SQObjectPtrPK17tagSQMemberHandleRPS1_(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef %2, ptr noundef nonnull align 8 dereferenceable(8) %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  switch i32 %15, label %72 [
    i32 167804928, label %16
    i32 134234112, label %45
  ]

16:                                               ; preds = %4
  %17 = load ptr, ptr %7, align 8
  %18 = getelementptr inbounds %struct.tagSQObject, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  store ptr %19, ptr %10, align 8
  %20 = load ptr, ptr %8, align 8
  %21 = getelementptr inbounds %struct.tagSQMemberHandle, ptr %20, i32 0, i32 0
  %22 = load i64, ptr %21, align 8
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %36

24:                                               ; preds = %16
  %25 = load ptr, ptr %10, align 8
  %26 = getelementptr inbounds %struct.SQInstance, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  store ptr %27, ptr %11, align 8
  %28 = load ptr, ptr %11, align 8
  %29 = getelementptr inbounds %struct.SQClass, ptr %28, i32 0, i32 4
  %30 = load ptr, ptr %8, align 8
  %31 = getelementptr inbounds %struct.tagSQMemberHandle, ptr %30, i32 0, i32 1
  %32 = load i64, ptr %31, align 8
  %33 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNK8sqvectorI13SQClassMemberEixEy(ptr noundef nonnull align 8 dereferenceable(24) %29, i64 noundef %32)
  %34 = getelementptr inbounds %struct.SQClassMember, ptr %33, i32 0, i32 0
  %35 = load ptr, ptr %9, align 8
  store ptr %34, ptr %35, align 8
  br label %44

36:                                               ; preds = %16
  %37 = load ptr, ptr %10, align 8
  %38 = getelementptr inbounds %struct.SQInstance, ptr %37, i32 0, i32 5
  %39 = load ptr, ptr %8, align 8
  %40 = getelementptr inbounds %struct.tagSQMemberHandle, ptr %39, i32 0, i32 1
  %41 = load i64, ptr %40, align 8
  %42 = getelementptr inbounds [1 x %struct.SQObjectPtr], ptr %38, i64 0, i64 %41
  %43 = load ptr, ptr %9, align 8
  store ptr %42, ptr %43, align 8
  br label %44

44:                                               ; preds = %36, %24
  br label %75

45:                                               ; preds = %4
  %46 = load ptr, ptr %7, align 8
  %47 = getelementptr inbounds %struct.tagSQObject, ptr %46, i32 0, i32 1
  %48 = load ptr, ptr %47, align 8
  store ptr %48, ptr %12, align 8
  %49 = load ptr, ptr %8, align 8
  %50 = getelementptr inbounds %struct.tagSQMemberHandle, ptr %49, i32 0, i32 0
  %51 = load i64, ptr %50, align 8
  %52 = icmp ne i64 %51, 0
  br i1 %52, label %53, label %62

53:                                               ; preds = %45
  %54 = load ptr, ptr %12, align 8
  %55 = getelementptr inbounds %struct.SQClass, ptr %54, i32 0, i32 4
  %56 = load ptr, ptr %8, align 8
  %57 = getelementptr inbounds %struct.tagSQMemberHandle, ptr %56, i32 0, i32 1
  %58 = load i64, ptr %57, align 8
  %59 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNK8sqvectorI13SQClassMemberEixEy(ptr noundef nonnull align 8 dereferenceable(24) %55, i64 noundef %58)
  %60 = getelementptr inbounds %struct.SQClassMember, ptr %59, i32 0, i32 0
  %61 = load ptr, ptr %9, align 8
  store ptr %60, ptr %61, align 8
  br label %71

62:                                               ; preds = %45
  %63 = load ptr, ptr %12, align 8
  %64 = getelementptr inbounds %struct.SQClass, ptr %63, i32 0, i32 3
  %65 = load ptr, ptr %8, align 8
  %66 = getelementptr inbounds %struct.tagSQMemberHandle, ptr %65, i32 0, i32 1
  %67 = load i64, ptr %66, align 8
  %68 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNK8sqvectorI13SQClassMemberEixEy(ptr noundef nonnull align 8 dereferenceable(24) %64, i64 noundef %67)
  %69 = getelementptr inbounds %struct.SQClassMember, ptr %68, i32 0, i32 0
  %70 = load ptr, ptr %9, align 8
  store ptr %69, ptr %70, align 8
  br label %71

71:                                               ; preds = %62, %53
  br label %75

72:                                               ; preds = %4
  %73 = load ptr, ptr %6, align 8
  %74 = call i64 @sq_throwerror(ptr noundef %73, ptr noundef @.str.46)
  store i64 %74, ptr %5, align 8
  br label %76

75:                                               ; preds = %71, %44
  store i64 0, ptr %5, align 8
  br label %76

76:                                               ; preds = %75, %72
  %77 = load i64, ptr %5, align 8
  ret i64 %77
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(32) ptr @_ZNK8sqvectorI13SQClassMemberEixEy(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #4 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %class.sqvector.3, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = load i64, ptr %4, align 8
  %9 = getelementptr inbounds %struct.SQClassMember, ptr %7, i64 %8
  ret ptr %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getbyhandle(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 personality ptr @__gxx_personality_v0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca %struct.SQObjectPtr, align 8
  %11 = alloca %struct.tagSQObject, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = load i64, ptr %6, align 8
  %16 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %14, i64 noundef %15)
  store ptr %16, ptr %8, align 8
  store ptr null, ptr %9, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = load ptr, ptr %8, align 8
  %19 = load ptr, ptr %7, align 8
  %20 = call noundef i64 @_Z18_getmemberbyhandleP4SQVMR11SQObjectPtrPK17tagSQMemberHandleRPS1_(ptr noundef %17, ptr noundef nonnull align 8 dereferenceable(16) %18, ptr noundef %19, ptr noundef nonnull align 8 dereferenceable(8) %9)
  %21 = icmp slt i64 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %3
  store i64 -1, ptr %4, align 8
  br label %45

23:                                               ; preds = %3
  %24 = load ptr, ptr %5, align 8
  %25 = load ptr, ptr %9, align 8
  %26 = getelementptr inbounds %struct.tagSQObject, ptr %25, i32 0, i32 0
  %27 = load i32, ptr %26, align 8
  %28 = icmp ne i32 %27, 134283264
  br i1 %28, label %29, label %31

29:                                               ; preds = %23
  %30 = load ptr, ptr %9, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %11, ptr align 8 %30, i64 16, i1 false)
  br label %36

31:                                               ; preds = %23
  %32 = load ptr, ptr %9, align 8
  %33 = getelementptr inbounds %struct.tagSQObject, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds %struct.SQWeakRef, ptr %34, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %11, ptr align 8 %35, i64 16, i1 false)
  br label %36

36:                                               ; preds = %31, %29
  %37 = call noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %10, ptr noundef nonnull align 8 dereferenceable(16) %11)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %24, ptr noundef nonnull align 8 dereferenceable(16) %10)
          to label %38 unwind label %40

38:                                               ; preds = %36
  %39 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10) #10
  store i64 0, ptr %4, align 8
  br label %45

40:                                               ; preds = %36
  %41 = landingpad { ptr, i32 }
          cleanup
  %42 = extractvalue { ptr, i32 } %41, 0
  store ptr %42, ptr %12, align 8
  %43 = extractvalue { ptr, i32 } %41, 1
  store i32 %43, ptr %13, align 4
  %44 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10) #10
  br label %47

45:                                               ; preds = %38, %22
  %46 = load i64, ptr %4, align 8
  ret i64 %46

47:                                               ; preds = %40
  %48 = load ptr, ptr %12, align 8
  %49 = load i32, ptr %13, align 4
  %50 = insertvalue { ptr, i32 } poison, ptr %48, 0
  %51 = insertvalue { ptr, i32 } %50, i32 %49, 1
  resume { ptr, i32 } %51
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setbyhandle(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = load i64, ptr %6, align 8
  %13 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %11, i64 noundef %12)
  store ptr %13, ptr %8, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %14, i64 noundef -1)
  store ptr %15, ptr %9, align 8
  store ptr null, ptr %10, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = load ptr, ptr %8, align 8
  %18 = load ptr, ptr %7, align 8
  %19 = call noundef i64 @_Z18_getmemberbyhandleP4SQVMR11SQObjectPtrPK17tagSQMemberHandleRPS1_(ptr noundef %16, ptr noundef nonnull align 8 dereferenceable(16) %17, ptr noundef %18, ptr noundef nonnull align 8 dereferenceable(8) %10)
  %20 = icmp slt i64 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %3
  store i64 -1, ptr %4, align 8
  br label %27

22:                                               ; preds = %3
  %23 = load ptr, ptr %9, align 8
  %24 = load ptr, ptr %10, align 8
  %25 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %24, ptr noundef nonnull align 8 dereferenceable(16) %23)
  %26 = load ptr, ptr %5, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %26)
  store i64 0, ptr %4, align 8
  br label %27

27:                                               ; preds = %22, %21
  %28 = load i64, ptr %4, align 8
  ret i64 %28
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getbase(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.SQObjectPtr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr null, ptr %6, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load i64, ptr %5, align 8
  %12 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %10, i64 noundef %11, i32 noundef 134234112, ptr noundef %6)
  br i1 %12, label %14, label %13

13:                                               ; preds = %2
  store i64 -1, ptr %3, align 8
  br label %39

14:                                               ; preds = %2
  %15 = load ptr, ptr %6, align 8
  %16 = getelementptr inbounds %struct.tagSQObject, ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds %struct.SQClass, ptr %17, i32 0, i32 2
  %19 = load ptr, ptr %18, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %36

21:                                               ; preds = %14
  %22 = load ptr, ptr %4, align 8
  %23 = load ptr, ptr %6, align 8
  %24 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %struct.SQClass, ptr %25, i32 0, i32 2
  %27 = load ptr, ptr %26, align 8
  %28 = call noundef ptr @_ZN11SQObjectPtrC1EP7SQClass(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef %27)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %22, ptr noundef nonnull align 8 dereferenceable(16) %7)
          to label %29 unwind label %31

29:                                               ; preds = %21
  %30 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  br label %38

31:                                               ; preds = %21
  %32 = landingpad { ptr, i32 }
          cleanup
  %33 = extractvalue { ptr, i32 } %32, 0
  store ptr %33, ptr %8, align 8
  %34 = extractvalue { ptr, i32 } %32, 1
  store i32 %34, ptr %9, align 4
  %35 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  br label %41

36:                                               ; preds = %14
  %37 = load ptr, ptr %4, align 8
  call void @_ZN4SQVM8PushNullEv(ptr noundef nonnull align 8 dereferenceable(344) %37)
  br label %38

38:                                               ; preds = %36, %29
  store i64 0, ptr %3, align 8
  br label %39

39:                                               ; preds = %38, %13
  %40 = load i64, ptr %3, align 8
  ret i64 %40

41:                                               ; preds = %31
  %42 = load ptr, ptr %8, align 8
  %43 = load i32, ptr %9, align 4
  %44 = insertvalue { ptr, i32 } poison, ptr %42, 0
  %45 = insertvalue { ptr, i32 } %44, i32 %43, 1
  resume { ptr, i32 } %45
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getclass(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.SQObjectPtr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr null, ptr %6, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load i64, ptr %5, align 8
  %12 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %10, i64 noundef %11, i32 noundef 167804928, ptr noundef %6)
  br i1 %12, label %14, label %13

13:                                               ; preds = %2
  store i64 -1, ptr %3, align 8
  br label %29

14:                                               ; preds = %2
  %15 = load ptr, ptr %4, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = getelementptr inbounds %struct.tagSQObject, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.SQInstance, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = call noundef ptr @_ZN11SQObjectPtrC1EP7SQClass(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef %20)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %15, ptr noundef nonnull align 8 dereferenceable(16) %7)
          to label %22 unwind label %24

22:                                               ; preds = %14
  %23 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  store i64 0, ptr %3, align 8
  br label %29

24:                                               ; preds = %14
  %25 = landingpad { ptr, i32 }
          cleanup
  %26 = extractvalue { ptr, i32 } %25, 0
  store ptr %26, ptr %8, align 8
  %27 = extractvalue { ptr, i32 } %25, 1
  store i32 %27, ptr %9, align 4
  %28 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  br label %31

29:                                               ; preds = %22, %13
  %30 = load i64, ptr %3, align 8
  ret i64 %30

31:                                               ; preds = %24
  %32 = load ptr, ptr %8, align 8
  %33 = load i32, ptr %9, align 4
  %34 = insertvalue { ptr, i32 } poison, ptr %32, 0
  %35 = insertvalue { ptr, i32 } %34, i32 %33, 1
  resume { ptr, i32 } %35
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_createinstance(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.SQObjectPtr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr null, ptr %6, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load i64, ptr %5, align 8
  %12 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %10, i64 noundef %11, i32 noundef 134234112, ptr noundef %6)
  br i1 %12, label %14, label %13

13:                                               ; preds = %2
  store i64 -1, ptr %3, align 8
  br label %28

14:                                               ; preds = %2
  %15 = load ptr, ptr %4, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = getelementptr inbounds %struct.tagSQObject, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = call noundef ptr @_ZN7SQClass14CreateInstanceEv(ptr noundef nonnull align 8 dereferenceable(456) %18)
  %20 = call noundef ptr @_ZN11SQObjectPtrC1EP10SQInstance(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef %19)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %15, ptr noundef nonnull align 8 dereferenceable(16) %7)
          to label %21 unwind label %23

21:                                               ; preds = %14
  %22 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  store i64 0, ptr %3, align 8
  br label %28

23:                                               ; preds = %14
  %24 = landingpad { ptr, i32 }
          cleanup
  %25 = extractvalue { ptr, i32 } %24, 0
  store ptr %25, ptr %8, align 8
  %26 = extractvalue { ptr, i32 } %24, 1
  store i32 %26, ptr %9, align 4
  %27 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  br label %30

28:                                               ; preds = %21, %13
  %29 = load i64, ptr %3, align 8
  ret i64 %29

30:                                               ; preds = %23
  %31 = load ptr, ptr %8, align 8
  %32 = load i32, ptr %9, align 4
  %33 = insertvalue { ptr, i32 } poison, ptr %31, 0
  %34 = insertvalue { ptr, i32 } %33, i32 %32, 1
  resume { ptr, i32 } %34
}

declare noundef ptr @_ZN7SQClass14CreateInstanceEv(ptr noundef nonnull align 8 dereferenceable(456)) #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP10SQInstance(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN11SQObjectPtrC2EP10SQInstance(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_weakref(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca %struct.SQObjectPtr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.SQObjectPtr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = load i64, ptr %4, align 8
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %10, i64 noundef %11)
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = and i32 %15, 134217728
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %35

18:                                               ; preds = %2
  %19 = load ptr, ptr %3, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds %struct.tagSQObject, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  %26 = call noundef ptr @_ZN12SQRefCounted10GetWeakRefE15tagSQObjectType(ptr noundef nonnull align 8 dereferenceable(24) %22, i32 noundef %25)
  %27 = call noundef ptr @_ZN11SQObjectPtrC1EP9SQWeakRef(ptr noundef nonnull align 8 dereferenceable(16) %6, ptr noundef %26)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %19, ptr noundef nonnull align 8 dereferenceable(16) %6)
          to label %28 unwind label %30

28:                                               ; preds = %18
  %29 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %6) #10
  br label %41

30:                                               ; preds = %18
  %31 = landingpad { ptr, i32 }
          cleanup
  %32 = extractvalue { ptr, i32 } %31, 0
  store ptr %32, ptr %7, align 8
  %33 = extractvalue { ptr, i32 } %31, 1
  store i32 %33, ptr %8, align 4
  %34 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %6) #10
  br label %47

35:                                               ; preds = %2
  %36 = load ptr, ptr %3, align 8
  %37 = load ptr, ptr %5, align 8
  %38 = call noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef nonnull align 8 dereferenceable(16) %37)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %36, ptr noundef nonnull align 8 dereferenceable(16) %9)
          to label %39 unwind label %42

39:                                               ; preds = %35
  %40 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9) #10
  br label %41

41:                                               ; preds = %39, %28
  ret void

42:                                               ; preds = %35
  %43 = landingpad { ptr, i32 }
          cleanup
  %44 = extractvalue { ptr, i32 } %43, 0
  store ptr %44, ptr %7, align 8
  %45 = extractvalue { ptr, i32 } %43, 1
  store i32 %45, ptr %8, align 4
  %46 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9) #10
  br label %47

47:                                               ; preds = %42, %30
  %48 = load ptr, ptr %7, align 8
  %49 = load i32, ptr %8, align 4
  %50 = insertvalue { ptr, i32 } poison, ptr %48, 0
  %51 = insertvalue { ptr, i32 } %50, i32 %49, 1
  resume { ptr, i32 } %51
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP9SQWeakRef(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN11SQObjectPtrC2EP9SQWeakRef(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getweakrefval(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.SQObjectPtr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load i64, ptr %5, align 8
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %10, i64 noundef %11)
  store ptr %12, ptr %6, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = icmp ne i32 %15, 134283264
  br i1 %16, label %17, label %20

17:                                               ; preds = %2
  %18 = load ptr, ptr %4, align 8
  %19 = call i64 @sq_throwerror(ptr noundef %18, ptr noundef @.str.47)
  store i64 %19, ptr %3, align 8
  br label %34

20:                                               ; preds = %2
  %21 = load ptr, ptr %4, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds %struct.tagSQObject, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.SQWeakRef, ptr %24, i32 0, i32 1
  %26 = call noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull align 8 dereferenceable(16) %25)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %21, ptr noundef nonnull align 8 dereferenceable(16) %7)
          to label %27 unwind label %29

27:                                               ; preds = %20
  %28 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  store i64 0, ptr %3, align 8
  br label %34

29:                                               ; preds = %20
  %30 = landingpad { ptr, i32 }
          cleanup
  %31 = extractvalue { ptr, i32 } %30, 0
  store ptr %31, ptr %8, align 8
  %32 = extractvalue { ptr, i32 } %30, 1
  store i32 %32, ptr %9, align 4
  %33 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  br label %36

34:                                               ; preds = %27, %17
  %35 = load i64, ptr %3, align 8
  ret i64 %35

36:                                               ; preds = %29
  %37 = load ptr, ptr %8, align 8
  %38 = load i32, ptr %9, align 4
  %39 = insertvalue { ptr, i32 } poison, ptr %37, 0
  %40 = insertvalue { ptr, i32 } %39, i32 %38, 1
  resume { ptr, i32 } %40
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getdefaultdelegate(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.SQVM, ptr %7, i32 0, i32 19
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %6, align 8
  %10 = load i32, ptr %5, align 4
  switch i32 %10, label %51 [
    i32 167772192, label %11
    i32 134217792, label %15
    i32 134217744, label %19
    i32 83886082, label %23
    i32 83886084, label %23
    i32 134218752, label %27
    i32 134217984, label %31
    i32 134218240, label %31
    i32 134221824, label %35
    i32 134234112, label %39
    i32 167804928, label %43
    i32 134283264, label %47
  ]

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = getelementptr inbounds %struct.SQSharedState, ptr %13, i32 0, i32 11
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %12, ptr noundef nonnull align 8 dereferenceable(16) %14)
  br label %54

15:                                               ; preds = %2
  %16 = load ptr, ptr %4, align 8
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds %struct.SQSharedState, ptr %17, i32 0, i32 12
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %16, ptr noundef nonnull align 8 dereferenceable(16) %18)
  br label %54

19:                                               ; preds = %2
  %20 = load ptr, ptr %4, align 8
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds %struct.SQSharedState, ptr %21, i32 0, i32 13
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %20, ptr noundef nonnull align 8 dereferenceable(16) %22)
  br label %54

23:                                               ; preds = %2, %2
  %24 = load ptr, ptr %4, align 8
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds %struct.SQSharedState, ptr %25, i32 0, i32 14
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %24, ptr noundef nonnull align 8 dereferenceable(16) %26)
  br label %54

27:                                               ; preds = %2
  %28 = load ptr, ptr %4, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr inbounds %struct.SQSharedState, ptr %29, i32 0, i32 15
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %28, ptr noundef nonnull align 8 dereferenceable(16) %30)
  br label %54

31:                                               ; preds = %2, %2
  %32 = load ptr, ptr %4, align 8
  %33 = load ptr, ptr %6, align 8
  %34 = getelementptr inbounds %struct.SQSharedState, ptr %33, i32 0, i32 16
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %32, ptr noundef nonnull align 8 dereferenceable(16) %34)
  br label %54

35:                                               ; preds = %2
  %36 = load ptr, ptr %4, align 8
  %37 = load ptr, ptr %6, align 8
  %38 = getelementptr inbounds %struct.SQSharedState, ptr %37, i32 0, i32 17
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %36, ptr noundef nonnull align 8 dereferenceable(16) %38)
  br label %54

39:                                               ; preds = %2
  %40 = load ptr, ptr %4, align 8
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds %struct.SQSharedState, ptr %41, i32 0, i32 18
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %40, ptr noundef nonnull align 8 dereferenceable(16) %42)
  br label %54

43:                                               ; preds = %2
  %44 = load ptr, ptr %4, align 8
  %45 = load ptr, ptr %6, align 8
  %46 = getelementptr inbounds %struct.SQSharedState, ptr %45, i32 0, i32 19
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %44, ptr noundef nonnull align 8 dereferenceable(16) %46)
  br label %54

47:                                               ; preds = %2
  %48 = load ptr, ptr %4, align 8
  %49 = load ptr, ptr %6, align 8
  %50 = getelementptr inbounds %struct.SQSharedState, ptr %49, i32 0, i32 20
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %48, ptr noundef nonnull align 8 dereferenceable(16) %50)
  br label %54

51:                                               ; preds = %2
  %52 = load ptr, ptr %4, align 8
  %53 = call i64 @sq_throwerror(ptr noundef %52, ptr noundef @.str.48)
  store i64 %53, ptr %3, align 8
  br label %55

54:                                               ; preds = %47, %43, %39, %35, %31, %27, %23, %19, %15, %11
  store i64 0, ptr %3, align 8
  br label %55

55:                                               ; preds = %54, %51
  %56 = load i64, ptr %3, align 8
  ret i64 %56
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_next(ptr noundef %0, i64 noundef %1) #0 personality ptr @__gxx_personality_v0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca %struct.SQObjectPtr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.SQObjectPtr, align 8
  %11 = alloca %struct.SQObjectPtr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = load i64, ptr %5, align 8
  %16 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %14, i64 noundef %15)
  %17 = call noundef ptr @_ZN11SQObjectPtrC1ERKS_(ptr noundef nonnull align 8 dereferenceable(16) %6, ptr noundef nonnull align 8 dereferenceable(16) %16)
  %18 = load ptr, ptr %4, align 8
  %19 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %18, i64 noundef -1)
          to label %20 unwind label %32

20:                                               ; preds = %2
  store ptr %19, ptr %7, align 8
  %21 = invoke noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10)
          to label %22 unwind label %32

22:                                               ; preds = %20
  %23 = invoke noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %11)
          to label %24 unwind label %36

24:                                               ; preds = %22
  %25 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = icmp eq i32 %26, 134218752
  br i1 %27, label %28, label %45

28:                                               ; preds = %24
  %29 = load ptr, ptr %4, align 8
  %30 = invoke i64 @sq_throwerror(ptr noundef %29, ptr noundef @.str.49)
          to label %31 unwind label %40

31:                                               ; preds = %28
  store i64 %30, ptr %3, align 8
  store i32 1, ptr %12, align 4
  br label %60

32:                                               ; preds = %20, %2
  %33 = landingpad { ptr, i32 }
          cleanup
  %34 = extractvalue { ptr, i32 } %33, 0
  store ptr %34, ptr %8, align 8
  %35 = extractvalue { ptr, i32 } %33, 1
  store i32 %35, ptr %9, align 4
  br label %67

36:                                               ; preds = %22
  %37 = landingpad { ptr, i32 }
          cleanup
  %38 = extractvalue { ptr, i32 } %37, 0
  store ptr %38, ptr %8, align 8
  %39 = extractvalue { ptr, i32 } %37, 1
  store i32 %39, ptr %9, align 4
  br label %65

40:                                               ; preds = %56, %54, %45, %28
  %41 = landingpad { ptr, i32 }
          cleanup
  %42 = extractvalue { ptr, i32 } %41, 0
  store ptr %42, ptr %8, align 8
  %43 = extractvalue { ptr, i32 } %41, 1
  store i32 %43, ptr %9, align 4
  %44 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %11) #10
  br label %65

45:                                               ; preds = %24
  %46 = load ptr, ptr %4, align 8
  %47 = load ptr, ptr %7, align 8
  %48 = invoke noundef zeroext i1 @_ZN4SQVM10FOREACH_OPER11SQObjectPtrS1_S1_S1_xiRi(ptr noundef nonnull align 8 dereferenceable(344) %46, ptr noundef nonnull align 8 dereferenceable(16) %6, ptr noundef nonnull align 8 dereferenceable(16) %10, ptr noundef nonnull align 8 dereferenceable(16) %11, ptr noundef nonnull align 8 dereferenceable(16) %47, i64 noundef 0, i32 noundef 666, ptr noundef nonnull align 4 dereferenceable(4) %13)
          to label %49 unwind label %40

49:                                               ; preds = %45
  br i1 %48, label %51, label %50

50:                                               ; preds = %49
  store i64 -1, ptr %3, align 8
  store i32 1, ptr %12, align 4
  br label %60

51:                                               ; preds = %49
  %52 = load i32, ptr %13, align 4
  %53 = icmp ne i32 %52, 666
  br i1 %53, label %54, label %59

54:                                               ; preds = %51
  %55 = load ptr, ptr %4, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %55, ptr noundef nonnull align 8 dereferenceable(16) %10)
          to label %56 unwind label %40

56:                                               ; preds = %54
  %57 = load ptr, ptr %4, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %57, ptr noundef nonnull align 8 dereferenceable(16) %11)
          to label %58 unwind label %40

58:                                               ; preds = %56
  store i64 0, ptr %3, align 8
  store i32 1, ptr %12, align 4
  br label %60

59:                                               ; preds = %51
  store i64 -1, ptr %3, align 8
  store i32 1, ptr %12, align 4
  br label %60

60:                                               ; preds = %59, %58, %50, %31
  %61 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %11) #10
  %62 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10) #10
  %63 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %6) #10
  %64 = load i64, ptr %3, align 8
  ret i64 %64

65:                                               ; preds = %40, %36
  %66 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %10) #10
  br label %67

67:                                               ; preds = %65, %32
  %68 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %6) #10
  br label %69

69:                                               ; preds = %67
  %70 = load ptr, ptr %8, align 8
  %71 = load i32, ptr %9, align 4
  %72 = insertvalue { ptr, i32 } poison, ptr %70, 0
  %73 = insertvalue { ptr, i32 } %72, i32 %71, 1
  resume { ptr, i32 } %73
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1ERKS_(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN11SQObjectPtrC2ERKS_(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef nonnull align 8 dereferenceable(16) %6)
  ret ptr %5
}

declare noundef zeroext i1 @_ZN4SQVM10FOREACH_OPER11SQObjectPtrS1_S1_S1_xiRi(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), i64 noundef, i32 noundef, ptr noundef nonnull align 4 dereferenceable(4)) #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define noundef i64 @_Z11buf_lexfeedPv(ptr noundef %0) #4 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  store ptr %5, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds %struct.BufState, ptr %6, i32 0, i32 2
  %8 = load i64, ptr %7, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.BufState, ptr %9, i32 0, i32 1
  %11 = load i64, ptr %10, align 8
  %12 = add nsw i64 %11, 1
  %13 = icmp slt i64 %8, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %1
  store i64 0, ptr %2, align 8
  br label %26

15:                                               ; preds = %1
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.BufState, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.BufState, ptr %19, i32 0, i32 1
  %21 = load i64, ptr %20, align 8
  %22 = add nsw i64 %21, 1
  store i64 %22, ptr %20, align 8
  %23 = getelementptr inbounds i8, ptr %18, i64 %21
  %24 = load i8, ptr %23, align 1
  %25 = sext i8 %24 to i64
  store i64 %25, ptr %2, align 8
  br label %26

26:                                               ; preds = %15, %14
  %27 = load i64, ptr %2, align 8
  ret i64 %27
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_compilebuffer(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, i64 noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca %struct.BufState, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i64 %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store i64 %4, ptr %10, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = getelementptr inbounds %struct.BufState, ptr %11, i32 0, i32 0
  store ptr %12, ptr %13, align 8
  %14 = load i64, ptr %8, align 8
  %15 = getelementptr inbounds %struct.BufState, ptr %11, i32 0, i32 2
  store i64 %14, ptr %15, align 8
  %16 = getelementptr inbounds %struct.BufState, ptr %11, i32 0, i32 1
  store i64 0, ptr %16, align 8
  %17 = load ptr, ptr %6, align 8
  %18 = load ptr, ptr %9, align 8
  %19 = load i64, ptr %10, align 8
  %20 = call i64 @sq_compile(ptr noundef %17, ptr noundef @_Z11buf_lexfeedPv, ptr noundef %11, ptr noundef %18, i64 noundef %19)
  ret i64 %20
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_move(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  %10 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %8, i64 noundef %9)
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %7, ptr noundef nonnull align 8 dereferenceable(16) %10)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_setprintfunc(ptr noundef %0, ptr noundef %1, ptr noundef %2) #4 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %struct.SQVM, ptr %8, i32 0, i32 19
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds %struct.SQSharedState, ptr %10, i32 0, i32 22
  store ptr %7, ptr %11, align 8
  %12 = load ptr, ptr %6, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.SQVM, ptr %13, i32 0, i32 19
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.SQSharedState, ptr %15, i32 0, i32 23
  store ptr %12, ptr %16, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_getprintfunc(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 19
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %struct.SQSharedState, ptr %5, i32 0, i32 22
  %7 = load ptr, ptr %6, align 8
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_geterrorfunc(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 19
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %struct.SQSharedState, ptr %5, i32 0, i32 23
  %7 = load ptr, ptr %6, align 8
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_malloc(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, ptr %2, align 8
  %3 = load i64, ptr %2, align 8
  %4 = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef %3)
  ret ptr %4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_realloc(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  %10 = call noundef ptr @_Z13sq_vm_reallocPvyy(ptr noundef %7, i64 noundef %8, i64 noundef %9)
  ret ptr %10
}

declare noundef ptr @_Z13sq_vm_reallocPvyy(ptr noundef, i64 noundef, i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_free(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  call void @_Z10sq_vm_freePvy(ptr noundef %5, i64 noundef %6)
  ret void
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP4SQVM(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  store ptr %6, ptr %3, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store i64 0, ptr %7, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  store i32 134221824, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store ptr %9, ptr %10, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  %14 = xor i1 %13, true
  br i1 %14, label %15, label %17

15:                                               ; preds = %2
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 236, ptr noundef @.str.51) #11
  unreachable

16:                                               ; No predecessors!
  br label %18

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %17, %16
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SQRefCounted, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %21, align 8
  %24 = load ptr, ptr %3, align 8
  ret ptr %24
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrD2Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #3 align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = and i32 %6, 134217728
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %23

9:                                                ; preds = %1
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %struct.SQRefCounted, ptr %11, i32 0, i32 1
  %13 = load i64, ptr %12, align 8
  %14 = add i64 %13, -1
  store i64 %14, ptr %12, align 8
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %16, label %23

16:                                               ; preds = %9
  %17 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds ptr, ptr %19, i64 2
  %21 = load ptr, ptr %20, align 8
  invoke void %21(ptr noundef nonnull align 8 dereferenceable(24) %18)
          to label %22 unwind label %25

22:                                               ; preds = %16
  br label %23

23:                                               ; preds = %22, %9, %1
  %24 = load ptr, ptr %2, align 8
  ret ptr %24

25:                                               ; preds = %16
  %26 = landingpad { ptr, i32 }
          catch ptr null
  %27 = extractvalue { ptr, i32 } %26, 0
  call void @__clang_call_terminate(ptr %27) #12
  unreachable
}

; Function Attrs: noinline noreturn nounwind ssp uwtable(sync)
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) #8 {
  %2 = call ptr @__cxa_begin_catch(ptr %0) #10
  call void @_ZSt9terminatev() #12
  unreachable
}

declare ptr @__cxa_begin_catch(ptr)

declare void @_ZSt9terminatev()

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 1
  store i64 0, ptr %4, align 8
  %5 = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 0
  store i32 16777217, ptr %5, align 8
  %6 = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 1
  store ptr null, ptr %6, align 8
  ret ptr %3
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN9SQClosureC1EP13SQSharedStateP15SQFunctionProto(ptr noundef nonnull returned align 8 dereferenceable(96) %0, ptr noundef %1, ptr noundef %2) unnamed_addr #2 align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call noundef ptr @_ZN9SQClosureC2EP13SQSharedStateP15SQFunctionProto(ptr noundef nonnull align 8 dereferenceable(96) %7, ptr noundef %8, ptr noundef %9)
  ret ptr %7
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN9SQClosureC2EP13SQSharedStateP15SQFunctionProto(ptr noundef nonnull returned align 8 dereferenceable(96) %0, ptr noundef %1, ptr noundef %2) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call noundef ptr @_ZN13SQCollectableC2Ev(ptr noundef nonnull align 8 dereferenceable(48) %9)
  store ptr getelementptr inbounds ({ [8 x ptr] }, ptr @_ZTV9SQClosure, i32 0, inrange i32 0, i32 2), ptr %9, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = getelementptr inbounds %struct.SQClosure, ptr %9, i32 0, i32 4
  store ptr %11, ptr %12, align 8
  %13 = getelementptr inbounds %struct.SQClosure, ptr %9, i32 0, i32 4
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %struct.SQRefCounted, ptr %14, i32 0, i32 1
  %16 = load i64, ptr %15, align 8
  %17 = add i64 %16, 1
  store i64 %17, ptr %15, align 8
  %18 = getelementptr inbounds %struct.SQClosure, ptr %9, i32 0, i32 3
  store ptr null, ptr %18, align 8
  %19 = getelementptr inbounds %struct.SQCollectable, ptr %9, i32 0, i32 1
  store ptr null, ptr %19, align 8
  %20 = getelementptr inbounds %struct.SQCollectable, ptr %9, i32 0, i32 2
  store ptr null, ptr %20, align 8
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds %struct.SQCollectable, ptr %9, i32 0, i32 3
  store ptr %21, ptr %22, align 8
  %23 = getelementptr inbounds %struct.SQCollectable, ptr %9, i32 0, i32 3
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.SQSharedState, ptr %24, i32 0, i32 9
  invoke void @_ZN13SQCollectable10AddToChainEPPS_S0_(ptr noundef %25, ptr noundef %9)
          to label %26 unwind label %29

26:                                               ; preds = %3
  %27 = getelementptr inbounds %struct.SQClosure, ptr %9, i32 0, i32 1
  store ptr null, ptr %27, align 8
  %28 = getelementptr inbounds %struct.SQClosure, ptr %9, i32 0, i32 2
  store ptr null, ptr %28, align 8
  ret ptr %9

29:                                               ; preds = %3
  %30 = landingpad { ptr, i32 }
          cleanup
  %31 = extractvalue { ptr, i32 } %30, 0
  store ptr %31, ptr %7, align 8
  %32 = extractvalue { ptr, i32 } %30, 1
  store i32 %32, ptr %8, align 4
  %33 = call noundef ptr @_ZN13SQCollectableD2Ev(ptr noundef nonnull align 8 dereferenceable(48) %9) #10
  br label %34

34:                                               ; preds = %29
  %35 = load ptr, ptr %7, align 8
  %36 = load i32, ptr %8, align 4
  %37 = insertvalue { ptr, i32 } poison, ptr %35, 0
  %38 = insertvalue { ptr, i32 } %37, i32 %36, 1
  resume { ptr, i32 } %38
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN13SQCollectableC2Ev(ptr noundef nonnull returned align 8 dereferenceable(48) %0) unnamed_addr #2 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN12SQRefCountedC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %3)
  store ptr getelementptr inbounds ({ [8 x ptr] }, ptr @_ZTV13SQCollectable, i32 0, inrange i32 0, i32 2), ptr %3, align 8
  ret ptr %3
}

declare void @_ZN13SQCollectable10AddToChainEPPS_S0_(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN13SQCollectableD2Ev(ptr noundef nonnull returned align 8 dereferenceable(48) %0) unnamed_addr #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN12SQRefCountedD2Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #10
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN12SQRefCountedC2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTV12SQRefCounted, i32 0, inrange i32 0, i32 2), ptr %3, align 8
  %4 = getelementptr inbounds %struct.SQRefCounted, ptr %3, i32 0, i32 1
  store i64 0, ptr %4, align 8
  %5 = getelementptr inbounds %struct.SQRefCounted, ptr %3, i32 0, i32 2
  store ptr null, ptr %5, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN13SQCollectableD1Ev(ptr noundef nonnull returned align 8 dereferenceable(48) %0) unnamed_addr #3 align 2 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  call void @llvm.trap() #12
  unreachable
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN13SQCollectableD0Ev(ptr noundef nonnull align 8 dereferenceable(48) %0) unnamed_addr #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @llvm.trap() #12
  unreachable
}

declare void @__cxa_pure_virtual() unnamed_addr

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #9

; Function Attrs: nounwind
declare noundef ptr @_ZN12SQRefCountedD2Ev(ptr noundef nonnull returned align 8 dereferenceable(24)) unnamed_addr #6

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP9SQClosure(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  store ptr %6, ptr %3, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store i64 0, ptr %7, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  store i32 134217984, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store ptr %9, ptr %10, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  %14 = xor i1 %13, true
  br i1 %14, label %15, label %17

15:                                               ; preds = %2
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 229, ptr noundef @.str.51) #11
  unreachable

16:                                               ; No predecessors!
  br label %18

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %17, %16
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SQRefCounted, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %21, align 8
  %24 = load ptr, ptr %3, align 8
  ret ptr %24
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP8SQString(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  store ptr %6, ptr %3, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store i64 0, ptr %7, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  store i32 134217744, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store ptr %9, ptr %10, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  %14 = xor i1 %13, true
  br i1 %14, label %15, label %17

15:                                               ; preds = %2
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 233, ptr noundef @.str.51) #11
  unreachable

16:                                               ; No predecessors!
  br label %18

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %17, %16
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SQRefCounted, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %21, align 8
  %24 = load ptr, ptr %3, align 8
  ret ptr %24
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2Ex(ptr noundef nonnull returned align 8 dereferenceable(16) %0, i64 noundef %1) unnamed_addr #3 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  store i64 0, ptr %6, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 0
  store i32 83886082, ptr %7, align 8
  %8 = load i64, ptr %4, align 8
  %9 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  store i64 %8, ptr %9, align 8
  ret ptr %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2Eb(ptr noundef nonnull returned align 8 dereferenceable(16) %0, i1 noundef zeroext %1) unnamed_addr #3 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  %5 = zext i1 %1 to i8
  store i8 %5, ptr %4, align 1
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store i64 0, ptr %7, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  store i32 16777224, ptr %8, align 8
  %9 = load i8, ptr %4, align 1
  %10 = trunc i8 %9 to i1
  %11 = zext i1 %10 to i64
  %12 = select i1 %10, i32 1, i32 0
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store i64 %13, ptr %14, align 8
  ret ptr %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2Ef(ptr noundef nonnull returned align 8 dereferenceable(16) %0, float noundef %1) unnamed_addr #3 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca float, align 4
  store ptr %0, ptr %3, align 8
  store float %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  store i64 0, ptr %6, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 0
  store i32 83886084, ptr %7, align 8
  %8 = load float, ptr %4, align 4
  %9 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  store float %8, ptr %9, align 8
  ret ptr %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EPv(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #3 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  store i64 0, ptr %6, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 0
  store i32 2048, ptr %7, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  store ptr %8, ptr %9, align 8
  ret ptr %5
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN10SQUserDataC1EP13SQSharedState(ptr noundef nonnull returned align 8 dereferenceable(80) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN10SQUserDataC2EP13SQSharedState(ptr noundef nonnull align 8 dereferenceable(80) %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN10SQUserDataC2EP13SQSharedState(ptr noundef nonnull returned align 8 dereferenceable(80) %0, ptr noundef %1) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = call noundef ptr @_ZN11SQDelegableC2Ev(ptr noundef nonnull align 8 dereferenceable(56) %7)
  store ptr getelementptr inbounds ({ [9 x ptr] }, ptr @_ZTV10SQUserData, i32 0, inrange i32 0, i32 2), ptr %7, align 8
  %9 = getelementptr inbounds %struct.SQDelegable, ptr %7, i32 0, i32 1
  store ptr null, ptr %9, align 8
  %10 = getelementptr inbounds %struct.SQUserData, ptr %7, i32 0, i32 2
  store ptr null, ptr %10, align 8
  %11 = getelementptr inbounds %struct.SQCollectable, ptr %7, i32 0, i32 1
  store ptr null, ptr %11, align 8
  %12 = getelementptr inbounds %struct.SQCollectable, ptr %7, i32 0, i32 2
  store ptr null, ptr %12, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.SQCollectable, ptr %7, i32 0, i32 3
  store ptr %13, ptr %14, align 8
  %15 = getelementptr inbounds %struct.SQCollectable, ptr %7, i32 0, i32 3
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.SQSharedState, ptr %16, i32 0, i32 9
  invoke void @_ZN13SQCollectable10AddToChainEPPS_S0_(ptr noundef %17, ptr noundef %7)
          to label %18 unwind label %19

18:                                               ; preds = %2
  ret ptr %7

19:                                               ; preds = %2
  %20 = landingpad { ptr, i32 }
          cleanup
  %21 = extractvalue { ptr, i32 } %20, 0
  store ptr %21, ptr %5, align 8
  %22 = extractvalue { ptr, i32 } %20, 1
  store i32 %22, ptr %6, align 4
  %23 = call noundef ptr @_ZN11SQDelegableD2Ev(ptr noundef nonnull align 8 dereferenceable(56) %7) #10
  br label %24

24:                                               ; preds = %19
  %25 = load ptr, ptr %5, align 8
  %26 = load i32, ptr %6, align 4
  %27 = insertvalue { ptr, i32 } poison, ptr %25, 0
  %28 = insertvalue { ptr, i32 } %27, i32 %26, 1
  resume { ptr, i32 } %28
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQDelegableC2Ev(ptr noundef nonnull returned align 8 dereferenceable(56) %0) unnamed_addr #2 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN13SQCollectableC2Ev(ptr noundef nonnull align 8 dereferenceable(48) %3)
  store ptr getelementptr inbounds ({ [9 x ptr] }, ptr @_ZTV11SQDelegable, i32 0, inrange i32 0, i32 2), ptr %3, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQDelegableD2Ev(ptr noundef nonnull returned align 8 dereferenceable(56) %0) unnamed_addr #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN13SQCollectableD2Ev(ptr noundef nonnull align 8 dereferenceable(48) %3) #10
  ret ptr %3
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP10SQUserData(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  store ptr %6, ptr %3, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store i64 0, ptr %7, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  store i32 167772288, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store ptr %9, ptr %10, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  %14 = xor i1 %13, true
  br i1 %14, label %15, label %17

15:                                               ; preds = %2
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 234, ptr noundef @.str.51) #11
  unreachable

16:                                               ; No predecessors!
  br label %18

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %17, %16
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SQRefCounted, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %21, align 8
  %24 = load ptr, ptr %3, align 8
  ret ptr %24
}

declare noundef ptr @_ZN7SQTableC1EP13SQSharedStatex(ptr noundef nonnull returned align 8 dereferenceable(88), ptr noundef, i64 noundef) unnamed_addr #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP7SQTable(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  store ptr %6, ptr %3, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store i64 0, ptr %7, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  store i32 167772192, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store ptr %9, ptr %10, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  %14 = xor i1 %13, true
  br i1 %14, label %15, label %17

15:                                               ; preds = %2
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 225, ptr noundef @.str.51) #11
  unreachable

16:                                               ; No predecessors!
  br label %18

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %17, %16
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SQRefCounted, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %21, align 8
  %24 = load ptr, ptr %3, align 8
  ret ptr %24
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7SQArrayC1EP13SQSharedStatex(ptr noundef nonnull returned align 8 dereferenceable(72) %0, ptr noundef %1, i64 noundef %2) unnamed_addr #2 align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  %10 = call noundef ptr @_ZN7SQArrayC2EP13SQSharedStatex(ptr noundef nonnull align 8 dereferenceable(72) %7, ptr noundef %8, i64 noundef %9)
  ret ptr %7
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7SQArrayC2EP13SQSharedStatex(ptr noundef nonnull returned align 8 dereferenceable(72) %0, ptr noundef %1, i64 noundef %2) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.SQObjectPtr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = call noundef ptr @_ZN13SQCollectableC2Ev(ptr noundef nonnull align 8 dereferenceable(48) %10)
  store ptr getelementptr inbounds ({ [8 x ptr] }, ptr @_ZTV7SQArray, i32 0, inrange i32 0, i32 2), ptr %10, align 8
  %12 = getelementptr inbounds %struct.SQArray, ptr %10, i32 0, i32 1
  %13 = invoke noundef ptr @_ZN8sqvectorI11SQObjectPtrEC1Ev(ptr noundef nonnull align 8 dereferenceable(24) %12)
          to label %14 unwind label %29

14:                                               ; preds = %3
  %15 = getelementptr inbounds %struct.SQArray, ptr %10, i32 0, i32 1
  %16 = load i64, ptr %6, align 8
  %17 = invoke noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9)
          to label %18 unwind label %33

18:                                               ; preds = %14
  invoke void @_ZN8sqvectorI11SQObjectPtrE6resizeEyRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %15, i64 noundef %16, ptr noundef nonnull align 8 dereferenceable(16) %9)
          to label %19 unwind label %37

19:                                               ; preds = %18
  %20 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9) #10
  %21 = getelementptr inbounds %struct.SQCollectable, ptr %10, i32 0, i32 1
  store ptr null, ptr %21, align 8
  %22 = getelementptr inbounds %struct.SQCollectable, ptr %10, i32 0, i32 2
  store ptr null, ptr %22, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds %struct.SQCollectable, ptr %10, i32 0, i32 3
  store ptr %23, ptr %24, align 8
  %25 = getelementptr inbounds %struct.SQCollectable, ptr %10, i32 0, i32 3
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds %struct.SQSharedState, ptr %26, i32 0, i32 9
  invoke void @_ZN13SQCollectable10AddToChainEPPS_S0_(ptr noundef %27, ptr noundef %10)
          to label %28 unwind label %33

28:                                               ; preds = %19
  ret ptr %10

29:                                               ; preds = %3
  %30 = landingpad { ptr, i32 }
          cleanup
  %31 = extractvalue { ptr, i32 } %30, 0
  store ptr %31, ptr %7, align 8
  %32 = extractvalue { ptr, i32 } %30, 1
  store i32 %32, ptr %8, align 4
  br label %44

33:                                               ; preds = %19, %14
  %34 = landingpad { ptr, i32 }
          cleanup
  %35 = extractvalue { ptr, i32 } %34, 0
  store ptr %35, ptr %7, align 8
  %36 = extractvalue { ptr, i32 } %34, 1
  store i32 %36, ptr %8, align 4
  br label %42

37:                                               ; preds = %18
  %38 = landingpad { ptr, i32 }
          cleanup
  %39 = extractvalue { ptr, i32 } %38, 0
  store ptr %39, ptr %7, align 8
  %40 = extractvalue { ptr, i32 } %38, 1
  store i32 %40, ptr %8, align 4
  %41 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9) #10
  br label %42

42:                                               ; preds = %37, %33
  %43 = call noundef ptr @_ZN8sqvectorI11SQObjectPtrED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %12) #10
  br label %44

44:                                               ; preds = %42, %29
  %45 = call noundef ptr @_ZN13SQCollectableD2Ev(ptr noundef nonnull align 8 dereferenceable(48) %10) #10
  br label %46

46:                                               ; preds = %44
  %47 = load ptr, ptr %7, align 8
  %48 = load i32, ptr %8, align 4
  %49 = insertvalue { ptr, i32 } poison, ptr %47, 0
  %50 = insertvalue { ptr, i32 } %49, i32 %48, 1
  resume { ptr, i32 } %50
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorI11SQObjectPtrEC1Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN8sqvectorI11SQObjectPtrEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %3)
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorI11SQObjectPtrED1Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN8sqvectorI11SQObjectPtrED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #10
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorI11SQObjectPtrEC2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.sqvector, ptr %3, i32 0, i32 0
  store ptr null, ptr %4, align 8
  %5 = getelementptr inbounds %class.sqvector, ptr %3, i32 0, i32 1
  store i64 0, ptr %5, align 8
  %6 = getelementptr inbounds %class.sqvector, ptr %3, i32 0, i32 2
  store i64 0, ptr %6, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorI11SQObjectPtrED2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #3 align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  store ptr %5, ptr %2, align 8
  %6 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 2
  %7 = load i64, ptr %6, align 8
  %8 = icmp ne i64 %7, 0
  br i1 %8, label %9, label %31

9:                                                ; preds = %1
  store i64 0, ptr %4, align 8
  br label %10

10:                                               ; preds = %21, %9
  %11 = load i64, ptr %4, align 8
  %12 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 1
  %13 = load i64, ptr %12, align 8
  %14 = icmp ult i64 %11, %13
  br i1 %14, label %15, label %24

15:                                               ; preds = %10
  %16 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load i64, ptr %4, align 8
  %19 = getelementptr inbounds %struct.SQObjectPtr, ptr %17, i64 %18
  %20 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %19) #10
  br label %21

21:                                               ; preds = %15
  %22 = load i64, ptr %4, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %4, align 8
  br label %10, !llvm.loop !23

24:                                               ; preds = %10
  %25 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 0
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 2
  %28 = load i64, ptr %27, align 8
  %29 = mul i64 %28, 16
  invoke void @_Z10sq_vm_freePvy(ptr noundef %26, i64 noundef %29)
          to label %30 unwind label %33

30:                                               ; preds = %24
  br label %31

31:                                               ; preds = %30, %1
  %32 = load ptr, ptr %2, align 8
  ret ptr %32

33:                                               ; preds = %24
  %34 = landingpad { ptr, i32 }
          catch ptr null
  %35 = extractvalue { ptr, i32 } %34, 0
  call void @__clang_call_terminate(ptr %35) #12
  unreachable
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP7SQArray(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  store ptr %6, ptr %3, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store i64 0, ptr %7, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  store i32 134217792, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store ptr %9, ptr %10, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  %14 = xor i1 %13, true
  br i1 %14, label %15, label %17

15:                                               ; preds = %2
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 228, ptr noundef @.str.51) #11
  unreachable

16:                                               ; No predecessors!
  br label %18

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %17, %16
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SQRefCounted, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %21, align 8
  %24 = load ptr, ptr %3, align 8
  ret ptr %24
}

declare noundef ptr @_ZN7SQClassC1EP13SQSharedStatePS_(ptr noundef nonnull returned align 8 dereferenceable(456), ptr noundef, ptr noundef) unnamed_addr #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP7SQClass(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  store ptr %6, ptr %3, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store i64 0, ptr %7, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  store i32 134234112, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store ptr %9, ptr %10, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  %14 = xor i1 %13, true
  br i1 %14, label %15, label %17

15:                                               ; preds = %2
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 226, ptr noundef @.str.51) #11
  unreachable

16:                                               ; No predecessors!
  br label %18

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %17, %16
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SQRefCounted, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %21, align 8
  %24 = load ptr, ptr %3, align 8
  ret ptr %24
}

declare noundef ptr @_ZN4SQVM11PrintObjValERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN8sqvectorI11SQObjectPtrE9push_backERKS0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 2
  %7 = load i64, ptr %6, align 8
  %8 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 1
  %9 = load i64, ptr %8, align 8
  %10 = icmp ule i64 %7, %9
  br i1 %10, label %11, label %15

11:                                               ; preds = %2
  %12 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 1
  %13 = load i64, ptr %12, align 8
  %14 = mul i64 %13, 2
  call void @_ZN8sqvectorI11SQObjectPtrE8_reallocEy(ptr noundef nonnull align 8 dereferenceable(24) %5, i64 noundef %14)
  br label %15

15:                                               ; preds = %11, %2
  %16 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 1
  %19 = load i64, ptr %18, align 8
  %20 = add i64 %19, 1
  store i64 %20, ptr %18, align 8
  %21 = getelementptr inbounds %struct.SQObjectPtr, ptr %17, i64 %19
  %22 = load ptr, ptr %4, align 8
  %23 = call noundef ptr @_ZN11SQObjectPtrC1ERKS_(ptr noundef nonnull align 8 dereferenceable(16) %21, ptr noundef nonnull align 8 dereferenceable(16) %22)
  ret ptr %21
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorI11SQObjectPtrE8_reallocEy(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = icmp ugt i64 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = load i64, ptr %4, align 8
  br label %11

10:                                               ; preds = %2
  br label %11

11:                                               ; preds = %10, %8
  %12 = phi i64 [ %9, %8 ], [ 4, %10 ]
  store i64 %12, ptr %4, align 8
  %13 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 2
  %16 = load i64, ptr %15, align 8
  %17 = mul i64 %16, 16
  %18 = load i64, ptr %4, align 8
  %19 = mul i64 %18, 16
  %20 = call noundef ptr @_Z13sq_vm_reallocPvyy(ptr noundef %14, i64 noundef %17, i64 noundef %19)
  %21 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 0
  store ptr %20, ptr %21, align 8
  %22 = load i64, ptr %4, align 8
  %23 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 2
  store i64 %22, ptr %23, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrE3topEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.sqvector, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %class.sqvector, ptr %3, i32 0, i32 1
  %7 = load i64, ptr %6, align 8
  %8 = sub i64 %7, 1
  %9 = getelementptr inbounds %struct.SQObjectPtr, ptr %5, i64 %8
  ret ptr %9
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorI11SQObjectPtrE8pop_backEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.sqvector, ptr %3, i32 0, i32 1
  %5 = load i64, ptr %4, align 8
  %6 = add i64 %5, -1
  store i64 %6, ptr %4, align 8
  %7 = getelementptr inbounds %class.sqvector, ptr %3, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds %class.sqvector, ptr %3, i32 0, i32 1
  %10 = load i64, ptr %9, align 8
  %11 = getelementptr inbounds %struct.SQObjectPtr, ptr %8, i64 %10
  %12 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %11) #10
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7SQArray14ShrinkIfNeededEv(ptr noundef nonnull align 8 dereferenceable(72) %0) #0 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.SQArray, ptr %3, i32 0, i32 1
  %5 = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %4)
  %6 = getelementptr inbounds %struct.SQArray, ptr %3, i32 0, i32 1
  %7 = call noundef i64 @_ZN8sqvectorI11SQObjectPtrE8capacityEv(ptr noundef nonnull align 8 dereferenceable(24) %6)
  %8 = lshr i64 %7, 2
  %9 = icmp ule i64 %5, %8
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = getelementptr inbounds %struct.SQArray, ptr %3, i32 0, i32 1
  call void @_ZN8sqvectorI11SQObjectPtrE11shrinktofitEv(ptr noundef nonnull align 8 dereferenceable(24) %11)
  br label %12

12:                                               ; preds = %10, %1
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZN8sqvectorI11SQObjectPtrE8capacityEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.sqvector, ptr %3, i32 0, i32 2
  %5 = load i64, ptr %4, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorI11SQObjectPtrE11shrinktofitEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #0 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.sqvector, ptr %3, i32 0, i32 1
  %5 = load i64, ptr %4, align 8
  %6 = icmp ugt i64 %5, 4
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = getelementptr inbounds %class.sqvector, ptr %3, i32 0, i32 1
  %9 = load i64, ptr %8, align 8
  call void @_ZN8sqvectorI11SQObjectPtrE8_reallocEy(ptr noundef nonnull align 8 dereferenceable(24) %3, i64 noundef %9)
  br label %10

10:                                               ; preds = %7, %1
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7SQArray6ResizeExR11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(72) %0, i64 noundef %1, ptr noundef nonnull align 8 dereferenceable(16) %2) #0 align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.SQArray, ptr %7, i32 0, i32 1
  %9 = load i64, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  call void @_ZN8sqvectorI11SQObjectPtrE6resizeEyRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %8, i64 noundef %9, ptr noundef nonnull align 8 dereferenceable(16) %10)
  call void @_ZN7SQArray14ShrinkIfNeededEv(ptr noundef nonnull align 8 dereferenceable(72) %7)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorI11SQObjectPtrE6removeEy(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #4 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = load i64, ptr %4, align 8
  %9 = getelementptr inbounds %struct.SQObjectPtr, ptr %7, i64 %8
  %10 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %9) #10
  %11 = load i64, ptr %4, align 8
  %12 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 1
  %13 = load i64, ptr %12, align 8
  %14 = sub i64 %13, 1
  %15 = icmp ult i64 %11, %14
  br i1 %15, label %16, label %32

16:                                               ; preds = %2
  %17 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = load i64, ptr %4, align 8
  %20 = getelementptr inbounds %struct.SQObjectPtr, ptr %18, i64 %19
  %21 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = load i64, ptr %4, align 8
  %24 = add i64 %23, 1
  %25 = getelementptr inbounds %struct.SQObjectPtr, ptr %22, i64 %24
  %26 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 1
  %27 = load i64, ptr %26, align 8
  %28 = load i64, ptr %4, align 8
  %29 = sub i64 %27, %28
  %30 = sub i64 %29, 1
  %31 = mul i64 16, %30
  call void @llvm.memmove.p0.p0.i64(ptr align 8 %20, ptr align 8 %25, i64 %31, i1 false)
  br label %32

32:                                               ; preds = %16, %2
  %33 = getelementptr inbounds %class.sqvector, ptr %5, i32 0, i32 1
  %34 = load i64, ptr %33, align 8
  %35 = add i64 %34, -1
  store i64 %35, ptr %33, align 8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #5

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorI11SQObjectPtrE6insertEyRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, ptr noundef nonnull align 8 dereferenceable(16) %2) #0 align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.SQObjectPtr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %class.sqvector, ptr %11, i32 0, i32 1
  %13 = load i64, ptr %12, align 8
  %14 = add i64 %13, 1
  %15 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7)
  invoke void @_ZN8sqvectorI11SQObjectPtrE6resizeEyRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %11, i64 noundef %14, ptr noundef nonnull align 8 dereferenceable(16) %7)
          to label %16 unwind label %39

16:                                               ; preds = %3
  %17 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  %18 = getelementptr inbounds %class.sqvector, ptr %11, i32 0, i32 1
  %19 = load i64, ptr %18, align 8
  %20 = sub i64 %19, 1
  store i64 %20, ptr %10, align 8
  br label %21

21:                                               ; preds = %36, %16
  %22 = load i64, ptr %10, align 8
  %23 = load i64, ptr %5, align 8
  %24 = icmp ugt i64 %22, %23
  br i1 %24, label %25, label %44

25:                                               ; preds = %21
  %26 = getelementptr inbounds %class.sqvector, ptr %11, i32 0, i32 0
  %27 = load ptr, ptr %26, align 8
  %28 = load i64, ptr %10, align 8
  %29 = sub i64 %28, 1
  %30 = getelementptr inbounds %struct.SQObjectPtr, ptr %27, i64 %29
  %31 = getelementptr inbounds %class.sqvector, ptr %11, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = load i64, ptr %10, align 8
  %34 = getelementptr inbounds %struct.SQObjectPtr, ptr %32, i64 %33
  %35 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %34, ptr noundef nonnull align 8 dereferenceable(16) %30)
  br label %36

36:                                               ; preds = %25
  %37 = load i64, ptr %10, align 8
  %38 = add i64 %37, -1
  store i64 %38, ptr %10, align 8
  br label %21, !llvm.loop !24

39:                                               ; preds = %3
  %40 = landingpad { ptr, i32 }
          cleanup
  %41 = extractvalue { ptr, i32 } %40, 0
  store ptr %41, ptr %8, align 8
  %42 = extractvalue { ptr, i32 } %40, 1
  store i32 %42, ptr %9, align 4
  %43 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #10
  br label %51

44:                                               ; preds = %21
  %45 = load ptr, ptr %6, align 8
  %46 = getelementptr inbounds %class.sqvector, ptr %11, i32 0, i32 0
  %47 = load ptr, ptr %46, align 8
  %48 = load i64, ptr %5, align 8
  %49 = getelementptr inbounds %struct.SQObjectPtr, ptr %47, i64 %48
  %50 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %49, ptr noundef nonnull align 8 dereferenceable(16) %45)
  ret void

51:                                               ; preds = %39
  %52 = load ptr, ptr %8, align 8
  %53 = load i32, ptr %9, align 4
  %54 = insertvalue { ptr, i32 } poison, ptr %52, 0
  %55 = insertvalue { ptr, i32 } %54, i32 %53, 1
  resume { ptr, i32 } %55
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN15SQNativeClosureC1EP13SQSharedStatePFxP4SQVME(ptr noundef nonnull returned align 8 dereferenceable(128) %0, ptr noundef %1, ptr noundef %2) unnamed_addr #2 align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call noundef ptr @_ZN15SQNativeClosureC2EP13SQSharedStatePFxP4SQVME(ptr noundef nonnull align 8 dereferenceable(128) %7, ptr noundef %8, ptr noundef %9)
  ret ptr %7
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN15SQNativeClosureC2EP13SQSharedStatePFxP4SQVME(ptr noundef nonnull returned align 8 dereferenceable(128) %0, ptr noundef %1, ptr noundef %2) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call noundef ptr @_ZN13SQCollectableC2Ev(ptr noundef nonnull align 8 dereferenceable(48) %9)
  store ptr getelementptr inbounds ({ [8 x ptr] }, ptr @_ZTV15SQNativeClosure, i32 0, inrange i32 0, i32 2), ptr %9, align 8
  %11 = getelementptr inbounds %struct.SQNativeClosure, ptr %9, i32 0, i32 2
  %12 = invoke noundef ptr @_ZN8sqvectorIxEC1Ev(ptr noundef nonnull align 8 dereferenceable(24) %11)
          to label %13 unwind label %28

13:                                               ; preds = %3
  %14 = getelementptr inbounds %struct.SQNativeClosure, ptr %9, i32 0, i32 7
  %15 = invoke noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %14)
          to label %16 unwind label %32

16:                                               ; preds = %13
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds %struct.SQNativeClosure, ptr %9, i32 0, i32 6
  store ptr %17, ptr %18, align 8
  %19 = getelementptr inbounds %struct.SQCollectable, ptr %9, i32 0, i32 1
  store ptr null, ptr %19, align 8
  %20 = getelementptr inbounds %struct.SQCollectable, ptr %9, i32 0, i32 2
  store ptr null, ptr %20, align 8
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds %struct.SQCollectable, ptr %9, i32 0, i32 3
  store ptr %21, ptr %22, align 8
  %23 = getelementptr inbounds %struct.SQCollectable, ptr %9, i32 0, i32 3
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.SQSharedState, ptr %24, i32 0, i32 9
  invoke void @_ZN13SQCollectable10AddToChainEPPS_S0_(ptr noundef %25, ptr noundef %9)
          to label %26 unwind label %36

26:                                               ; preds = %16
  %27 = getelementptr inbounds %struct.SQNativeClosure, ptr %9, i32 0, i32 5
  store ptr null, ptr %27, align 8
  ret ptr %9

28:                                               ; preds = %3
  %29 = landingpad { ptr, i32 }
          cleanup
  %30 = extractvalue { ptr, i32 } %29, 0
  store ptr %30, ptr %7, align 8
  %31 = extractvalue { ptr, i32 } %29, 1
  store i32 %31, ptr %8, align 4
  br label %43

32:                                               ; preds = %13
  %33 = landingpad { ptr, i32 }
          cleanup
  %34 = extractvalue { ptr, i32 } %33, 0
  store ptr %34, ptr %7, align 8
  %35 = extractvalue { ptr, i32 } %33, 1
  store i32 %35, ptr %8, align 4
  br label %41

36:                                               ; preds = %16
  %37 = landingpad { ptr, i32 }
          cleanup
  %38 = extractvalue { ptr, i32 } %37, 0
  store ptr %38, ptr %7, align 8
  %39 = extractvalue { ptr, i32 } %37, 1
  store i32 %39, ptr %8, align 4
  %40 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %14) #10
  br label %41

41:                                               ; preds = %36, %32
  %42 = call noundef ptr @_ZN8sqvectorIxED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %11) #10
  br label %43

43:                                               ; preds = %41, %28
  %44 = call noundef ptr @_ZN13SQCollectableD2Ev(ptr noundef nonnull align 8 dereferenceable(48) %9) #10
  br label %45

45:                                               ; preds = %43
  %46 = load ptr, ptr %7, align 8
  %47 = load i32, ptr %8, align 4
  %48 = insertvalue { ptr, i32 } poison, ptr %46, 0
  %49 = insertvalue { ptr, i32 } %48, i32 %47, 1
  resume { ptr, i32 } %49
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP15SQNativeClosure(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  store ptr %6, ptr %3, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store i64 0, ptr %7, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  store i32 134218240, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store ptr %9, ptr %10, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  %14 = xor i1 %13, true
  br i1 %14, label %15, label %17

15:                                               ; preds = %2
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 230, ptr noundef @.str.51) #11
  unreachable

16:                                               ; No predecessors!
  br label %18

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %17, %16
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SQRefCounted, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %21, align 8
  %24 = load ptr, ptr %3, align 8
  ret ptr %24
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2ERK11tagSQObject(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) unnamed_addr #3 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  store i32 %9, ptr %10, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.tagSQObject, ptr %11, i32 0, i32 1
  %13 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 8 %12, i64 8, i1 false)
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = and i32 %15, 134217728
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %24

18:                                               ; preds = %2
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SQRefCounted, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %21, align 8
  br label %24

24:                                               ; preds = %18, %2
  %25 = load ptr, ptr %3, align 8
  ret ptr %25
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP10SQInstance(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  store ptr %6, ptr %3, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store i64 0, ptr %7, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  store i32 167804928, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store ptr %9, ptr %10, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  %14 = xor i1 %13, true
  br i1 %14, label %15, label %17

15:                                               ; preds = %2
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 227, ptr noundef @.str.51) #11
  unreachable

16:                                               ; No predecessors!
  br label %18

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %17, %16
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SQRefCounted, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %21, align 8
  %24 = load ptr, ptr %3, align 8
  ret ptr %24
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP9SQWeakRef(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  store ptr %6, ptr %3, align 8
  %7 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store i64 0, ptr %7, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  store i32 134283264, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  store ptr %9, ptr %10, align 8
  %11 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  %14 = xor i1 %13, true
  br i1 %14, label %15, label %17

15:                                               ; preds = %2
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 235, ptr noundef @.str.51) #11
  unreachable

16:                                               ; No predecessors!
  br label %18

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %17, %16
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SQRefCounted, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %21, align 8
  %24 = load ptr, ptr %3, align 8
  ret ptr %24
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2ERKS_(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) unnamed_addr #3 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  %10 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  store i32 %9, ptr %10, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.tagSQObject, ptr %11, i32 0, i32 1
  %13 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 8 %12, i64 8, i1 false)
  %14 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = and i32 %15, 134217728
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %24

18:                                               ; preds = %2
  %19 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.SQRefCounted, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr %21, align 8
  br label %24

24:                                               ; preds = %18, %2
  %25 = load ptr, ptr %3, align 8
  ret ptr %25
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorIxEC2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #3 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.sqvector.2, ptr %3, i32 0, i32 0
  store ptr null, ptr %4, align 8
  %5 = getelementptr inbounds %class.sqvector.2, ptr %3, i32 0, i32 1
  store i64 0, ptr %5, align 8
  %6 = getelementptr inbounds %class.sqvector.2, ptr %3, i32 0, i32 2
  store i64 0, ptr %6, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorIxED2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #3 align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  store ptr %5, ptr %2, align 8
  %6 = getelementptr inbounds %class.sqvector.2, ptr %5, i32 0, i32 2
  %7 = load i64, ptr %6, align 8
  %8 = icmp ne i64 %7, 0
  br i1 %8, label %9, label %30

9:                                                ; preds = %1
  store i64 0, ptr %4, align 8
  br label %10

10:                                               ; preds = %20, %9
  %11 = load i64, ptr %4, align 8
  %12 = getelementptr inbounds %class.sqvector.2, ptr %5, i32 0, i32 1
  %13 = load i64, ptr %12, align 8
  %14 = icmp ult i64 %11, %13
  br i1 %14, label %15, label %23

15:                                               ; preds = %10
  %16 = getelementptr inbounds %class.sqvector.2, ptr %5, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load i64, ptr %4, align 8
  %19 = getelementptr inbounds i64, ptr %17, i64 %18
  br label %20

20:                                               ; preds = %15
  %21 = load i64, ptr %4, align 8
  %22 = add i64 %21, 1
  store i64 %22, ptr %4, align 8
  br label %10, !llvm.loop !25

23:                                               ; preds = %10
  %24 = getelementptr inbounds %class.sqvector.2, ptr %5, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %class.sqvector.2, ptr %5, i32 0, i32 2
  %27 = load i64, ptr %26, align 8
  %28 = mul i64 %27, 8
  invoke void @_Z10sq_vm_freePvy(ptr noundef %25, i64 noundef %28)
          to label %29 unwind label %32

29:                                               ; preds = %23
  br label %30

30:                                               ; preds = %29, %1
  %31 = load ptr, ptr %2, align 8
  ret ptr %31

32:                                               ; preds = %23
  %33 = landingpad { ptr, i32 }
          catch ptr null
  %34 = extractvalue { ptr, i32 } %33, 0
  call void @__clang_call_terminate(ptr %34) #12
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorIxE8_reallocEy(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #0 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = icmp ugt i64 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = load i64, ptr %4, align 8
  br label %11

10:                                               ; preds = %2
  br label %11

11:                                               ; preds = %10, %8
  %12 = phi i64 [ %9, %8 ], [ 4, %10 ]
  store i64 %12, ptr %4, align 8
  %13 = getelementptr inbounds %class.sqvector.2, ptr %5, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %class.sqvector.2, ptr %5, i32 0, i32 2
  %16 = load i64, ptr %15, align 8
  %17 = mul i64 %16, 8
  %18 = load i64, ptr %4, align 8
  %19 = mul i64 %18, 8
  %20 = call noundef ptr @_Z13sq_vm_reallocPvyy(ptr noundef %14, i64 noundef %17, i64 noundef %19)
  %21 = getelementptr inbounds %class.sqvector.2, ptr %5, i32 0, i32 0
  store ptr %20, ptr %21, align 8
  %22 = load i64, ptr %4, align 8
  %23 = getelementptr inbounds %class.sqvector.2, ptr %5, i32 0, i32 2
  store i64 %22, ptr %23, align 8
  ret void
}

attributes #0 = { mustprogress noinline optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { noinline optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { mustprogress noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #7 = { cold noreturn "disable-tail-calls"="true" "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #8 = { noinline noreturn nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #9 = { cold noreturn nounwind }
attributes #10 = { nounwind }
attributes #11 = { cold noreturn }
attributes #12 = { noreturn nounwind }

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
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
