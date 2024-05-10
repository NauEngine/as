; ModuleID = '/Users/alexzelenshikov/Work/NAU_ENGINE/as_proto/cmake-build-debug_withdebugllvm/as/languages/squirrel/sqapi.bc'
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
define noundef i64 @_Z18sq_aux_invalidtypeP4SQVM15tagSQObjectType(ptr noundef %v, i32 noundef %type) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %type.addr = alloca i32, align 4
  %buf_size = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i32 %type, ptr %type.addr, align 4
  store i64 100, ptr %buf_size, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 19
  %1 = load ptr, ptr %_sharedstate, align 8
  %2 = load i64, ptr %buf_size, align 8
  %call = call noundef ptr @_ZN13SQSharedState13GetScratchPadEx(ptr noundef nonnull align 8 dereferenceable(384) %1, i64 noundef %2)
  %3 = load i64, ptr %buf_size, align 8
  %4 = load i32, ptr %type.addr, align 4
  %call1 = call noundef ptr @_Z11IdType2Name15tagSQObjectType(i32 noundef %4)
  %call2 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %call, i64 noundef %3, ptr noundef @.str, ptr noundef %call1)
  %5 = load ptr, ptr %v.addr, align 8
  %6 = load ptr, ptr %v.addr, align 8
  %_sharedstate3 = getelementptr inbounds %struct.SQVM, ptr %6, i32 0, i32 19
  %7 = load ptr, ptr %_sharedstate3, align 8
  %call4 = call noundef ptr @_ZN13SQSharedState13GetScratchPadEx(ptr noundef nonnull align 8 dereferenceable(384) %7, i64 noundef -1)
  %call5 = call i64 @sq_throwerror(ptr noundef %5, ptr noundef %call4)
  ret i64 %call5
}

declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...) #1

declare noundef ptr @_ZN13SQSharedState13GetScratchPadEx(ptr noundef nonnull align 8 dereferenceable(384), i64 noundef) #1

declare noundef ptr @_Z11IdType2Name15tagSQObjectType(i32 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_throwerror(ptr noundef %v, ptr noundef %err) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %err.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store ptr %err, ptr %err.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 19
  %1 = load ptr, ptr %_sharedstate, align 8
  %2 = load ptr, ptr %err.addr, align 8
  %call = call noundef ptr @_ZN8SQString6CreateEP13SQSharedStatePKcx(ptr noundef %1, ptr noundef %2, i64 noundef -1)
  %3 = load ptr, ptr %v.addr, align 8
  %_lasterror = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 6
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP8SQString(ptr noundef nonnull align 8 dereferenceable(16) %_lasterror, ptr noundef %call)
  ret i64 -1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_open(i64 noundef %initialstacksize) #0 {
entry:
  %retval = alloca ptr, align 8
  %initialstacksize.addr = alloca i64, align 8
  %ss = alloca ptr, align 8
  %v = alloca ptr, align 8
  store i64 %initialstacksize, ptr %initialstacksize.addr, align 8
  %call = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef 384)
  store ptr %call, ptr %ss, align 8
  %0 = load ptr, ptr %ss, align 8
  %call1 = call noundef ptr @_ZN13SQSharedStateC1Ev(ptr noundef nonnull align 8 dereferenceable(384) %0)
  %1 = load ptr, ptr %ss, align 8
  call void @_ZN13SQSharedState4InitEv(ptr noundef nonnull align 8 dereferenceable(384) %1)
  %call2 = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef 344)
  store ptr %call2, ptr %v, align 8
  %2 = load ptr, ptr %v, align 8
  %3 = load ptr, ptr %ss, align 8
  %call3 = call noundef ptr @_ZN4SQVMC1EP13SQSharedState(ptr noundef nonnull align 8 dereferenceable(344) %2, ptr noundef %3)
  %4 = load ptr, ptr %v, align 8
  %5 = load ptr, ptr %ss, align 8
  %_root_vm = getelementptr inbounds %struct.SQSharedState, ptr %5, i32 0, i32 10
  %call4 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP4SQVM(ptr noundef nonnull align 8 dereferenceable(16) %_root_vm, ptr noundef %4)
  %6 = load ptr, ptr %v, align 8
  %7 = load i64, ptr %initialstacksize.addr, align 8
  %call5 = call noundef zeroext i1 @_ZN4SQVM4InitEPS_x(ptr noundef nonnull align 8 dereferenceable(344) %6, ptr noundef null, i64 noundef %7)
  br i1 %call5, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %8 = load ptr, ptr %v, align 8
  store ptr %8, ptr %retval, align 8
  br label %return

if.else:                                          ; preds = %entry
  %9 = load ptr, ptr %v, align 8
  %vtable = load ptr, ptr %9, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 0
  %10 = load ptr, ptr %vfn, align 8
  %call6 = call noundef ptr %10(ptr noundef nonnull align 8 dereferenceable(344) %9) #10
  %11 = load ptr, ptr %v, align 8
  call void @_Z10sq_vm_freePvy(ptr noundef %11, i64 noundef 344)
  store ptr null, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.else, %if.then
  %12 = load ptr, ptr %retval, align 8
  ret ptr %12
}

declare noundef ptr @_Z12sq_vm_mallocy(i64 noundef) #1

declare noundef ptr @_ZN13SQSharedStateC1Ev(ptr noundef nonnull returned align 8 dereferenceable(384)) unnamed_addr #1

declare void @_ZN13SQSharedState4InitEv(ptr noundef nonnull align 8 dereferenceable(384)) #1

declare noundef ptr @_ZN4SQVMC1EP13SQSharedState(ptr noundef nonnull returned align 8 dereferenceable(344), ptr noundef) unnamed_addr #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP4SQVM(ptr noundef nonnull align 8 dereferenceable(16) %this, ptr noundef %x) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  %tOldType = alloca i32, align 4
  %unOldVal = alloca %union.tagSQObjectValue, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  %0 = load i32, ptr %_type, align 8
  store i32 %0, ptr %tOldType, align 4
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %unOldVal, ptr align 8 %_unVal, i64 8, i1 false)
  %_type2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 134221824, ptr %_type2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal3, align 8
  %1 = load ptr, ptr %x.addr, align 8
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %1, ptr %_unVal4, align 8
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %2 = load ptr, ptr %_unVal5, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %2, i32 0, i32 1
  %3 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %3, 1
  store i64 %inc, ptr %_uiRef, align 8
  %4 = load i32, ptr %tOldType, align 4
  %and = and i32 %4, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load ptr, ptr %unOldVal, align 8
  %_uiRef6 = getelementptr inbounds %struct.SQRefCounted, ptr %5, i32 0, i32 1
  %6 = load i64, ptr %_uiRef6, align 8
  %dec = add i64 %6, -1
  store i64 %dec, ptr %_uiRef6, align 8
  %cmp = icmp eq i64 %dec, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %7 = load ptr, ptr %unOldVal, align 8
  %vtable = load ptr, ptr %7, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 2
  %8 = load ptr, ptr %vfn, align 8
  call void %8(ptr noundef nonnull align 8 dereferenceable(24) %7)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret ptr %this1
}

declare noundef zeroext i1 @_ZN4SQVM4InitEPS_x(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef, i64 noundef) #1

declare void @_Z10sq_vm_freePvy(ptr noundef, i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_newthread(ptr noundef %friendvm, i64 noundef %initialstacksize) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca ptr, align 8
  %friendvm.addr = alloca ptr, align 8
  %initialstacksize.addr = alloca i64, align 8
  %ss = alloca ptr, align 8
  %v = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %friendvm, ptr %friendvm.addr, align 8
  store i64 %initialstacksize, ptr %initialstacksize.addr, align 8
  %0 = load ptr, ptr %friendvm.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 19
  %1 = load ptr, ptr %_sharedstate, align 8
  store ptr %1, ptr %ss, align 8
  %call = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef 344)
  store ptr %call, ptr %v, align 8
  %2 = load ptr, ptr %v, align 8
  %3 = load ptr, ptr %ss, align 8
  %call1 = call noundef ptr @_ZN4SQVMC1EP13SQSharedState(ptr noundef nonnull align 8 dereferenceable(344) %2, ptr noundef %3)
  %4 = load ptr, ptr %v, align 8
  %5 = load ptr, ptr %friendvm.addr, align 8
  %6 = load i64, ptr %initialstacksize.addr, align 8
  %call2 = call noundef zeroext i1 @_ZN4SQVM4InitEPS_x(ptr noundef nonnull align 8 dereferenceable(344) %4, ptr noundef %5, i64 noundef %6)
  br i1 %call2, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %7 = load ptr, ptr %friendvm.addr, align 8
  %8 = load ptr, ptr %v, align 8
  %call3 = call noundef ptr @_ZN11SQObjectPtrC1EP4SQVM(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %8)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %7, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then
  %call4 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  %9 = load ptr, ptr %v, align 8
  store ptr %9, ptr %retval, align 8
  br label %return

lpad:                                             ; preds = %if.then
  %10 = landingpad { ptr, i32 }
          cleanup
  %11 = extractvalue { ptr, i32 } %10, 0
  store ptr %11, ptr %exn.slot, align 8
  %12 = extractvalue { ptr, i32 } %10, 1
  store i32 %12, ptr %ehselector.slot, align 4
  %call5 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

if.else:                                          ; preds = %entry
  %13 = load ptr, ptr %v, align 8
  %vtable = load ptr, ptr %13, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 0
  %14 = load ptr, ptr %vfn, align 8
  %call6 = call noundef ptr %14(ptr noundef nonnull align 8 dereferenceable(344) %13) #10
  %15 = load ptr, ptr %v, align 8
  call void @_Z10sq_vm_freePvy(ptr noundef %15, i64 noundef 344)
  store ptr null, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.else, %invoke.cont
  %16 = load ptr, ptr %retval, align 8
  ret ptr %16

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val7 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val7
}

declare void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP4SQVM(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2EP4SQVM(ptr noundef nonnull align 8 dereferenceable(16) %this1, ptr noundef %0)
  ret ptr %this1
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %this) unnamed_addr #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrD2Ev(ptr noundef nonnull align 8 dereferenceable(16) %this1) #10
  ret ptr %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define i64 @sq_getvmstate(ptr noundef %v) #4 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_suspended = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 23
  %1 = load i64, ptr %_suspended, align 8
  %tobool = icmp ne i64 %1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i64 2, ptr %retval, align 8
  br label %return

if.else:                                          ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %_callsstacksize = getelementptr inbounds %struct.SQVM, ptr %2, i32 0, i32 13
  %3 = load i64, ptr %_callsstacksize, align 8
  %cmp = icmp ne i64 %3, 0
  br i1 %cmp, label %if.then1, label %if.else2

if.then1:                                         ; preds = %if.else
  store i64 1, ptr %retval, align 8
  br label %return

if.else2:                                         ; preds = %if.else
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.else2, %if.then1, %if.then
  %4 = load i64, ptr %retval, align 8
  ret i64 %4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_seterrorhandler(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %o = alloca %struct.tagSQObject, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef -1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %o, ptr align 8 %call, i64 16, i1 false)
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %1, 134217984
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %_type1 = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %2 = load i32, ptr %_type1, align 8
  %cmp2 = icmp eq i32 %2, 134218240
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %_type4 = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %3 = load i32, ptr %_type4, align 8
  %cmp5 = icmp eq i32 %3, 16777217
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  %4 = load ptr, ptr %v.addr, align 8
  %_errorhandler = getelementptr inbounds %struct.SQVM, ptr %4, i32 0, i32 7
  %call6 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %_errorhandler, ptr noundef nonnull align 8 dereferenceable(16) %o)
  %5 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %5)
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false3
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load i64, ptr %idx.addr, align 8
  %cmp = icmp sge i64 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load ptr, ptr %v.addr, align 8
  %2 = load i64, ptr %idx.addr, align 8
  %3 = load ptr, ptr %v.addr, align 8
  %_stackbase = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 3
  %4 = load i64, ptr %_stackbase, align 8
  %add = add nsw i64 %2, %4
  %sub = sub nsw i64 %add, 1
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetAtEx(ptr noundef nonnull align 8 dereferenceable(344) %1, i64 noundef %sub)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %5 = load ptr, ptr %v.addr, align 8
  %6 = load i64, ptr %idx.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %5, i64 noundef %6)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond-lvalue = phi ptr [ %call, %cond.true ], [ %call1, %cond.false ]
  ret ptr %cond-lvalue
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %this, ptr noundef nonnull align 8 dereferenceable(16) %obj) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %obj.addr = alloca ptr, align 8
  %tOldType = alloca i32, align 4
  %unOldVal = alloca %union.tagSQObjectValue, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %obj, ptr %obj.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  %0 = load i32, ptr %_type, align 8
  store i32 %0, ptr %tOldType, align 4
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %unOldVal, ptr align 8 %_unVal, i64 8, i1 false)
  %1 = load ptr, ptr %obj.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %1, i32 0, i32 1
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_unVal3, ptr align 8 %_unVal2, i64 8, i1 false)
  %2 = load ptr, ptr %obj.addr, align 8
  %_type4 = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type4, align 8
  %_type5 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 %3, ptr %_type5, align 8
  %_type6 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  %4 = load i32, ptr %_type6, align 8
  %and = and i32 %4, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %_unVal7 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %5 = load ptr, ptr %_unVal7, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %5, i32 0, i32 1
  %6 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %6, 1
  store i64 %inc, ptr %_uiRef, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load i32, ptr %tOldType, align 4
  %and8 = and i32 %7, 134217728
  %tobool9 = icmp ne i32 %and8, 0
  br i1 %tobool9, label %land.lhs.true, label %if.end12

land.lhs.true:                                    ; preds = %if.end
  %8 = load ptr, ptr %unOldVal, align 8
  %_uiRef10 = getelementptr inbounds %struct.SQRefCounted, ptr %8, i32 0, i32 1
  %9 = load i64, ptr %_uiRef10, align 8
  %dec = add i64 %9, -1
  store i64 %dec, ptr %_uiRef10, align 8
  %cmp = icmp eq i64 %dec, 0
  br i1 %cmp, label %if.then11, label %if.end12

if.then11:                                        ; preds = %land.lhs.true
  %10 = load ptr, ptr %unOldVal, align 8
  %vtable = load ptr, ptr %10, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 2
  %11 = load ptr, ptr %vfn, align 8
  call void %11(ptr noundef nonnull align 8 dereferenceable(24) %10)
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %land.lhs.true, %if.end
  ret ptr %this1
}

declare void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_setnativedebughook(ptr noundef %v, ptr noundef %hook) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %hook.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store ptr %hook, ptr %hook.addr, align 8
  %0 = load ptr, ptr %hook.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %_debughook_native = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 9
  store ptr %0, ptr %_debughook_native, align 8
  %2 = load ptr, ptr %v.addr, align 8
  %_debughook_closure = getelementptr inbounds %struct.SQVM, ptr %2, i32 0, i32 10
  call void @_ZN11SQObjectPtr4NullEv(ptr noundef nonnull align 8 dereferenceable(16) %_debughook_closure)
  %3 = load ptr, ptr %hook.addr, align 8
  %tobool = icmp ne ptr %3, null
  %4 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i1 true, i1 false
  %5 = load ptr, ptr %v.addr, align 8
  %_debughook = getelementptr inbounds %struct.SQVM, ptr %5, i32 0, i32 8
  %frombool = zext i1 %cond to i8
  store i8 %frombool, ptr %_debughook, align 8
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN11SQObjectPtr4NullEv(ptr noundef nonnull align 8 dereferenceable(16) %this) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %tOldType = alloca i32, align 4
  %unOldVal = alloca %union.tagSQObjectValue, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  %0 = load i32, ptr %_type, align 8
  store i32 %0, ptr %tOldType, align 4
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %unOldVal, ptr align 8 %_unVal, i64 8, i1 false)
  %_type2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 16777217, ptr %_type2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal3, align 8
  %1 = load i32, ptr %tOldType, align 4
  %and = and i32 %1, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load ptr, ptr %unOldVal, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %2, i32 0, i32 1
  %3 = load i64, ptr %_uiRef, align 8
  %dec = add i64 %3, -1
  store i64 %dec, ptr %_uiRef, align 8
  %cmp = icmp eq i64 %dec, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load ptr, ptr %unOldVal, align 8
  %vtable = load ptr, ptr %4, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 2
  %5 = load ptr, ptr %vfn, align 8
  call void %5(ptr noundef nonnull align 8 dereferenceable(24) %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_setdebughook(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %o = alloca %struct.tagSQObject, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef -1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %o, ptr align 8 %call, i64 16, i1 false)
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %1, 134217984
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %_type1 = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %2 = load i32, ptr %_type1, align 8
  %cmp2 = icmp eq i32 %2, 134218240
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %_type4 = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %3 = load i32, ptr %_type4, align 8
  %cmp5 = icmp eq i32 %3, 16777217
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  %4 = load ptr, ptr %v.addr, align 8
  %_debughook_closure = getelementptr inbounds %struct.SQVM, ptr %4, i32 0, i32 10
  %call6 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %_debughook_closure, ptr noundef nonnull align 8 dereferenceable(16) %o)
  %5 = load ptr, ptr %v.addr, align 8
  %_debughook_native = getelementptr inbounds %struct.SQVM, ptr %5, i32 0, i32 9
  store ptr null, ptr %_debughook_native, align 8
  %_type7 = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %6 = load i32, ptr %_type7, align 8
  %cmp8 = icmp eq i32 %6, 16777217
  %lnot = xor i1 %cmp8, true
  %7 = load ptr, ptr %v.addr, align 8
  %_debughook = getelementptr inbounds %struct.SQVM, ptr %7, i32 0, i32 8
  %frombool = zext i1 %lnot to i8
  store i8 %frombool, ptr %_debughook, align 8
  %8 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %8)
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false3
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_close(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %ss = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 19
  %1 = load ptr, ptr %_sharedstate, align 8
  store ptr %1, ptr %ss, align 8
  %2 = load ptr, ptr %ss, align 8
  %_root_vm = getelementptr inbounds %struct.SQSharedState, ptr %2, i32 0, i32 10
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %_root_vm, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  %vtable = load ptr, ptr %3, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 5
  %4 = load ptr, ptr %vfn, align 8
  call void %4(ptr noundef nonnull align 8 dereferenceable(344) %3)
  %5 = load ptr, ptr %ss, align 8
  %call = call noundef ptr @_ZN13SQSharedStateD1Ev(ptr noundef nonnull align 8 dereferenceable(384) %5) #10
  %6 = load ptr, ptr %ss, align 8
  call void @_Z10sq_vm_freePvy(ptr noundef %6, i64 noundef 384)
  ret void
}

; Function Attrs: nounwind
declare noundef ptr @_ZN13SQSharedStateD1Ev(ptr noundef nonnull returned align 8 dereferenceable(384)) unnamed_addr #6

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define i64 @sq_getversion() #4 {
entry:
  ret i64 320
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_compile(ptr noundef %v, ptr noundef %read, ptr noundef %p, ptr noundef %sourcename, i64 noundef %raiseerror) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %read.addr = alloca ptr, align 8
  %p.addr = alloca ptr, align 8
  %sourcename.addr = alloca ptr, align 8
  %raiseerror.addr = alloca i64, align 8
  %o = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %cleanup.dest.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store ptr %read, ptr %read.addr, align 8
  store ptr %p, ptr %p.addr, align 8
  store ptr %sourcename, ptr %sourcename.addr, align 8
  store i64 %raiseerror, ptr %raiseerror.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %o)
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load ptr, ptr %read.addr, align 8
  %2 = load ptr, ptr %p.addr, align 8
  %3 = load ptr, ptr %sourcename.addr, align 8
  %4 = load i64, ptr %raiseerror.addr, align 8
  %tobool = icmp ne i64 %4, 0
  %5 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i1 true, i1 false
  %6 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %6, i32 0, i32 19
  %7 = load ptr, ptr %_sharedstate, align 8
  %_debuginfo = getelementptr inbounds %struct.SQSharedState, ptr %7, i32 0, i32 24
  %8 = load i8, ptr %_debuginfo, align 8
  %tobool1 = trunc i8 %8 to i1
  %call2 = invoke noundef zeroext i1 @_Z7CompileP4SQVMPFxPvES1_PKcR11SQObjectPtrbb(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(16) %o, i1 noundef zeroext %cond, i1 noundef zeroext %tobool1)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  br i1 %call2, label %if.then, label %if.end

if.then:                                          ; preds = %invoke.cont
  %9 = load ptr, ptr %v.addr, align 8
  %10 = load ptr, ptr %v.addr, align 8
  %_sharedstate3 = getelementptr inbounds %struct.SQVM, ptr %10, i32 0, i32 19
  %11 = load ptr, ptr %_sharedstate3, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 1
  %12 = load ptr, ptr %_unVal, align 8
  %13 = load ptr, ptr %v.addr, align 8
  %_roottable = getelementptr inbounds %struct.SQVM, ptr %13, i32 0, i32 5
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %_roottable, i32 0, i32 1
  %14 = load ptr, ptr %_unVal4, align 8
  %call6 = invoke noundef ptr @_ZN12SQRefCounted10GetWeakRefE15tagSQObjectType(ptr noundef nonnull align 8 dereferenceable(24) %14, i32 noundef 167772192)
          to label %invoke.cont5 unwind label %lpad

invoke.cont5:                                     ; preds = %if.then
  %call8 = invoke noundef ptr @_ZN9SQClosure6CreateEP13SQSharedStateP15SQFunctionProtoP9SQWeakRef(ptr noundef %11, ptr noundef %12, ptr noundef %call6)
          to label %invoke.cont7 unwind label %lpad

invoke.cont7:                                     ; preds = %invoke.cont5
  %call10 = invoke noundef ptr @_ZN11SQObjectPtrC1EP9SQClosure(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %call8)
          to label %invoke.cont9 unwind label %lpad

invoke.cont9:                                     ; preds = %invoke.cont7
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %9, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont12 unwind label %lpad11

invoke.cont12:                                    ; preds = %invoke.cont9
  %call13 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  store i64 0, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %invoke.cont7, %invoke.cont5, %if.then, %entry
  %15 = landingpad { ptr, i32 }
          cleanup
  %16 = extractvalue { ptr, i32 } %15, 0
  store ptr %16, ptr %exn.slot, align 8
  %17 = extractvalue { ptr, i32 } %15, 1
  store i32 %17, ptr %ehselector.slot, align 4
  br label %ehcleanup

lpad11:                                           ; preds = %invoke.cont9
  %18 = landingpad { ptr, i32 }
          cleanup
  %19 = extractvalue { ptr, i32 } %18, 0
  store ptr %19, ptr %exn.slot, align 8
  %20 = extractvalue { ptr, i32 } %18, 1
  store i32 %20, ptr %ehselector.slot, align 4
  %call14 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %ehcleanup

if.end:                                           ; preds = %invoke.cont
  store i64 -1, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %if.end, %invoke.cont12
  %call15 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %o) #10
  %21 = load i64, ptr %retval, align 8
  ret i64 %21

ehcleanup:                                        ; preds = %lpad11, %lpad
  %call16 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %o) #10
  br label %eh.resume

eh.resume:                                        ; preds = %ehcleanup
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val17 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val17
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %this) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2Ev(ptr noundef nonnull align 8 dereferenceable(16) %this1)
  ret ptr %this1
}

declare noundef zeroext i1 @_Z7CompileP4SQVMPFxPvES1_PKcR11SQObjectPtrbb(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef nonnull align 8 dereferenceable(16), i1 noundef zeroext, i1 noundef zeroext) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN9SQClosure6CreateEP13SQSharedStateP15SQFunctionProtoP9SQWeakRef(ptr noundef %ss, ptr noundef %func, ptr noundef %root) #0 align 2 {
entry:
  %ss.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %root.addr = alloca ptr, align 8
  %size = alloca i64, align 8
  %nc = alloca ptr, align 8
  %n = alloca i64, align 8
  %n12 = alloca i64, align 8
  store ptr %ss, ptr %ss.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  store ptr %root, ptr %root.addr, align 8
  %0 = load ptr, ptr %func.addr, align 8
  %_noutervalues = getelementptr inbounds %struct.SQFunctionProto, ptr %0, i32 0, i32 16
  %1 = load i64, ptr %_noutervalues, align 8
  %mul = mul i64 %1, 16
  %add = add i64 96, %mul
  %2 = load ptr, ptr %func.addr, align 8
  %_ndefaultparams = getelementptr inbounds %struct.SQFunctionProto, ptr %2, i32 0, i32 18
  %3 = load i64, ptr %_ndefaultparams, align 8
  %mul1 = mul i64 %3, 16
  %add2 = add i64 %add, %mul1
  store i64 %add2, ptr %size, align 8
  %4 = load i64, ptr %size, align 8
  %call = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef %4)
  store ptr %call, ptr %nc, align 8
  %5 = load ptr, ptr %nc, align 8
  %6 = load ptr, ptr %ss.addr, align 8
  %7 = load ptr, ptr %func.addr, align 8
  %call3 = call noundef ptr @_ZN9SQClosureC1EP13SQSharedStateP15SQFunctionProto(ptr noundef nonnull align 8 dereferenceable(96) %5, ptr noundef %6, ptr noundef %7)
  %8 = load ptr, ptr %nc, align 8
  %add.ptr = getelementptr inbounds %struct.SQClosure, ptr %8, i64 1
  %9 = load ptr, ptr %nc, align 8
  %_outervalues = getelementptr inbounds %struct.SQClosure, ptr %9, i32 0, i32 5
  store ptr %add.ptr, ptr %_outervalues, align 8
  %10 = load ptr, ptr %nc, align 8
  %_outervalues4 = getelementptr inbounds %struct.SQClosure, ptr %10, i32 0, i32 5
  %11 = load ptr, ptr %_outervalues4, align 8
  %12 = load ptr, ptr %func.addr, align 8
  %_noutervalues5 = getelementptr inbounds %struct.SQFunctionProto, ptr %12, i32 0, i32 16
  %13 = load i64, ptr %_noutervalues5, align 8
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %11, i64 %13
  %14 = load ptr, ptr %nc, align 8
  %_defaultparams = getelementptr inbounds %struct.SQClosure, ptr %14, i32 0, i32 6
  store ptr %arrayidx, ptr %_defaultparams, align 8
  %15 = load ptr, ptr %root.addr, align 8
  %16 = load ptr, ptr %nc, align 8
  %_root = getelementptr inbounds %struct.SQClosure, ptr %16, i32 0, i32 2
  store ptr %15, ptr %_root, align 8
  %17 = load ptr, ptr %nc, align 8
  %_root6 = getelementptr inbounds %struct.SQClosure, ptr %17, i32 0, i32 2
  %18 = load ptr, ptr %_root6, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %18, i32 0, i32 1
  %19 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %19, 1
  store i64 %inc, ptr %_uiRef, align 8
  store i64 0, ptr %n, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %20 = load i64, ptr %n, align 8
  %21 = load ptr, ptr %func.addr, align 8
  %_noutervalues7 = getelementptr inbounds %struct.SQFunctionProto, ptr %21, i32 0, i32 16
  %22 = load i64, ptr %_noutervalues7, align 8
  %cmp = icmp slt i64 %20, %22
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %23 = load ptr, ptr %nc, align 8
  %_outervalues8 = getelementptr inbounds %struct.SQClosure, ptr %23, i32 0, i32 5
  %24 = load ptr, ptr %_outervalues8, align 8
  %25 = load i64, ptr %n, align 8
  %arrayidx9 = getelementptr inbounds %struct.SQObjectPtr, ptr %24, i64 %25
  %call10 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx9)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %26 = load i64, ptr %n, align 8
  %inc11 = add nsw i64 %26, 1
  store i64 %inc11, ptr %n, align 8
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i64 0, ptr %n12, align 8
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc20, %for.end
  %27 = load i64, ptr %n12, align 8
  %28 = load ptr, ptr %func.addr, align 8
  %_ndefaultparams14 = getelementptr inbounds %struct.SQFunctionProto, ptr %28, i32 0, i32 18
  %29 = load i64, ptr %_ndefaultparams14, align 8
  %cmp15 = icmp slt i64 %27, %29
  br i1 %cmp15, label %for.body16, label %for.end22

for.body16:                                       ; preds = %for.cond13
  %30 = load ptr, ptr %nc, align 8
  %_defaultparams17 = getelementptr inbounds %struct.SQClosure, ptr %30, i32 0, i32 6
  %31 = load ptr, ptr %_defaultparams17, align 8
  %32 = load i64, ptr %n12, align 8
  %arrayidx18 = getelementptr inbounds %struct.SQObjectPtr, ptr %31, i64 %32
  %call19 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx18)
  br label %for.inc20

for.inc20:                                        ; preds = %for.body16
  %33 = load i64, ptr %n12, align 8
  %inc21 = add nsw i64 %33, 1
  store i64 %inc21, ptr %n12, align 8
  br label %for.cond13, !llvm.loop !8

for.end22:                                        ; preds = %for.cond13
  %34 = load ptr, ptr %nc, align 8
  ret ptr %34
}

declare noundef ptr @_ZN12SQRefCounted10GetWeakRefE15tagSQObjectType(ptr noundef nonnull align 8 dereferenceable(24), i32 noundef) #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP9SQClosure(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2EP9SQClosure(ptr noundef nonnull align 8 dereferenceable(16) %this1, ptr noundef %0)
  ret ptr %this1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_enabledebuginfo(ptr noundef %v, i64 noundef %enable) #4 {
entry:
  %v.addr = alloca ptr, align 8
  %enable.addr = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %enable, ptr %enable.addr, align 8
  %0 = load i64, ptr %enable.addr, align 8
  %tobool = icmp ne i64 %0, 0
  %1 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i1 true, i1 false
  %2 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %2, i32 0, i32 19
  %3 = load ptr, ptr %_sharedstate, align 8
  %_debuginfo = getelementptr inbounds %struct.SQSharedState, ptr %3, i32 0, i32 24
  %frombool = zext i1 %cond to i8
  store i8 %frombool, ptr %_debuginfo, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_notifyallexceptions(ptr noundef %v, i64 noundef %enable) #4 {
entry:
  %v.addr = alloca ptr, align 8
  %enable.addr = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %enable, ptr %enable.addr, align 8
  %0 = load i64, ptr %enable.addr, align 8
  %tobool = icmp ne i64 %0, 0
  %1 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i1 true, i1 false
  %2 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %2, i32 0, i32 19
  %3 = load ptr, ptr %_sharedstate, align 8
  %_notifyallexceptions = getelementptr inbounds %struct.SQSharedState, ptr %3, i32 0, i32 25
  %frombool = zext i1 %cond to i8
  store i8 %frombool, ptr %_notifyallexceptions, align 1
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_addref(ptr noundef %v, ptr noundef %po) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %po.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store ptr %po, ptr %po.addr, align 8
  %0 = load ptr, ptr %po.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %and = and i32 %1, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %2, i32 0, i32 19
  %3 = load ptr, ptr %_sharedstate, align 8
  %_refs_table = getelementptr inbounds %struct.SQSharedState, ptr %3, i32 0, i32 5
  %4 = load ptr, ptr %po.addr, align 8
  call void @_ZN8RefTable6AddRefER11tagSQObject(ptr noundef nonnull align 8 dereferenceable(40) %_refs_table, ptr noundef nonnull align 8 dereferenceable(16) %4)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

declare void @_ZN8RefTable6AddRefER11tagSQObject(ptr noundef nonnull align 8 dereferenceable(40), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getrefcount(ptr noundef %v, ptr noundef %po) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %po.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store ptr %po, ptr %po.addr, align 8
  %0 = load ptr, ptr %po.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %and = and i32 %1, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %2, i32 0, i32 19
  %3 = load ptr, ptr %_sharedstate, align 8
  %_refs_table = getelementptr inbounds %struct.SQSharedState, ptr %3, i32 0, i32 5
  %4 = load ptr, ptr %po.addr, align 8
  %call = call noundef i64 @_ZN8RefTable11GetRefCountER11tagSQObject(ptr noundef nonnull align 8 dereferenceable(40) %_refs_table, ptr noundef nonnull align 8 dereferenceable(16) %4)
  store i64 %call, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i64, ptr %retval, align 8
  ret i64 %5
}

declare noundef i64 @_ZN8RefTable11GetRefCountER11tagSQObject(ptr noundef nonnull align 8 dereferenceable(40), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_release(ptr noundef %v, ptr noundef %po) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %po.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store ptr %po, ptr %po.addr, align 8
  %0 = load ptr, ptr %po.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %and = and i32 %1, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %2, i32 0, i32 19
  %3 = load ptr, ptr %_sharedstate, align 8
  %_refs_table = getelementptr inbounds %struct.SQSharedState, ptr %3, i32 0, i32 5
  %4 = load ptr, ptr %po.addr, align 8
  %call = call noundef i64 @_ZN8RefTable7ReleaseER11tagSQObject(ptr noundef nonnull align 8 dereferenceable(40) %_refs_table, ptr noundef nonnull align 8 dereferenceable(16) %4)
  store i64 %call, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i64, ptr %retval, align 8
  ret i64 %5
}

declare noundef i64 @_ZN8RefTable7ReleaseER11tagSQObject(ptr noundef nonnull align 8 dereferenceable(40), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define i64 @sq_getvmrefcount(ptr noundef %v, ptr noundef %po) #4 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %po.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store ptr %po, ptr %po.addr, align 8
  %0 = load ptr, ptr %po.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %and = and i32 %1, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %po.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %_uiRef, align 8
  store i64 %4, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i64, ptr %retval, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_objtostring(ptr noundef %o) #4 {
entry:
  %retval = alloca ptr, align 8
  %o.addr = alloca ptr, align 8
  store ptr %o, ptr %o.addr, align 8
  %0 = load ptr, ptr %o.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %1, 134217744
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %o.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  %_val = getelementptr inbounds %struct.SQString, ptr %3, i32 0, i32 5
  %arraydecay = getelementptr inbounds [1 x i8], ptr %_val, i64 0, i64 0
  store ptr %arraydecay, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load ptr, ptr %retval, align 8
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define i64 @sq_objtointeger(ptr noundef %o) #4 {
entry:
  %retval = alloca i64, align 8
  %o.addr = alloca ptr, align 8
  store ptr %o, ptr %o.addr, align 8
  %0 = load ptr, ptr %o.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %and = and i32 %1, 67108864
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %o.addr, align 8
  %_type1 = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type1, align 8
  %cmp = icmp eq i32 %3, 83886084
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %4 = load ptr, ptr %o.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %5 = load float, ptr %_unVal, align 8
  %conv = fptosi float %5 to i64
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %6 = load ptr, ptr %o.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %7 = load i64, ptr %_unVal2, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %conv, %cond.true ], [ %7, %cond.false ]
  store i64 %cond, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %cond.end
  %8 = load i64, ptr %retval, align 8
  ret i64 %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define float @sq_objtofloat(ptr noundef %o) #4 {
entry:
  %retval = alloca float, align 4
  %o.addr = alloca ptr, align 8
  store ptr %o, ptr %o.addr, align 8
  %0 = load ptr, ptr %o.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %and = and i32 %1, 67108864
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %o.addr, align 8
  %_type1 = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type1, align 8
  %cmp = icmp eq i32 %3, 83886082
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %4 = load ptr, ptr %o.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %5 = load i64, ptr %_unVal, align 8
  %conv = sitofp i64 %5 to float
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %6 = load ptr, ptr %o.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %7 = load float, ptr %_unVal2, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi float [ %conv, %cond.true ], [ %7, %cond.false ]
  store float %cond, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store float 0.000000e+00, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %cond.end
  %8 = load float, ptr %retval, align 4
  ret float %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define i64 @sq_objtobool(ptr noundef %o) #4 {
entry:
  %retval = alloca i64, align 8
  %o.addr = alloca ptr, align 8
  store ptr %o, ptr %o.addr, align 8
  %0 = load ptr, ptr %o.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %1, 16777224
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %o.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %3 = load i64, ptr %_unVal, align 8
  store i64 %3, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i64, ptr %retval, align 8
  ret i64 %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_objtouserpointer(ptr noundef %o) #4 {
entry:
  %retval = alloca ptr, align 8
  %o.addr = alloca ptr, align 8
  store ptr %o, ptr %o.addr, align 8
  %0 = load ptr, ptr %o.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %1, 2048
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %o.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  store ptr %3, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load ptr, ptr %retval, align 8
  ret ptr %4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushnull(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM8PushNullEv(ptr noundef nonnull align 8 dereferenceable(344) %0)
  ret void
}

declare void @_ZN4SQVM8PushNullEv(ptr noundef nonnull align 8 dereferenceable(344)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushstring(ptr noundef %v, ptr noundef %s, i64 noundef %len) #0 personality ptr @__gxx_personality_v0 {
entry:
  %v.addr = alloca ptr, align 8
  %s.addr = alloca ptr, align 8
  %len.addr = alloca i64, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store ptr %s, ptr %s.addr, align 8
  store i64 %len, ptr %len.addr, align 8
  %0 = load ptr, ptr %s.addr, align 8
  %tobool = icmp ne ptr %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %v.addr, align 8
  %2 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %2, i32 0, i32 19
  %3 = load ptr, ptr %_sharedstate, align 8
  %4 = load ptr, ptr %s.addr, align 8
  %5 = load i64, ptr %len.addr, align 8
  %call = call noundef ptr @_ZN8SQString6CreateEP13SQSharedStatePKcx(ptr noundef %3, ptr noundef %4, i64 noundef %5)
  %call1 = call noundef ptr @_ZN11SQObjectPtrC1EP8SQString(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %call)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %1, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then
  %call2 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %if.end

lpad:                                             ; preds = %if.then
  %6 = landingpad { ptr, i32 }
          cleanup
  %7 = extractvalue { ptr, i32 } %6, 0
  store ptr %7, ptr %exn.slot, align 8
  %8 = extractvalue { ptr, i32 } %6, 1
  store i32 %8, ptr %ehselector.slot, align 4
  %call3 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

if.else:                                          ; preds = %entry
  %9 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM8PushNullEv(ptr noundef nonnull align 8 dereferenceable(344) %9)
  br label %if.end

if.end:                                           ; preds = %if.else, %invoke.cont
  ret void

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val4 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val4
}

declare noundef ptr @_ZN8SQString6CreateEP13SQSharedStatePKcx(ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP8SQString(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2EP8SQString(ptr noundef nonnull align 8 dereferenceable(16) %this1, ptr noundef %0)
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushinteger(ptr noundef %v, i64 noundef %n) #0 personality ptr @__gxx_personality_v0 {
entry:
  %v.addr = alloca ptr, align 8
  %n.addr = alloca i64, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %n, ptr %n.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %n.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC1Ex(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, i64 noundef %1)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call1 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  ret void

lpad:                                             ; preds = %entry
  %2 = landingpad { ptr, i32 }
          cleanup
  %3 = extractvalue { ptr, i32 } %2, 0
  store ptr %3, ptr %exn.slot, align 8
  %4 = extractvalue { ptr, i32 } %2, 1
  store i32 %4, ptr %ehselector.slot, align 4
  %call2 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val3 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val3
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1Ex(ptr noundef nonnull returned align 8 dereferenceable(16) %this, i64 noundef %x) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  store i64 %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load i64, ptr %x.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2Ex(ptr noundef nonnull align 8 dereferenceable(16) %this1, i64 noundef %0)
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushbool(ptr noundef %v, i64 noundef %b) #0 personality ptr @__gxx_personality_v0 {
entry:
  %v.addr = alloca ptr, align 8
  %b.addr = alloca i64, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %b, ptr %b.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %b.addr, align 8
  %tobool = icmp ne i64 %1, 0
  %2 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i1 true, i1 false
  %call = call noundef ptr @_ZN11SQObjectPtrC1Eb(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, i1 noundef zeroext %cond)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call1 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  ret void

lpad:                                             ; preds = %entry
  %3 = landingpad { ptr, i32 }
          cleanup
  %4 = extractvalue { ptr, i32 } %3, 0
  store ptr %4, ptr %exn.slot, align 8
  %5 = extractvalue { ptr, i32 } %3, 1
  store i32 %5, ptr %ehselector.slot, align 4
  %call2 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val3 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val3
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1Eb(ptr noundef nonnull returned align 8 dereferenceable(16) %this, i1 noundef zeroext %bBool) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %bBool.addr = alloca i8, align 1
  store ptr %this, ptr %this.addr, align 8
  %frombool = zext i1 %bBool to i8
  store i8 %frombool, ptr %bBool.addr, align 1
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load i8, ptr %bBool.addr, align 1
  %tobool = trunc i8 %0 to i1
  %call = call noundef ptr @_ZN11SQObjectPtrC2Eb(ptr noundef nonnull align 8 dereferenceable(16) %this1, i1 noundef zeroext %tobool)
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushfloat(ptr noundef %v, float noundef %n) #0 personality ptr @__gxx_personality_v0 {
entry:
  %v.addr = alloca ptr, align 8
  %n.addr = alloca float, align 4
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store float %n, ptr %n.addr, align 4
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load float, ptr %n.addr, align 4
  %call = call noundef ptr @_ZN11SQObjectPtrC1Ef(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, float noundef %1)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call1 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  ret void

lpad:                                             ; preds = %entry
  %2 = landingpad { ptr, i32 }
          cleanup
  %3 = extractvalue { ptr, i32 } %2, 0
  store ptr %3, ptr %exn.slot, align 8
  %4 = extractvalue { ptr, i32 } %2, 1
  store i32 %4, ptr %ehselector.slot, align 4
  %call2 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val3 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val3
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1Ef(ptr noundef nonnull returned align 8 dereferenceable(16) %this, float noundef %x) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca float, align 4
  store ptr %this, ptr %this.addr, align 8
  store float %x, ptr %x.addr, align 4
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load float, ptr %x.addr, align 4
  %call = call noundef ptr @_ZN11SQObjectPtrC2Ef(ptr noundef nonnull align 8 dereferenceable(16) %this1, float noundef %0)
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushuserpointer(ptr noundef %v, ptr noundef %p) #0 personality ptr @__gxx_personality_v0 {
entry:
  %v.addr = alloca ptr, align 8
  %p.addr = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store ptr %p, ptr %p.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load ptr, ptr %p.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC1EPv(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %1)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call1 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  ret void

lpad:                                             ; preds = %entry
  %2 = landingpad { ptr, i32 }
          cleanup
  %3 = extractvalue { ptr, i32 } %2, 0
  store ptr %3, ptr %exn.slot, align 8
  %4 = extractvalue { ptr, i32 } %2, 1
  store i32 %4, ptr %ehselector.slot, align 4
  %call2 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val3 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val3
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EPv(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2EPv(ptr noundef nonnull align 8 dereferenceable(16) %this1, ptr noundef %0)
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushthread(ptr noundef %v, ptr noundef %thread) #0 personality ptr @__gxx_personality_v0 {
entry:
  %v.addr = alloca ptr, align 8
  %thread.addr = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store ptr %thread, ptr %thread.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load ptr, ptr %thread.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC1EP4SQVM(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %1)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call1 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  ret void

lpad:                                             ; preds = %entry
  %2 = landingpad { ptr, i32 }
          cleanup
  %3 = extractvalue { ptr, i32 } %2, 0
  store ptr %3, ptr %exn.slot, align 8
  %4 = extractvalue { ptr, i32 } %2, 1
  store i32 %4, ptr %ehselector.slot, align 4
  %call2 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val3 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_newuserdata(ptr noundef %v, i64 noundef %size) #0 personality ptr @__gxx_personality_v0 {
entry:
  %v.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %ud = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 19
  %1 = load ptr, ptr %_sharedstate, align 8
  %2 = load i64, ptr %size.addr, align 8
  %add = add i64 %2, 8
  %call = call noundef ptr @_ZN10SQUserData6CreateEP13SQSharedStatex(ptr noundef %1, i64 noundef %add)
  store ptr %call, ptr %ud, align 8
  %3 = load ptr, ptr %v.addr, align 8
  %4 = load ptr, ptr %ud, align 8
  %call1 = call noundef ptr @_ZN11SQObjectPtrC1EP10SQUserData(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %4)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %3, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call2 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  %5 = load ptr, ptr %ud, align 8
  %add.ptr = getelementptr inbounds %struct.SQUserData, ptr %5, i64 1
  %6 = ptrtoint ptr %add.ptr to i64
  %add4 = add i64 %6, 7
  %and = and i64 %add4, -8
  %7 = inttoptr i64 %and to ptr
  ret ptr %7

lpad:                                             ; preds = %entry
  %8 = landingpad { ptr, i32 }
          cleanup
  %9 = extractvalue { ptr, i32 } %8, 0
  store ptr %9, ptr %exn.slot, align 8
  %10 = extractvalue { ptr, i32 } %8, 1
  store i32 %10, ptr %ehselector.slot, align 4
  %call3 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val5 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN10SQUserData6CreateEP13SQSharedStatex(ptr noundef %ss, i64 noundef %size) #0 align 2 {
entry:
  %ss.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %ud = alloca ptr, align 8
  store ptr %ss, ptr %ss.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  %0 = load i64, ptr %size.addr, align 8
  %add = add i64 80, %0
  %call = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef %add)
  store ptr %call, ptr %ud, align 8
  %1 = load ptr, ptr %ud, align 8
  %2 = load ptr, ptr %ss.addr, align 8
  %call1 = call noundef ptr @_ZN10SQUserDataC1EP13SQSharedState(ptr noundef nonnull align 8 dereferenceable(80) %1, ptr noundef %2)
  %3 = load i64, ptr %size.addr, align 8
  %4 = load ptr, ptr %ud, align 8
  %_size = getelementptr inbounds %struct.SQUserData, ptr %4, i32 0, i32 1
  store i64 %3, ptr %_size, align 8
  %5 = load ptr, ptr %ud, align 8
  %_typetag = getelementptr inbounds %struct.SQUserData, ptr %5, i32 0, i32 3
  store ptr null, ptr %_typetag, align 8
  %6 = load ptr, ptr %ud, align 8
  ret ptr %6
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP10SQUserData(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2EP10SQUserData(ptr noundef nonnull align 8 dereferenceable(16) %this1, ptr noundef %0)
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_newtable(ptr noundef %v) #0 personality ptr @__gxx_personality_v0 {
entry:
  %v.addr = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 19
  %2 = load ptr, ptr %_sharedstate, align 8
  %call = call noundef ptr @_ZN7SQTable6CreateEP13SQSharedStatex(ptr noundef %2, i64 noundef 0)
  %call1 = call noundef ptr @_ZN11SQObjectPtrC1EP7SQTable(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %call)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call2 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  ret void

lpad:                                             ; preds = %entry
  %3 = landingpad { ptr, i32 }
          cleanup
  %4 = extractvalue { ptr, i32 } %3, 0
  store ptr %4, ptr %exn.slot, align 8
  %5 = extractvalue { ptr, i32 } %3, 1
  store i32 %5, ptr %ehselector.slot, align 4
  %call3 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val4 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7SQTable6CreateEP13SQSharedStatex(ptr noundef %ss, i64 noundef %nInitialSize) #0 align 2 {
entry:
  %ss.addr = alloca ptr, align 8
  %nInitialSize.addr = alloca i64, align 8
  %newtable = alloca ptr, align 8
  store ptr %ss, ptr %ss.addr, align 8
  store i64 %nInitialSize, ptr %nInitialSize.addr, align 8
  %call = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef 88)
  store ptr %call, ptr %newtable, align 8
  %0 = load ptr, ptr %newtable, align 8
  %1 = load ptr, ptr %ss.addr, align 8
  %2 = load i64, ptr %nInitialSize.addr, align 8
  %call1 = call noundef ptr @_ZN7SQTableC1EP13SQSharedStatex(ptr noundef nonnull align 8 dereferenceable(88) %0, ptr noundef %1, i64 noundef %2)
  %3 = load ptr, ptr %newtable, align 8
  %_delegate = getelementptr inbounds %struct.SQDelegable, ptr %3, i32 0, i32 1
  store ptr null, ptr %_delegate, align 8
  %4 = load ptr, ptr %newtable, align 8
  ret ptr %4
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP7SQTable(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2EP7SQTable(ptr noundef nonnull align 8 dereferenceable(16) %this1, ptr noundef %0)
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_newtableex(ptr noundef %v, i64 noundef %initialcapacity) #0 personality ptr @__gxx_personality_v0 {
entry:
  %v.addr = alloca ptr, align 8
  %initialcapacity.addr = alloca i64, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %initialcapacity, ptr %initialcapacity.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 19
  %2 = load ptr, ptr %_sharedstate, align 8
  %3 = load i64, ptr %initialcapacity.addr, align 8
  %call = call noundef ptr @_ZN7SQTable6CreateEP13SQSharedStatex(ptr noundef %2, i64 noundef %3)
  %call1 = call noundef ptr @_ZN11SQObjectPtrC1EP7SQTable(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %call)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call2 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  ret void

lpad:                                             ; preds = %entry
  %4 = landingpad { ptr, i32 }
          cleanup
  %5 = extractvalue { ptr, i32 } %4, 0
  store ptr %5, ptr %exn.slot, align 8
  %6 = extractvalue { ptr, i32 } %4, 1
  store i32 %6, ptr %ehselector.slot, align 4
  %call3 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val4 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_newarray(ptr noundef %v, i64 noundef %size) #0 personality ptr @__gxx_personality_v0 {
entry:
  %v.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 19
  %2 = load ptr, ptr %_sharedstate, align 8
  %3 = load i64, ptr %size.addr, align 8
  %call = call noundef ptr @_ZN7SQArray6CreateEP13SQSharedStatex(ptr noundef %2, i64 noundef %3)
  %call1 = call noundef ptr @_ZN11SQObjectPtrC1EP7SQArray(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %call)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call2 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  ret void

lpad:                                             ; preds = %entry
  %4 = landingpad { ptr, i32 }
          cleanup
  %5 = extractvalue { ptr, i32 } %4, 0
  store ptr %5, ptr %exn.slot, align 8
  %6 = extractvalue { ptr, i32 } %4, 1
  store i32 %6, ptr %ehselector.slot, align 4
  %call3 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val4 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7SQArray6CreateEP13SQSharedStatex(ptr noundef %ss, i64 noundef %nInitialSize) #0 align 2 {
entry:
  %ss.addr = alloca ptr, align 8
  %nInitialSize.addr = alloca i64, align 8
  %newarray = alloca ptr, align 8
  store ptr %ss, ptr %ss.addr, align 8
  store i64 %nInitialSize, ptr %nInitialSize.addr, align 8
  %call = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef 72)
  store ptr %call, ptr %newarray, align 8
  %0 = load ptr, ptr %newarray, align 8
  %1 = load ptr, ptr %ss.addr, align 8
  %2 = load i64, ptr %nInitialSize.addr, align 8
  %call1 = call noundef ptr @_ZN7SQArrayC1EP13SQSharedStatex(ptr noundef nonnull align 8 dereferenceable(72) %0, ptr noundef %1, i64 noundef %2)
  %3 = load ptr, ptr %newarray, align 8
  ret ptr %3
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP7SQArray(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2EP7SQArray(ptr noundef nonnull align 8 dereferenceable(16) %this1, ptr noundef %0)
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_newclass(ptr noundef %v, i64 noundef %hasbase) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %hasbase.addr = alloca i64, align 8
  %baseclass = alloca ptr, align 8
  %base = alloca ptr, align 8
  %newclass = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %hasbase, ptr %hasbase.addr, align 8
  store ptr null, ptr %baseclass, align 8
  %0 = load i64, ptr %hasbase.addr, align 8
  %tobool = icmp ne i64 %0, 0
  br i1 %tobool, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %v.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %1, i64 noundef -1)
  store ptr %call, ptr %base, align 8
  %2 = load ptr, ptr %base, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %cmp = icmp ne i32 %3, 134234112
  br i1 %cmp, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %4 = load ptr, ptr %v.addr, align 8
  %call2 = call i64 @sq_throwerror(ptr noundef %4, ptr noundef @.str.1)
  store i64 %call2, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %if.then
  %5 = load ptr, ptr %base, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %_unVal, align 8
  store ptr %6, ptr %baseclass, align 8
  br label %if.end3

if.end3:                                          ; preds = %if.end, %entry
  %7 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %7, i32 0, i32 19
  %8 = load ptr, ptr %_sharedstate, align 8
  %9 = load ptr, ptr %baseclass, align 8
  %call4 = call noundef ptr @_ZN7SQClass6CreateEP13SQSharedStatePS_(ptr noundef %8, ptr noundef %9)
  store ptr %call4, ptr %newclass, align 8
  %10 = load ptr, ptr %baseclass, align 8
  %tobool5 = icmp ne ptr %10, null
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end3
  %11 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %11)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end3
  %12 = load ptr, ptr %v.addr, align 8
  %13 = load ptr, ptr %newclass, align 8
  %call8 = call noundef ptr @_ZN11SQObjectPtrC1EP7SQClass(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %13)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %12, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.end7
  %call9 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  store i64 0, ptr %retval, align 8
  br label %return

lpad:                                             ; preds = %if.end7
  %14 = landingpad { ptr, i32 }
          cleanup
  %15 = extractvalue { ptr, i32 } %14, 0
  store ptr %15, ptr %exn.slot, align 8
  %16 = extractvalue { ptr, i32 } %14, 1
  store i32 %16, ptr %ehselector.slot, align 4
  %call10 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

return:                                           ; preds = %invoke.cont, %if.then1
  %17 = load i64, ptr %retval, align 8
  ret i64 %17

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val11 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val11
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7SQClass6CreateEP13SQSharedStatePS_(ptr noundef %ss, ptr noundef %base) #0 align 2 {
entry:
  %ss.addr = alloca ptr, align 8
  %base.addr = alloca ptr, align 8
  %newclass = alloca ptr, align 8
  store ptr %ss, ptr %ss.addr, align 8
  store ptr %base, ptr %base.addr, align 8
  %call = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef 456)
  store ptr %call, ptr %newclass, align 8
  %0 = load ptr, ptr %newclass, align 8
  %1 = load ptr, ptr %ss.addr, align 8
  %2 = load ptr, ptr %base.addr, align 8
  %call1 = call noundef ptr @_ZN7SQClassC1EP13SQSharedStatePS_(ptr noundef nonnull align 8 dereferenceable(456) %0, ptr noundef %1, ptr noundef %2)
  %3 = load ptr, ptr %newclass, align 8
  ret ptr %3
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP7SQClass(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2EP7SQClass(ptr noundef nonnull align 8 dereferenceable(16) %this1, ptr noundef %0)
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_instanceof(ptr noundef %v) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %inst = alloca ptr, align 8
  %cl = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef -1)
  store ptr %call, ptr %inst, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %1, i64 noundef -2)
  store ptr %call1, ptr %cl, align 8
  %2 = load ptr, ptr %inst, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %cmp = icmp ne i32 %3, 167804928
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %4 = load ptr, ptr %cl, align 8
  %_type2 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %5 = load i32, ptr %_type2, align 8
  %cmp3 = icmp ne i32 %5, 134234112
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %6 = load ptr, ptr %v.addr, align 8
  %call4 = call i64 @sq_throwerror(ptr noundef %6, ptr noundef @.str.2)
  store i64 %call4, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %7 = load ptr, ptr %inst, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  %8 = load ptr, ptr %_unVal, align 8
  %9 = load ptr, ptr %cl, align 8
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %9, i32 0, i32 1
  %10 = load ptr, ptr %_unVal5, align 8
  %call6 = call noundef zeroext i1 @_ZN10SQInstance10InstanceOfEP7SQClass(ptr noundef nonnull align 8 dereferenceable(104) %8, ptr noundef %10)
  %11 = zext i1 %call6 to i64
  %cond = select i1 %call6, i32 1, i32 0
  %conv = sext i32 %cond to i64
  store i64 %conv, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %12 = load i64, ptr %retval, align 8
  ret i64 %12
}

declare noundef zeroext i1 @_ZN10SQInstance10InstanceOfEP7SQClass(ptr noundef nonnull align 8 dereferenceable(104), ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_arrayappend(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %arr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call i64 @sq_gettop(ptr noundef %0)
  %cmp = icmp slt i64 %call, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %v.addr, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %1, ptr noundef @.str.3)
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load i64, ptr %idx.addr, align 8
  %call1 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %2, i64 noundef %3, i32 noundef 134217792, ptr noundef %arr)
  br i1 %call1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  store i64 -1, ptr %retval, align 8
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load ptr, ptr %arr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %5 = load ptr, ptr %_unVal, align 8
  %6 = load ptr, ptr %v.addr, align 8
  %call4 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %6, i64 noundef -1)
  call void @_ZN7SQArray6AppendERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(72) %5, ptr noundef nonnull align 8 dereferenceable(16) %call4)
  %7 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %7)
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %8 = load i64, ptr %retval, align 8
  ret i64 %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define i64 @sq_gettop(ptr noundef %v) #4 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_top = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 2
  %1 = load i64, ptr %_top, align 8
  %2 = load ptr, ptr %v.addr, align 8
  %_stackbase = getelementptr inbounds %struct.SQVM, ptr %2, i32 0, i32 3
  %3 = load i64, ptr %_stackbase, align 8
  %sub = sub nsw i64 %1, %3
  ret i64 %sub
}

declare void @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef, ...) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define internal noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %v, i64 noundef %idx, i32 noundef %type, ptr noundef %o) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i1, align 1
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %type.addr = alloca i32, align 4
  %o.addr = alloca ptr, align 8
  %oval = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store i32 %type, ptr %type.addr, align 4
  store ptr %o, ptr %o.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  %2 = load ptr, ptr %o.addr, align 8
  store ptr %call, ptr %2, align 8
  %3 = load ptr, ptr %o.addr, align 8
  %4 = load ptr, ptr %3, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %5 = load i32, ptr %_type, align 8
  %6 = load i32, ptr %type.addr, align 4
  %cmp = icmp ne i32 %5, %6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load ptr, ptr %v.addr, align 8
  %8 = load ptr, ptr %o.addr, align 8
  %9 = load ptr, ptr %8, align 8
  %call1 = call noundef ptr @_ZN4SQVM11PrintObjValERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %7, ptr noundef nonnull align 8 dereferenceable(16) %9)
  %call2 = call noundef ptr @_ZN11SQObjectPtrC1EP8SQString(ptr noundef nonnull align 8 dereferenceable(16) %oval, ptr noundef %call1)
  %10 = load ptr, ptr %v.addr, align 8
  %11 = load i32, ptr %type.addr, align 4
  %call3 = invoke noundef ptr @_Z11IdType2Name15tagSQObjectType(i32 noundef %11)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %oval, i32 0, i32 1
  %12 = load ptr, ptr %_unVal, align 8
  %_val = getelementptr inbounds %struct.SQString, ptr %12, i32 0, i32 5
  %arraydecay = getelementptr inbounds [1 x i8], ptr %_val, i64 0, i64 0
  invoke void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %10, ptr noundef @.str.52, ptr noundef %call3, ptr noundef %arraydecay)
          to label %invoke.cont4 unwind label %lpad

invoke.cont4:                                     ; preds = %invoke.cont
  store i1 false, ptr %retval, align 1
  %call5 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %oval) #10
  br label %return

lpad:                                             ; preds = %invoke.cont, %if.then
  %13 = landingpad { ptr, i32 }
          cleanup
  %14 = extractvalue { ptr, i32 } %13, 0
  store ptr %14, ptr %exn.slot, align 8
  %15 = extractvalue { ptr, i32 } %13, 1
  store i32 %15, ptr %ehselector.slot, align 4
  %call6 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %oval) #10
  br label %eh.resume

if.end:                                           ; preds = %entry
  store i1 true, ptr %retval, align 1
  br label %return

return:                                           ; preds = %if.end, %invoke.cont4
  %16 = load i1, ptr %retval, align 1
  ret i1 %16

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val7 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7SQArray6AppendERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(72) %this, ptr noundef nonnull align 8 dereferenceable(16) %o) #0 align 2 personality ptr @__gxx_personality_v0 {
entry:
  %this.addr = alloca ptr, align 8
  %o.addr = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %this, ptr %this.addr, align 8
  store ptr %o, ptr %o.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_values = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  %0 = load ptr, ptr %o.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef nonnull align 8 dereferenceable(16) %0)
  %call2 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN8sqvectorI11SQObjectPtrE9push_backERKS0_(ptr noundef nonnull align 8 dereferenceable(24) %_values, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call3 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  ret void

lpad:                                             ; preds = %entry
  %1 = landingpad { ptr, i32 }
          cleanup
  %2 = extractvalue { ptr, i32 } %1, 0
  store ptr %2, ptr %exn.slot, align 8
  %3 = extractvalue { ptr, i32 } %1, 1
  store i32 %3, ptr %ehselector.slot, align 4
  %call4 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val5 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val5
}

declare noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344), i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_arraypop(ptr noundef %v, i64 noundef %idx, i64 noundef %pushval) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %pushval.addr = alloca i64, align 8
  %arr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store i64 %pushval, ptr %pushval.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call i64 @sq_gettop(ptr noundef %0)
  %cmp = icmp slt i64 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %v.addr, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %1, ptr noundef @.str.3)
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load i64, ptr %idx.addr, align 8
  %call1 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %2, i64 noundef %3, i32 noundef 134217792, ptr noundef %arr)
  br i1 %call1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  store i64 -1, ptr %retval, align 8
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load ptr, ptr %arr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %5 = load ptr, ptr %_unVal, align 8
  %call4 = call noundef i64 @_ZNK7SQArray4SizeEv(ptr noundef nonnull align 8 dereferenceable(72) %5)
  %cmp5 = icmp sgt i64 %call4, 0
  br i1 %cmp5, label %if.then6, label %if.end13

if.then6:                                         ; preds = %if.end3
  %6 = load i64, ptr %pushval.addr, align 8
  %cmp7 = icmp ne i64 %6, 0
  br i1 %cmp7, label %if.then8, label %if.end11

if.then8:                                         ; preds = %if.then6
  %7 = load ptr, ptr %v.addr, align 8
  %8 = load ptr, ptr %arr, align 8
  %_unVal9 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %9 = load ptr, ptr %_unVal9, align 8
  %call10 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN7SQArray3TopEv(ptr noundef nonnull align 8 dereferenceable(72) %9)
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %7, ptr noundef nonnull align 8 dereferenceable(16) %call10)
  br label %if.end11

if.end11:                                         ; preds = %if.then8, %if.then6
  %10 = load ptr, ptr %arr, align 8
  %_unVal12 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 1
  %11 = load ptr, ptr %_unVal12, align 8
  call void @_ZN7SQArray3PopEv(ptr noundef nonnull align 8 dereferenceable(72) %11)
  store i64 0, ptr %retval, align 8
  br label %return

if.end13:                                         ; preds = %if.end3
  %12 = load ptr, ptr %v.addr, align 8
  %call14 = call i64 @sq_throwerror(ptr noundef %12, ptr noundef @.str.4)
  store i64 %call14, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end13, %if.end11, %if.then2, %if.then
  %13 = load i64, ptr %retval, align 8
  ret i64 %13
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNK7SQArray4SizeEv(ptr noundef nonnull align 8 dereferenceable(72) %this) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_values = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  %call = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %_values)
  ret i64 %call
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN7SQArray3TopEv(ptr noundef nonnull align 8 dereferenceable(72) %this) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_values = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrE3topEv(ptr noundef nonnull align 8 dereferenceable(24) %_values)
  ret ptr %call
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7SQArray3PopEv(ptr noundef nonnull align 8 dereferenceable(72) %this) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_values = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  call void @_ZN8sqvectorI11SQObjectPtrE8pop_backEv(ptr noundef nonnull align 8 dereferenceable(24) %_values)
  call void @_ZN7SQArray14ShrinkIfNeededEv(ptr noundef nonnull align 8 dereferenceable(72) %this1)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_arrayresize(ptr noundef %v, i64 noundef %idx, i64 noundef %newsize) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %newsize.addr = alloca i64, align 8
  %arr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store i64 %newsize, ptr %newsize.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call i64 @sq_gettop(ptr noundef %0)
  %cmp = icmp slt i64 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %v.addr, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %1, ptr noundef @.str.3)
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load i64, ptr %idx.addr, align 8
  %call1 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %2, i64 noundef %3, i32 noundef 134217792, ptr noundef %arr)
  br i1 %call1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  store i64 -1, ptr %retval, align 8
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load i64, ptr %newsize.addr, align 8
  %cmp4 = icmp sge i64 %4, 0
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  %5 = load ptr, ptr %arr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %_unVal, align 8
  %7 = load i64, ptr %newsize.addr, align 8
  call void @_ZN7SQArray6ResizeEx(ptr noundef nonnull align 8 dereferenceable(72) %6, i64 noundef %7)
  store i64 0, ptr %retval, align 8
  br label %return

if.end6:                                          ; preds = %if.end3
  %8 = load ptr, ptr %v.addr, align 8
  %call7 = call i64 @sq_throwerror(ptr noundef %8, ptr noundef @.str.5)
  store i64 %call7, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end6, %if.then5, %if.then2, %if.then
  %9 = load i64, ptr %retval, align 8
  ret i64 %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7SQArray6ResizeEx(ptr noundef nonnull align 8 dereferenceable(72) %this, i64 noundef %size) #0 align 2 personality ptr @__gxx_personality_v0 {
entry:
  %this.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %_null = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %this, ptr %this.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %_null)
  %0 = load i64, ptr %size.addr, align 8
  invoke void @_ZN7SQArray6ResizeExR11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(72) %this1, i64 noundef %0, ptr noundef nonnull align 8 dereferenceable(16) %_null)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call2 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %_null) #10
  ret void

lpad:                                             ; preds = %entry
  %1 = landingpad { ptr, i32 }
          cleanup
  %2 = extractvalue { ptr, i32 } %1, 0
  store ptr %2, ptr %exn.slot, align 8
  %3 = extractvalue { ptr, i32 } %1, 1
  store i32 %3, ptr %ehselector.slot, align 4
  %call3 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %_null) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val4 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_arrayreverse(ptr noundef %v, i64 noundef %idx) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  %arr = alloca ptr, align 8
  %t = alloca %struct.SQObjectPtr, align 8
  %size = alloca i64, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %n = alloca i64, align 8
  %i = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call i64 @sq_gettop(ptr noundef %0)
  %cmp = icmp slt i64 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %v.addr, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %1, ptr noundef @.str.3)
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load i64, ptr %idx.addr, align 8
  %call1 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %2, i64 noundef %3, i32 noundef 134217792, ptr noundef %o)
  br i1 %call1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  store i64 -1, ptr %retval, align 8
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %5 = load ptr, ptr %_unVal, align 8
  store ptr %5, ptr %arr, align 8
  %6 = load ptr, ptr %arr, align 8
  %call4 = call noundef i64 @_ZNK7SQArray4SizeEv(ptr noundef nonnull align 8 dereferenceable(72) %6)
  %cmp5 = icmp sgt i64 %call4, 0
  br i1 %cmp5, label %if.then6, label %if.end31

if.then6:                                         ; preds = %if.end3
  %call7 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %t)
  %7 = load ptr, ptr %arr, align 8
  %call8 = invoke noundef i64 @_ZNK7SQArray4SizeEv(ptr noundef nonnull align 8 dereferenceable(72) %7)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then6
  store i64 %call8, ptr %size, align 8
  %8 = load i64, ptr %size, align 8
  %shr = ashr i64 %8, 1
  store i64 %shr, ptr %n, align 8
  %9 = load i64, ptr %size, align 8
  %sub = sub nsw i64 %9, 1
  store i64 %sub, ptr %size, align 8
  store i64 0, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %invoke.cont
  %10 = load i64, ptr %i, align 8
  %11 = load i64, ptr %n, align 8
  %cmp9 = icmp slt i64 %10, %11
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load ptr, ptr %arr, align 8
  %_values = getelementptr inbounds %struct.SQArray, ptr %12, i32 0, i32 1
  %13 = load i64, ptr %i, align 8
  %call11 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrEixEy(ptr noundef nonnull align 8 dereferenceable(24) %_values, i64 noundef %13)
          to label %invoke.cont10 unwind label %lpad

invoke.cont10:                                    ; preds = %for.body
  %call13 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %t, ptr noundef nonnull align 8 dereferenceable(16) %call11)
          to label %invoke.cont12 unwind label %lpad

invoke.cont12:                                    ; preds = %invoke.cont10
  %14 = load ptr, ptr %arr, align 8
  %_values14 = getelementptr inbounds %struct.SQArray, ptr %14, i32 0, i32 1
  %15 = load i64, ptr %size, align 8
  %16 = load i64, ptr %i, align 8
  %sub15 = sub nsw i64 %15, %16
  %call17 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrEixEy(ptr noundef nonnull align 8 dereferenceable(24) %_values14, i64 noundef %sub15)
          to label %invoke.cont16 unwind label %lpad

invoke.cont16:                                    ; preds = %invoke.cont12
  %17 = load ptr, ptr %arr, align 8
  %_values18 = getelementptr inbounds %struct.SQArray, ptr %17, i32 0, i32 1
  %18 = load i64, ptr %i, align 8
  %call20 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrEixEy(ptr noundef nonnull align 8 dereferenceable(24) %_values18, i64 noundef %18)
          to label %invoke.cont19 unwind label %lpad

invoke.cont19:                                    ; preds = %invoke.cont16
  %call22 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %call20, ptr noundef nonnull align 8 dereferenceable(16) %call17)
          to label %invoke.cont21 unwind label %lpad

invoke.cont21:                                    ; preds = %invoke.cont19
  %19 = load ptr, ptr %arr, align 8
  %_values23 = getelementptr inbounds %struct.SQArray, ptr %19, i32 0, i32 1
  %20 = load i64, ptr %size, align 8
  %21 = load i64, ptr %i, align 8
  %sub24 = sub nsw i64 %20, %21
  %call26 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrEixEy(ptr noundef nonnull align 8 dereferenceable(24) %_values23, i64 noundef %sub24)
          to label %invoke.cont25 unwind label %lpad

invoke.cont25:                                    ; preds = %invoke.cont21
  %call28 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %call26, ptr noundef nonnull align 8 dereferenceable(16) %t)
          to label %invoke.cont27 unwind label %lpad

invoke.cont27:                                    ; preds = %invoke.cont25
  br label %for.inc

for.inc:                                          ; preds = %invoke.cont27
  %22 = load i64, ptr %i, align 8
  %inc = add nsw i64 %22, 1
  store i64 %inc, ptr %i, align 8
  br label %for.cond, !llvm.loop !9

lpad:                                             ; preds = %invoke.cont25, %invoke.cont21, %invoke.cont19, %invoke.cont16, %invoke.cont12, %invoke.cont10, %for.body, %if.then6
  %23 = landingpad { ptr, i32 }
          cleanup
  %24 = extractvalue { ptr, i32 } %23, 0
  store ptr %24, ptr %exn.slot, align 8
  %25 = extractvalue { ptr, i32 } %23, 1
  store i32 %25, ptr %ehselector.slot, align 4
  %call30 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %t) #10
  br label %eh.resume

for.end:                                          ; preds = %for.cond
  store i64 0, ptr %retval, align 8
  %call29 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %t) #10
  br label %return

if.end31:                                         ; preds = %if.end3
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end31, %for.end, %if.then2, %if.then
  %26 = load i64, ptr %retval, align 8
  ret i64 %26

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val32 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val32
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrEixEy(ptr noundef nonnull align 8 dereferenceable(24) %this, i64 noundef %pos) #4 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %pos.addr = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  store i64 %pos, ptr %pos.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_vals = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %0 = load ptr, ptr %_vals, align 8
  %1 = load i64, ptr %pos.addr, align 8
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %0, i64 %1
  ret ptr %arrayidx
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %this, ptr noundef nonnull align 8 dereferenceable(16) %obj) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %obj.addr = alloca ptr, align 8
  %tOldType = alloca i32, align 4
  %unOldVal = alloca %union.tagSQObjectValue, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %obj, ptr %obj.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  %0 = load i32, ptr %_type, align 8
  store i32 %0, ptr %tOldType, align 4
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %unOldVal, ptr align 8 %_unVal, i64 8, i1 false)
  %1 = load ptr, ptr %obj.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %1, i32 0, i32 1
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_unVal3, ptr align 8 %_unVal2, i64 8, i1 false)
  %2 = load ptr, ptr %obj.addr, align 8
  %_type4 = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type4, align 8
  %_type5 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 %3, ptr %_type5, align 8
  %_type6 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  %4 = load i32, ptr %_type6, align 8
  %and = and i32 %4, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %_unVal7 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %5 = load ptr, ptr %_unVal7, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %5, i32 0, i32 1
  %6 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %6, 1
  store i64 %inc, ptr %_uiRef, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load i32, ptr %tOldType, align 4
  %and8 = and i32 %7, 134217728
  %tobool9 = icmp ne i32 %and8, 0
  br i1 %tobool9, label %land.lhs.true, label %if.end12

land.lhs.true:                                    ; preds = %if.end
  %8 = load ptr, ptr %unOldVal, align 8
  %_uiRef10 = getelementptr inbounds %struct.SQRefCounted, ptr %8, i32 0, i32 1
  %9 = load i64, ptr %_uiRef10, align 8
  %dec = add i64 %9, -1
  store i64 %dec, ptr %_uiRef10, align 8
  %cmp = icmp eq i64 %dec, 0
  br i1 %cmp, label %if.then11, label %if.end12

if.then11:                                        ; preds = %land.lhs.true
  %10 = load ptr, ptr %unOldVal, align 8
  %vtable = load ptr, ptr %10, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 2
  %11 = load ptr, ptr %vfn, align 8
  call void %11(ptr noundef nonnull align 8 dereferenceable(24) %10)
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %land.lhs.true, %if.end
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_arrayremove(ptr noundef %v, i64 noundef %idx, i64 noundef %itemidx) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %itemidx.addr = alloca i64, align 8
  %arr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store i64 %itemidx, ptr %itemidx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call i64 @sq_gettop(ptr noundef %0)
  %cmp = icmp slt i64 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %v.addr, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %1, ptr noundef @.str.3)
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load i64, ptr %idx.addr, align 8
  %call1 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %2, i64 noundef %3, i32 noundef 134217792, ptr noundef %arr)
  br i1 %call1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  store i64 -1, ptr %retval, align 8
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load ptr, ptr %arr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %5 = load ptr, ptr %_unVal, align 8
  %6 = load i64, ptr %itemidx.addr, align 8
  %call4 = call noundef zeroext i1 @_ZN7SQArray6RemoveEx(ptr noundef nonnull align 8 dereferenceable(72) %5, i64 noundef %6)
  br i1 %call4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end3
  br label %cond.end

cond.false:                                       ; preds = %if.end3
  %7 = load ptr, ptr %v.addr, align 8
  %call5 = call i64 @sq_throwerror(ptr noundef %7, ptr noundef @.str.6)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ 0, %cond.true ], [ %call5, %cond.false ]
  store i64 %cond, ptr %retval, align 8
  br label %return

return:                                           ; preds = %cond.end, %if.then2, %if.then
  %8 = load i64, ptr %retval, align 8
  ret i64 %8
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZN7SQArray6RemoveEx(ptr noundef nonnull align 8 dereferenceable(72) %this, i64 noundef %idx) #0 align 2 {
entry:
  %retval = alloca i1, align 1
  %this.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load i64, ptr %idx.addr, align 8
  %cmp = icmp slt i64 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i64, ptr %idx.addr, align 8
  %_values = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  %call = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %_values)
  %cmp2 = icmp sge i64 %1, %call
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i1 false, ptr %retval, align 1
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %_values3 = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  %2 = load i64, ptr %idx.addr, align 8
  call void @_ZN8sqvectorI11SQObjectPtrE6removeEy(ptr noundef nonnull align 8 dereferenceable(24) %_values3, i64 noundef %2)
  call void @_ZN7SQArray14ShrinkIfNeededEv(ptr noundef nonnull align 8 dereferenceable(72) %this1)
  store i1 true, ptr %retval, align 1
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i1, ptr %retval, align 1
  ret i1 %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_arrayinsert(ptr noundef %v, i64 noundef %idx, i64 noundef %destpos) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %destpos.addr = alloca i64, align 8
  %arr = alloca ptr, align 8
  %ret = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store i64 %destpos, ptr %destpos.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call i64 @sq_gettop(ptr noundef %0)
  %cmp = icmp slt i64 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %v.addr, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %1, ptr noundef @.str.3)
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load i64, ptr %idx.addr, align 8
  %call1 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %2, i64 noundef %3, i32 noundef 134217792, ptr noundef %arr)
  br i1 %call1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  store i64 -1, ptr %retval, align 8
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load ptr, ptr %arr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %5 = load ptr, ptr %_unVal, align 8
  %6 = load i64, ptr %destpos.addr, align 8
  %7 = load ptr, ptr %v.addr, align 8
  %call4 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %7, i64 noundef -1)
  %call5 = call noundef zeroext i1 @_ZN7SQArray6InsertExRK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(72) %5, i64 noundef %6, ptr noundef nonnull align 8 dereferenceable(16) %call4)
  br i1 %call5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end3
  br label %cond.end

cond.false:                                       ; preds = %if.end3
  %8 = load ptr, ptr %v.addr, align 8
  %call6 = call i64 @sq_throwerror(ptr noundef %8, ptr noundef @.str.6)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ 0, %cond.true ], [ %call6, %cond.false ]
  store i64 %cond, ptr %ret, align 8
  %9 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %9)
  %10 = load i64, ptr %ret, align 8
  store i64 %10, ptr %retval, align 8
  br label %return

return:                                           ; preds = %cond.end, %if.then2, %if.then
  %11 = load i64, ptr %retval, align 8
  ret i64 %11
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZN7SQArray6InsertExRK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(72) %this, i64 noundef %idx, ptr noundef nonnull align 8 dereferenceable(16) %val) #0 align 2 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i1, align 1
  %this.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %val.addr = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %this, ptr %this.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %val, ptr %val.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load i64, ptr %idx.addr, align 8
  %cmp = icmp slt i64 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i64, ptr %idx.addr, align 8
  %_values = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  %call = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %_values)
  %cmp2 = icmp sgt i64 %1, %call
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i1 false, ptr %retval, align 1
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %_values3 = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  %2 = load i64, ptr %idx.addr, align 8
  %3 = load ptr, ptr %val.addr, align 8
  %call4 = call noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef nonnull align 8 dereferenceable(16) %3)
  invoke void @_ZN8sqvectorI11SQObjectPtrE6insertEyRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %_values3, i64 noundef %2, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.end
  %call5 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  store i1 true, ptr %retval, align 1
  br label %return

lpad:                                             ; preds = %if.end
  %4 = landingpad { ptr, i32 }
          cleanup
  %5 = extractvalue { ptr, i32 } %4, 0
  store ptr %5, ptr %exn.slot, align 8
  %6 = extractvalue { ptr, i32 } %4, 1
  store i32 %6, ptr %ehselector.slot, align 4
  %call6 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

return:                                           ; preds = %invoke.cont, %if.then
  %7 = load i1, ptr %retval, align 1
  ret i1 %7

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val7 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_newclosure(ptr noundef %v, ptr noundef %func, i64 noundef %nfreevars) #0 personality ptr @__gxx_personality_v0 {
entry:
  %v.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %nfreevars.addr = alloca i64, align 8
  %nc = alloca ptr, align 8
  %i = alloca i64, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  store i64 %nfreevars, ptr %nfreevars.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 19
  %1 = load ptr, ptr %_sharedstate, align 8
  %2 = load ptr, ptr %func.addr, align 8
  %3 = load i64, ptr %nfreevars.addr, align 8
  %call = call noundef ptr @_ZN15SQNativeClosure6CreateEP13SQSharedStatePFxP4SQVMEx(ptr noundef %1, ptr noundef %2, i64 noundef %3)
  store ptr %call, ptr %nc, align 8
  %4 = load ptr, ptr %nc, align 8
  %_nparamscheck = getelementptr inbounds %struct.SQNativeClosure, ptr %4, i32 0, i32 1
  store i64 0, ptr %_nparamscheck, align 8
  store i64 0, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, ptr %i, align 8
  %6 = load i64, ptr %nfreevars.addr, align 8
  %cmp = icmp ult i64 %5, %6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM3TopEv(ptr noundef nonnull align 8 dereferenceable(344) %7)
  %8 = load ptr, ptr %nc, align 8
  %_outervalues = getelementptr inbounds %struct.SQNativeClosure, ptr %8, i32 0, i32 3
  %9 = load ptr, ptr %_outervalues, align 8
  %10 = load i64, ptr %i, align 8
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %9, i64 %10
  %call2 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx, ptr noundef nonnull align 8 dereferenceable(16) %call1)
  %11 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %11)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i64, ptr %i, align 8
  %inc = add i64 %12, 1
  store i64 %inc, ptr %i, align 8
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %for.cond
  %13 = load ptr, ptr %v.addr, align 8
  %14 = load ptr, ptr %nc, align 8
  %call3 = call noundef ptr @_ZN11SQObjectPtrC1EP15SQNativeClosure(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %14)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %13, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %for.end
  %call4 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  ret void

lpad:                                             ; preds = %for.end
  %15 = landingpad { ptr, i32 }
          cleanup
  %16 = extractvalue { ptr, i32 } %15, 0
  store ptr %16, ptr %exn.slot, align 8
  %17 = extractvalue { ptr, i32 } %15, 1
  store i32 %17, ptr %ehselector.slot, align 4
  %call5 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val6 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val6
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN15SQNativeClosure6CreateEP13SQSharedStatePFxP4SQVMEx(ptr noundef %ss, ptr noundef %func, i64 noundef %nouters) #0 align 2 {
entry:
  %ss.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %nouters.addr = alloca i64, align 8
  %size = alloca i64, align 8
  %nc = alloca ptr, align 8
  %n = alloca i64, align 8
  store ptr %ss, ptr %ss.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  store i64 %nouters, ptr %nouters.addr, align 8
  %0 = load i64, ptr %nouters.addr, align 8
  %mul = mul i64 %0, 16
  %add = add i64 128, %mul
  store i64 %add, ptr %size, align 8
  %1 = load i64, ptr %size, align 8
  %call = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef %1)
  store ptr %call, ptr %nc, align 8
  %2 = load ptr, ptr %nc, align 8
  %3 = load ptr, ptr %ss.addr, align 8
  %4 = load ptr, ptr %func.addr, align 8
  %call1 = call noundef ptr @_ZN15SQNativeClosureC1EP13SQSharedStatePFxP4SQVME(ptr noundef nonnull align 8 dereferenceable(128) %2, ptr noundef %3, ptr noundef %4)
  %5 = load ptr, ptr %nc, align 8
  %add.ptr = getelementptr inbounds %struct.SQNativeClosure, ptr %5, i64 1
  %6 = load ptr, ptr %nc, align 8
  %_outervalues = getelementptr inbounds %struct.SQNativeClosure, ptr %6, i32 0, i32 3
  store ptr %add.ptr, ptr %_outervalues, align 8
  %7 = load i64, ptr %nouters.addr, align 8
  %8 = load ptr, ptr %nc, align 8
  %_noutervalues = getelementptr inbounds %struct.SQNativeClosure, ptr %8, i32 0, i32 4
  store i64 %7, ptr %_noutervalues, align 8
  store i64 0, ptr %n, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, ptr %n, align 8
  %10 = load ptr, ptr %nc, align 8
  %_noutervalues2 = getelementptr inbounds %struct.SQNativeClosure, ptr %10, i32 0, i32 4
  %11 = load i64, ptr %_noutervalues2, align 8
  %cmp = icmp slt i64 %9, %11
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load ptr, ptr %nc, align 8
  %_outervalues3 = getelementptr inbounds %struct.SQNativeClosure, ptr %12, i32 0, i32 3
  %13 = load ptr, ptr %_outervalues3, align 8
  %14 = load i64, ptr %n, align 8
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %13, i64 %14
  %call4 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %15 = load i64, ptr %n, align 8
  %inc = add nsw i64 %15, 1
  store i64 %inc, ptr %n, align 8
  br label %for.cond, !llvm.loop !11

for.end:                                          ; preds = %for.cond
  %16 = load ptr, ptr %nc, align 8
  ret ptr %16
}

declare noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM3TopEv(ptr noundef nonnull align 8 dereferenceable(344)) #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP15SQNativeClosure(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2EP15SQNativeClosure(ptr noundef nonnull align 8 dereferenceable(16) %this1, ptr noundef %0)
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getclosureinfo(ptr noundef %v, i64 noundef %idx, ptr noundef %nparams, ptr noundef %nfreevars) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %nparams.addr = alloca ptr, align 8
  %nfreevars.addr = alloca ptr, align 8
  %o = alloca %struct.tagSQObject, align 8
  %c = alloca ptr, align 8
  %proto = alloca ptr, align 8
  %c4 = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %nparams, ptr %nparams.addr, align 8
  store ptr %nfreevars, ptr %nfreevars.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %o, ptr align 8 %call, i64 16, i1 false)
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %2 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %2, 134217984
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  store ptr %3, ptr %c, align 8
  %4 = load ptr, ptr %c, align 8
  %_function = getelementptr inbounds %struct.SQClosure, ptr %4, i32 0, i32 4
  %5 = load ptr, ptr %_function, align 8
  store ptr %5, ptr %proto, align 8
  %6 = load ptr, ptr %proto, align 8
  %_nparameters = getelementptr inbounds %struct.SQFunctionProto, ptr %6, i32 0, i32 12
  %7 = load i64, ptr %_nparameters, align 8
  %8 = load ptr, ptr %nparams.addr, align 8
  store i64 %7, ptr %8, align 8
  %9 = load ptr, ptr %proto, align 8
  %_noutervalues = getelementptr inbounds %struct.SQFunctionProto, ptr %9, i32 0, i32 16
  %10 = load i64, ptr %_noutervalues, align 8
  %11 = load ptr, ptr %nfreevars.addr, align 8
  store i64 %10, ptr %11, align 8
  store i64 0, ptr %retval, align 8
  br label %return

if.else:                                          ; preds = %entry
  %_type1 = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %12 = load i32, ptr %_type1, align 8
  %cmp2 = icmp eq i32 %12, 134218240
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 1
  %13 = load ptr, ptr %_unVal5, align 8
  store ptr %13, ptr %c4, align 8
  %14 = load ptr, ptr %c4, align 8
  %_nparamscheck = getelementptr inbounds %struct.SQNativeClosure, ptr %14, i32 0, i32 1
  %15 = load i64, ptr %_nparamscheck, align 8
  %16 = load ptr, ptr %nparams.addr, align 8
  store i64 %15, ptr %16, align 8
  %17 = load ptr, ptr %c4, align 8
  %_noutervalues6 = getelementptr inbounds %struct.SQNativeClosure, ptr %17, i32 0, i32 4
  %18 = load i64, ptr %_noutervalues6, align 8
  %19 = load ptr, ptr %nfreevars.addr, align 8
  store i64 %18, ptr %19, align 8
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end
  %20 = load ptr, ptr %v.addr, align 8
  %call8 = call i64 @sq_throwerror(ptr noundef %20, ptr noundef @.str.7)
  store i64 %call8, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end7, %if.then3, %if.then
  %21 = load i64, ptr %retval, align 8
  ret i64 %21
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setnativeclosurename(ptr noundef %v, i64 noundef %idx, ptr noundef %name) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %name.addr = alloca ptr, align 8
  %o = alloca %struct.tagSQObject, align 8
  %nc = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %name, ptr %name.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %o, ptr align 8 %call, i64 16, i1 false)
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %2 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %2, 134218240
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  store ptr %3, ptr %nc, align 8
  %4 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %4, i32 0, i32 19
  %5 = load ptr, ptr %_sharedstate, align 8
  %6 = load ptr, ptr %name.addr, align 8
  %call1 = call noundef ptr @_ZN8SQString6CreateEP13SQSharedStatePKcx(ptr noundef %5, ptr noundef %6, i64 noundef -1)
  %7 = load ptr, ptr %nc, align 8
  %_name = getelementptr inbounds %struct.SQNativeClosure, ptr %7, i32 0, i32 7
  %call2 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP8SQString(ptr noundef nonnull align 8 dereferenceable(16) %_name, ptr noundef %call1)
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %8 = load ptr, ptr %v.addr, align 8
  %call3 = call i64 @sq_throwerror(ptr noundef %8, ptr noundef @.str.8)
  store i64 %call3, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %9 = load i64, ptr %retval, align 8
  ret i64 %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP8SQString(ptr noundef nonnull align 8 dereferenceable(16) %this, ptr noundef %x) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  %tOldType = alloca i32, align 4
  %unOldVal = alloca %union.tagSQObjectValue, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  %0 = load i32, ptr %_type, align 8
  store i32 %0, ptr %tOldType, align 4
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %unOldVal, ptr align 8 %_unVal, i64 8, i1 false)
  %_type2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 134217744, ptr %_type2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal3, align 8
  %1 = load ptr, ptr %x.addr, align 8
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %1, ptr %_unVal4, align 8
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %2 = load ptr, ptr %_unVal5, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %2, i32 0, i32 1
  %3 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %3, 1
  store i64 %inc, ptr %_uiRef, align 8
  %4 = load i32, ptr %tOldType, align 4
  %and = and i32 %4, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load ptr, ptr %unOldVal, align 8
  %_uiRef6 = getelementptr inbounds %struct.SQRefCounted, ptr %5, i32 0, i32 1
  %6 = load i64, ptr %_uiRef6, align 8
  %dec = add i64 %6, -1
  store i64 %dec, ptr %_uiRef6, align 8
  %cmp = icmp eq i64 %dec, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %7 = load ptr, ptr %unOldVal, align 8
  %vtable = load ptr, ptr %7, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 2
  %8 = load ptr, ptr %vfn, align 8
  call void %8(ptr noundef nonnull align 8 dereferenceable(24) %7)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setparamscheck(ptr noundef %v, i64 noundef %nparamscheck, ptr noundef %typemask) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %nparamscheck.addr = alloca i64, align 8
  %typemask.addr = alloca ptr, align 8
  %o = alloca %struct.tagSQObject, align 8
  %nc = alloca ptr, align 8
  %res = alloca %class.sqvector.2, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  %ref.tmp = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %nparamscheck, ptr %nparamscheck.addr, align 8
  store ptr %typemask, ptr %typemask.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef -1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %o, ptr align 8 %call, i64 16, i1 false)
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %1, 134218240
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %call1 = call i64 @sq_throwerror(ptr noundef %2, ptr noundef @.str.9)
  store i64 %call1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  store ptr %3, ptr %nc, align 8
  %4 = load i64, ptr %nparamscheck.addr, align 8
  %5 = load ptr, ptr %nc, align 8
  %_nparamscheck = getelementptr inbounds %struct.SQNativeClosure, ptr %5, i32 0, i32 1
  store i64 %4, ptr %_nparamscheck, align 8
  %6 = load ptr, ptr %typemask.addr, align 8
  %tobool = icmp ne ptr %6, null
  br i1 %tobool, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %call3 = call noundef ptr @_ZN8sqvectorIxEC1Ev(ptr noundef nonnull align 8 dereferenceable(24) %res)
  %7 = load ptr, ptr %typemask.addr, align 8
  %call4 = invoke noundef zeroext i1 @_Z15CompileTypemaskR8sqvectorIxEPKc(ptr noundef nonnull align 8 dereferenceable(24) %res, ptr noundef %7)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then2
  br i1 %call4, label %if.end8, label %if.then5

if.then5:                                         ; preds = %invoke.cont
  %8 = load ptr, ptr %v.addr, align 8
  %call7 = invoke i64 @sq_throwerror(ptr noundef %8, ptr noundef @.str.10)
          to label %invoke.cont6 unwind label %lpad

invoke.cont6:                                     ; preds = %if.then5
  store i64 %call7, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %if.end8, %if.then5, %if.then2
  %9 = landingpad { ptr, i32 }
          cleanup
  %10 = extractvalue { ptr, i32 } %9, 0
  store ptr %10, ptr %exn.slot, align 8
  %11 = extractvalue { ptr, i32 } %9, 1
  store i32 %11, ptr %ehselector.slot, align 4
  %call11 = call noundef ptr @_ZN8sqvectorIxED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %res) #10
  br label %eh.resume

if.end8:                                          ; preds = %invoke.cont
  %12 = load ptr, ptr %nc, align 8
  %_typecheck = getelementptr inbounds %struct.SQNativeClosure, ptr %12, i32 0, i32 2
  invoke void @_ZN8sqvectorIxE4copyERKS0_(ptr noundef nonnull align 8 dereferenceable(24) %_typecheck, ptr noundef nonnull align 8 dereferenceable(24) %res)
          to label %invoke.cont9 unwind label %lpad

invoke.cont9:                                     ; preds = %if.end8
  store i32 0, ptr %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %invoke.cont9, %invoke.cont6
  %call10 = call noundef ptr @_ZN8sqvectorIxED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %res) #10
  %cleanup.dest = load i32, ptr %cleanup.dest.slot, align 4
  switch i32 %cleanup.dest, label %unreachable [
    i32 0, label %cleanup.cont
    i32 1, label %return
  ]

cleanup.cont:                                     ; preds = %cleanup
  br label %if.end13

if.else:                                          ; preds = %if.end
  %13 = load ptr, ptr %nc, align 8
  %_typecheck12 = getelementptr inbounds %struct.SQNativeClosure, ptr %13, i32 0, i32 2
  store i64 0, ptr %ref.tmp, align 8
  call void @_ZN8sqvectorIxE6resizeEyRKx(ptr noundef nonnull align 8 dereferenceable(24) %_typecheck12, i64 noundef 0, ptr noundef nonnull align 8 dereferenceable(8) %ref.tmp)
  br label %if.end13

if.end13:                                         ; preds = %if.else, %cleanup.cont
  %14 = load i64, ptr %nparamscheck.addr, align 8
  %cmp14 = icmp eq i64 %14, -99999
  br i1 %cmp14, label %if.then15, label %if.end19

if.then15:                                        ; preds = %if.end13
  %15 = load ptr, ptr %nc, align 8
  %_typecheck16 = getelementptr inbounds %struct.SQNativeClosure, ptr %15, i32 0, i32 2
  %call17 = call noundef i64 @_ZNK8sqvectorIxE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %_typecheck16)
  %16 = load ptr, ptr %nc, align 8
  %_nparamscheck18 = getelementptr inbounds %struct.SQNativeClosure, ptr %16, i32 0, i32 1
  store i64 %call17, ptr %_nparamscheck18, align 8
  br label %if.end19

if.end19:                                         ; preds = %if.then15, %if.end13
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end19, %cleanup, %if.then
  %17 = load i64, ptr %retval, align 8
  ret i64 %17

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val20 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val20

unreachable:                                      ; preds = %cleanup
  unreachable
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorIxEC1Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN8sqvectorIxEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %this1)
  ret ptr %this1
}

declare noundef zeroext i1 @_Z15CompileTypemaskR8sqvectorIxEPKc(ptr noundef nonnull align 8 dereferenceable(24), ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorIxE4copyERKS0_(ptr noundef nonnull align 8 dereferenceable(24) %this, ptr noundef nonnull align 8 dereferenceable(24) %v) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %v.addr = alloca ptr, align 8
  %ref.tmp = alloca i64, align 8
  %i = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %v, ptr %v.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_size = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 1
  %0 = load i64, ptr %_size, align 8
  %tobool = icmp ne i64 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, ptr %ref.tmp, align 8
  call void @_ZN8sqvectorIxE6resizeEyRKx(ptr noundef nonnull align 8 dereferenceable(24) %this1, i64 noundef 0, ptr noundef nonnull align 8 dereferenceable(8) %ref.tmp)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load ptr, ptr %v.addr, align 8
  %_size2 = getelementptr inbounds %class.sqvector.2, ptr %1, i32 0, i32 1
  %2 = load i64, ptr %_size2, align 8
  %_allocated = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 2
  %3 = load i64, ptr %_allocated, align 8
  %cmp = icmp ugt i64 %2, %3
  br i1 %cmp, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %4 = load ptr, ptr %v.addr, align 8
  %_size4 = getelementptr inbounds %class.sqvector.2, ptr %4, i32 0, i32 1
  %5 = load i64, ptr %_size4, align 8
  call void @_ZN8sqvectorIxE8_reallocEy(ptr noundef nonnull align 8 dereferenceable(24) %this1, i64 noundef %5)
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  store i64 0, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end5
  %6 = load i64, ptr %i, align 8
  %7 = load ptr, ptr %v.addr, align 8
  %_size6 = getelementptr inbounds %class.sqvector.2, ptr %7, i32 0, i32 1
  %8 = load i64, ptr %_size6, align 8
  %cmp7 = icmp ult i64 %6, %8
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %_vals = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 0
  %9 = load ptr, ptr %_vals, align 8
  %10 = load i64, ptr %i, align 8
  %arrayidx = getelementptr inbounds i64, ptr %9, i64 %10
  %11 = load ptr, ptr %v.addr, align 8
  %_vals8 = getelementptr inbounds %class.sqvector.2, ptr %11, i32 0, i32 0
  %12 = load ptr, ptr %_vals8, align 8
  %13 = load i64, ptr %i, align 8
  %arrayidx9 = getelementptr inbounds i64, ptr %12, i64 %13
  %14 = load i64, ptr %arrayidx9, align 8
  store i64 %14, ptr %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %15 = load i64, ptr %i, align 8
  %inc = add i64 %15, 1
  store i64 %inc, ptr %i, align 8
  br label %for.cond, !llvm.loop !12

for.end:                                          ; preds = %for.cond
  %16 = load ptr, ptr %v.addr, align 8
  %_size10 = getelementptr inbounds %class.sqvector.2, ptr %16, i32 0, i32 1
  %17 = load i64, ptr %_size10, align 8
  %_size11 = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 1
  store i64 %17, ptr %_size11, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorIxED1Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN8sqvectorIxED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %this1) #10
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorIxE6resizeEyRKx(ptr noundef nonnull align 8 dereferenceable(24) %this, i64 noundef %newsize, ptr noundef nonnull align 8 dereferenceable(8) %fill) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %newsize.addr = alloca i64, align 8
  %fill.addr = alloca ptr, align 8
  %i = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  store i64 %newsize, ptr %newsize.addr, align 8
  store ptr %fill, ptr %fill.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load i64, ptr %newsize.addr, align 8
  %_allocated = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 2
  %1 = load i64, ptr %_allocated, align 8
  %cmp = icmp ugt i64 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i64, ptr %newsize.addr, align 8
  call void @_ZN8sqvectorIxE8_reallocEy(ptr noundef nonnull align 8 dereferenceable(24) %this1, i64 noundef %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i64, ptr %newsize.addr, align 8
  %_size = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 1
  %4 = load i64, ptr %_size, align 8
  %cmp2 = icmp ugt i64 %3, %4
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then3
  %_size4 = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 1
  %5 = load i64, ptr %_size4, align 8
  %6 = load i64, ptr %newsize.addr, align 8
  %cmp5 = icmp ult i64 %5, %6
  br i1 %cmp5, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %_vals = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 0
  %7 = load ptr, ptr %_vals, align 8
  %_size6 = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 1
  %8 = load i64, ptr %_size6, align 8
  %arrayidx = getelementptr inbounds i64, ptr %7, i64 %8
  %9 = load ptr, ptr %fill.addr, align 8
  %10 = load i64, ptr %9, align 8
  store i64 %10, ptr %arrayidx, align 8
  %_size7 = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 1
  %11 = load i64, ptr %_size7, align 8
  %inc = add i64 %11, 1
  store i64 %inc, ptr %_size7, align 8
  br label %while.cond, !llvm.loop !13

while.end:                                        ; preds = %while.cond
  br label %if.end14

if.else:                                          ; preds = %if.end
  %12 = load i64, ptr %newsize.addr, align 8
  store i64 %12, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.else
  %13 = load i64, ptr %i, align 8
  %_size8 = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 1
  %14 = load i64, ptr %_size8, align 8
  %cmp9 = icmp ult i64 %13, %14
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %_vals10 = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 0
  %15 = load ptr, ptr %_vals10, align 8
  %16 = load i64, ptr %i, align 8
  %arrayidx11 = getelementptr inbounds i64, ptr %15, i64 %16
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i64, ptr %i, align 8
  %inc12 = add i64 %17, 1
  store i64 %inc12, ptr %i, align 8
  br label %for.cond, !llvm.loop !14

for.end:                                          ; preds = %for.cond
  %18 = load i64, ptr %newsize.addr, align 8
  %_size13 = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 1
  store i64 %18, ptr %_size13, align 8
  br label %if.end14

if.end14:                                         ; preds = %for.end, %while.end
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNK8sqvectorIxE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %this) #4 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_size = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 1
  %0 = load i64, ptr %_size, align 8
  ret i64 %0
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_bindenv(ptr noundef %v, i64 noundef %idx) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  %env = alloca ptr, align 8
  %w = alloca ptr, align 8
  %ret = alloca %struct.SQObjectPtr, align 8
  %c = alloca ptr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %c53 = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %3, 134218240
  br i1 %cmp, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %_type1 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %5 = load i32, ptr %_type1, align 8
  %cmp2 = icmp eq i32 %5, 134217984
  br i1 %cmp2, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %6 = load ptr, ptr %v.addr, align 8
  %call3 = call i64 @sq_throwerror(ptr noundef %6, ptr noundef @.str.11)
  store i64 %call3, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %7 = load ptr, ptr %v.addr, align 8
  %call4 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %7, i64 noundef -1)
  store ptr %call4, ptr %env, align 8
  %8 = load ptr, ptr %env, align 8
  %_type5 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 0
  %9 = load i32, ptr %_type5, align 8
  %cmp6 = icmp eq i32 %9, 167772192
  br i1 %cmp6, label %if.end18, label %land.lhs.true7

land.lhs.true7:                                   ; preds = %if.end
  %10 = load ptr, ptr %env, align 8
  %_type8 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 0
  %11 = load i32, ptr %_type8, align 8
  %cmp9 = icmp eq i32 %11, 134217792
  br i1 %cmp9, label %if.end18, label %land.lhs.true10

land.lhs.true10:                                  ; preds = %land.lhs.true7
  %12 = load ptr, ptr %env, align 8
  %_type11 = getelementptr inbounds %struct.tagSQObject, ptr %12, i32 0, i32 0
  %13 = load i32, ptr %_type11, align 8
  %cmp12 = icmp eq i32 %13, 134234112
  br i1 %cmp12, label %if.end18, label %land.lhs.true13

land.lhs.true13:                                  ; preds = %land.lhs.true10
  %14 = load ptr, ptr %env, align 8
  %_type14 = getelementptr inbounds %struct.tagSQObject, ptr %14, i32 0, i32 0
  %15 = load i32, ptr %_type14, align 8
  %cmp15 = icmp eq i32 %15, 167804928
  br i1 %cmp15, label %if.end18, label %if.then16

if.then16:                                        ; preds = %land.lhs.true13
  %16 = load ptr, ptr %v.addr, align 8
  %call17 = call i64 @sq_throwerror(ptr noundef %16, ptr noundef @.str.12)
  store i64 %call17, ptr %retval, align 8
  br label %return

if.end18:                                         ; preds = %land.lhs.true13, %land.lhs.true10, %land.lhs.true7, %if.end
  %17 = load ptr, ptr %env, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %17, i32 0, i32 1
  %18 = load ptr, ptr %_unVal, align 8
  %19 = load ptr, ptr %env, align 8
  %_type19 = getelementptr inbounds %struct.tagSQObject, ptr %19, i32 0, i32 0
  %20 = load i32, ptr %_type19, align 8
  %call20 = call noundef ptr @_ZN12SQRefCounted10GetWeakRefE15tagSQObjectType(ptr noundef nonnull align 8 dereferenceable(24) %18, i32 noundef %20)
  store ptr %call20, ptr %w, align 8
  %call21 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ret)
  %21 = load ptr, ptr %o, align 8
  %_type22 = getelementptr inbounds %struct.tagSQObject, ptr %21, i32 0, i32 0
  %22 = load i32, ptr %_type22, align 8
  %cmp23 = icmp eq i32 %22, 134217984
  br i1 %cmp23, label %if.then24, label %if.else

if.then24:                                        ; preds = %if.end18
  %23 = load ptr, ptr %o, align 8
  %_unVal25 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 1
  %24 = load ptr, ptr %_unVal25, align 8
  %call26 = invoke noundef ptr @_ZN9SQClosure5CloneEv(ptr noundef nonnull align 8 dereferenceable(96) %24)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then24
  store ptr %call26, ptr %c, align 8
  %25 = load ptr, ptr %c, align 8
  %_env = getelementptr inbounds %struct.SQClosure, ptr %25, i32 0, i32 1
  %26 = load ptr, ptr %_env, align 8
  %tobool = icmp ne ptr %26, null
  br i1 %tobool, label %if.then27, label %if.end37

if.then27:                                        ; preds = %invoke.cont
  %27 = load ptr, ptr %c, align 8
  %_env28 = getelementptr inbounds %struct.SQClosure, ptr %27, i32 0, i32 1
  %28 = load ptr, ptr %_env28, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %28, i32 0, i32 1
  %29 = load i64, ptr %_uiRef, align 8
  %dec = add i64 %29, -1
  store i64 %dec, ptr %_uiRef, align 8
  %30 = load ptr, ptr %c, align 8
  %_env29 = getelementptr inbounds %struct.SQClosure, ptr %30, i32 0, i32 1
  %31 = load ptr, ptr %_env29, align 8
  %_uiRef30 = getelementptr inbounds %struct.SQRefCounted, ptr %31, i32 0, i32 1
  %32 = load i64, ptr %_uiRef30, align 8
  %cmp31 = icmp eq i64 %32, 0
  br i1 %cmp31, label %if.then32, label %if.end35

if.then32:                                        ; preds = %if.then27
  %33 = load ptr, ptr %c, align 8
  %_env33 = getelementptr inbounds %struct.SQClosure, ptr %33, i32 0, i32 1
  %34 = load ptr, ptr %_env33, align 8
  %vtable = load ptr, ptr %34, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 2
  %35 = load ptr, ptr %vfn, align 8
  invoke void %35(ptr noundef nonnull align 8 dereferenceable(40) %34)
          to label %invoke.cont34 unwind label %lpad

invoke.cont34:                                    ; preds = %if.then32
  br label %if.end35

lpad:                                             ; preds = %invoke.cont81, %if.end80, %if.end73, %if.then66, %if.else, %if.end50, %if.then32, %if.then24
  %36 = landingpad { ptr, i32 }
          cleanup
  %37 = extractvalue { ptr, i32 } %36, 0
  store ptr %37, ptr %exn.slot, align 8
  %38 = extractvalue { ptr, i32 } %36, 1
  store i32 %38, ptr %ehselector.slot, align 4
  %call84 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ret) #10
  br label %eh.resume

if.end35:                                         ; preds = %invoke.cont34, %if.then27
  %39 = load ptr, ptr %c, align 8
  %_env36 = getelementptr inbounds %struct.SQClosure, ptr %39, i32 0, i32 1
  store ptr null, ptr %_env36, align 8
  br label %if.end37

if.end37:                                         ; preds = %if.end35, %invoke.cont
  %40 = load ptr, ptr %w, align 8
  %41 = load ptr, ptr %c, align 8
  %_env38 = getelementptr inbounds %struct.SQClosure, ptr %41, i32 0, i32 1
  store ptr %40, ptr %_env38, align 8
  %42 = load ptr, ptr %c, align 8
  %_env39 = getelementptr inbounds %struct.SQClosure, ptr %42, i32 0, i32 1
  %43 = load ptr, ptr %_env39, align 8
  %_uiRef40 = getelementptr inbounds %struct.SQRefCounted, ptr %43, i32 0, i32 1
  %44 = load i64, ptr %_uiRef40, align 8
  %inc = add i64 %44, 1
  store i64 %inc, ptr %_uiRef40, align 8
  %45 = load ptr, ptr %o, align 8
  %_unVal41 = getelementptr inbounds %struct.tagSQObject, ptr %45, i32 0, i32 1
  %46 = load ptr, ptr %_unVal41, align 8
  %_base = getelementptr inbounds %struct.SQClosure, ptr %46, i32 0, i32 3
  %47 = load ptr, ptr %_base, align 8
  %tobool42 = icmp ne ptr %47, null
  br i1 %tobool42, label %if.then43, label %if.end50

if.then43:                                        ; preds = %if.end37
  %48 = load ptr, ptr %o, align 8
  %_unVal44 = getelementptr inbounds %struct.tagSQObject, ptr %48, i32 0, i32 1
  %49 = load ptr, ptr %_unVal44, align 8
  %_base45 = getelementptr inbounds %struct.SQClosure, ptr %49, i32 0, i32 3
  %50 = load ptr, ptr %_base45, align 8
  %51 = load ptr, ptr %c, align 8
  %_base46 = getelementptr inbounds %struct.SQClosure, ptr %51, i32 0, i32 3
  store ptr %50, ptr %_base46, align 8
  %52 = load ptr, ptr %c, align 8
  %_base47 = getelementptr inbounds %struct.SQClosure, ptr %52, i32 0, i32 3
  %53 = load ptr, ptr %_base47, align 8
  %_uiRef48 = getelementptr inbounds %struct.SQRefCounted, ptr %53, i32 0, i32 1
  %54 = load i64, ptr %_uiRef48, align 8
  %inc49 = add i64 %54, 1
  store i64 %inc49, ptr %_uiRef48, align 8
  br label %if.end50

if.end50:                                         ; preds = %if.then43, %if.end37
  %55 = load ptr, ptr %c, align 8
  %call52 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP9SQClosure(ptr noundef nonnull align 8 dereferenceable(16) %ret, ptr noundef %55)
          to label %invoke.cont51 unwind label %lpad

invoke.cont51:                                    ; preds = %if.end50
  br label %if.end80

if.else:                                          ; preds = %if.end18
  %56 = load ptr, ptr %o, align 8
  %_unVal54 = getelementptr inbounds %struct.tagSQObject, ptr %56, i32 0, i32 1
  %57 = load ptr, ptr %_unVal54, align 8
  %call56 = invoke noundef ptr @_ZN15SQNativeClosure5CloneEv(ptr noundef nonnull align 8 dereferenceable(128) %57)
          to label %invoke.cont55 unwind label %lpad

invoke.cont55:                                    ; preds = %if.else
  store ptr %call56, ptr %c53, align 8
  %58 = load ptr, ptr %c53, align 8
  %_env57 = getelementptr inbounds %struct.SQNativeClosure, ptr %58, i32 0, i32 5
  %59 = load ptr, ptr %_env57, align 8
  %tobool58 = icmp ne ptr %59, null
  br i1 %tobool58, label %if.then59, label %if.end73

if.then59:                                        ; preds = %invoke.cont55
  %60 = load ptr, ptr %c53, align 8
  %_env60 = getelementptr inbounds %struct.SQNativeClosure, ptr %60, i32 0, i32 5
  %61 = load ptr, ptr %_env60, align 8
  %_uiRef61 = getelementptr inbounds %struct.SQRefCounted, ptr %61, i32 0, i32 1
  %62 = load i64, ptr %_uiRef61, align 8
  %dec62 = add i64 %62, -1
  store i64 %dec62, ptr %_uiRef61, align 8
  %63 = load ptr, ptr %c53, align 8
  %_env63 = getelementptr inbounds %struct.SQNativeClosure, ptr %63, i32 0, i32 5
  %64 = load ptr, ptr %_env63, align 8
  %_uiRef64 = getelementptr inbounds %struct.SQRefCounted, ptr %64, i32 0, i32 1
  %65 = load i64, ptr %_uiRef64, align 8
  %cmp65 = icmp eq i64 %65, 0
  br i1 %cmp65, label %if.then66, label %if.end71

if.then66:                                        ; preds = %if.then59
  %66 = load ptr, ptr %c53, align 8
  %_env67 = getelementptr inbounds %struct.SQNativeClosure, ptr %66, i32 0, i32 5
  %67 = load ptr, ptr %_env67, align 8
  %vtable68 = load ptr, ptr %67, align 8
  %vfn69 = getelementptr inbounds ptr, ptr %vtable68, i64 2
  %68 = load ptr, ptr %vfn69, align 8
  invoke void %68(ptr noundef nonnull align 8 dereferenceable(40) %67)
          to label %invoke.cont70 unwind label %lpad

invoke.cont70:                                    ; preds = %if.then66
  br label %if.end71

if.end71:                                         ; preds = %invoke.cont70, %if.then59
  %69 = load ptr, ptr %c53, align 8
  %_env72 = getelementptr inbounds %struct.SQNativeClosure, ptr %69, i32 0, i32 5
  store ptr null, ptr %_env72, align 8
  br label %if.end73

if.end73:                                         ; preds = %if.end71, %invoke.cont55
  %70 = load ptr, ptr %w, align 8
  %71 = load ptr, ptr %c53, align 8
  %_env74 = getelementptr inbounds %struct.SQNativeClosure, ptr %71, i32 0, i32 5
  store ptr %70, ptr %_env74, align 8
  %72 = load ptr, ptr %c53, align 8
  %_env75 = getelementptr inbounds %struct.SQNativeClosure, ptr %72, i32 0, i32 5
  %73 = load ptr, ptr %_env75, align 8
  %_uiRef76 = getelementptr inbounds %struct.SQRefCounted, ptr %73, i32 0, i32 1
  %74 = load i64, ptr %_uiRef76, align 8
  %inc77 = add i64 %74, 1
  store i64 %inc77, ptr %_uiRef76, align 8
  %75 = load ptr, ptr %c53, align 8
  %call79 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP15SQNativeClosure(ptr noundef nonnull align 8 dereferenceable(16) %ret, ptr noundef %75)
          to label %invoke.cont78 unwind label %lpad

invoke.cont78:                                    ; preds = %if.end73
  br label %if.end80

if.end80:                                         ; preds = %invoke.cont78, %invoke.cont51
  %76 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %76)
          to label %invoke.cont81 unwind label %lpad

invoke.cont81:                                    ; preds = %if.end80
  %77 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %77, ptr noundef nonnull align 8 dereferenceable(16) %ret)
          to label %invoke.cont82 unwind label %lpad

invoke.cont82:                                    ; preds = %invoke.cont81
  store i64 0, ptr %retval, align 8
  %call83 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ret) #10
  br label %return

return:                                           ; preds = %invoke.cont82, %if.then16, %if.then
  %78 = load i64, ptr %retval, align 8
  ret i64 %78

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val85 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val85
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN9SQClosure5CloneEv(ptr noundef nonnull align 8 dereferenceable(96) %this) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %f = alloca ptr, align 8
  %ret = alloca ptr, align 8
  %_n_ = alloca i64, align 8
  %_n_9 = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_function = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 4
  %0 = load ptr, ptr %_function, align 8
  store ptr %0, ptr %f, align 8
  %_sharedstate = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 3
  %1 = load ptr, ptr %_sharedstate, align 8
  %2 = load ptr, ptr %f, align 8
  %_root = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 2
  %3 = load ptr, ptr %_root, align 8
  %call = call noundef ptr @_ZN9SQClosure6CreateEP13SQSharedStateP15SQFunctionProtoP9SQWeakRef(ptr noundef %1, ptr noundef %2, ptr noundef %3)
  store ptr %call, ptr %ret, align 8
  %_env = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 1
  %4 = load ptr, ptr %_env, align 8
  %5 = load ptr, ptr %ret, align 8
  %_env2 = getelementptr inbounds %struct.SQClosure, ptr %5, i32 0, i32 1
  store ptr %4, ptr %_env2, align 8
  %6 = load ptr, ptr %ret, align 8
  %_env3 = getelementptr inbounds %struct.SQClosure, ptr %6, i32 0, i32 1
  %7 = load ptr, ptr %_env3, align 8
  %tobool = icmp ne ptr %7, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %8 = load ptr, ptr %ret, align 8
  %_env4 = getelementptr inbounds %struct.SQClosure, ptr %8, i32 0, i32 1
  %9 = load ptr, ptr %_env4, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %9, i32 0, i32 1
  %10 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %10, 1
  store i64 %inc, ptr %_uiRef, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i64 0, ptr %_n_, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load i64, ptr %_n_, align 8
  %12 = load ptr, ptr %f, align 8
  %_noutervalues = getelementptr inbounds %struct.SQFunctionProto, ptr %12, i32 0, i32 16
  %13 = load i64, ptr %_noutervalues, align 8
  %cmp = icmp slt i64 %11, %13
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %_outervalues = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 5
  %14 = load ptr, ptr %_outervalues, align 8
  %15 = load i64, ptr %_n_, align 8
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %14, i64 %15
  %16 = load ptr, ptr %ret, align 8
  %_outervalues5 = getelementptr inbounds %struct.SQClosure, ptr %16, i32 0, i32 5
  %17 = load ptr, ptr %_outervalues5, align 8
  %18 = load i64, ptr %_n_, align 8
  %arrayidx6 = getelementptr inbounds %struct.SQObjectPtr, ptr %17, i64 %18
  %call7 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx6, ptr noundef nonnull align 8 dereferenceable(16) %arrayidx)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i64, ptr %_n_, align 8
  %inc8 = add nsw i64 %19, 1
  store i64 %inc8, ptr %_n_, align 8
  br label %for.cond, !llvm.loop !15

for.end:                                          ; preds = %for.cond
  store i64 0, ptr %_n_9, align 8
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc17, %for.end
  %20 = load i64, ptr %_n_9, align 8
  %21 = load ptr, ptr %f, align 8
  %_ndefaultparams = getelementptr inbounds %struct.SQFunctionProto, ptr %21, i32 0, i32 18
  %22 = load i64, ptr %_ndefaultparams, align 8
  %cmp11 = icmp slt i64 %20, %22
  br i1 %cmp11, label %for.body12, label %for.end19

for.body12:                                       ; preds = %for.cond10
  %_defaultparams = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 6
  %23 = load ptr, ptr %_defaultparams, align 8
  %24 = load i64, ptr %_n_9, align 8
  %arrayidx13 = getelementptr inbounds %struct.SQObjectPtr, ptr %23, i64 %24
  %25 = load ptr, ptr %ret, align 8
  %_defaultparams14 = getelementptr inbounds %struct.SQClosure, ptr %25, i32 0, i32 6
  %26 = load ptr, ptr %_defaultparams14, align 8
  %27 = load i64, ptr %_n_9, align 8
  %arrayidx15 = getelementptr inbounds %struct.SQObjectPtr, ptr %26, i64 %27
  %call16 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx15, ptr noundef nonnull align 8 dereferenceable(16) %arrayidx13)
  br label %for.inc17

for.inc17:                                        ; preds = %for.body12
  %28 = load i64, ptr %_n_9, align 8
  %inc18 = add nsw i64 %28, 1
  store i64 %inc18, ptr %_n_9, align 8
  br label %for.cond10, !llvm.loop !16

for.end19:                                        ; preds = %for.cond10
  %29 = load ptr, ptr %ret, align 8
  ret ptr %29
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP9SQClosure(ptr noundef nonnull align 8 dereferenceable(16) %this, ptr noundef %x) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  %tOldType = alloca i32, align 4
  %unOldVal = alloca %union.tagSQObjectValue, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  %0 = load i32, ptr %_type, align 8
  store i32 %0, ptr %tOldType, align 4
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %unOldVal, ptr align 8 %_unVal, i64 8, i1 false)
  %_type2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 134217984, ptr %_type2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal3, align 8
  %1 = load ptr, ptr %x.addr, align 8
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %1, ptr %_unVal4, align 8
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %2 = load ptr, ptr %_unVal5, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %2, i32 0, i32 1
  %3 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %3, 1
  store i64 %inc, ptr %_uiRef, align 8
  %4 = load i32, ptr %tOldType, align 4
  %and = and i32 %4, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load ptr, ptr %unOldVal, align 8
  %_uiRef6 = getelementptr inbounds %struct.SQRefCounted, ptr %5, i32 0, i32 1
  %6 = load i64, ptr %_uiRef6, align 8
  %dec = add i64 %6, -1
  store i64 %dec, ptr %_uiRef6, align 8
  %cmp = icmp eq i64 %dec, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %7 = load ptr, ptr %unOldVal, align 8
  %vtable = load ptr, ptr %7, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 2
  %8 = load ptr, ptr %vfn, align 8
  call void %8(ptr noundef nonnull align 8 dereferenceable(24) %7)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN15SQNativeClosure5CloneEv(ptr noundef nonnull align 8 dereferenceable(128) %this) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %ret = alloca ptr, align 8
  %_n_ = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 3
  %0 = load ptr, ptr %_sharedstate, align 8
  %_function = getelementptr inbounds %struct.SQNativeClosure, ptr %this1, i32 0, i32 6
  %1 = load ptr, ptr %_function, align 8
  %_noutervalues = getelementptr inbounds %struct.SQNativeClosure, ptr %this1, i32 0, i32 4
  %2 = load i64, ptr %_noutervalues, align 8
  %call = call noundef ptr @_ZN15SQNativeClosure6CreateEP13SQSharedStatePFxP4SQVMEx(ptr noundef %0, ptr noundef %1, i64 noundef %2)
  store ptr %call, ptr %ret, align 8
  %_env = getelementptr inbounds %struct.SQNativeClosure, ptr %this1, i32 0, i32 5
  %3 = load ptr, ptr %_env, align 8
  %4 = load ptr, ptr %ret, align 8
  %_env2 = getelementptr inbounds %struct.SQNativeClosure, ptr %4, i32 0, i32 5
  store ptr %3, ptr %_env2, align 8
  %5 = load ptr, ptr %ret, align 8
  %_env3 = getelementptr inbounds %struct.SQNativeClosure, ptr %5, i32 0, i32 5
  %6 = load ptr, ptr %_env3, align 8
  %tobool = icmp ne ptr %6, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load ptr, ptr %ret, align 8
  %_env4 = getelementptr inbounds %struct.SQNativeClosure, ptr %7, i32 0, i32 5
  %8 = load ptr, ptr %_env4, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %8, i32 0, i32 1
  %9 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %9, 1
  store i64 %inc, ptr %_uiRef, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %_name = getelementptr inbounds %struct.SQNativeClosure, ptr %this1, i32 0, i32 7
  %10 = load ptr, ptr %ret, align 8
  %_name5 = getelementptr inbounds %struct.SQNativeClosure, ptr %10, i32 0, i32 7
  %call6 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %_name5, ptr noundef nonnull align 8 dereferenceable(16) %_name)
  store i64 0, ptr %_n_, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load i64, ptr %_n_, align 8
  %_noutervalues7 = getelementptr inbounds %struct.SQNativeClosure, ptr %this1, i32 0, i32 4
  %12 = load i64, ptr %_noutervalues7, align 8
  %cmp = icmp slt i64 %11, %12
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %_outervalues = getelementptr inbounds %struct.SQNativeClosure, ptr %this1, i32 0, i32 3
  %13 = load ptr, ptr %_outervalues, align 8
  %14 = load i64, ptr %_n_, align 8
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %13, i64 %14
  %15 = load ptr, ptr %ret, align 8
  %_outervalues8 = getelementptr inbounds %struct.SQNativeClosure, ptr %15, i32 0, i32 3
  %16 = load ptr, ptr %_outervalues8, align 8
  %17 = load i64, ptr %_n_, align 8
  %arrayidx9 = getelementptr inbounds %struct.SQObjectPtr, ptr %16, i64 %17
  %call10 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx9, ptr noundef nonnull align 8 dereferenceable(16) %arrayidx)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i64, ptr %_n_, align 8
  %inc11 = add nsw i64 %18, 1
  store i64 %inc11, ptr %_n_, align 8
  br label %for.cond, !llvm.loop !17

for.end:                                          ; preds = %for.cond
  %19 = load ptr, ptr %ret, align 8
  %_typecheck = getelementptr inbounds %struct.SQNativeClosure, ptr %19, i32 0, i32 2
  %_typecheck12 = getelementptr inbounds %struct.SQNativeClosure, ptr %this1, i32 0, i32 2
  call void @_ZN8sqvectorIxE4copyERKS0_(ptr noundef nonnull align 8 dereferenceable(24) %_typecheck, ptr noundef nonnull align 8 dereferenceable(24) %_typecheck12)
  %_nparamscheck = getelementptr inbounds %struct.SQNativeClosure, ptr %this1, i32 0, i32 1
  %20 = load i64, ptr %_nparamscheck, align 8
  %21 = load ptr, ptr %ret, align 8
  %_nparamscheck13 = getelementptr inbounds %struct.SQNativeClosure, ptr %21, i32 0, i32 1
  store i64 %20, ptr %_nparamscheck13, align 8
  %22 = load ptr, ptr %ret, align 8
  ret ptr %22
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSEP15SQNativeClosure(ptr noundef nonnull align 8 dereferenceable(16) %this, ptr noundef %x) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  %tOldType = alloca i32, align 4
  %unOldVal = alloca %union.tagSQObjectValue, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  %0 = load i32, ptr %_type, align 8
  store i32 %0, ptr %tOldType, align 4
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %unOldVal, ptr align 8 %_unVal, i64 8, i1 false)
  %_type2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 134218240, ptr %_type2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal3, align 8
  %1 = load ptr, ptr %x.addr, align 8
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %1, ptr %_unVal4, align 8
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %2 = load ptr, ptr %_unVal5, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %2, i32 0, i32 1
  %3 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %3, 1
  store i64 %inc, ptr %_uiRef, align 8
  %4 = load i32, ptr %tOldType, align 4
  %and = and i32 %4, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load ptr, ptr %unOldVal, align 8
  %_uiRef6 = getelementptr inbounds %struct.SQRefCounted, ptr %5, i32 0, i32 1
  %6 = load i64, ptr %_uiRef6, align 8
  %dec = add i64 %6, -1
  store i64 %dec, ptr %_uiRef6, align 8
  %cmp = icmp eq i64 %dec, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %7 = load ptr, ptr %unOldVal, align 8
  %vtable = load ptr, ptr %7, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 2
  %8 = load ptr, ptr %vfn, align 8
  call void %8(ptr noundef nonnull align 8 dereferenceable(24) %7)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getclosurename(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %3, 134218240
  br i1 %cmp, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %_type1 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %5 = load i32, ptr %_type1, align 8
  %cmp2 = icmp eq i32 %5, 134217984
  br i1 %cmp2, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %6 = load ptr, ptr %v.addr, align 8
  %call3 = call i64 @sq_throwerror(ptr noundef %6, ptr noundef @.str.11)
  store i64 %call3, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %7 = load ptr, ptr %o, align 8
  %_type4 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %8 = load i32, ptr %_type4, align 8
  %cmp5 = icmp eq i32 %8, 134218240
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.end
  %9 = load ptr, ptr %v.addr, align 8
  %10 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 1
  %11 = load ptr, ptr %_unVal, align 8
  %_name = getelementptr inbounds %struct.SQNativeClosure, ptr %11, i32 0, i32 7
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %9, ptr noundef nonnull align 8 dereferenceable(16) %_name)
  br label %if.end9

if.else:                                          ; preds = %if.end
  %12 = load ptr, ptr %v.addr, align 8
  %13 = load ptr, ptr %o, align 8
  %_unVal7 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 1
  %14 = load ptr, ptr %_unVal7, align 8
  %_function = getelementptr inbounds %struct.SQClosure, ptr %14, i32 0, i32 4
  %15 = load ptr, ptr %_function, align 8
  %_name8 = getelementptr inbounds %struct.SQFunctionProto, ptr %15, i32 0, i32 2
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %12, ptr noundef nonnull align 8 dereferenceable(16) %_name8)
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.then6
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end9, %if.then
  %16 = load i64, ptr %retval, align 8
  ret i64 %16
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setclosureroot(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %c = alloca ptr, align 8
  %o = alloca %struct.tagSQObject, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %c, align 8
  %2 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %2, i64 noundef -1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %o, ptr align 8 %call1, i64 16, i1 false)
  %3 = load ptr, ptr %c, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 0
  %4 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %4, 134217984
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %5 = load ptr, ptr %v.addr, align 8
  %call2 = call i64 @sq_throwerror(ptr noundef %5, ptr noundef @.str.13)
  store i64 %call2, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %_type3 = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %6 = load i32, ptr %_type3, align 8
  %cmp4 = icmp eq i32 %6, 167772192
  br i1 %cmp4, label %if.then5, label %if.end8

if.then5:                                         ; preds = %if.end
  %7 = load ptr, ptr %c, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  %8 = load ptr, ptr %_unVal, align 8
  %_unVal6 = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 1
  %9 = load ptr, ptr %_unVal6, align 8
  %call7 = call noundef ptr @_ZN12SQRefCounted10GetWeakRefE15tagSQObjectType(ptr noundef nonnull align 8 dereferenceable(24) %9, i32 noundef 167772192)
  call void @_ZN9SQClosure7SetRootEP9SQWeakRef(ptr noundef nonnull align 8 dereferenceable(96) %8, ptr noundef %call7)
  %10 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %10)
  store i64 0, ptr %retval, align 8
  br label %return

if.end8:                                          ; preds = %if.end
  %11 = load ptr, ptr %v.addr, align 8
  %call9 = call i64 @sq_throwerror(ptr noundef %11, ptr noundef @.str.14)
  store i64 %call9, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end8, %if.then5, %if.then
  %12 = load i64, ptr %retval, align 8
  ret i64 %12
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN9SQClosure7SetRootEP9SQWeakRef(ptr noundef nonnull align 8 dereferenceable(96) %this, ptr noundef %r) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %r.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %r, ptr %r.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_root = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 2
  %0 = load ptr, ptr %_root, align 8
  %tobool = icmp ne ptr %0, null
  br i1 %tobool, label %if.then, label %if.end8

if.then:                                          ; preds = %entry
  %_root2 = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 2
  %1 = load ptr, ptr %_root2, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %1, i32 0, i32 1
  %2 = load i64, ptr %_uiRef, align 8
  %dec = add i64 %2, -1
  store i64 %dec, ptr %_uiRef, align 8
  %_root3 = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 2
  %3 = load ptr, ptr %_root3, align 8
  %_uiRef4 = getelementptr inbounds %struct.SQRefCounted, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %_uiRef4, align 8
  %cmp = icmp eq i64 %4, 0
  br i1 %cmp, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  %_root6 = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 2
  %5 = load ptr, ptr %_root6, align 8
  %vtable = load ptr, ptr %5, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 2
  %6 = load ptr, ptr %vfn, align 8
  call void %6(ptr noundef nonnull align 8 dereferenceable(40) %5)
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then
  %_root7 = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 2
  store ptr null, ptr %_root7, align 8
  br label %if.end8

if.end8:                                          ; preds = %if.end, %entry
  %7 = load ptr, ptr %r.addr, align 8
  %_root9 = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 2
  store ptr %7, ptr %_root9, align 8
  %_root10 = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 2
  %8 = load ptr, ptr %_root10, align 8
  %_uiRef11 = getelementptr inbounds %struct.SQRefCounted, ptr %8, i32 0, i32 1
  %9 = load i64, ptr %_uiRef11, align 8
  %inc = add i64 %9, 1
  store i64 %inc, ptr %_uiRef11, align 8
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getclosureroot(ptr noundef %v, i64 noundef %idx) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %c = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %c, align 8
  %2 = load ptr, ptr %c, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %3, 134217984
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %v.addr, align 8
  %call1 = call i64 @sq_throwerror(ptr noundef %4, ptr noundef @.str.13)
  store i64 %call1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %v.addr, align 8
  %6 = load ptr, ptr %c, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %7 = load ptr, ptr %_unVal, align 8
  %_root = getelementptr inbounds %struct.SQClosure, ptr %7, i32 0, i32 2
  %8 = load ptr, ptr %_root, align 8
  %_obj = getelementptr inbounds %struct.SQWeakRef, ptr %8, i32 0, i32 1
  %call2 = call noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef nonnull align 8 dereferenceable(16) %_obj)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %5, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.end
  %call3 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  store i64 0, ptr %retval, align 8
  br label %return

lpad:                                             ; preds = %if.end
  %9 = landingpad { ptr, i32 }
          cleanup
  %10 = extractvalue { ptr, i32 } %9, 0
  store ptr %10, ptr %exn.slot, align 8
  %11 = extractvalue { ptr, i32 } %9, 1
  store i32 %11, ptr %ehselector.slot, align 4
  %call4 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

return:                                           ; preds = %invoke.cont, %if.then
  %12 = load i64, ptr %retval, align 8
  ret i64 %12

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val5 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val5
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef nonnull align 8 dereferenceable(16) %o) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %o.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %o, ptr %o.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %o.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %this1, ptr noundef nonnull align 8 dereferenceable(16) %0)
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_clear(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  switch i32 %3, label %sw.default [
    i32 167772192, label %sw.bb
    i32 134217792, label %sw.bb1
  ]

sw.bb:                                            ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %5 = load ptr, ptr %_unVal, align 8
  call void @_ZN7SQTable5ClearEv(ptr noundef nonnull align 8 dereferenceable(88) %5)
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %6 = load ptr, ptr %o, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %7 = load ptr, ptr %_unVal2, align 8
  call void @_ZN7SQArray6ResizeEx(ptr noundef nonnull align 8 dereferenceable(72) %7, i64 noundef 0)
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %8 = load ptr, ptr %v.addr, align 8
  %call3 = call i64 @sq_throwerror(ptr noundef %8, ptr noundef @.str.15)
  store i64 %call3, ptr %retval, align 8
  br label %return

sw.epilog:                                        ; preds = %sw.bb1, %sw.bb
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.epilog, %sw.default
  %9 = load i64, ptr %retval, align 8
  ret i64 %9
}

declare void @_ZN7SQTable5ClearEv(ptr noundef nonnull align 8 dereferenceable(88)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushroottable(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %_roottable = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 5
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %_roottable)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushregistrytable(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 19
  %2 = load ptr, ptr %_sharedstate, align 8
  %_registry = getelementptr inbounds %struct.SQSharedState, ptr %2, i32 0, i32 6
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %_registry)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushconsttable(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 19
  %2 = load ptr, ptr %_sharedstate, align 8
  %_consts = getelementptr inbounds %struct.SQSharedState, ptr %2, i32 0, i32 7
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %_consts)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setroottable(ptr noundef %v) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %o = alloca %struct.tagSQObject, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef -1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %o, ptr align 8 %call, i64 16, i1 false)
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %1, 167772192
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %_type1 = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %2 = load i32, ptr %_type1, align 8
  %cmp2 = icmp eq i32 %2, 16777217
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load ptr, ptr %v.addr, align 8
  %_roottable = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 5
  %call3 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %_roottable, ptr noundef nonnull align 8 dereferenceable(16) %o)
  %4 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %4)
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %5 = load ptr, ptr %v.addr, align 8
  %call4 = call i64 @sq_throwerror(ptr noundef %5, ptr noundef @.str.14)
  store i64 %call4, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i64, ptr %retval, align 8
  ret i64 %6
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setconsttable(ptr noundef %v) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %o = alloca %struct.tagSQObject, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef -1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %o, ptr align 8 %call, i64 16, i1 false)
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %1, 167772192
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %2, i32 0, i32 19
  %3 = load ptr, ptr %_sharedstate, align 8
  %_consts = getelementptr inbounds %struct.SQSharedState, ptr %3, i32 0, i32 7
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %_consts, ptr noundef nonnull align 8 dereferenceable(16) %o)
  %4 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %4)
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %v.addr, align 8
  %call2 = call i64 @sq_throwerror(ptr noundef %5, ptr noundef @.str.16)
  store i64 %call2, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i64, ptr %retval, align 8
  ret i64 %6
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_setforeignptr(ptr noundef %v, ptr noundef %p) #4 {
entry:
  %v.addr = alloca ptr, align 8
  %p.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store ptr %p, ptr %p.addr, align 8
  %0 = load ptr, ptr %p.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %_foreignptr = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 18
  store ptr %0, ptr %_foreignptr, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_getforeignptr(ptr noundef %v) #4 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_foreignptr = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 18
  %1 = load ptr, ptr %_foreignptr, align 8
  ret ptr %1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_setsharedforeignptr(ptr noundef %v, ptr noundef %p) #4 {
entry:
  %v.addr = alloca ptr, align 8
  %p.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store ptr %p, ptr %p.addr, align 8
  %0 = load ptr, ptr %p.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 19
  %2 = load ptr, ptr %_sharedstate, align 8
  %_foreignptr = getelementptr inbounds %struct.SQSharedState, ptr %2, i32 0, i32 26
  store ptr %0, ptr %_foreignptr, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_getsharedforeignptr(ptr noundef %v) #4 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 19
  %1 = load ptr, ptr %_sharedstate, align 8
  %_foreignptr = getelementptr inbounds %struct.SQSharedState, ptr %1, i32 0, i32 26
  %2 = load ptr, ptr %_foreignptr, align 8
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_setvmreleasehook(ptr noundef %v, ptr noundef %hook) #4 {
entry:
  %v.addr = alloca ptr, align 8
  %hook.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store ptr %hook, ptr %hook.addr, align 8
  %0 = load ptr, ptr %hook.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %_releasehook = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 22
  store ptr %0, ptr %_releasehook, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_getvmreleasehook(ptr noundef %v) #4 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_releasehook = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 22
  %1 = load ptr, ptr %_releasehook, align 8
  ret ptr %1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_setsharedreleasehook(ptr noundef %v, ptr noundef %hook) #4 {
entry:
  %v.addr = alloca ptr, align 8
  %hook.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store ptr %hook, ptr %hook.addr, align 8
  %0 = load ptr, ptr %hook.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 19
  %2 = load ptr, ptr %_sharedstate, align 8
  %_releasehook = getelementptr inbounds %struct.SQSharedState, ptr %2, i32 0, i32 27
  store ptr %0, ptr %_releasehook, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_getsharedreleasehook(ptr noundef %v) #4 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 19
  %1 = load ptr, ptr %_sharedstate, align 8
  %_releasehook = getelementptr inbounds %struct.SQSharedState, ptr %1, i32 0, i32 27
  %2 = load ptr, ptr %_releasehook, align 8
  ret ptr %2
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_push(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %2 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %1, i64 noundef %2)
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %call)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i32 @sq_gettype(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %call, i32 0, i32 0
  %2 = load i32, ptr %_type, align 8
  ret i32 %2
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_typeof(ptr noundef %v, i64 noundef %idx) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  %res = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %call1 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %res)
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load ptr, ptr %o, align 8
  %call2 = invoke noundef zeroext i1 @_ZN4SQVM6TypeOfERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(344) %2, ptr noundef nonnull align 8 dereferenceable(16) %3, ptr noundef nonnull align 8 dereferenceable(16) %res)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  br i1 %call2, label %if.end, label %if.then

if.then:                                          ; preds = %invoke.cont
  store i64 -1, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %if.end, %entry
  %4 = landingpad { ptr, i32 }
          cleanup
  %5 = extractvalue { ptr, i32 } %4, 0
  store ptr %5, ptr %exn.slot, align 8
  %6 = extractvalue { ptr, i32 } %4, 1
  store i32 %6, ptr %ehselector.slot, align 4
  %call5 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %res) #10
  br label %eh.resume

if.end:                                           ; preds = %invoke.cont
  %7 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %7, ptr noundef nonnull align 8 dereferenceable(16) %res)
          to label %invoke.cont3 unwind label %lpad

invoke.cont3:                                     ; preds = %if.end
  store i64 0, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %invoke.cont3, %if.then
  %call4 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %res) #10
  %8 = load i64, ptr %retval, align 8
  ret i64 %8

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val6 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val6
}

declare noundef zeroext i1 @_ZN4SQVM6TypeOfERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_tostring(ptr noundef %v, i64 noundef %idx) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  %res = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %call1 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %res)
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load ptr, ptr %o, align 8
  %call2 = invoke noundef zeroext i1 @_ZN4SQVM8ToStringERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(344) %2, ptr noundef nonnull align 8 dereferenceable(16) %3, ptr noundef nonnull align 8 dereferenceable(16) %res)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  br i1 %call2, label %if.end, label %if.then

if.then:                                          ; preds = %invoke.cont
  store i64 -1, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %if.end, %entry
  %4 = landingpad { ptr, i32 }
          cleanup
  %5 = extractvalue { ptr, i32 } %4, 0
  store ptr %5, ptr %exn.slot, align 8
  %6 = extractvalue { ptr, i32 } %4, 1
  store i32 %6, ptr %ehselector.slot, align 4
  %call5 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %res) #10
  br label %eh.resume

if.end:                                           ; preds = %invoke.cont
  %7 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %7, ptr noundef nonnull align 8 dereferenceable(16) %res)
          to label %invoke.cont3 unwind label %lpad

invoke.cont3:                                     ; preds = %if.end
  store i64 0, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %invoke.cont3, %if.then
  %call4 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %res) #10
  %8 = load i64, ptr %retval, align 8
  ret i64 %8

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val6 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val6
}

declare noundef zeroext i1 @_ZN4SQVM8ToStringERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_tobool(ptr noundef %v, i64 noundef %idx, ptr noundef %b) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %b.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %b, ptr %b.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %call1 = call noundef zeroext i1 @_ZN4SQVM7IsFalseER11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(16) %2)
  %3 = zext i1 %call1 to i64
  %cond = select i1 %call1, i32 0, i32 1
  %conv = sext i32 %cond to i64
  %4 = load ptr, ptr %b.addr, align 8
  store i64 %conv, ptr %4, align 8
  ret void
}

declare noundef zeroext i1 @_ZN4SQVM7IsFalseER11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getinteger(ptr noundef %v, i64 noundef %idx, ptr noundef %i) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %i.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %i, ptr %i.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %and = and i32 %3, 67108864
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %_type1 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %5 = load i32, ptr %_type1, align 8
  %cmp = icmp eq i32 %5, 83886084
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %6 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %7 = load float, ptr %_unVal, align 8
  %conv = fptosi float %7 to i64
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %8 = load ptr, ptr %o, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %9 = load i64, ptr %_unVal2, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %conv, %cond.true ], [ %9, %cond.false ]
  %10 = load ptr, ptr %i.addr, align 8
  store i64 %cond, ptr %10, align 8
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %11 = load ptr, ptr %o, align 8
  %_type3 = getelementptr inbounds %struct.tagSQObject, ptr %11, i32 0, i32 0
  %12 = load i32, ptr %_type3, align 8
  %cmp4 = icmp eq i32 %12, 16777224
  br i1 %cmp4, label %if.then5, label %if.end9

if.then5:                                         ; preds = %if.end
  %13 = load ptr, ptr %o, align 8
  %call6 = call noundef zeroext i1 @_ZN4SQVM7IsFalseER11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(16) %13)
  %14 = zext i1 %call6 to i64
  %cond7 = select i1 %call6, i32 0, i32 1
  %conv8 = sext i32 %cond7 to i64
  %15 = load ptr, ptr %i.addr, align 8
  store i64 %conv8, ptr %15, align 8
  store i64 0, ptr %retval, align 8
  br label %return

if.end9:                                          ; preds = %if.end
  store i64 -1, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end9, %if.then5, %cond.end
  %16 = load i64, ptr %retval, align 8
  ret i64 %16
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getfloat(ptr noundef %v, i64 noundef %idx, ptr noundef %f) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %f.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %f, ptr %f.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %and = and i32 %3, 67108864
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %_type1 = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %5 = load i32, ptr %_type1, align 8
  %cmp = icmp eq i32 %5, 83886082
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %6 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %7 = load i64, ptr %_unVal, align 8
  %conv = sitofp i64 %7 to float
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %8 = load ptr, ptr %o, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %9 = load float, ptr %_unVal2, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi float [ %conv, %cond.true ], [ %9, %cond.false ]
  %10 = load ptr, ptr %f.addr, align 8
  store float %cond, ptr %10, align 4
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %cond.end
  %11 = load i64, ptr %retval, align 8
  ret i64 %11
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getbool(ptr noundef %v, i64 noundef %idx, ptr noundef %b) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %b.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %b, ptr %b.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %3, 16777224
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %5 = load i64, ptr %_unVal, align 8
  %6 = load ptr, ptr %b.addr, align 8
  store i64 %5, ptr %6, align 8
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load i64, ptr %retval, align 8
  ret i64 %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getstringandsize(ptr noundef %v, i64 noundef %idx, ptr noundef %c, ptr noundef %size) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %c.addr = alloca ptr, align 8
  %size.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %c, ptr %c.addr, align 8
  store ptr %size, ptr %size.addr, align 8
  store ptr null, ptr %o, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %0, i64 noundef %1, i32 noundef 134217744, ptr noundef %o)
  br i1 %call, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  %_val = getelementptr inbounds %struct.SQString, ptr %3, i32 0, i32 5
  %arraydecay = getelementptr inbounds [1 x i8], ptr %_val, i64 0, i64 0
  %4 = load ptr, ptr %c.addr, align 8
  store ptr %arraydecay, ptr %4, align 8
  %5 = load ptr, ptr %o, align 8
  %_unVal1 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %_unVal1, align 8
  %_len = getelementptr inbounds %struct.SQString, ptr %6, i32 0, i32 3
  %7 = load i64, ptr %_len, align 8
  %8 = load ptr, ptr %size.addr, align 8
  store i64 %7, ptr %8, align 8
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %9 = load i64, ptr %retval, align 8
  ret i64 %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getstring(ptr noundef %v, i64 noundef %idx, ptr noundef %c) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %c.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %c, ptr %c.addr, align 8
  store ptr null, ptr %o, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %0, i64 noundef %1, i32 noundef 134217744, ptr noundef %o)
  br i1 %call, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  %_val = getelementptr inbounds %struct.SQString, ptr %3, i32 0, i32 5
  %arraydecay = getelementptr inbounds [1 x i8], ptr %_val, i64 0, i64 0
  %4 = load ptr, ptr %c.addr, align 8
  store ptr %arraydecay, ptr %4, align 8
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i64, ptr %retval, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getthread(ptr noundef %v, i64 noundef %idx, ptr noundef %thread) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %thread.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %thread, ptr %thread.addr, align 8
  store ptr null, ptr %o, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %0, i64 noundef %1, i32 noundef 134221824, ptr noundef %o)
  br i1 %call, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  %4 = load ptr, ptr %thread.addr, align 8
  store ptr %3, ptr %4, align 8
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i64, ptr %retval, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_clone(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM8PushNullEv(ptr noundef nonnull align 8 dereferenceable(344) %2)
  %3 = load ptr, ptr %v.addr, align 8
  %4 = load ptr, ptr %o, align 8
  %5 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %5, i64 noundef -1)
  %call2 = call noundef zeroext i1 @_ZN4SQVM5CloneERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(344) %3, ptr noundef nonnull align 8 dereferenceable(16) %4, ptr noundef nonnull align 8 dereferenceable(16) %call1)
  br i1 %call2, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %6 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %6)
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load i64, ptr %retval, align 8
  ret i64 %7
}

declare noundef zeroext i1 @_ZN4SQVM5CloneERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getsize(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  %type = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  store i32 %3, ptr %type, align 4
  %4 = load i32, ptr %type, align 4
  switch i32 %4, label %sw.default [
    i32 134217744, label %sw.bb
    i32 167772192, label %sw.bb1
    i32 134217792, label %sw.bb4
    i32 167772288, label %sw.bb7
    i32 167804928, label %sw.bb9
    i32 134234112, label %sw.bb11
  ]

sw.bb:                                            ; preds = %entry
  %5 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %_unVal, align 8
  %_len = getelementptr inbounds %struct.SQString, ptr %6, i32 0, i32 3
  %7 = load i64, ptr %_len, align 8
  store i64 %7, ptr %retval, align 8
  br label %return

sw.bb1:                                           ; preds = %entry
  %8 = load ptr, ptr %o, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %9 = load ptr, ptr %_unVal2, align 8
  %call3 = call noundef i64 @_ZN7SQTable9CountUsedEv(ptr noundef nonnull align 8 dereferenceable(88) %9)
  store i64 %call3, ptr %retval, align 8
  br label %return

sw.bb4:                                           ; preds = %entry
  %10 = load ptr, ptr %o, align 8
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 1
  %11 = load ptr, ptr %_unVal5, align 8
  %call6 = call noundef i64 @_ZNK7SQArray4SizeEv(ptr noundef nonnull align 8 dereferenceable(72) %11)
  store i64 %call6, ptr %retval, align 8
  br label %return

sw.bb7:                                           ; preds = %entry
  %12 = load ptr, ptr %o, align 8
  %_unVal8 = getelementptr inbounds %struct.tagSQObject, ptr %12, i32 0, i32 1
  %13 = load ptr, ptr %_unVal8, align 8
  %_size = getelementptr inbounds %struct.SQUserData, ptr %13, i32 0, i32 1
  %14 = load i64, ptr %_size, align 8
  store i64 %14, ptr %retval, align 8
  br label %return

sw.bb9:                                           ; preds = %entry
  %15 = load ptr, ptr %o, align 8
  %_unVal10 = getelementptr inbounds %struct.tagSQObject, ptr %15, i32 0, i32 1
  %16 = load ptr, ptr %_unVal10, align 8
  %_class = getelementptr inbounds %struct.SQInstance, ptr %16, i32 0, i32 1
  %17 = load ptr, ptr %_class, align 8
  %_udsize = getelementptr inbounds %struct.SQClass, ptr %17, i32 0, i32 11
  %18 = load i64, ptr %_udsize, align 8
  store i64 %18, ptr %retval, align 8
  br label %return

sw.bb11:                                          ; preds = %entry
  %19 = load ptr, ptr %o, align 8
  %_unVal12 = getelementptr inbounds %struct.tagSQObject, ptr %19, i32 0, i32 1
  %20 = load ptr, ptr %_unVal12, align 8
  %_udsize13 = getelementptr inbounds %struct.SQClass, ptr %20, i32 0, i32 11
  %21 = load i64, ptr %_udsize13, align 8
  store i64 %21, ptr %retval, align 8
  br label %return

sw.default:                                       ; preds = %entry
  %22 = load ptr, ptr %v.addr, align 8
  %23 = load i32, ptr %type, align 4
  %call14 = call noundef i64 @_Z18sq_aux_invalidtypeP4SQVM15tagSQObjectType(ptr noundef %22, i32 noundef %23)
  store i64 %call14, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.default, %sw.bb11, %sw.bb9, %sw.bb7, %sw.bb4, %sw.bb1, %sw.bb
  %24 = load i64, ptr %retval, align 8
  ret i64 %24
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZN7SQTable9CountUsedEv(ptr noundef nonnull align 8 dereferenceable(88) %this) #4 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_usednodes = getelementptr inbounds %struct.SQTable, ptr %this1, i32 0, i32 4
  %0 = load i64, ptr %_usednodes, align 8
  ret i64 %0
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_gethash(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %call1 = call noundef i64 @_Z7HashObjRK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %2)
  ret i64 %call1
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i64 @_Z7HashObjRK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %key) #4 {
entry:
  %retval = alloca i64, align 8
  %key.addr = alloca ptr, align 8
  store ptr %key, ptr %key.addr, align 8
  %0 = load ptr, ptr %key.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  switch i32 %1, label %sw.default [
    i32 134217744, label %sw.bb
    i32 83886084, label %sw.bb1
    i32 16777224, label %sw.bb3
    i32 83886082, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  %2 = load ptr, ptr %key.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  %_hash = getelementptr inbounds %struct.SQString, ptr %3, i32 0, i32 4
  %4 = load i64, ptr %_hash, align 8
  store i64 %4, ptr %retval, align 8
  br label %return

sw.bb1:                                           ; preds = %entry
  %5 = load ptr, ptr %key.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  %6 = load float, ptr %_unVal2, align 8
  %conv = fptosi float %6 to i64
  store i64 %conv, ptr %retval, align 8
  br label %return

sw.bb3:                                           ; preds = %entry, %entry
  %7 = load ptr, ptr %key.addr, align 8
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  %8 = load i64, ptr %_unVal4, align 8
  store i64 %8, ptr %retval, align 8
  br label %return

sw.default:                                       ; preds = %entry
  %9 = load ptr, ptr %key.addr, align 8
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %9, i32 0, i32 1
  %10 = load ptr, ptr %_unVal5, align 8
  %11 = ptrtoint ptr %10 to i64
  %shr = ashr i64 %11, 3
  store i64 %shr, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.default, %sw.bb3, %sw.bb1, %sw.bb
  %12 = load i64, ptr %retval, align 8
  ret i64 %12
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getuserdata(ptr noundef %v, i64 noundef %idx, ptr noundef %p, ptr noundef %typetag) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %p.addr = alloca ptr, align 8
  %typetag.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %p, ptr %p.addr, align 8
  store ptr %typetag, ptr %typetag.addr, align 8
  store ptr null, ptr %o, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %0, i64 noundef %1, i32 noundef 167772288, ptr noundef %o)
  br i1 %call, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  %add.ptr = getelementptr inbounds %struct.SQUserData, ptr %3, i64 1
  %4 = ptrtoint ptr %add.ptr to i64
  %add = add i64 %4, 7
  %and = and i64 %add, -8
  %5 = inttoptr i64 %and to ptr
  %6 = load ptr, ptr %p.addr, align 8
  store ptr %5, ptr %6, align 8
  %7 = load ptr, ptr %typetag.addr, align 8
  %tobool = icmp ne ptr %7, null
  br i1 %tobool, label %if.then1, label %if.end3

if.then1:                                         ; preds = %if.end
  %8 = load ptr, ptr %o, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %9 = load ptr, ptr %_unVal2, align 8
  %_typetag = getelementptr inbounds %struct.SQUserData, ptr %9, i32 0, i32 3
  %10 = load ptr, ptr %_typetag, align 8
  %11 = load ptr, ptr %typetag.addr, align 8
  store ptr %10, ptr %11, align 8
  br label %if.end3

if.end3:                                          ; preds = %if.then1, %if.end
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end3, %if.then
  %12 = load i64, ptr %retval, align 8
  ret i64 %12
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_settypetag(ptr noundef %v, i64 noundef %idx, ptr noundef %typetag) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %typetag.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %typetag, ptr %typetag.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  switch i32 %3, label %sw.default [
    i32 167772288, label %sw.bb
    i32 134234112, label %sw.bb1
  ]

sw.bb:                                            ; preds = %entry
  %4 = load ptr, ptr %typetag.addr, align 8
  %5 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %_unVal, align 8
  %_typetag = getelementptr inbounds %struct.SQUserData, ptr %6, i32 0, i32 3
  store ptr %4, ptr %_typetag, align 8
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %7 = load ptr, ptr %typetag.addr, align 8
  %8 = load ptr, ptr %o, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %9 = load ptr, ptr %_unVal2, align 8
  %_typetag3 = getelementptr inbounds %struct.SQClass, ptr %9, i32 0, i32 7
  store ptr %7, ptr %_typetag3, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %10 = load ptr, ptr %v.addr, align 8
  %call4 = call i64 @sq_throwerror(ptr noundef %10, ptr noundef @.str.17)
  store i64 %call4, ptr %retval, align 8
  br label %return

sw.epilog:                                        ; preds = %sw.bb1, %sw.bb
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.epilog, %sw.default
  %11 = load i64, ptr %retval, align 8
  ret i64 %11
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define i64 @sq_getobjtypetag(ptr noundef %o, ptr noundef %typetag) #4 {
entry:
  %retval = alloca i64, align 8
  %o.addr = alloca ptr, align 8
  %typetag.addr = alloca ptr, align 8
  store ptr %o, ptr %o.addr, align 8
  store ptr %typetag, ptr %typetag.addr, align 8
  %0 = load ptr, ptr %o.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  switch i32 %1, label %sw.default [
    i32 167804928, label %sw.bb
    i32 167772288, label %sw.bb1
    i32 134234112, label %sw.bb4
  ]

sw.bb:                                            ; preds = %entry
  %2 = load ptr, ptr %o.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  %_class = getelementptr inbounds %struct.SQInstance, ptr %3, i32 0, i32 1
  %4 = load ptr, ptr %_class, align 8
  %_typetag = getelementptr inbounds %struct.SQClass, ptr %4, i32 0, i32 7
  %5 = load ptr, ptr %_typetag, align 8
  %6 = load ptr, ptr %typetag.addr, align 8
  store ptr %5, ptr %6, align 8
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %7 = load ptr, ptr %o.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  %8 = load ptr, ptr %_unVal2, align 8
  %_typetag3 = getelementptr inbounds %struct.SQUserData, ptr %8, i32 0, i32 3
  %9 = load ptr, ptr %_typetag3, align 8
  %10 = load ptr, ptr %typetag.addr, align 8
  store ptr %9, ptr %10, align 8
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  %11 = load ptr, ptr %o.addr, align 8
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %11, i32 0, i32 1
  %12 = load ptr, ptr %_unVal5, align 8
  %_typetag6 = getelementptr inbounds %struct.SQClass, ptr %12, i32 0, i32 7
  %13 = load ptr, ptr %_typetag6, align 8
  %14 = load ptr, ptr %typetag.addr, align 8
  store ptr %13, ptr %14, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

sw.epilog:                                        ; preds = %sw.bb4, %sw.bb1, %sw.bb
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.epilog, %sw.default
  %15 = load i64, ptr %retval, align 8
  ret i64 %15
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_gettypetag(ptr noundef %v, i64 noundef %idx, ptr noundef %typetag) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %typetag.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %typetag, ptr %typetag.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %3 = load ptr, ptr %typetag.addr, align 8
  %call1 = call i64 @sq_getobjtypetag(ptr noundef %2, ptr noundef %3)
  %cmp = icmp slt i64 %call1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i64, ptr %retval, align 8
  ret i64 %4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getuserpointer(ptr noundef %v, i64 noundef %idx, ptr noundef %p) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %p.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %p, ptr %p.addr, align 8
  store ptr null, ptr %o, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %0, i64 noundef %1, i32 noundef 2048, ptr noundef %o)
  br i1 %call, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  %4 = load ptr, ptr %p.addr, align 8
  store ptr %3, ptr %4, align 8
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i64, ptr %retval, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setinstanceup(ptr noundef %v, i64 noundef %idx, ptr noundef %p) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %p.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %p, ptr %p.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %cmp = icmp ne i32 %3, 167804928
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %v.addr, align 8
  %call1 = call i64 @sq_throwerror(ptr noundef %4, ptr noundef @.str.18)
  store i64 %call1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %p.addr, align 8
  %6 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %7 = load ptr, ptr %_unVal, align 8
  %_userpointer = getelementptr inbounds %struct.SQInstance, ptr %7, i32 0, i32 2
  store ptr %5, ptr %_userpointer, align 8
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %8 = load i64, ptr %retval, align 8
  ret i64 %8
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setclassudsize(ptr noundef %v, i64 noundef %idx, i64 noundef %udsize) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %udsize.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store i64 %udsize, ptr %udsize.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %cmp = icmp ne i32 %3, 134234112
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %v.addr, align 8
  %call1 = call i64 @sq_throwerror(ptr noundef %4, ptr noundef @.str.19)
  store i64 %call1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %_unVal, align 8
  %_locked = getelementptr inbounds %struct.SQClass, ptr %6, i32 0, i32 9
  %7 = load i8, ptr %_locked, align 8
  %tobool = trunc i8 %7 to i1
  br i1 %tobool, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %8 = load ptr, ptr %v.addr, align 8
  %call3 = call i64 @sq_throwerror(ptr noundef %8, ptr noundef @.str.20)
  store i64 %call3, ptr %retval, align 8
  br label %return

if.end4:                                          ; preds = %if.end
  %9 = load i64, ptr %udsize.addr, align 8
  %10 = load ptr, ptr %o, align 8
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 1
  %11 = load ptr, ptr %_unVal5, align 8
  %_udsize = getelementptr inbounds %struct.SQClass, ptr %11, i32 0, i32 11
  store i64 %9, ptr %_udsize, align 8
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end4, %if.then2, %if.then
  %12 = load i64, ptr %retval, align 8
  ret i64 %12
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getinstanceup(ptr noundef %v, i64 noundef %idx, ptr noundef %p, ptr noundef %typetag, i64 noundef %throwerror) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %p.addr = alloca ptr, align 8
  %typetag.addr = alloca ptr, align 8
  %throwerror.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  %cl = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %p, ptr %p.addr, align 8
  store ptr %typetag, ptr %typetag.addr, align 8
  store i64 %throwerror, ptr %throwerror.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %cmp = icmp ne i32 %3, 167804928
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i64, ptr %throwerror.addr, align 8
  %tobool = icmp ne i64 %4, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %5 = load ptr, ptr %v.addr, align 8
  %call1 = call i64 @sq_throwerror(ptr noundef %5, ptr noundef @.str.18)
  br label %cond.end

cond.false:                                       ; preds = %if.then
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %call1, %cond.true ], [ -1, %cond.false ]
  store i64 %cond, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %6 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %7 = load ptr, ptr %_unVal, align 8
  %_userpointer = getelementptr inbounds %struct.SQInstance, ptr %7, i32 0, i32 2
  %8 = load ptr, ptr %_userpointer, align 8
  %9 = load ptr, ptr %p.addr, align 8
  store ptr %8, ptr %9, align 8
  %10 = load ptr, ptr %typetag.addr, align 8
  %cmp2 = icmp ne ptr %10, null
  br i1 %cmp2, label %if.then3, label %if.end15

if.then3:                                         ; preds = %if.end
  %11 = load ptr, ptr %o, align 8
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %11, i32 0, i32 1
  %12 = load ptr, ptr %_unVal4, align 8
  %_class = getelementptr inbounds %struct.SQInstance, ptr %12, i32 0, i32 1
  %13 = load ptr, ptr %_class, align 8
  store ptr %13, ptr %cl, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then3
  %14 = load ptr, ptr %cl, align 8
  %_typetag = getelementptr inbounds %struct.SQClass, ptr %14, i32 0, i32 7
  %15 = load ptr, ptr %_typetag, align 8
  %16 = load ptr, ptr %typetag.addr, align 8
  %cmp5 = icmp eq ptr %15, %16
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %do.body
  store i64 0, ptr %retval, align 8
  br label %return

if.end7:                                          ; preds = %do.body
  %17 = load ptr, ptr %cl, align 8
  %_base = getelementptr inbounds %struct.SQClass, ptr %17, i32 0, i32 2
  %18 = load ptr, ptr %_base, align 8
  store ptr %18, ptr %cl, align 8
  br label %do.cond

do.cond:                                          ; preds = %if.end7
  %19 = load ptr, ptr %cl, align 8
  %cmp8 = icmp ne ptr %19, null
  br i1 %cmp8, label %do.body, label %do.end, !llvm.loop !18

do.end:                                           ; preds = %do.cond
  %20 = load i64, ptr %throwerror.addr, align 8
  %tobool9 = icmp ne i64 %20, 0
  br i1 %tobool9, label %cond.true10, label %cond.false12

cond.true10:                                      ; preds = %do.end
  %21 = load ptr, ptr %v.addr, align 8
  %call11 = call i64 @sq_throwerror(ptr noundef %21, ptr noundef @.str.21)
  br label %cond.end13

cond.false12:                                     ; preds = %do.end
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false12, %cond.true10
  %cond14 = phi i64 [ %call11, %cond.true10 ], [ -1, %cond.false12 ]
  store i64 %cond14, ptr %retval, align 8
  br label %return

if.end15:                                         ; preds = %if.end
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end15, %cond.end13, %if.then6, %cond.end
  %22 = load i64, ptr %retval, align 8
  ret i64 %22
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_settop(ptr noundef %v, i64 noundef %newtop) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %newtop.addr = alloca i64, align 8
  %top = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %newtop, ptr %newtop.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call i64 @sq_gettop(ptr noundef %0)
  store i64 %call, ptr %top, align 8
  %1 = load i64, ptr %top, align 8
  %2 = load i64, ptr %newtop.addr, align 8
  %cmp = icmp sgt i64 %1, %2
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load ptr, ptr %v.addr, align 8
  %4 = load i64, ptr %top, align 8
  %5 = load i64, ptr %newtop.addr, align 8
  %sub = sub nsw i64 %4, %5
  call void @sq_pop(ptr noundef %3, i64 noundef %sub)
  br label %if.end

if.else:                                          ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.else
  %6 = load i64, ptr %top, align 8
  %inc = add nsw i64 %6, 1
  store i64 %inc, ptr %top, align 8
  %7 = load i64, ptr %newtop.addr, align 8
  %cmp1 = icmp slt i64 %6, %7
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load ptr, ptr %v.addr, align 8
  call void @sq_pushnull(ptr noundef %8)
  br label %while.cond, !llvm.loop !19

while.end:                                        ; preds = %while.cond
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pop(ptr noundef %v, i64 noundef %nelemstopop) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %nelemstopop.addr = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %nelemstopop, ptr %nelemstopop.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_top = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 2
  %1 = load i64, ptr %_top, align 8
  %2 = load i64, ptr %nelemstopop.addr, align 8
  %cmp = icmp sge i64 %1, %2
  %lnot = xor i1 %cmp, true
  br i1 %lnot, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  call void @__assert_rtn(ptr noundef @__func__.sq_pop, ptr noundef @.str.22, i32 noundef 843, ptr noundef @.str.23) #11
  unreachable

3:                                                ; No predecessors!
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %3
  %4 = load ptr, ptr %v.addr, align 8
  %5 = load i64, ptr %nelemstopop.addr, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %4, i64 noundef %5)
  ret void
}

; Function Attrs: cold noreturn
declare void @__assert_rtn(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #7

declare void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344), i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_poptop(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_top = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 2
  %1 = load i64, ptr %_top, align 8
  %cmp = icmp sge i64 %1, 1
  %lnot = xor i1 %cmp, true
  br i1 %lnot, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  call void @__assert_rtn(ptr noundef @__func__.sq_poptop, ptr noundef @.str.22, i32 noundef 849, ptr noundef @.str.24) #11
  unreachable

2:                                                ; No predecessors!
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %2
  %3 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %3)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_remove(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  call void @_ZN4SQVM6RemoveEx(ptr noundef nonnull align 8 dereferenceable(344) %0, i64 noundef %1)
  ret void
}

declare void @_ZN4SQVM6RemoveEx(ptr noundef nonnull align 8 dereferenceable(344), i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_cmp(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %res = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %1, i64 noundef -1)
  %2 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %2, i64 noundef -2)
  %call2 = call noundef zeroext i1 @_ZN4SQVM6ObjCmpERK11SQObjectPtrS2_Rx(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %call, ptr noundef nonnull align 8 dereferenceable(16) %call1, ptr noundef nonnull align 8 dereferenceable(8) %res)
  %3 = load i64, ptr %res, align 8
  ret i64 %3
}

declare noundef zeroext i1 @_ZN4SQVM6ObjCmpERK11SQObjectPtrS2_Rx(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(8)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_newslot(ptr noundef %v, i64 noundef %idx, i64 noundef %bstatic) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %bstatic.addr = alloca i64, align 8
  %self = alloca ptr, align 8
  %key = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store i64 %bstatic, ptr %bstatic.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call i64 @sq_gettop(ptr noundef %0)
  %cmp = icmp slt i64 %call, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %v.addr, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %1, ptr noundef @.str.3)
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load i64, ptr %idx.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %2, i64 noundef %3)
  store ptr %call1, ptr %self, align 8
  %4 = load ptr, ptr %self, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %5 = load i32, ptr %_type, align 8
  %cmp2 = icmp eq i32 %5, 167772192
  br i1 %cmp2, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %6 = load ptr, ptr %self, align 8
  %_type3 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  %7 = load i32, ptr %_type3, align 8
  %cmp4 = icmp eq i32 %7, 134234112
  br i1 %cmp4, label %if.then5, label %if.end14

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  %8 = load ptr, ptr %v.addr, align 8
  %call6 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %8, i64 noundef -2)
  store ptr %call6, ptr %key, align 8
  %9 = load ptr, ptr %key, align 8
  %_type7 = getelementptr inbounds %struct.tagSQObject, ptr %9, i32 0, i32 0
  %10 = load i32, ptr %_type7, align 8
  %cmp8 = icmp eq i32 %10, 16777217
  br i1 %cmp8, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.then5
  %11 = load ptr, ptr %v.addr, align 8
  %call10 = call i64 @sq_throwerror(ptr noundef %11, ptr noundef @.str.25)
  store i64 %call10, ptr %retval, align 8
  br label %return

if.end11:                                         ; preds = %if.then5
  %12 = load ptr, ptr %v.addr, align 8
  %13 = load ptr, ptr %self, align 8
  %14 = load ptr, ptr %key, align 8
  %15 = load ptr, ptr %v.addr, align 8
  %call12 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %15, i64 noundef -1)
  %16 = load i64, ptr %bstatic.addr, align 8
  %tobool = icmp ne i64 %16, 0
  %17 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i1 true, i1 false
  %call13 = call noundef zeroext i1 @_ZN4SQVM7NewSlotERK11SQObjectPtrS2_S2_b(ptr noundef nonnull align 8 dereferenceable(344) %12, ptr noundef nonnull align 8 dereferenceable(16) %13, ptr noundef nonnull align 8 dereferenceable(16) %14, ptr noundef nonnull align 8 dereferenceable(16) %call12, i1 noundef zeroext %cond)
  %18 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %18, i64 noundef 2)
  br label %if.end14

if.end14:                                         ; preds = %if.end11, %lor.lhs.false
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end14, %if.then9, %if.then
  %19 = load i64, ptr %retval, align 8
  ret i64 %19
}

declare noundef zeroext i1 @_ZN4SQVM7NewSlotERK11SQObjectPtrS2_S2_b(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), i1 noundef zeroext) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_deleteslot(ptr noundef %v, i64 noundef %idx, i64 noundef %pushval) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %pushval.addr = alloca i64, align 8
  %self = alloca ptr, align 8
  %key = alloca ptr, align 8
  %res = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store i64 %pushval, ptr %pushval.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call i64 @sq_gettop(ptr noundef %0)
  %cmp = icmp slt i64 %call, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %v.addr, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %1, ptr noundef @.str.3)
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load i64, ptr %idx.addr, align 8
  %call1 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %2, i64 noundef %3, i32 noundef 167772192, ptr noundef %self)
  br i1 %call1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  store i64 -1, ptr %retval, align 8
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load ptr, ptr %v.addr, align 8
  %call4 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %4, i64 noundef -1)
  store ptr %call4, ptr %key, align 8
  %5 = load ptr, ptr %key, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 0
  %6 = load i32, ptr %_type, align 8
  %cmp5 = icmp eq i32 %6, 16777217
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end3
  %7 = load ptr, ptr %v.addr, align 8
  %call7 = call i64 @sq_throwerror(ptr noundef %7, ptr noundef @.str.25)
  store i64 %call7, ptr %retval, align 8
  br label %return

if.end8:                                          ; preds = %if.end3
  %call9 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %res)
  %8 = load ptr, ptr %v.addr, align 8
  %9 = load ptr, ptr %self, align 8
  %10 = load ptr, ptr %key, align 8
  %call10 = invoke noundef zeroext i1 @_ZN4SQVM10DeleteSlotERK11SQObjectPtrS2_RS0_(ptr noundef nonnull align 8 dereferenceable(344) %8, ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef nonnull align 8 dereferenceable(16) %10, ptr noundef nonnull align 8 dereferenceable(16) %res)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.end8
  br i1 %call10, label %if.end13, label %if.then11

if.then11:                                        ; preds = %invoke.cont
  %11 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %11)
          to label %invoke.cont12 unwind label %lpad

invoke.cont12:                                    ; preds = %if.then11
  store i64 -1, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %if.else, %invoke.cont15, %if.then14, %if.then11, %if.end8
  %12 = landingpad { ptr, i32 }
          cleanup
  %13 = extractvalue { ptr, i32 } %12, 0
  store ptr %13, ptr %exn.slot, align 8
  %14 = extractvalue { ptr, i32 } %12, 1
  store i32 %14, ptr %ehselector.slot, align 4
  %call22 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %res) #10
  br label %eh.resume

if.end13:                                         ; preds = %invoke.cont
  %15 = load i64, ptr %pushval.addr, align 8
  %tobool = icmp ne i64 %15, 0
  br i1 %tobool, label %if.then14, label %if.else

if.then14:                                        ; preds = %if.end13
  %16 = load ptr, ptr %v.addr, align 8
  %call16 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %16, i64 noundef -1)
          to label %invoke.cont15 unwind label %lpad

invoke.cont15:                                    ; preds = %if.then14
  %call18 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %call16, ptr noundef nonnull align 8 dereferenceable(16) %res)
          to label %invoke.cont17 unwind label %lpad

invoke.cont17:                                    ; preds = %invoke.cont15
  br label %if.end20

if.else:                                          ; preds = %if.end13
  %17 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %17)
          to label %invoke.cont19 unwind label %lpad

invoke.cont19:                                    ; preds = %if.else
  br label %if.end20

if.end20:                                         ; preds = %invoke.cont19, %invoke.cont17
  store i64 0, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %if.end20, %invoke.cont12
  %call21 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %res) #10
  br label %return

return:                                           ; preds = %cleanup, %if.then6, %if.then2, %if.then
  %18 = load i64, ptr %retval, align 8
  ret i64 %18

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val23 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val23
}

declare noundef zeroext i1 @_ZN4SQVM10DeleteSlotERK11SQObjectPtrS2_RS0_(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_set(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %self = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %self, align 8
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load ptr, ptr %self, align 8
  %4 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %4, i64 noundef -2)
  %5 = load ptr, ptr %v.addr, align 8
  %call2 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %5, i64 noundef -1)
  %call3 = call noundef zeroext i1 @_ZN4SQVM3SetERK11SQObjectPtrS2_S2_x(ptr noundef nonnull align 8 dereferenceable(344) %2, ptr noundef nonnull align 8 dereferenceable(16) %3, ptr noundef nonnull align 8 dereferenceable(16) %call1, ptr noundef nonnull align 8 dereferenceable(16) %call2, i64 noundef 666)
  br i1 %call3, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %6, i64 noundef 2)
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load i64, ptr %retval, align 8
  ret i64 %7
}

declare noundef zeroext i1 @_ZN4SQVM3SetERK11SQObjectPtrS2_S2_x(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_rawset(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %self = alloca ptr, align 8
  %key = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %self, align 8
  %2 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %2, i64 noundef -2)
  store ptr %call1, ptr %key, align 8
  %3 = load ptr, ptr %key, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 0
  %4 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %4, 16777217
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %5, i64 noundef 2)
  %6 = load ptr, ptr %v.addr, align 8
  %call2 = call i64 @sq_throwerror(ptr noundef %6, ptr noundef @.str.26)
  store i64 %call2, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %7 = load ptr, ptr %self, align 8
  %_type3 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %8 = load i32, ptr %_type3, align 8
  switch i32 %8, label %sw.default [
    i32 167772192, label %sw.bb
    i32 134234112, label %sw.bb6
    i32 167804928, label %sw.bb10
    i32 134217792, label %sw.bb16
  ]

sw.bb:                                            ; preds = %if.end
  %9 = load ptr, ptr %self, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %9, i32 0, i32 1
  %10 = load ptr, ptr %_unVal, align 8
  %11 = load ptr, ptr %key, align 8
  %12 = load ptr, ptr %v.addr, align 8
  %call4 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %12, i64 noundef -1)
  %call5 = call noundef zeroext i1 @_ZN7SQTable7NewSlotERK11SQObjectPtrS2_(ptr noundef nonnull align 8 dereferenceable(88) %10, ptr noundef nonnull align 8 dereferenceable(16) %11, ptr noundef nonnull align 8 dereferenceable(16) %call4)
  %13 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %13, i64 noundef 2)
  store i64 0, ptr %retval, align 8
  br label %return

sw.bb6:                                           ; preds = %if.end
  %14 = load ptr, ptr %self, align 8
  %_unVal7 = getelementptr inbounds %struct.tagSQObject, ptr %14, i32 0, i32 1
  %15 = load ptr, ptr %_unVal7, align 8
  %16 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %16, i32 0, i32 19
  %17 = load ptr, ptr %_sharedstate, align 8
  %18 = load ptr, ptr %key, align 8
  %19 = load ptr, ptr %v.addr, align 8
  %call8 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %19, i64 noundef -1)
  %call9 = call noundef zeroext i1 @_ZN7SQClass7NewSlotEP13SQSharedStateRK11SQObjectPtrS4_b(ptr noundef nonnull align 8 dereferenceable(456) %15, ptr noundef %17, ptr noundef nonnull align 8 dereferenceable(16) %18, ptr noundef nonnull align 8 dereferenceable(16) %call8, i1 noundef zeroext false)
  %20 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %20, i64 noundef 2)
  store i64 0, ptr %retval, align 8
  br label %return

sw.bb10:                                          ; preds = %if.end
  %21 = load ptr, ptr %self, align 8
  %_unVal11 = getelementptr inbounds %struct.tagSQObject, ptr %21, i32 0, i32 1
  %22 = load ptr, ptr %_unVal11, align 8
  %23 = load ptr, ptr %key, align 8
  %24 = load ptr, ptr %v.addr, align 8
  %call12 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %24, i64 noundef -1)
  %call13 = call noundef zeroext i1 @_ZN10SQInstance3SetERK11SQObjectPtrS2_(ptr noundef nonnull align 8 dereferenceable(104) %22, ptr noundef nonnull align 8 dereferenceable(16) %23, ptr noundef nonnull align 8 dereferenceable(16) %call12)
  br i1 %call13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %sw.bb10
  %25 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %25, i64 noundef 2)
  store i64 0, ptr %retval, align 8
  br label %return

if.end15:                                         ; preds = %sw.bb10
  br label %sw.epilog

sw.bb16:                                          ; preds = %if.end
  %26 = load ptr, ptr %v.addr, align 8
  %27 = load ptr, ptr %self, align 8
  %28 = load ptr, ptr %key, align 8
  %29 = load ptr, ptr %v.addr, align 8
  %call17 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %29, i64 noundef -1)
  %call18 = call noundef zeroext i1 @_ZN4SQVM3SetERK11SQObjectPtrS2_S2_x(ptr noundef nonnull align 8 dereferenceable(344) %26, ptr noundef nonnull align 8 dereferenceable(16) %27, ptr noundef nonnull align 8 dereferenceable(16) %28, ptr noundef nonnull align 8 dereferenceable(16) %call17, i64 noundef 0)
  br i1 %call18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %sw.bb16
  %30 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %30, i64 noundef 2)
  store i64 0, ptr %retval, align 8
  br label %return

if.end20:                                         ; preds = %sw.bb16
  br label %sw.epilog

sw.default:                                       ; preds = %if.end
  %31 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %31, i64 noundef 2)
  %32 = load ptr, ptr %v.addr, align 8
  %call21 = call i64 @sq_throwerror(ptr noundef %32, ptr noundef @.str.27)
  store i64 %call21, ptr %retval, align 8
  br label %return

sw.epilog:                                        ; preds = %if.end20, %if.end15
  %33 = load ptr, ptr %v.addr, align 8
  %34 = load ptr, ptr %v.addr, align 8
  %call22 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %34, i64 noundef -2)
  call void @_ZN4SQVM14Raise_IdxErrorERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %33, ptr noundef nonnull align 8 dereferenceable(16) %call22)
  store i64 -1, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.epilog, %sw.default, %if.then19, %if.then14, %sw.bb6, %sw.bb, %if.then
  %35 = load i64, ptr %retval, align 8
  ret i64 %35
}

declare noundef zeroext i1 @_ZN7SQTable7NewSlotERK11SQObjectPtrS2_(ptr noundef nonnull align 8 dereferenceable(88), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

declare noundef zeroext i1 @_ZN7SQClass7NewSlotEP13SQSharedStateRK11SQObjectPtrS4_b(ptr noundef nonnull align 8 dereferenceable(456), ptr noundef, ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), i1 noundef zeroext) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZN10SQInstance3SetERK11SQObjectPtrS2_(ptr noundef nonnull align 8 dereferenceable(104) %this, ptr noundef nonnull align 8 dereferenceable(16) %key, ptr noundef nonnull align 8 dereferenceable(16) %val) #0 align 2 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i1, align 1
  %this.addr = alloca ptr, align 8
  %key.addr = alloca ptr, align 8
  %val.addr = alloca ptr, align 8
  %idx = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store ptr %this, ptr %this.addr, align 8
  store ptr %key, ptr %key.addr, align 8
  store ptr %val, ptr %val.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %idx)
  %_class = getelementptr inbounds %struct.SQInstance, ptr %this1, i32 0, i32 1
  %0 = load ptr, ptr %_class, align 8
  %_members = getelementptr inbounds %struct.SQClass, ptr %0, i32 0, i32 1
  %1 = load ptr, ptr %_members, align 8
  %2 = load ptr, ptr %key.addr, align 8
  %call2 = invoke noundef zeroext i1 @_ZN7SQTable3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(88) %1, ptr noundef nonnull align 8 dereferenceable(16) %2, ptr noundef nonnull align 8 dereferenceable(16) %idx)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  br i1 %call2, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %invoke.cont
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %idx, i32 0, i32 1
  %3 = load i64, ptr %_unVal, align 8
  %and = and i64 %3, 33554432
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load ptr, ptr %val.addr, align 8
  %_values = getelementptr inbounds %struct.SQInstance, ptr %this1, i32 0, i32 5
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %idx, i32 0, i32 1
  %5 = load i64, ptr %_unVal3, align 8
  %and4 = and i64 %5, 16777215
  %arrayidx = getelementptr inbounds [1 x %struct.SQObjectPtr], ptr %_values, i64 0, i64 %and4
  %call6 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx, ptr noundef nonnull align 8 dereferenceable(16) %4)
          to label %invoke.cont5 unwind label %lpad

invoke.cont5:                                     ; preds = %if.then
  store i1 true, ptr %retval, align 1
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %if.then, %entry
  %6 = landingpad { ptr, i32 }
          cleanup
  %7 = extractvalue { ptr, i32 } %6, 0
  store ptr %7, ptr %exn.slot, align 8
  %8 = extractvalue { ptr, i32 } %6, 1
  store i32 %8, ptr %ehselector.slot, align 4
  %call8 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %idx) #10
  br label %eh.resume

if.end:                                           ; preds = %land.lhs.true, %invoke.cont
  store i1 false, ptr %retval, align 1
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %if.end, %invoke.cont5
  %call7 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %idx) #10
  %9 = load i1, ptr %retval, align 1
  ret i1 %9

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val9 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val9
}

declare void @_ZN4SQVM14Raise_IdxErrorERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_newmember(ptr noundef %v, i64 noundef %idx, i64 noundef %bstatic) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %bstatic.addr = alloca i64, align 8
  %self = alloca ptr, align 8
  %key = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store i64 %bstatic, ptr %bstatic.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %self, align 8
  %2 = load ptr, ptr %self, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %cmp = icmp ne i32 %3, 134234112
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %v.addr, align 8
  %call1 = call i64 @sq_throwerror(ptr noundef %4, ptr noundef @.str.28)
  store i64 %call1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %v.addr, align 8
  %call2 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %5, i64 noundef -3)
  store ptr %call2, ptr %key, align 8
  %6 = load ptr, ptr %key, align 8
  %_type3 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  %7 = load i32, ptr %_type3, align 8
  %cmp4 = icmp eq i32 %7, 16777217
  br i1 %cmp4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %8 = load ptr, ptr %v.addr, align 8
  %call6 = call i64 @sq_throwerror(ptr noundef %8, ptr noundef @.str.26)
  store i64 %call6, ptr %retval, align 8
  br label %return

if.end7:                                          ; preds = %if.end
  %9 = load ptr, ptr %v.addr, align 8
  %10 = load ptr, ptr %self, align 8
  %11 = load ptr, ptr %key, align 8
  %12 = load ptr, ptr %v.addr, align 8
  %call8 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %12, i64 noundef -2)
  %13 = load ptr, ptr %v.addr, align 8
  %call9 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %13, i64 noundef -1)
  %14 = load i64, ptr %bstatic.addr, align 8
  %tobool = icmp ne i64 %14, 0
  %15 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i1 true, i1 false
  %call10 = call noundef zeroext i1 @_ZN4SQVM8NewSlotAERK11SQObjectPtrS2_S2_S2_bb(ptr noundef nonnull align 8 dereferenceable(344) %9, ptr noundef nonnull align 8 dereferenceable(16) %10, ptr noundef nonnull align 8 dereferenceable(16) %11, ptr noundef nonnull align 8 dereferenceable(16) %call8, ptr noundef nonnull align 8 dereferenceable(16) %call9, i1 noundef zeroext %cond, i1 noundef zeroext false)
  br i1 %call10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end7
  %16 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %16, i64 noundef 3)
  store i64 -1, ptr %retval, align 8
  br label %return

if.end12:                                         ; preds = %if.end7
  %17 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %17, i64 noundef 3)
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end12, %if.then11, %if.then5, %if.then
  %18 = load i64, ptr %retval, align 8
  ret i64 %18
}

declare noundef zeroext i1 @_ZN4SQVM8NewSlotAERK11SQObjectPtrS2_S2_S2_bb(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), i1 noundef zeroext, i1 noundef zeroext) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_rawnewmember(ptr noundef %v, i64 noundef %idx, i64 noundef %bstatic) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %bstatic.addr = alloca i64, align 8
  %self = alloca ptr, align 8
  %key = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store i64 %bstatic, ptr %bstatic.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %self, align 8
  %2 = load ptr, ptr %self, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %cmp = icmp ne i32 %3, 134234112
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %v.addr, align 8
  %call1 = call i64 @sq_throwerror(ptr noundef %4, ptr noundef @.str.28)
  store i64 %call1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %v.addr, align 8
  %call2 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %5, i64 noundef -3)
  store ptr %call2, ptr %key, align 8
  %6 = load ptr, ptr %key, align 8
  %_type3 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  %7 = load i32, ptr %_type3, align 8
  %cmp4 = icmp eq i32 %7, 16777217
  br i1 %cmp4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %8 = load ptr, ptr %v.addr, align 8
  %call6 = call i64 @sq_throwerror(ptr noundef %8, ptr noundef @.str.26)
  store i64 %call6, ptr %retval, align 8
  br label %return

if.end7:                                          ; preds = %if.end
  %9 = load ptr, ptr %v.addr, align 8
  %10 = load ptr, ptr %self, align 8
  %11 = load ptr, ptr %key, align 8
  %12 = load ptr, ptr %v.addr, align 8
  %call8 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %12, i64 noundef -2)
  %13 = load ptr, ptr %v.addr, align 8
  %call9 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %13, i64 noundef -1)
  %14 = load i64, ptr %bstatic.addr, align 8
  %tobool = icmp ne i64 %14, 0
  %15 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i1 true, i1 false
  %call10 = call noundef zeroext i1 @_ZN4SQVM8NewSlotAERK11SQObjectPtrS2_S2_S2_bb(ptr noundef nonnull align 8 dereferenceable(344) %9, ptr noundef nonnull align 8 dereferenceable(16) %10, ptr noundef nonnull align 8 dereferenceable(16) %11, ptr noundef nonnull align 8 dereferenceable(16) %call8, ptr noundef nonnull align 8 dereferenceable(16) %call9, i1 noundef zeroext %cond, i1 noundef zeroext true)
  br i1 %call10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end7
  %16 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %16, i64 noundef 3)
  store i64 -1, ptr %retval, align 8
  br label %return

if.end12:                                         ; preds = %if.end7
  %17 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %17, i64 noundef 3)
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end12, %if.then11, %if.then5, %if.then
  %18 = load i64, ptr %retval, align 8
  ret i64 %18
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setdelegate(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %self = alloca ptr, align 8
  %mt = alloca ptr, align 8
  %type = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %self, align 8
  %2 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %2, i64 noundef -1)
  store ptr %call1, ptr %mt, align 8
  %3 = load ptr, ptr %self, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 0
  %4 = load i32, ptr %_type, align 8
  store i32 %4, ptr %type, align 4
  %5 = load i32, ptr %type, align 4
  switch i32 %5, label %sw.default [
    i32 167772192, label %sw.bb
    i32 167772288, label %sw.bb16
  ]

sw.bb:                                            ; preds = %entry
  %6 = load ptr, ptr %mt, align 8
  %_type2 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  %7 = load i32, ptr %_type2, align 8
  %cmp = icmp eq i32 %7, 167772192
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %sw.bb
  %8 = load ptr, ptr %self, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %9 = load ptr, ptr %_unVal, align 8
  %10 = load ptr, ptr %mt, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 1
  %11 = load ptr, ptr %_unVal3, align 8
  %call4 = call noundef zeroext i1 @_ZN11SQDelegable11SetDelegateEP7SQTable(ptr noundef nonnull align 8 dereferenceable(56) %9, ptr noundef %11)
  br i1 %call4, label %if.end, label %if.then5

if.then5:                                         ; preds = %if.then
  %12 = load ptr, ptr %v.addr, align 8
  %call6 = call i64 @sq_throwerror(ptr noundef %12, ptr noundef @.str.29)
  store i64 %call6, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %if.then
  %13 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %13)
  br label %if.end15

if.else:                                          ; preds = %sw.bb
  %14 = load ptr, ptr %mt, align 8
  %_type7 = getelementptr inbounds %struct.tagSQObject, ptr %14, i32 0, i32 0
  %15 = load i32, ptr %_type7, align 8
  %cmp8 = icmp eq i32 %15, 16777217
  br i1 %cmp8, label %if.then9, label %if.else12

if.then9:                                         ; preds = %if.else
  %16 = load ptr, ptr %self, align 8
  %_unVal10 = getelementptr inbounds %struct.tagSQObject, ptr %16, i32 0, i32 1
  %17 = load ptr, ptr %_unVal10, align 8
  %call11 = call noundef zeroext i1 @_ZN11SQDelegable11SetDelegateEP7SQTable(ptr noundef nonnull align 8 dereferenceable(56) %17, ptr noundef null)
  %18 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %18)
  br label %if.end14

if.else12:                                        ; preds = %if.else
  %19 = load ptr, ptr %v.addr, align 8
  %20 = load i32, ptr %type, align 4
  %call13 = call noundef i64 @_Z18sq_aux_invalidtypeP4SQVM15tagSQObjectType(ptr noundef %19, i32 noundef %20)
  store i64 %call13, ptr %retval, align 8
  br label %return

if.end14:                                         ; preds = %if.then9
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end
  br label %sw.epilog

sw.bb16:                                          ; preds = %entry
  %21 = load ptr, ptr %mt, align 8
  %_type17 = getelementptr inbounds %struct.tagSQObject, ptr %21, i32 0, i32 0
  %22 = load i32, ptr %_type17, align 8
  %cmp18 = icmp eq i32 %22, 167772192
  br i1 %cmp18, label %if.then19, label %if.else23

if.then19:                                        ; preds = %sw.bb16
  %23 = load ptr, ptr %self, align 8
  %_unVal20 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 1
  %24 = load ptr, ptr %_unVal20, align 8
  %25 = load ptr, ptr %mt, align 8
  %_unVal21 = getelementptr inbounds %struct.tagSQObject, ptr %25, i32 0, i32 1
  %26 = load ptr, ptr %_unVal21, align 8
  %call22 = call noundef zeroext i1 @_ZN11SQDelegable11SetDelegateEP7SQTable(ptr noundef nonnull align 8 dereferenceable(56) %24, ptr noundef %26)
  %27 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %27)
  br label %if.end32

if.else23:                                        ; preds = %sw.bb16
  %28 = load ptr, ptr %mt, align 8
  %_type24 = getelementptr inbounds %struct.tagSQObject, ptr %28, i32 0, i32 0
  %29 = load i32, ptr %_type24, align 8
  %cmp25 = icmp eq i32 %29, 16777217
  br i1 %cmp25, label %if.then26, label %if.else29

if.then26:                                        ; preds = %if.else23
  %30 = load ptr, ptr %self, align 8
  %_unVal27 = getelementptr inbounds %struct.tagSQObject, ptr %30, i32 0, i32 1
  %31 = load ptr, ptr %_unVal27, align 8
  %call28 = call noundef zeroext i1 @_ZN11SQDelegable11SetDelegateEP7SQTable(ptr noundef nonnull align 8 dereferenceable(56) %31, ptr noundef null)
  %32 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %32)
  br label %if.end31

if.else29:                                        ; preds = %if.else23
  %33 = load ptr, ptr %v.addr, align 8
  %34 = load i32, ptr %type, align 4
  %call30 = call noundef i64 @_Z18sq_aux_invalidtypeP4SQVM15tagSQObjectType(ptr noundef %33, i32 noundef %34)
  store i64 %call30, ptr %retval, align 8
  br label %return

if.end31:                                         ; preds = %if.then26
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then19
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %35 = load ptr, ptr %v.addr, align 8
  %36 = load i32, ptr %type, align 4
  %call33 = call noundef i64 @_Z18sq_aux_invalidtypeP4SQVM15tagSQObjectType(ptr noundef %35, i32 noundef %36)
  store i64 %call33, ptr %retval, align 8
  br label %return

sw.epilog:                                        ; preds = %if.end32, %if.end15
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.epilog, %sw.default, %if.else29, %if.else12, %if.then5
  %37 = load i64, ptr %retval, align 8
  ret i64 %37
}

declare noundef zeroext i1 @_ZN11SQDelegable11SetDelegateEP7SQTable(ptr noundef nonnull align 8 dereferenceable(56), ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_rawdeleteslot(ptr noundef %v, i64 noundef %idx, i64 noundef %pushval) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %pushval.addr = alloca i64, align 8
  %self = alloca ptr, align 8
  %key = alloca ptr, align 8
  %t = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store i64 %pushval, ptr %pushval.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call i64 @sq_gettop(ptr noundef %0)
  %cmp = icmp slt i64 %call, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %v.addr, align 8
  call void (ptr, ptr, ...) @_ZN4SQVM11Raise_ErrorEPKcz(ptr noundef nonnull align 8 dereferenceable(344) %1, ptr noundef @.str.3)
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load i64, ptr %idx.addr, align 8
  %call1 = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %2, i64 noundef %3, i32 noundef 167772192, ptr noundef %self)
  br i1 %call1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  store i64 -1, ptr %retval, align 8
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load ptr, ptr %v.addr, align 8
  %call4 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %4, i64 noundef -1)
  store ptr %call4, ptr %key, align 8
  %call5 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %t)
  %5 = load ptr, ptr %self, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %_unVal, align 8
  %7 = load ptr, ptr %key, align 8
  %call6 = invoke noundef zeroext i1 @_ZN7SQTable3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(88) %6, ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull align 8 dereferenceable(16) %t)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.end3
  br i1 %call6, label %if.then7, label %if.end10

if.then7:                                         ; preds = %invoke.cont
  %8 = load ptr, ptr %self, align 8
  %_unVal8 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %9 = load ptr, ptr %_unVal8, align 8
  %10 = load ptr, ptr %key, align 8
  invoke void @_ZN7SQTable6RemoveERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(88) %9, ptr noundef nonnull align 8 dereferenceable(16) %10)
          to label %invoke.cont9 unwind label %lpad

invoke.cont9:                                     ; preds = %if.then7
  br label %if.end10

lpad:                                             ; preds = %if.else, %invoke.cont13, %if.then12, %if.then7, %if.end3
  %11 = landingpad { ptr, i32 }
          cleanup
  %12 = extractvalue { ptr, i32 } %11, 0
  store ptr %12, ptr %exn.slot, align 8
  %13 = extractvalue { ptr, i32 } %11, 1
  store i32 %13, ptr %ehselector.slot, align 4
  %call20 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %t) #10
  br label %eh.resume

if.end10:                                         ; preds = %invoke.cont9, %invoke.cont
  %14 = load i64, ptr %pushval.addr, align 8
  %cmp11 = icmp ne i64 %14, 0
  br i1 %cmp11, label %if.then12, label %if.else

if.then12:                                        ; preds = %if.end10
  %15 = load ptr, ptr %v.addr, align 8
  %call14 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %15, i64 noundef -1)
          to label %invoke.cont13 unwind label %lpad

invoke.cont13:                                    ; preds = %if.then12
  %call16 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %call14, ptr noundef nonnull align 8 dereferenceable(16) %t)
          to label %invoke.cont15 unwind label %lpad

invoke.cont15:                                    ; preds = %invoke.cont13
  br label %if.end18

if.else:                                          ; preds = %if.end10
  %16 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %16)
          to label %invoke.cont17 unwind label %lpad

invoke.cont17:                                    ; preds = %if.else
  br label %if.end18

if.end18:                                         ; preds = %invoke.cont17, %invoke.cont15
  store i64 0, ptr %retval, align 8
  %call19 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %t) #10
  br label %return

return:                                           ; preds = %if.end18, %if.then2, %if.then
  %17 = load i64, ptr %retval, align 8
  ret i64 %17

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val21 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val21
}

declare noundef zeroext i1 @_ZN7SQTable3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(88), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

declare void @_ZN7SQTable6RemoveERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(88), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getdelegate(ptr noundef %v, i64 noundef %idx) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %self = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %self, align 8
  %2 = load ptr, ptr %self, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  switch i32 %3, label %sw.default [
    i32 167772192, label %sw.bb
    i32 167772288, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry, %entry
  %4 = load ptr, ptr %self, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %5 = load ptr, ptr %_unVal, align 8
  %_delegate = getelementptr inbounds %struct.SQDelegable, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %_delegate, align 8
  %tobool = icmp ne ptr %6, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %sw.bb
  %7 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM8PushNullEv(ptr noundef nonnull align 8 dereferenceable(344) %7)
  br label %sw.epilog

if.end:                                           ; preds = %sw.bb
  %8 = load ptr, ptr %v.addr, align 8
  %9 = load ptr, ptr %self, align 8
  %_unVal1 = getelementptr inbounds %struct.tagSQObject, ptr %9, i32 0, i32 1
  %10 = load ptr, ptr %_unVal1, align 8
  %_delegate2 = getelementptr inbounds %struct.SQDelegable, ptr %10, i32 0, i32 1
  %11 = load ptr, ptr %_delegate2, align 8
  %call3 = call noundef ptr @_ZN11SQObjectPtrC1EP7SQTable(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %11)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %8, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.end
  %call4 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %sw.epilog

lpad:                                             ; preds = %if.end
  %12 = landingpad { ptr, i32 }
          cleanup
  %13 = extractvalue { ptr, i32 } %12, 0
  store ptr %13, ptr %exn.slot, align 8
  %14 = extractvalue { ptr, i32 } %12, 1
  store i32 %14, ptr %ehselector.slot, align 4
  %call5 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

sw.default:                                       ; preds = %entry
  %15 = load ptr, ptr %v.addr, align 8
  %call6 = call i64 @sq_throwerror(ptr noundef %15, ptr noundef @.str.30)
  store i64 %call6, ptr %retval, align 8
  br label %return

sw.epilog:                                        ; preds = %invoke.cont, %if.then
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.epilog, %sw.default
  %16 = load i64, ptr %retval, align 8
  ret i64 %16

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val7 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_get(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %self = alloca ptr, align 8
  %obj = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %self, align 8
  %2 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %2, i64 noundef -1)
  store ptr %call1, ptr %obj, align 8
  %3 = load ptr, ptr %v.addr, align 8
  %4 = load ptr, ptr %self, align 8
  %5 = load ptr, ptr %obj, align 8
  %6 = load ptr, ptr %obj, align 8
  %call2 = call noundef zeroext i1 @_ZN4SQVM3GetERK11SQObjectPtrS2_RS0_yx(ptr noundef nonnull align 8 dereferenceable(344) %3, ptr noundef nonnull align 8 dereferenceable(16) %4, ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef nonnull align 8 dereferenceable(16) %6, i64 noundef 0, i64 noundef 666)
  br i1 %call2, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %7 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %7)
  store i64 -1, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %8 = load i64, ptr %retval, align 8
  ret i64 %8
}

declare noundef zeroext i1 @_ZN4SQVM3GetERK11SQObjectPtrS2_RS0_yx(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), i64 noundef, i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_rawget(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %self = alloca ptr, align 8
  %obj = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %self, align 8
  %2 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %2, i64 noundef -1)
  store ptr %call1, ptr %obj, align 8
  %3 = load ptr, ptr %self, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 0
  %4 = load i32, ptr %_type, align 8
  switch i32 %4, label %sw.default [
    i32 167772192, label %sw.bb
    i32 134234112, label %sw.bb3
    i32 167804928, label %sw.bb8
    i32 134217792, label %sw.bb13
  ]

sw.bb:                                            ; preds = %entry
  %5 = load ptr, ptr %self, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %_unVal, align 8
  %7 = load ptr, ptr %obj, align 8
  %8 = load ptr, ptr %obj, align 8
  %call2 = call noundef zeroext i1 @_ZN7SQTable3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(88) %6, ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull align 8 dereferenceable(16) %8)
  br i1 %call2, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %sw.bb
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %9 = load ptr, ptr %self, align 8
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %9, i32 0, i32 1
  %10 = load ptr, ptr %_unVal4, align 8
  %11 = load ptr, ptr %obj, align 8
  %12 = load ptr, ptr %obj, align 8
  %call5 = call noundef zeroext i1 @_ZN7SQClass3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(456) %10, ptr noundef nonnull align 8 dereferenceable(16) %11, ptr noundef nonnull align 8 dereferenceable(16) %12)
  br i1 %call5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %sw.bb3
  store i64 0, ptr %retval, align 8
  br label %return

if.end7:                                          ; preds = %sw.bb3
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %13 = load ptr, ptr %self, align 8
  %_unVal9 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 1
  %14 = load ptr, ptr %_unVal9, align 8
  %15 = load ptr, ptr %obj, align 8
  %16 = load ptr, ptr %obj, align 8
  %call10 = call noundef zeroext i1 @_ZN10SQInstance3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(104) %14, ptr noundef nonnull align 8 dereferenceable(16) %15, ptr noundef nonnull align 8 dereferenceable(16) %16)
  br i1 %call10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %sw.bb8
  store i64 0, ptr %retval, align 8
  br label %return

if.end12:                                         ; preds = %sw.bb8
  br label %sw.epilog

sw.bb13:                                          ; preds = %entry
  %17 = load ptr, ptr %obj, align 8
  %_type14 = getelementptr inbounds %struct.tagSQObject, ptr %17, i32 0, i32 0
  %18 = load i32, ptr %_type14, align 8
  %and = and i32 %18, 67108864
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then15, label %if.else

if.then15:                                        ; preds = %sw.bb13
  %19 = load ptr, ptr %self, align 8
  %_unVal16 = getelementptr inbounds %struct.tagSQObject, ptr %19, i32 0, i32 1
  %20 = load ptr, ptr %_unVal16, align 8
  %21 = load ptr, ptr %obj, align 8
  %_type17 = getelementptr inbounds %struct.tagSQObject, ptr %21, i32 0, i32 0
  %22 = load i32, ptr %_type17, align 8
  %cmp = icmp eq i32 %22, 83886084
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then15
  %23 = load ptr, ptr %obj, align 8
  %_unVal18 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 1
  %24 = load float, ptr %_unVal18, align 8
  %conv = fptosi float %24 to i64
  br label %cond.end

cond.false:                                       ; preds = %if.then15
  %25 = load ptr, ptr %obj, align 8
  %_unVal19 = getelementptr inbounds %struct.tagSQObject, ptr %25, i32 0, i32 1
  %26 = load i64, ptr %_unVal19, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %conv, %cond.true ], [ %26, %cond.false ]
  %27 = load ptr, ptr %obj, align 8
  %call20 = call noundef zeroext i1 @_ZN7SQArray3GetExR11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(72) %20, i64 noundef %cond, ptr noundef nonnull align 8 dereferenceable(16) %27)
  br i1 %call20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %cond.end
  store i64 0, ptr %retval, align 8
  br label %return

if.end22:                                         ; preds = %cond.end
  br label %if.end24

if.else:                                          ; preds = %sw.bb13
  %28 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %28)
  %29 = load ptr, ptr %v.addr, align 8
  %call23 = call i64 @sq_throwerror(ptr noundef %29, ptr noundef @.str.31)
  store i64 %call23, ptr %retval, align 8
  br label %return

if.end24:                                         ; preds = %if.end22
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %30 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %30)
  %31 = load ptr, ptr %v.addr, align 8
  %call25 = call i64 @sq_throwerror(ptr noundef %31, ptr noundef @.str.32)
  store i64 %call25, ptr %retval, align 8
  br label %return

sw.epilog:                                        ; preds = %if.end24, %if.end12, %if.end7, %if.end
  %32 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %32)
  %33 = load ptr, ptr %v.addr, align 8
  %call26 = call i64 @sq_throwerror(ptr noundef %33, ptr noundef @.str.33)
  store i64 %call26, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.epilog, %sw.default, %if.else, %if.then21, %if.then11, %if.then6, %if.then
  %34 = load i64, ptr %retval, align 8
  ret i64 %34
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZN7SQClass3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(456) %this, ptr noundef nonnull align 8 dereferenceable(16) %key, ptr noundef nonnull align 8 dereferenceable(16) %val) #0 align 2 {
entry:
  %retval = alloca i1, align 1
  %this.addr = alloca ptr, align 8
  %key.addr = alloca ptr, align 8
  %val.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  %ref.tmp = alloca %struct.tagSQObject, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %key, ptr %key.addr, align 8
  store ptr %val, ptr %val.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_members = getelementptr inbounds %struct.SQClass, ptr %this1, i32 0, i32 1
  %0 = load ptr, ptr %_members, align 8
  %1 = load ptr, ptr %key.addr, align 8
  %2 = load ptr, ptr %val.addr, align 8
  %call = call noundef zeroext i1 @_ZN7SQTable3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(88) %0, ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull align 8 dereferenceable(16) %2)
  br i1 %call, label %if.then, label %if.end14

if.then:                                          ; preds = %entry
  %3 = load ptr, ptr %val.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %_unVal, align 8
  %and = and i64 %4, 33554432
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  %_defaultvalues = getelementptr inbounds %struct.SQClass, ptr %this1, i32 0, i32 3
  %5 = load ptr, ptr %val.addr, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  %6 = load i64, ptr %_unVal3, align 8
  %and4 = and i64 %6, 16777215
  %call5 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNK8sqvectorI13SQClassMemberEixEy(ptr noundef nonnull align 8 dereferenceable(24) %_defaultvalues, i64 noundef %and4)
  %val6 = getelementptr inbounds %struct.SQClassMember, ptr %call5, i32 0, i32 0
  store ptr %val6, ptr %o, align 8
  %7 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %8 = load i32, ptr %_type, align 8
  %cmp = icmp ne i32 %8, 134283264
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then2
  %9 = load ptr, ptr %o, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %ref.tmp, ptr align 8 %9, i64 16, i1 false)
  br label %cond.end

cond.false:                                       ; preds = %if.then2
  %10 = load ptr, ptr %o, align 8
  %_unVal7 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 1
  %11 = load ptr, ptr %_unVal7, align 8
  %_obj = getelementptr inbounds %struct.SQWeakRef, ptr %11, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %ref.tmp, ptr align 8 %_obj, i64 16, i1 false)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %12 = load ptr, ptr %val.addr, align 8
  %call8 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %12, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
  br label %if.end

if.else:                                          ; preds = %if.then
  %_methods = getelementptr inbounds %struct.SQClass, ptr %this1, i32 0, i32 4
  %13 = load ptr, ptr %val.addr, align 8
  %_unVal9 = getelementptr inbounds %struct.tagSQObject, ptr %13, i32 0, i32 1
  %14 = load i64, ptr %_unVal9, align 8
  %and10 = and i64 %14, 16777215
  %call11 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNK8sqvectorI13SQClassMemberEixEy(ptr noundef nonnull align 8 dereferenceable(24) %_methods, i64 noundef %and10)
  %val12 = getelementptr inbounds %struct.SQClassMember, ptr %call11, i32 0, i32 0
  %15 = load ptr, ptr %val.addr, align 8
  %call13 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %15, ptr noundef nonnull align 8 dereferenceable(16) %val12)
  br label %if.end

if.end:                                           ; preds = %if.else, %cond.end
  store i1 true, ptr %retval, align 1
  br label %return

if.end14:                                         ; preds = %entry
  store i1 false, ptr %retval, align 1
  br label %return

return:                                           ; preds = %if.end14, %if.end
  %16 = load i1, ptr %retval, align 1
  ret i1 %16
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZN10SQInstance3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(104) %this, ptr noundef nonnull align 8 dereferenceable(16) %key, ptr noundef nonnull align 8 dereferenceable(16) %val) #0 align 2 {
entry:
  %retval = alloca i1, align 1
  %this.addr = alloca ptr, align 8
  %key.addr = alloca ptr, align 8
  %val.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  %ref.tmp = alloca %struct.tagSQObject, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %key, ptr %key.addr, align 8
  store ptr %val, ptr %val.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_class = getelementptr inbounds %struct.SQInstance, ptr %this1, i32 0, i32 1
  %0 = load ptr, ptr %_class, align 8
  %_members = getelementptr inbounds %struct.SQClass, ptr %0, i32 0, i32 1
  %1 = load ptr, ptr %_members, align 8
  %2 = load ptr, ptr %key.addr, align 8
  %3 = load ptr, ptr %val.addr, align 8
  %call = call noundef zeroext i1 @_ZN7SQTable3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(88) %1, ptr noundef nonnull align 8 dereferenceable(16) %2, ptr noundef nonnull align 8 dereferenceable(16) %3)
  br i1 %call, label %if.then, label %if.end13

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %val.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %5 = load i64, ptr %_unVal, align 8
  %and = and i64 %5, 33554432
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  %_values = getelementptr inbounds %struct.SQInstance, ptr %this1, i32 0, i32 5
  %6 = load ptr, ptr %val.addr, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %7 = load i64, ptr %_unVal3, align 8
  %and4 = and i64 %7, 16777215
  %arrayidx = getelementptr inbounds [1 x %struct.SQObjectPtr], ptr %_values, i64 0, i64 %and4
  store ptr %arrayidx, ptr %o, align 8
  %8 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 0
  %9 = load i32, ptr %_type, align 8
  %cmp = icmp ne i32 %9, 134283264
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then2
  %10 = load ptr, ptr %o, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %ref.tmp, ptr align 8 %10, i64 16, i1 false)
  br label %cond.end

cond.false:                                       ; preds = %if.then2
  %11 = load ptr, ptr %o, align 8
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %11, i32 0, i32 1
  %12 = load ptr, ptr %_unVal5, align 8
  %_obj = getelementptr inbounds %struct.SQWeakRef, ptr %12, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %ref.tmp, ptr align 8 %_obj, i64 16, i1 false)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %13 = load ptr, ptr %val.addr, align 8
  %call6 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %13, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
  br label %if.end

if.else:                                          ; preds = %if.then
  %_class7 = getelementptr inbounds %struct.SQInstance, ptr %this1, i32 0, i32 1
  %14 = load ptr, ptr %_class7, align 8
  %_methods = getelementptr inbounds %struct.SQClass, ptr %14, i32 0, i32 4
  %15 = load ptr, ptr %val.addr, align 8
  %_unVal8 = getelementptr inbounds %struct.tagSQObject, ptr %15, i32 0, i32 1
  %16 = load i64, ptr %_unVal8, align 8
  %and9 = and i64 %16, 16777215
  %call10 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNK8sqvectorI13SQClassMemberEixEy(ptr noundef nonnull align 8 dereferenceable(24) %_methods, i64 noundef %and9)
  %val11 = getelementptr inbounds %struct.SQClassMember, ptr %call10, i32 0, i32 0
  %17 = load ptr, ptr %val.addr, align 8
  %call12 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %17, ptr noundef nonnull align 8 dereferenceable(16) %val11)
  br label %if.end

if.end:                                           ; preds = %if.else, %cond.end
  store i1 true, ptr %retval, align 1
  br label %return

if.end13:                                         ; preds = %entry
  store i1 false, ptr %retval, align 1
  br label %return

return:                                           ; preds = %if.end13, %if.end
  %18 = load i1, ptr %retval, align 1
  ret i1 %18
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZN7SQArray3GetExR11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(72) %this, i64 noundef %nidx, ptr noundef nonnull align 8 dereferenceable(16) %val) #0 align 2 {
entry:
  %retval = alloca i1, align 1
  %this.addr = alloca ptr, align 8
  %nidx.addr = alloca i64, align 8
  %val.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  %ref.tmp = alloca %struct.tagSQObject, align 8
  store ptr %this, ptr %this.addr, align 8
  store i64 %nidx, ptr %nidx.addr, align 8
  store ptr %val, ptr %val.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load i64, ptr %nidx.addr, align 8
  %cmp = icmp sge i64 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i64, ptr %nidx.addr, align 8
  %_values = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  %call = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %_values)
  %cmp2 = icmp slt i64 %1, %call
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %_values3 = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  %2 = load i64, ptr %nidx.addr, align 8
  %call4 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrEixEy(ptr noundef nonnull align 8 dereferenceable(24) %_values3, i64 noundef %2)
  store ptr %call4, ptr %o, align 8
  %3 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 0
  %4 = load i32, ptr %_type, align 8
  %cmp5 = icmp ne i32 %4, 134283264
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %5 = load ptr, ptr %o, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %ref.tmp, ptr align 8 %5, i64 16, i1 false)
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %6 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %7 = load ptr, ptr %_unVal, align 8
  %_obj = getelementptr inbounds %struct.SQWeakRef, ptr %7, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %ref.tmp, ptr align 8 %_obj, i64 16, i1 false)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %8 = load ptr, ptr %val.addr, align 8
  %call6 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
  store i1 true, ptr %retval, align 1
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  store i1 false, ptr %retval, align 1
  br label %return

return:                                           ; preds = %if.else, %cond.end
  %9 = load i1, ptr %retval, align 1
  ret i1 %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getstackobj(ptr noundef %v, i64 noundef %idx, ptr noundef %po) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %po.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %po, ptr %po.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  %2 = load ptr, ptr %po.addr, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %call, i64 16, i1 false)
  ret i64 0
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_getlocal(ptr noundef %v, i64 noundef %level, i64 noundef %idx) #0 {
entry:
  %retval = alloca ptr, align 8
  %v.addr = alloca ptr, align 8
  %level.addr = alloca i64, align 8
  %idx.addr = alloca i64, align 8
  %cstksize = alloca i64, align 8
  %lvl = alloca i64, align 8
  %stackbase = alloca i64, align 8
  %i = alloca i64, align 8
  %ci = alloca ptr, align 8
  %ci6 = alloca ptr, align 8
  %c = alloca ptr, align 8
  %func = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %level, ptr %level.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_callsstacksize = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 13
  %1 = load i64, ptr %_callsstacksize, align 8
  store i64 %1, ptr %cstksize, align 8
  %2 = load i64, ptr %cstksize, align 8
  %3 = load i64, ptr %level.addr, align 8
  %sub = sub i64 %2, %3
  %sub1 = sub i64 %sub, 1
  store i64 %sub1, ptr %lvl, align 8
  %4 = load ptr, ptr %v.addr, align 8
  %_stackbase = getelementptr inbounds %struct.SQVM, ptr %4, i32 0, i32 3
  %5 = load i64, ptr %_stackbase, align 8
  store i64 %5, ptr %stackbase, align 8
  %6 = load i64, ptr %lvl, align 8
  %7 = load i64, ptr %cstksize, align 8
  %cmp = icmp ult i64 %6, %7
  br i1 %cmp, label %if.then, label %if.end24

if.then:                                          ; preds = %entry
  store i64 0, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %8 = load i64, ptr %i, align 8
  %9 = load i64, ptr %level.addr, align 8
  %cmp2 = icmp ult i64 %8, %9
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load ptr, ptr %v.addr, align 8
  %_callsstack = getelementptr inbounds %struct.SQVM, ptr %10, i32 0, i32 12
  %11 = load ptr, ptr %_callsstack, align 8
  %12 = load i64, ptr %cstksize, align 8
  %13 = load i64, ptr %i, align 8
  %sub3 = sub i64 %12, %13
  %sub4 = sub i64 %sub3, 1
  %arrayidx = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %11, i64 %sub4
  store ptr %arrayidx, ptr %ci, align 8
  %14 = load ptr, ptr %ci, align 8
  %_prevstkbase = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %14, i32 0, i32 5
  %15 = load i32, ptr %_prevstkbase, align 4
  %conv = sext i32 %15 to i64
  %16 = load i64, ptr %stackbase, align 8
  %sub5 = sub nsw i64 %16, %conv
  store i64 %sub5, ptr %stackbase, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i64, ptr %i, align 8
  %inc = add i64 %17, 1
  store i64 %inc, ptr %i, align 8
  br label %for.cond, !llvm.loop !20

for.end:                                          ; preds = %for.cond
  %18 = load ptr, ptr %v.addr, align 8
  %_callsstack7 = getelementptr inbounds %struct.SQVM, ptr %18, i32 0, i32 12
  %19 = load ptr, ptr %_callsstack7, align 8
  %20 = load i64, ptr %lvl, align 8
  %arrayidx8 = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %19, i64 %20
  store ptr %arrayidx8, ptr %ci6, align 8
  %21 = load ptr, ptr %ci6, align 8
  %_closure = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %21, i32 0, i32 2
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %_closure, i32 0, i32 0
  %22 = load i32, ptr %_type, align 8
  %cmp9 = icmp ne i32 %22, 134217984
  br i1 %cmp9, label %if.then10, label %if.end

if.then10:                                        ; preds = %for.end
  store ptr null, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %for.end
  %23 = load ptr, ptr %ci6, align 8
  %_closure11 = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %23, i32 0, i32 2
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %_closure11, i32 0, i32 1
  %24 = load ptr, ptr %_unVal, align 8
  store ptr %24, ptr %c, align 8
  %25 = load ptr, ptr %c, align 8
  %_function = getelementptr inbounds %struct.SQClosure, ptr %25, i32 0, i32 4
  %26 = load ptr, ptr %_function, align 8
  store ptr %26, ptr %func, align 8
  %27 = load ptr, ptr %func, align 8
  %_noutervalues = getelementptr inbounds %struct.SQFunctionProto, ptr %27, i32 0, i32 16
  %28 = load i64, ptr %_noutervalues, align 8
  %29 = load i64, ptr %idx.addr, align 8
  %cmp12 = icmp sgt i64 %28, %29
  br i1 %cmp12, label %if.then13, label %if.end19

if.then13:                                        ; preds = %if.end
  %30 = load ptr, ptr %v.addr, align 8
  %31 = load ptr, ptr %c, align 8
  %_outervalues = getelementptr inbounds %struct.SQClosure, ptr %31, i32 0, i32 5
  %32 = load ptr, ptr %_outervalues, align 8
  %33 = load i64, ptr %idx.addr, align 8
  %arrayidx14 = getelementptr inbounds %struct.SQObjectPtr, ptr %32, i64 %33
  %_unVal15 = getelementptr inbounds %struct.tagSQObject, ptr %arrayidx14, i32 0, i32 1
  %34 = load ptr, ptr %_unVal15, align 8
  %_valptr = getelementptr inbounds %struct.SQOuter, ptr %34, i32 0, i32 1
  %35 = load ptr, ptr %_valptr, align 8
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %30, ptr noundef nonnull align 8 dereferenceable(16) %35)
  %36 = load ptr, ptr %func, align 8
  %_outervalues16 = getelementptr inbounds %struct.SQFunctionProto, ptr %36, i32 0, i32 17
  %37 = load ptr, ptr %_outervalues16, align 8
  %38 = load i64, ptr %idx.addr, align 8
  %arrayidx17 = getelementptr inbounds %struct.SQOuterVar, ptr %37, i64 %38
  %_name = getelementptr inbounds %struct.SQOuterVar, ptr %arrayidx17, i32 0, i32 1
  %_unVal18 = getelementptr inbounds %struct.tagSQObject, ptr %_name, i32 0, i32 1
  %39 = load ptr, ptr %_unVal18, align 8
  %_val = getelementptr inbounds %struct.SQString, ptr %39, i32 0, i32 5
  %arraydecay = getelementptr inbounds [1 x i8], ptr %_val, i64 0, i64 0
  store ptr %arraydecay, ptr %retval, align 8
  br label %return

if.end19:                                         ; preds = %if.end
  %40 = load ptr, ptr %func, align 8
  %_noutervalues20 = getelementptr inbounds %struct.SQFunctionProto, ptr %40, i32 0, i32 16
  %41 = load i64, ptr %_noutervalues20, align 8
  %42 = load i64, ptr %idx.addr, align 8
  %sub21 = sub i64 %42, %41
  store i64 %sub21, ptr %idx.addr, align 8
  %43 = load ptr, ptr %func, align 8
  %44 = load ptr, ptr %v.addr, align 8
  %45 = load i64, ptr %stackbase, align 8
  %46 = load i64, ptr %idx.addr, align 8
  %47 = load ptr, ptr %ci6, align 8
  %_ip = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %47, i32 0, i32 0
  %48 = load ptr, ptr %_ip, align 8
  %49 = load ptr, ptr %func, align 8
  %_instructions = getelementptr inbounds %struct.SQFunctionProto, ptr %49, i32 0, i32 21
  %arraydecay22 = getelementptr inbounds [1 x %struct.SQInstruction], ptr %_instructions, i64 0, i64 0
  %sub.ptr.lhs.cast = ptrtoint ptr %48 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %arraydecay22 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8
  %sub23 = sub nsw i64 %sub.ptr.div, 1
  %call = call noundef ptr @_ZN15SQFunctionProto8GetLocalEP4SQVMyyy(ptr noundef nonnull align 8 dereferenceable(232) %43, ptr noundef %44, i64 noundef %45, i64 noundef %46, i64 noundef %sub23)
  store ptr %call, ptr %retval, align 8
  br label %return

if.end24:                                         ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end24, %if.end19, %if.then13, %if.then10
  %50 = load ptr, ptr %retval, align 8
  ret ptr %50
}

declare noundef ptr @_ZN15SQFunctionProto8GetLocalEP4SQVMyyy(ptr noundef nonnull align 8 dereferenceable(232), ptr noundef, i64 noundef, i64 noundef, i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_pushobject(ptr noundef %v, [2 x i64] %obj.coerce) #0 personality ptr @__gxx_personality_v0 {
entry:
  %obj = alloca %struct.tagSQObject, align 8
  %v.addr = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store [2 x i64] %obj.coerce, ptr %obj, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef nonnull align 8 dereferenceable(16) %obj)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call1 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  ret void

lpad:                                             ; preds = %entry
  %1 = landingpad { ptr, i32 }
          cleanup
  %2 = extractvalue { ptr, i32 } %1, 0
  store ptr %2, ptr %exn.slot, align 8
  %3 = extractvalue { ptr, i32 } %1, 1
  store i32 %3, ptr %ehselector.slot, align 4
  %call2 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val3 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_resetobject(ptr noundef %po) #4 {
entry:
  %po.addr = alloca ptr, align 8
  store ptr %po, ptr %po.addr, align 8
  %0 = load ptr, ptr %po.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 1
  store ptr null, ptr %_unVal, align 8
  %1 = load ptr, ptr %po.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %1, i32 0, i32 0
  store i32 16777217, ptr %_type, align 8
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_throwobject(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %0, i64 noundef -1)
  %1 = load ptr, ptr %v.addr, align 8
  %_lasterror = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 6
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %_lasterror, ptr noundef nonnull align 8 dereferenceable(16) %call)
  %2 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %2)
  ret i64 -1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_reseterror(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_lasterror = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 6
  call void @_ZN11SQObjectPtr4NullEv(ptr noundef nonnull align 8 dereferenceable(16) %_lasterror)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_getlasterror(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %_lasterror = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 6
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %_lasterror)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_reservestack(ptr noundef %v, i64 noundef %nsize) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %nsize.addr = alloca i64, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %nsize, ptr %nsize.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_top = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 2
  %1 = load i64, ptr %_top, align 8
  %2 = load i64, ptr %nsize.addr, align 8
  %add = add i64 %1, %2
  %3 = load ptr, ptr %v.addr, align 8
  %_stack = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 1
  %call = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %_stack)
  %cmp = icmp ugt i64 %add, %call
  br i1 %cmp, label %if.then, label %if.end14

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %v.addr, align 8
  %_nmetamethodscall = getelementptr inbounds %struct.SQVM, ptr %4, i32 0, i32 21
  %5 = load i64, ptr %_nmetamethodscall, align 8
  %tobool = icmp ne i64 %5, 0
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %6 = load ptr, ptr %v.addr, align 8
  %call2 = call i64 @sq_throwerror(ptr noundef %6, ptr noundef @.str.34)
  store i64 %call2, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %if.then
  %7 = load ptr, ptr %v.addr, align 8
  %_stack3 = getelementptr inbounds %struct.SQVM, ptr %7, i32 0, i32 1
  %8 = load ptr, ptr %v.addr, align 8
  %_stack4 = getelementptr inbounds %struct.SQVM, ptr %8, i32 0, i32 1
  %call5 = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %_stack4)
  %9 = load ptr, ptr %v.addr, align 8
  %_top6 = getelementptr inbounds %struct.SQVM, ptr %9, i32 0, i32 2
  %10 = load i64, ptr %_top6, align 8
  %11 = load i64, ptr %nsize.addr, align 8
  %add7 = add nsw i64 %10, %11
  %12 = load ptr, ptr %v.addr, align 8
  %_stack8 = getelementptr inbounds %struct.SQVM, ptr %12, i32 0, i32 1
  %call9 = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %_stack8)
  %sub = sub i64 %add7, %call9
  %add10 = add i64 %call5, %sub
  %call11 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
  invoke void @_ZN8sqvectorI11SQObjectPtrE6resizeEyRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %_stack3, i64 noundef %add10, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.end
  %call12 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %if.end14

lpad:                                             ; preds = %if.end
  %13 = landingpad { ptr, i32 }
          cleanup
  %14 = extractvalue { ptr, i32 } %13, 0
  store ptr %14, ptr %exn.slot, align 8
  %15 = extractvalue { ptr, i32 } %13, 1
  store i32 %15, ptr %ehselector.slot, align 4
  %call13 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

if.end14:                                         ; preds = %invoke.cont, %entry
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end14, %if.then1
  %16 = load i64, ptr %retval, align 8
  ret i64 %16

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val15 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val15
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %this) #4 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_size = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %0 = load i64, ptr %_size, align 8
  ret i64 %0
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorI11SQObjectPtrE6resizeEyRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %this, i64 noundef %newsize, ptr noundef nonnull align 8 dereferenceable(16) %fill) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %newsize.addr = alloca i64, align 8
  %fill.addr = alloca ptr, align 8
  %i = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  store i64 %newsize, ptr %newsize.addr, align 8
  store ptr %fill, ptr %fill.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load i64, ptr %newsize.addr, align 8
  %_allocated = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 2
  %1 = load i64, ptr %_allocated, align 8
  %cmp = icmp ugt i64 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i64, ptr %newsize.addr, align 8
  call void @_ZN8sqvectorI11SQObjectPtrE8_reallocEy(ptr noundef nonnull align 8 dereferenceable(24) %this1, i64 noundef %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i64, ptr %newsize.addr, align 8
  %_size = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %4 = load i64, ptr %_size, align 8
  %cmp2 = icmp ugt i64 %3, %4
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then3
  %_size4 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %5 = load i64, ptr %_size4, align 8
  %6 = load i64, ptr %newsize.addr, align 8
  %cmp5 = icmp ult i64 %5, %6
  br i1 %cmp5, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %_vals = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %7 = load ptr, ptr %_vals, align 8
  %_size6 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %8 = load i64, ptr %_size6, align 8
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %7, i64 %8
  %9 = load ptr, ptr %fill.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC1ERKS_(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx, ptr noundef nonnull align 8 dereferenceable(16) %9)
  %_size7 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %10 = load i64, ptr %_size7, align 8
  %inc = add i64 %10, 1
  store i64 %inc, ptr %_size7, align 8
  br label %while.cond, !llvm.loop !21

while.end:                                        ; preds = %while.cond
  br label %if.end15

if.else:                                          ; preds = %if.end
  %11 = load i64, ptr %newsize.addr, align 8
  store i64 %11, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.else
  %12 = load i64, ptr %i, align 8
  %_size8 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %13 = load i64, ptr %_size8, align 8
  %cmp9 = icmp ult i64 %12, %13
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %_vals10 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %14 = load ptr, ptr %_vals10, align 8
  %15 = load i64, ptr %i, align 8
  %arrayidx11 = getelementptr inbounds %struct.SQObjectPtr, ptr %14, i64 %15
  %call12 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx11) #10
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %16 = load i64, ptr %i, align 8
  %inc13 = add i64 %16, 1
  store i64 %inc13, ptr %i, align 8
  br label %for.cond, !llvm.loop !22

for.end:                                          ; preds = %for.cond
  %17 = load i64, ptr %newsize.addr, align 8
  %_size14 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  store i64 %17, ptr %_size14, align 8
  br label %if.end15

if.end15:                                         ; preds = %for.end, %while.end
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_resume(ptr noundef %v, i64 noundef %retval1, i64 noundef %raiseerror) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %retval.addr = alloca i64, align 8
  %raiseerror.addr = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %retval1, ptr %retval.addr, align 8
  store i64 %raiseerror, ptr %raiseerror.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %0, i64 noundef -1)
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %call, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %1, 134218752
  br i1 %cmp, label %if.then, label %if.end8

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM8PushNullEv(ptr noundef nonnull align 8 dereferenceable(344) %2)
  %3 = load ptr, ptr %v.addr, align 8
  %4 = load ptr, ptr %v.addr, align 8
  %call2 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %4, i64 noundef -2)
  %5 = load ptr, ptr %v.addr, align 8
  %_top = getelementptr inbounds %struct.SQVM, ptr %5, i32 0, i32 2
  %6 = load i64, ptr %_top, align 8
  %7 = load ptr, ptr %v.addr, align 8
  %call3 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %7, i64 noundef -1)
  %8 = load i64, ptr %raiseerror.addr, align 8
  %call4 = call noundef zeroext i1 @_ZN4SQVM7ExecuteER11SQObjectPtrxxS1_yNS_13ExecutionTypeE(ptr noundef nonnull align 8 dereferenceable(344) %3, ptr noundef nonnull align 8 dereferenceable(16) %call2, i64 noundef 0, i64 noundef %6, ptr noundef nonnull align 8 dereferenceable(16) %call3, i64 noundef %8, i32 noundef 1)
  br i1 %call4, label %if.end, label %if.then5

if.then5:                                         ; preds = %if.then
  %9 = load ptr, ptr %v.addr, align 8
  %10 = load ptr, ptr %v.addr, align 8
  %_lasterror = getelementptr inbounds %struct.SQVM, ptr %10, i32 0, i32 6
  call void @_ZN4SQVM11Raise_ErrorERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %9, ptr noundef nonnull align 8 dereferenceable(16) %_lasterror)
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %if.then
  %11 = load i64, ptr %retval.addr, align 8
  %tobool = icmp ne i64 %11, 0
  br i1 %tobool, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  %12 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %12)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
  store i64 0, ptr %retval, align 8
  br label %return

if.end8:                                          ; preds = %entry
  %13 = load ptr, ptr %v.addr, align 8
  %call9 = call i64 @sq_throwerror(ptr noundef %13, ptr noundef @.str.35)
  store i64 %call9, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end8, %if.end7, %if.then5
  %14 = load i64, ptr %retval, align 8
  ret i64 %14
}

declare noundef zeroext i1 @_ZN4SQVM7ExecuteER11SQObjectPtrxxS1_yNS_13ExecutionTypeE(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), i64 noundef, i64 noundef, ptr noundef nonnull align 8 dereferenceable(16), i64 noundef, i32 noundef) #1

declare void @_ZN4SQVM11Raise_ErrorERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_call(ptr noundef %v, i64 noundef %params, i64 noundef %retval1, i64 noundef %raiseerror) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %params.addr = alloca i64, align 8
  %retval.addr = alloca i64, align 8
  %raiseerror.addr = alloca i64, align 8
  %res = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %params, ptr %params.addr, align 8
  store i64 %retval1, ptr %retval.addr, align 8
  store i64 %raiseerror, ptr %raiseerror.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %res)
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %2 = load i64, ptr %params.addr, align 8
  %add = add nsw i64 %2, 1
  %sub = sub nsw i64 0, %add
  %call2 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %1, i64 noundef %sub)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %3 = load i64, ptr %params.addr, align 8
  %4 = load ptr, ptr %v.addr, align 8
  %_top = getelementptr inbounds %struct.SQVM, ptr %4, i32 0, i32 2
  %5 = load i64, ptr %_top, align 8
  %6 = load i64, ptr %params.addr, align 8
  %sub3 = sub nsw i64 %5, %6
  %7 = load i64, ptr %raiseerror.addr, align 8
  %tobool = icmp ne i64 %7, 0
  %8 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i1 true, i1 false
  %conv = zext i1 %cond to i64
  %call5 = invoke noundef zeroext i1 @_ZN4SQVM4CallER11SQObjectPtrxxS1_y(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %call2, i64 noundef %3, i64 noundef %sub3, ptr noundef nonnull align 8 dereferenceable(16) %res, i64 noundef %conv)
          to label %invoke.cont4 unwind label %lpad

invoke.cont4:                                     ; preds = %invoke.cont
  br i1 %call5, label %if.end, label %if.then

if.then:                                          ; preds = %invoke.cont4
  %9 = load ptr, ptr %v.addr, align 8
  %10 = load i64, ptr %params.addr, align 8
  invoke void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %9, i64 noundef %10)
          to label %invoke.cont6 unwind label %lpad

invoke.cont6:                                     ; preds = %if.then
  store i64 -1, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %if.then12, %if.then8, %if.then, %invoke.cont, %entry
  %11 = landingpad { ptr, i32 }
          cleanup
  %12 = extractvalue { ptr, i32 } %11, 0
  store ptr %12, ptr %exn.slot, align 8
  %13 = extractvalue { ptr, i32 } %11, 1
  store i32 %13, ptr %ehselector.slot, align 4
  %call16 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %res) #10
  br label %eh.resume

if.end:                                           ; preds = %invoke.cont4
  %14 = load ptr, ptr %v.addr, align 8
  %_suspended = getelementptr inbounds %struct.SQVM, ptr %14, i32 0, i32 23
  %15 = load i64, ptr %_suspended, align 8
  %tobool7 = icmp ne i64 %15, 0
  br i1 %tobool7, label %if.end10, label %if.then8

if.then8:                                         ; preds = %if.end
  %16 = load ptr, ptr %v.addr, align 8
  %17 = load i64, ptr %params.addr, align 8
  invoke void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %16, i64 noundef %17)
          to label %invoke.cont9 unwind label %lpad

invoke.cont9:                                     ; preds = %if.then8
  br label %if.end10

if.end10:                                         ; preds = %invoke.cont9, %if.end
  %18 = load i64, ptr %retval.addr, align 8
  %tobool11 = icmp ne i64 %18, 0
  br i1 %tobool11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end10
  %19 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %19, ptr noundef nonnull align 8 dereferenceable(16) %res)
          to label %invoke.cont13 unwind label %lpad

invoke.cont13:                                    ; preds = %if.then12
  br label %if.end14

if.end14:                                         ; preds = %invoke.cont13, %if.end10
  store i64 0, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %if.end14, %invoke.cont6
  %call15 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %res) #10
  %20 = load i64, ptr %retval, align 8
  ret i64 %20

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val17 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val17
}

declare noundef zeroext i1 @_ZN4SQVM4CallER11SQObjectPtrxxS1_y(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), i64 noundef, i64 noundef, ptr noundef nonnull align 8 dereferenceable(16), i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_tailcall(ptr noundef %v, i64 noundef %nparams) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %nparams.addr = alloca i64, align 8
  %res = alloca ptr, align 8
  %clo = alloca ptr, align 8
  %stackbase = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %nparams, ptr %nparams.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %nparams.addr, align 8
  %add = add nsw i64 %1, 1
  %sub = sub nsw i64 0, %add
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %0, i64 noundef %sub)
  store ptr %call, ptr %res, align 8
  %2 = load ptr, ptr %res, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %cmp = icmp ne i32 %3, 134217984
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %v.addr, align 8
  %call1 = call i64 @sq_throwerror(ptr noundef %4, ptr noundef @.str.36)
  store i64 %call1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %res, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %_unVal, align 8
  store ptr %6, ptr %clo, align 8
  %7 = load ptr, ptr %clo, align 8
  %_function = getelementptr inbounds %struct.SQClosure, ptr %7, i32 0, i32 4
  %8 = load ptr, ptr %_function, align 8
  %_bgenerator = getelementptr inbounds %struct.SQFunctionProto, ptr %8, i32 0, i32 4
  %9 = load i8, ptr %_bgenerator, align 8
  %tobool = trunc i8 %9 to i1
  br i1 %tobool, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %10 = load ptr, ptr %v.addr, align 8
  %call3 = call i64 @sq_throwerror(ptr noundef %10, ptr noundef @.str.37)
  store i64 %call3, ptr %retval, align 8
  br label %return

if.end4:                                          ; preds = %if.end
  %11 = load ptr, ptr %v.addr, align 8
  %_top = getelementptr inbounds %struct.SQVM, ptr %11, i32 0, i32 2
  %12 = load i64, ptr %_top, align 8
  %13 = load i64, ptr %nparams.addr, align 8
  %sub5 = sub nsw i64 %12, %13
  %14 = load ptr, ptr %v.addr, align 8
  %_stackbase = getelementptr inbounds %struct.SQVM, ptr %14, i32 0, i32 3
  %15 = load i64, ptr %_stackbase, align 8
  %sub6 = sub nsw i64 %sub5, %15
  store i64 %sub6, ptr %stackbase, align 8
  %16 = load ptr, ptr %v.addr, align 8
  %17 = load ptr, ptr %clo, align 8
  %18 = load i64, ptr %stackbase, align 8
  %19 = load i64, ptr %nparams.addr, align 8
  %call7 = call noundef zeroext i1 @_ZN4SQVM8TailCallEP9SQClosurexx(ptr noundef nonnull align 8 dereferenceable(344) %16, ptr noundef %17, i64 noundef %18, i64 noundef %19)
  br i1 %call7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.end4
  store i64 -1, ptr %retval, align 8
  br label %return

if.end9:                                          ; preds = %if.end4
  store i64 -777, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end9, %if.then8, %if.then2, %if.then
  %20 = load i64, ptr %retval, align 8
  ret i64 %20
}

declare noundef zeroext i1 @_ZN4SQVM8TailCallEP9SQClosurexx(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef, i64 noundef, i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_suspendvm(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call noundef i64 @_ZN4SQVM7SuspendEv(ptr noundef nonnull align 8 dereferenceable(344) %0)
  ret i64 %call
}

declare noundef i64 @_ZN4SQVM7SuspendEv(ptr noundef nonnull align 8 dereferenceable(344)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_wakeupvm(ptr noundef %v, i64 noundef %wakeupret, i64 noundef %retval1, i64 noundef %raiseerror, i64 noundef %throwerror) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %wakeupret.addr = alloca i64, align 8
  %retval.addr = alloca i64, align 8
  %raiseerror.addr = alloca i64, align 8
  %throwerror.addr = alloca i64, align 8
  %ret = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  %target = alloca i64, align 8
  %dummy = alloca %struct.SQObjectPtr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %wakeupret, ptr %wakeupret.addr, align 8
  store i64 %retval1, ptr %retval.addr, align 8
  store i64 %raiseerror, ptr %raiseerror.addr, align 8
  store i64 %throwerror, ptr %throwerror.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ret)
  %0 = load ptr, ptr %v.addr, align 8
  %_suspended = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 23
  %1 = load i64, ptr %_suspended, align 8
  %tobool = icmp ne i64 %1, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %call2 = invoke i64 @sq_throwerror(ptr noundef %2, ptr noundef @.str.38)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then
  store i64 %call2, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup39

lpad:                                             ; preds = %if.end24, %invoke.cont20, %if.then16, %if.end13, %invoke.cont9, %invoke.cont6, %if.then5, %if.then
  %3 = landingpad { ptr, i32 }
          cleanup
  %4 = extractvalue { ptr, i32 } %3, 0
  store ptr %4, ptr %exn.slot, align 8
  %5 = extractvalue { ptr, i32 } %3, 1
  store i32 %5, ptr %ehselector.slot, align 4
  br label %ehcleanup

if.end:                                           ; preds = %entry
  %6 = load ptr, ptr %v.addr, align 8
  %_suspended_target = getelementptr inbounds %struct.SQVM, ptr %6, i32 0, i32 25
  %7 = load i64, ptr %_suspended_target, align 8
  store i64 %7, ptr %target, align 8
  %8 = load i64, ptr %wakeupret.addr, align 8
  %tobool3 = icmp ne i64 %8, 0
  br i1 %tobool3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  %9 = load i64, ptr %target, align 8
  %cmp = icmp ne i64 %9, -1
  br i1 %cmp, label %if.then5, label %if.end13

if.then5:                                         ; preds = %if.then4
  %10 = load ptr, ptr %v.addr, align 8
  %call7 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetUpEx(ptr noundef nonnull align 8 dereferenceable(344) %10, i64 noundef -1)
          to label %invoke.cont6 unwind label %lpad

invoke.cont6:                                     ; preds = %if.then5
  %11 = load ptr, ptr %v.addr, align 8
  %12 = load ptr, ptr %v.addr, align 8
  %_stackbase = getelementptr inbounds %struct.SQVM, ptr %12, i32 0, i32 3
  %13 = load i64, ptr %_stackbase, align 8
  %14 = load ptr, ptr %v.addr, align 8
  %_suspended_target8 = getelementptr inbounds %struct.SQVM, ptr %14, i32 0, i32 25
  %15 = load i64, ptr %_suspended_target8, align 8
  %add = add nsw i64 %13, %15
  %call10 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetAtEx(ptr noundef nonnull align 8 dereferenceable(344) %11, i64 noundef %add)
          to label %invoke.cont9 unwind label %lpad

invoke.cont9:                                     ; preds = %invoke.cont6
  %call12 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %call10, ptr noundef nonnull align 8 dereferenceable(16) %call7)
          to label %invoke.cont11 unwind label %lpad

invoke.cont11:                                    ; preds = %invoke.cont9
  br label %if.end13

if.end13:                                         ; preds = %invoke.cont11, %if.then4
  %16 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %16)
          to label %invoke.cont14 unwind label %lpad

invoke.cont14:                                    ; preds = %if.end13
  br label %if.end24

if.else:                                          ; preds = %if.end
  %17 = load i64, ptr %target, align 8
  %cmp15 = icmp ne i64 %17, -1
  br i1 %cmp15, label %if.then16, label %if.end23

if.then16:                                        ; preds = %if.else
  %18 = load ptr, ptr %v.addr, align 8
  %19 = load ptr, ptr %v.addr, align 8
  %_stackbase17 = getelementptr inbounds %struct.SQVM, ptr %19, i32 0, i32 3
  %20 = load i64, ptr %_stackbase17, align 8
  %21 = load ptr, ptr %v.addr, align 8
  %_suspended_target18 = getelementptr inbounds %struct.SQVM, ptr %21, i32 0, i32 25
  %22 = load i64, ptr %_suspended_target18, align 8
  %add19 = add nsw i64 %20, %22
  %call21 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetAtEx(ptr noundef nonnull align 8 dereferenceable(344) %18, i64 noundef %add19)
          to label %invoke.cont20 unwind label %lpad

invoke.cont20:                                    ; preds = %if.then16
  invoke void @_ZN11SQObjectPtr4NullEv(ptr noundef nonnull align 8 dereferenceable(16) %call21)
          to label %invoke.cont22 unwind label %lpad

invoke.cont22:                                    ; preds = %invoke.cont20
  br label %if.end23

if.end23:                                         ; preds = %invoke.cont22, %if.else
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %invoke.cont14
  %call26 = invoke noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %dummy)
          to label %invoke.cont25 unwind label %lpad

invoke.cont25:                                    ; preds = %if.end24
  %23 = load ptr, ptr %v.addr, align 8
  %24 = load i64, ptr %raiseerror.addr, align 8
  %25 = load i64, ptr %throwerror.addr, align 8
  %tobool27 = icmp ne i64 %25, 0
  %26 = zext i1 %tobool27 to i64
  %cond = select i1 %tobool27, i32 3, i32 2
  %call30 = invoke noundef zeroext i1 @_ZN4SQVM7ExecuteER11SQObjectPtrxxS1_yNS_13ExecutionTypeE(ptr noundef nonnull align 8 dereferenceable(344) %23, ptr noundef nonnull align 8 dereferenceable(16) %dummy, i64 noundef -1, i64 noundef -1, ptr noundef nonnull align 8 dereferenceable(16) %ret, i64 noundef %24, i32 noundef %cond)
          to label %invoke.cont29 unwind label %lpad28

invoke.cont29:                                    ; preds = %invoke.cont25
  br i1 %call30, label %if.end32, label %if.then31

if.then31:                                        ; preds = %invoke.cont29
  store i64 -1, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

lpad28:                                           ; preds = %if.then34, %invoke.cont25
  %27 = landingpad { ptr, i32 }
          cleanup
  %28 = extractvalue { ptr, i32 } %27, 0
  store ptr %28, ptr %exn.slot, align 8
  %29 = extractvalue { ptr, i32 } %27, 1
  store i32 %29, ptr %ehselector.slot, align 4
  %call38 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %dummy) #10
  br label %ehcleanup

if.end32:                                         ; preds = %invoke.cont29
  %30 = load i64, ptr %retval.addr, align 8
  %tobool33 = icmp ne i64 %30, 0
  br i1 %tobool33, label %if.then34, label %if.end36

if.then34:                                        ; preds = %if.end32
  %31 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %31, ptr noundef nonnull align 8 dereferenceable(16) %ret)
          to label %invoke.cont35 unwind label %lpad28

invoke.cont35:                                    ; preds = %if.then34
  br label %if.end36

if.end36:                                         ; preds = %invoke.cont35, %if.end32
  store i64 0, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %if.end36, %if.then31
  %call37 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %dummy) #10
  br label %cleanup39

cleanup39:                                        ; preds = %cleanup, %invoke.cont
  %call40 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ret) #10
  %32 = load i64, ptr %retval, align 8
  ret i64 %32

ehcleanup:                                        ; preds = %lpad28, %lpad
  %call41 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ret) #10
  br label %eh.resume

eh.resume:                                        ; preds = %ehcleanup
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val42 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val42
}

declare noundef nonnull align 8 dereferenceable(16) ptr @_ZN4SQVM5GetAtEx(ptr noundef nonnull align 8 dereferenceable(344), i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_setreleasehook(ptr noundef %v, i64 noundef %idx, ptr noundef %hook) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %hook.addr = alloca ptr, align 8
  %ud = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %hook, ptr %hook.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %ud, align 8
  %2 = load ptr, ptr %ud, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  switch i32 %3, label %sw.default [
    i32 167772288, label %sw.bb
    i32 167804928, label %sw.bb1
    i32 134234112, label %sw.bb4
  ]

sw.bb:                                            ; preds = %entry
  %4 = load ptr, ptr %hook.addr, align 8
  %5 = load ptr, ptr %ud, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %_unVal, align 8
  %_hook = getelementptr inbounds %struct.SQUserData, ptr %6, i32 0, i32 2
  store ptr %4, ptr %_hook, align 8
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %7 = load ptr, ptr %hook.addr, align 8
  %8 = load ptr, ptr %ud, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %8, i32 0, i32 1
  %9 = load ptr, ptr %_unVal2, align 8
  %_hook3 = getelementptr inbounds %struct.SQInstance, ptr %9, i32 0, i32 3
  store ptr %7, ptr %_hook3, align 8
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  %10 = load ptr, ptr %hook.addr, align 8
  %11 = load ptr, ptr %ud, align 8
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %11, i32 0, i32 1
  %12 = load ptr, ptr %_unVal5, align 8
  %_hook6 = getelementptr inbounds %struct.SQClass, ptr %12, i32 0, i32 8
  store ptr %10, ptr %_hook6, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb4, %sw.bb1, %sw.bb
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_getreleasehook(ptr noundef %v, i64 noundef %idx) #0 {
entry:
  %retval = alloca ptr, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %ud = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %ud, align 8
  %2 = load ptr, ptr %ud, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  switch i32 %3, label %sw.default [
    i32 167772288, label %sw.bb
    i32 167804928, label %sw.bb1
    i32 134234112, label %sw.bb4
  ]

sw.bb:                                            ; preds = %entry
  %4 = load ptr, ptr %ud, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %5 = load ptr, ptr %_unVal, align 8
  %_hook = getelementptr inbounds %struct.SQUserData, ptr %5, i32 0, i32 2
  %6 = load ptr, ptr %_hook, align 8
  store ptr %6, ptr %retval, align 8
  br label %return

sw.bb1:                                           ; preds = %entry
  %7 = load ptr, ptr %ud, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 1
  %8 = load ptr, ptr %_unVal2, align 8
  %_hook3 = getelementptr inbounds %struct.SQInstance, ptr %8, i32 0, i32 3
  %9 = load ptr, ptr %_hook3, align 8
  store ptr %9, ptr %retval, align 8
  br label %return

sw.bb4:                                           ; preds = %entry
  %10 = load ptr, ptr %ud, align 8
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %10, i32 0, i32 1
  %11 = load ptr, ptr %_unVal5, align 8
  %_hook6 = getelementptr inbounds %struct.SQClass, ptr %11, i32 0, i32 8
  %12 = load ptr, ptr %_hook6, align 8
  store ptr %12, ptr %retval, align 8
  br label %return

sw.default:                                       ; preds = %entry
  store ptr null, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.default, %sw.bb4, %sw.bb1, %sw.bb
  %13 = load ptr, ptr %retval, align 8
  ret ptr %13
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_setcompilererrorhandler(ptr noundef %v, ptr noundef %f) #4 {
entry:
  %v.addr = alloca ptr, align 8
  %f.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store ptr %f, ptr %f.addr, align 8
  %0 = load ptr, ptr %f.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 19
  %2 = load ptr, ptr %_sharedstate, align 8
  %_compilererrorhandler = getelementptr inbounds %struct.SQSharedState, ptr %2, i32 0, i32 21
  store ptr %0, ptr %_compilererrorhandler, align 8
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_writeclosure(ptr noundef %v, ptr noundef %w, ptr noundef %up) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %w.addr = alloca ptr, align 8
  %up.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  %tag = alloca i16, align 2
  store ptr %v, ptr %v.addr, align 8
  store ptr %w, ptr %w.addr, align 8
  store ptr %up, ptr %up.addr, align 8
  store ptr null, ptr %o, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %call = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %0, i64 noundef -1, i32 noundef 134217984, ptr noundef %o)
  br i1 %call, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  store i16 -1286, ptr %tag, align 2
  %1 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %1, i32 0, i32 1
  %2 = load ptr, ptr %_unVal, align 8
  %_function = getelementptr inbounds %struct.SQClosure, ptr %2, i32 0, i32 4
  %3 = load ptr, ptr %_function, align 8
  %_noutervalues = getelementptr inbounds %struct.SQFunctionProto, ptr %3, i32 0, i32 16
  %4 = load i64, ptr %_noutervalues, align 8
  %tobool = icmp ne i64 %4, 0
  br i1 %tobool, label %if.then1, label %if.end3

if.then1:                                         ; preds = %if.end
  %5 = load ptr, ptr %v.addr, align 8
  %call2 = call i64 @sq_throwerror(ptr noundef %5, ptr noundef @.str.39)
  store i64 %call2, ptr %retval, align 8
  br label %return

if.end3:                                          ; preds = %if.end
  %6 = load ptr, ptr %w.addr, align 8
  %7 = load ptr, ptr %up.addr, align 8
  %call4 = call noundef i64 %6(ptr noundef %7, ptr noundef %tag, i64 noundef 2)
  %cmp = icmp ne i64 %call4, 2
  br i1 %cmp, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end3
  %8 = load ptr, ptr %v.addr, align 8
  %call6 = call i64 @sq_throwerror(ptr noundef %8, ptr noundef @.str.40)
  store i64 %call6, ptr %retval, align 8
  br label %return

if.end7:                                          ; preds = %if.end3
  %9 = load ptr, ptr %o, align 8
  %_unVal8 = getelementptr inbounds %struct.tagSQObject, ptr %9, i32 0, i32 1
  %10 = load ptr, ptr %_unVal8, align 8
  %11 = load ptr, ptr %v.addr, align 8
  %12 = load ptr, ptr %up.addr, align 8
  %13 = load ptr, ptr %w.addr, align 8
  %call9 = call noundef zeroext i1 @_ZN9SQClosure4SaveEP4SQVMPvPFxS2_S2_xE(ptr noundef nonnull align 8 dereferenceable(96) %10, ptr noundef %11, ptr noundef %12, ptr noundef %13)
  br i1 %call9, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.end7
  store i64 -1, ptr %retval, align 8
  br label %return

if.end11:                                         ; preds = %if.end7
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end11, %if.then10, %if.then5, %if.then1, %if.then
  %14 = load i64, ptr %retval, align 8
  ret i64 %14
}

declare noundef zeroext i1 @_ZN9SQClosure4SaveEP4SQVMPvPFxS2_S2_xE(ptr noundef nonnull align 8 dereferenceable(96), ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_readclosure(ptr noundef %v, ptr noundef %r, ptr noundef %up) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %r.addr = alloca ptr, align 8
  %up.addr = alloca ptr, align 8
  %closure = alloca %struct.SQObjectPtr, align 8
  %tag = alloca i16, align 2
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store ptr %r, ptr %r.addr, align 8
  store ptr %up, ptr %up.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %closure)
  %0 = load ptr, ptr %r.addr, align 8
  %1 = load ptr, ptr %up.addr, align 8
  %call1 = invoke noundef i64 %0(ptr noundef %1, ptr noundef %tag, i64 noundef 2)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %cmp = icmp ne i64 %call1, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %invoke.cont
  %2 = load ptr, ptr %v.addr, align 8
  %call3 = invoke i64 @sq_throwerror(ptr noundef %2, ptr noundef @.str.40)
          to label %invoke.cont2 unwind label %lpad

invoke.cont2:                                     ; preds = %if.then
  store i64 %call3, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %if.end12, %if.end8, %if.then5, %if.then, %entry
  %3 = landingpad { ptr, i32 }
          cleanup
  %4 = extractvalue { ptr, i32 } %3, 0
  store ptr %4, ptr %exn.slot, align 8
  %5 = extractvalue { ptr, i32 } %3, 1
  store i32 %5, ptr %ehselector.slot, align 4
  %call15 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %closure) #10
  br label %eh.resume

if.end:                                           ; preds = %invoke.cont
  %6 = load i16, ptr %tag, align 2
  %conv = zext i16 %6 to i32
  %cmp4 = icmp ne i32 %conv, 64250
  br i1 %cmp4, label %if.then5, label %if.end8

if.then5:                                         ; preds = %if.end
  %7 = load ptr, ptr %v.addr, align 8
  %call7 = invoke i64 @sq_throwerror(ptr noundef %7, ptr noundef @.str.41)
          to label %invoke.cont6 unwind label %lpad

invoke.cont6:                                     ; preds = %if.then5
  store i64 %call7, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

if.end8:                                          ; preds = %if.end
  %8 = load ptr, ptr %v.addr, align 8
  %9 = load ptr, ptr %up.addr, align 8
  %10 = load ptr, ptr %r.addr, align 8
  %call10 = invoke noundef zeroext i1 @_ZN9SQClosure4LoadEP4SQVMPvPFxS2_S2_xER11SQObjectPtr(ptr noundef %8, ptr noundef %9, ptr noundef %10, ptr noundef nonnull align 8 dereferenceable(16) %closure)
          to label %invoke.cont9 unwind label %lpad

invoke.cont9:                                     ; preds = %if.end8
  br i1 %call10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %invoke.cont9
  store i64 -1, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

if.end12:                                         ; preds = %invoke.cont9
  %11 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %11, ptr noundef nonnull align 8 dereferenceable(16) %closure)
          to label %invoke.cont13 unwind label %lpad

invoke.cont13:                                    ; preds = %if.end12
  store i64 0, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %invoke.cont13, %if.then11, %invoke.cont6, %invoke.cont2
  %call14 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %closure) #10
  %12 = load i64, ptr %retval, align 8
  ret i64 %12

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val16 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val16
}

declare noundef zeroext i1 @_ZN9SQClosure4LoadEP4SQVMPvPFxS2_S2_xER11SQObjectPtr(ptr noundef, ptr noundef, ptr noundef, ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_getscratchpad(ptr noundef %v, i64 noundef %minsize) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %minsize.addr = alloca i64, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %minsize, ptr %minsize.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 19
  %1 = load ptr, ptr %_sharedstate, align 8
  %2 = load i64, ptr %minsize.addr, align 8
  %call = call noundef ptr @_ZN13SQSharedState13GetScratchPadEx(ptr noundef nonnull align 8 dereferenceable(384) %1, i64 noundef %2)
  ret ptr %call
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_resurrectunreachable(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 19
  %1 = load ptr, ptr %_sharedstate, align 8
  %2 = load ptr, ptr %v.addr, align 8
  %call = call noundef i64 @_ZN13SQSharedState20ResurrectUnreachableEP4SQVM(ptr noundef nonnull align 8 dereferenceable(384) %1, ptr noundef %2)
  ret i64 0
}

declare noundef i64 @_ZN13SQSharedState20ResurrectUnreachableEP4SQVM(ptr noundef nonnull align 8 dereferenceable(384), ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_collectgarbage(ptr noundef %v) #0 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 19
  %1 = load ptr, ptr %_sharedstate, align 8
  %2 = load ptr, ptr %v.addr, align 8
  %call = call noundef i64 @_ZN13SQSharedState14CollectGarbageEP4SQVM(ptr noundef nonnull align 8 dereferenceable(384) %1, ptr noundef %2)
  ret i64 %call
}

declare noundef i64 @_ZN13SQSharedState14CollectGarbageEP4SQVM(ptr noundef nonnull align 8 dereferenceable(384), ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getcallee(ptr noundef %v) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_callsstacksize = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 13
  %1 = load i64, ptr %_callsstacksize, align 8
  %cmp = icmp sgt i64 %1, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load ptr, ptr %v.addr, align 8
  %_callsstack = getelementptr inbounds %struct.SQVM, ptr %3, i32 0, i32 12
  %4 = load ptr, ptr %_callsstack, align 8
  %5 = load ptr, ptr %v.addr, align 8
  %_callsstacksize1 = getelementptr inbounds %struct.SQVM, ptr %5, i32 0, i32 13
  %6 = load i64, ptr %_callsstacksize1, align 8
  %sub = sub nsw i64 %6, 2
  %arrayidx = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %4, i64 %sub
  %_closure = getelementptr inbounds %"struct.SQVM::CallInfo", ptr %arrayidx, i32 0, i32 2
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %2, ptr noundef nonnull align 8 dereferenceable(16) %_closure)
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %7 = load ptr, ptr %v.addr, align 8
  %call = call i64 @sq_throwerror(ptr noundef %7, ptr noundef @.str.42)
  store i64 %call, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %8 = load i64, ptr %retval, align 8
  ret i64 %8
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_getfreevariable(ptr noundef %v, i64 noundef %idx, i64 noundef %nval) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %nval.addr = alloca i64, align 8
  %self = alloca ptr, align 8
  %name = alloca ptr, align 8
  %clo = alloca ptr, align 8
  %fp = alloca ptr, align 8
  %ov = alloca ptr, align 8
  %clo6 = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store i64 %nval, ptr %nval.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %self, align 8
  store ptr null, ptr %name, align 8
  %2 = load ptr, ptr %self, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  switch i32 %3, label %sw.default [
    i32 134217984, label %sw.bb
    i32 134218240, label %sw.bb5
  ]

sw.bb:                                            ; preds = %entry
  %4 = load ptr, ptr %self, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %5 = load ptr, ptr %_unVal, align 8
  store ptr %5, ptr %clo, align 8
  %6 = load ptr, ptr %clo, align 8
  %_function = getelementptr inbounds %struct.SQClosure, ptr %6, i32 0, i32 4
  %7 = load ptr, ptr %_function, align 8
  store ptr %7, ptr %fp, align 8
  %8 = load ptr, ptr %fp, align 8
  %_noutervalues = getelementptr inbounds %struct.SQFunctionProto, ptr %8, i32 0, i32 16
  %9 = load i64, ptr %_noutervalues, align 8
  %10 = load i64, ptr %nval.addr, align 8
  %cmp = icmp ugt i64 %9, %10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb
  %11 = load ptr, ptr %v.addr, align 8
  %12 = load ptr, ptr %clo, align 8
  %_outervalues = getelementptr inbounds %struct.SQClosure, ptr %12, i32 0, i32 5
  %13 = load ptr, ptr %_outervalues, align 8
  %14 = load i64, ptr %nval.addr, align 8
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %13, i64 %14
  %_unVal1 = getelementptr inbounds %struct.tagSQObject, ptr %arrayidx, i32 0, i32 1
  %15 = load ptr, ptr %_unVal1, align 8
  %_valptr = getelementptr inbounds %struct.SQOuter, ptr %15, i32 0, i32 1
  %16 = load ptr, ptr %_valptr, align 8
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %11, ptr noundef nonnull align 8 dereferenceable(16) %16)
  %17 = load ptr, ptr %fp, align 8
  %_outervalues2 = getelementptr inbounds %struct.SQFunctionProto, ptr %17, i32 0, i32 17
  %18 = load ptr, ptr %_outervalues2, align 8
  %19 = load i64, ptr %nval.addr, align 8
  %arrayidx3 = getelementptr inbounds %struct.SQOuterVar, ptr %18, i64 %19
  store ptr %arrayidx3, ptr %ov, align 8
  %20 = load ptr, ptr %ov, align 8
  %_name = getelementptr inbounds %struct.SQOuterVar, ptr %20, i32 0, i32 1
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %_name, i32 0, i32 1
  %21 = load ptr, ptr %_unVal4, align 8
  %_val = getelementptr inbounds %struct.SQString, ptr %21, i32 0, i32 5
  %arraydecay = getelementptr inbounds [1 x i8], ptr %_val, i64 0, i64 0
  store ptr %arraydecay, ptr %name, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %sw.bb
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %22 = load ptr, ptr %self, align 8
  %_unVal7 = getelementptr inbounds %struct.tagSQObject, ptr %22, i32 0, i32 1
  %23 = load ptr, ptr %_unVal7, align 8
  store ptr %23, ptr %clo6, align 8
  %24 = load ptr, ptr %clo6, align 8
  %_noutervalues8 = getelementptr inbounds %struct.SQNativeClosure, ptr %24, i32 0, i32 4
  %25 = load i64, ptr %_noutervalues8, align 8
  %26 = load i64, ptr %nval.addr, align 8
  %cmp9 = icmp ugt i64 %25, %26
  br i1 %cmp9, label %if.then10, label %if.end13

if.then10:                                        ; preds = %sw.bb5
  %27 = load ptr, ptr %v.addr, align 8
  %28 = load ptr, ptr %clo6, align 8
  %_outervalues11 = getelementptr inbounds %struct.SQNativeClosure, ptr %28, i32 0, i32 3
  %29 = load ptr, ptr %_outervalues11, align 8
  %30 = load i64, ptr %nval.addr, align 8
  %arrayidx12 = getelementptr inbounds %struct.SQObjectPtr, ptr %29, i64 %30
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %27, ptr noundef nonnull align 8 dereferenceable(16) %arrayidx12)
  store ptr @.str.43, ptr %name, align 8
  br label %if.end13

if.end13:                                         ; preds = %if.then10, %sw.bb5
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %if.end13, %if.end
  %31 = load ptr, ptr %name, align 8
  ret ptr %31
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setfreevariable(ptr noundef %v, i64 noundef %idx, i64 noundef %nval) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %nval.addr = alloca i64, align 8
  %self = alloca ptr, align 8
  %fp = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store i64 %nval, ptr %nval.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %self, align 8
  %2 = load ptr, ptr %self, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  switch i32 %3, label %sw.default [
    i32 134217984, label %sw.bb
    i32 134218240, label %sw.bb6
  ]

sw.bb:                                            ; preds = %entry
  %4 = load ptr, ptr %self, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 1
  %5 = load ptr, ptr %_unVal, align 8
  %_function = getelementptr inbounds %struct.SQClosure, ptr %5, i32 0, i32 4
  %6 = load ptr, ptr %_function, align 8
  store ptr %6, ptr %fp, align 8
  %7 = load ptr, ptr %fp, align 8
  %_noutervalues = getelementptr inbounds %struct.SQFunctionProto, ptr %7, i32 0, i32 16
  %8 = load i64, ptr %_noutervalues, align 8
  %9 = load i64, ptr %nval.addr, align 8
  %cmp = icmp ugt i64 %8, %9
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %sw.bb
  %10 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %10, i64 noundef -1)
  %11 = load ptr, ptr %self, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %11, i32 0, i32 1
  %12 = load ptr, ptr %_unVal2, align 8
  %_outervalues = getelementptr inbounds %struct.SQClosure, ptr %12, i32 0, i32 5
  %13 = load ptr, ptr %_outervalues, align 8
  %14 = load i64, ptr %nval.addr, align 8
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %13, i64 %14
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %arrayidx, i32 0, i32 1
  %15 = load ptr, ptr %_unVal3, align 8
  %_valptr = getelementptr inbounds %struct.SQOuter, ptr %15, i32 0, i32 1
  %16 = load ptr, ptr %_valptr, align 8
  %call4 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %16, ptr noundef nonnull align 8 dereferenceable(16) %call1)
  br label %if.end

if.else:                                          ; preds = %sw.bb
  %17 = load ptr, ptr %v.addr, align 8
  %call5 = call i64 @sq_throwerror(ptr noundef %17, ptr noundef @.str.44)
  store i64 %call5, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %if.then
  br label %sw.epilog

sw.bb6:                                           ; preds = %entry
  %18 = load ptr, ptr %self, align 8
  %_unVal7 = getelementptr inbounds %struct.tagSQObject, ptr %18, i32 0, i32 1
  %19 = load ptr, ptr %_unVal7, align 8
  %_noutervalues8 = getelementptr inbounds %struct.SQNativeClosure, ptr %19, i32 0, i32 4
  %20 = load i64, ptr %_noutervalues8, align 8
  %21 = load i64, ptr %nval.addr, align 8
  %cmp9 = icmp ugt i64 %20, %21
  br i1 %cmp9, label %if.then10, label %if.else16

if.then10:                                        ; preds = %sw.bb6
  %22 = load ptr, ptr %v.addr, align 8
  %call11 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %22, i64 noundef -1)
  %23 = load ptr, ptr %self, align 8
  %_unVal12 = getelementptr inbounds %struct.tagSQObject, ptr %23, i32 0, i32 1
  %24 = load ptr, ptr %_unVal12, align 8
  %_outervalues13 = getelementptr inbounds %struct.SQNativeClosure, ptr %24, i32 0, i32 3
  %25 = load ptr, ptr %_outervalues13, align 8
  %26 = load i64, ptr %nval.addr, align 8
  %arrayidx14 = getelementptr inbounds %struct.SQObjectPtr, ptr %25, i64 %26
  %call15 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx14, ptr noundef nonnull align 8 dereferenceable(16) %call11)
  br label %if.end18

if.else16:                                        ; preds = %sw.bb6
  %27 = load ptr, ptr %v.addr, align 8
  %call17 = call i64 @sq_throwerror(ptr noundef %27, ptr noundef @.str.44)
  store i64 %call17, ptr %retval, align 8
  br label %return

if.end18:                                         ; preds = %if.then10
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %28 = load ptr, ptr %v.addr, align 8
  %29 = load ptr, ptr %self, align 8
  %_type19 = getelementptr inbounds %struct.tagSQObject, ptr %29, i32 0, i32 0
  %30 = load i32, ptr %_type19, align 8
  %call20 = call noundef i64 @_Z18sq_aux_invalidtypeP4SQVM15tagSQObjectType(ptr noundef %28, i32 noundef %30)
  store i64 %call20, ptr %retval, align 8
  br label %return

sw.epilog:                                        ; preds = %if.end18, %if.end
  %31 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %31)
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.epilog, %sw.default, %if.else16, %if.else
  %32 = load i64, ptr %retval, align 8
  ret i64 %32
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setattributes(ptr noundef %v, i64 noundef %idx) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  %key = alloca ptr, align 8
  %val = alloca ptr, align 8
  %attrs = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr null, ptr %o, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %0, i64 noundef %1, i32 noundef 134234112, ptr noundef %o)
  br i1 %call, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %2, i64 noundef -2)
  store ptr %call1, ptr %key, align 8
  %3 = load ptr, ptr %v.addr, align 8
  %call2 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %3, i64 noundef -1)
  store ptr %call2, ptr %val, align 8
  %call3 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %attrs)
  %4 = load ptr, ptr %key, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %4, i32 0, i32 0
  %5 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %5, 16777217
  br i1 %cmp, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  %6 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %7 = load ptr, ptr %_unVal, align 8
  %_attributes = getelementptr inbounds %struct.SQClass, ptr %7, i32 0, i32 6
  %call5 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %attrs, ptr noundef nonnull align 8 dereferenceable(16) %_attributes)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then4
  %8 = load ptr, ptr %val, align 8
  %9 = load ptr, ptr %o, align 8
  %_unVal6 = getelementptr inbounds %struct.tagSQObject, ptr %9, i32 0, i32 1
  %10 = load ptr, ptr %_unVal6, align 8
  %_attributes7 = getelementptr inbounds %struct.SQClass, ptr %10, i32 0, i32 6
  %call9 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %_attributes7, ptr noundef nonnull align 8 dereferenceable(16) %8)
          to label %invoke.cont8 unwind label %lpad

invoke.cont8:                                     ; preds = %invoke.cont
  %11 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %11, i64 noundef 2)
          to label %invoke.cont10 unwind label %lpad

invoke.cont10:                                    ; preds = %invoke.cont8
  %12 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %12, ptr noundef nonnull align 8 dereferenceable(16) %attrs)
          to label %invoke.cont11 unwind label %lpad

invoke.cont11:                                    ; preds = %invoke.cont10
  store i64 0, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %if.end22, %invoke.cont19, %invoke.cont17, %if.then15, %if.else, %invoke.cont10, %invoke.cont8, %invoke.cont, %if.then4
  %13 = landingpad { ptr, i32 }
          cleanup
  %14 = extractvalue { ptr, i32 } %13, 0
  store ptr %14, ptr %exn.slot, align 8
  %15 = extractvalue { ptr, i32 } %13, 1
  store i32 %15, ptr %ehselector.slot, align 4
  %call26 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %attrs) #10
  br label %eh.resume

if.else:                                          ; preds = %if.end
  %16 = load ptr, ptr %o, align 8
  %_unVal12 = getelementptr inbounds %struct.tagSQObject, ptr %16, i32 0, i32 1
  %17 = load ptr, ptr %_unVal12, align 8
  %18 = load ptr, ptr %key, align 8
  %call14 = invoke noundef zeroext i1 @_ZN7SQClass13GetAttributesERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(456) %17, ptr noundef nonnull align 8 dereferenceable(16) %18, ptr noundef nonnull align 8 dereferenceable(16) %attrs)
          to label %invoke.cont13 unwind label %lpad

invoke.cont13:                                    ; preds = %if.else
  br i1 %call14, label %if.then15, label %if.end21

if.then15:                                        ; preds = %invoke.cont13
  %19 = load ptr, ptr %o, align 8
  %_unVal16 = getelementptr inbounds %struct.tagSQObject, ptr %19, i32 0, i32 1
  %20 = load ptr, ptr %_unVal16, align 8
  %21 = load ptr, ptr %key, align 8
  %22 = load ptr, ptr %val, align 8
  %call18 = invoke noundef zeroext i1 @_ZN7SQClass13SetAttributesERK11SQObjectPtrS2_(ptr noundef nonnull align 8 dereferenceable(456) %20, ptr noundef nonnull align 8 dereferenceable(16) %21, ptr noundef nonnull align 8 dereferenceable(16) %22)
          to label %invoke.cont17 unwind label %lpad

invoke.cont17:                                    ; preds = %if.then15
  %23 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM3PopEx(ptr noundef nonnull align 8 dereferenceable(344) %23, i64 noundef 2)
          to label %invoke.cont19 unwind label %lpad

invoke.cont19:                                    ; preds = %invoke.cont17
  %24 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %24, ptr noundef nonnull align 8 dereferenceable(16) %attrs)
          to label %invoke.cont20 unwind label %lpad

invoke.cont20:                                    ; preds = %invoke.cont19
  store i64 0, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

if.end21:                                         ; preds = %invoke.cont13
  br label %if.end22

if.end22:                                         ; preds = %if.end21
  %25 = load ptr, ptr %v.addr, align 8
  %call24 = invoke i64 @sq_throwerror(ptr noundef %25, ptr noundef @.str.45)
          to label %invoke.cont23 unwind label %lpad

invoke.cont23:                                    ; preds = %if.end22
  store i64 %call24, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %invoke.cont23, %invoke.cont20, %invoke.cont11
  %call25 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %attrs) #10
  br label %return

return:                                           ; preds = %cleanup, %if.then
  %26 = load i64, ptr %retval, align 8
  ret i64 %26

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val27 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val27
}

declare noundef zeroext i1 @_ZN7SQClass13GetAttributesERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(456), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

declare noundef zeroext i1 @_ZN7SQClass13SetAttributesERK11SQObjectPtrS2_(ptr noundef nonnull align 8 dereferenceable(456), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getattributes(ptr noundef %v, i64 noundef %idx) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  %key = alloca ptr, align 8
  %attrs = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr null, ptr %o, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %0, i64 noundef %1, i32 noundef 134234112, ptr noundef %o)
  br i1 %call, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %2, i64 noundef -1)
  store ptr %call1, ptr %key, align 8
  %call2 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %attrs)
  %3 = load ptr, ptr %key, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 0
  %4 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %4, 16777217
  br i1 %cmp, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %5 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %_unVal, align 8
  %_attributes = getelementptr inbounds %struct.SQClass, ptr %6, i32 0, i32 6
  %call4 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %attrs, ptr noundef nonnull align 8 dereferenceable(16) %_attributes)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then3
  %7 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %7)
          to label %invoke.cont5 unwind label %lpad

invoke.cont5:                                     ; preds = %invoke.cont
  %8 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %8, ptr noundef nonnull align 8 dereferenceable(16) %attrs)
          to label %invoke.cont6 unwind label %lpad

invoke.cont6:                                     ; preds = %invoke.cont5
  store i64 0, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %if.end14, %invoke.cont11, %if.then10, %if.else, %invoke.cont5, %invoke.cont, %if.then3
  %9 = landingpad { ptr, i32 }
          cleanup
  %10 = extractvalue { ptr, i32 } %9, 0
  store ptr %10, ptr %exn.slot, align 8
  %11 = extractvalue { ptr, i32 } %9, 1
  store i32 %11, ptr %ehselector.slot, align 4
  %call18 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %attrs) #10
  br label %eh.resume

if.else:                                          ; preds = %if.end
  %12 = load ptr, ptr %o, align 8
  %_unVal7 = getelementptr inbounds %struct.tagSQObject, ptr %12, i32 0, i32 1
  %13 = load ptr, ptr %_unVal7, align 8
  %14 = load ptr, ptr %key, align 8
  %call9 = invoke noundef zeroext i1 @_ZN7SQClass13GetAttributesERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(456) %13, ptr noundef nonnull align 8 dereferenceable(16) %14, ptr noundef nonnull align 8 dereferenceable(16) %attrs)
          to label %invoke.cont8 unwind label %lpad

invoke.cont8:                                     ; preds = %if.else
  br i1 %call9, label %if.then10, label %if.end13

if.then10:                                        ; preds = %invoke.cont8
  %15 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %15)
          to label %invoke.cont11 unwind label %lpad

invoke.cont11:                                    ; preds = %if.then10
  %16 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %16, ptr noundef nonnull align 8 dereferenceable(16) %attrs)
          to label %invoke.cont12 unwind label %lpad

invoke.cont12:                                    ; preds = %invoke.cont11
  store i64 0, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

if.end13:                                         ; preds = %invoke.cont8
  br label %if.end14

if.end14:                                         ; preds = %if.end13
  %17 = load ptr, ptr %v.addr, align 8
  %call16 = invoke i64 @sq_throwerror(ptr noundef %17, ptr noundef @.str.45)
          to label %invoke.cont15 unwind label %lpad

invoke.cont15:                                    ; preds = %if.end14
  store i64 %call16, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %invoke.cont15, %invoke.cont12, %invoke.cont6
  %call17 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %attrs) #10
  br label %return

return:                                           ; preds = %cleanup, %if.then
  %18 = load i64, ptr %retval, align 8
  ret i64 %18

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val19 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val19
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getmemberhandle(ptr noundef %v, i64 noundef %idx, ptr noundef %handle) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %handle.addr = alloca ptr, align 8
  %o = alloca ptr, align 8
  %key = alloca ptr, align 8
  %m = alloca ptr, align 8
  %val = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %handle, ptr %handle.addr, align 8
  store ptr null, ptr %o, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %0, i64 noundef %1, i32 noundef 134234112, ptr noundef %o)
  br i1 %call, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %2, i64 noundef -1)
  store ptr %call1, ptr %key, align 8
  %3 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 1
  %4 = load ptr, ptr %_unVal, align 8
  %_members = getelementptr inbounds %struct.SQClass, ptr %4, i32 0, i32 1
  %5 = load ptr, ptr %_members, align 8
  store ptr %5, ptr %m, align 8
  %call2 = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %val)
  %6 = load ptr, ptr %m, align 8
  %7 = load ptr, ptr %key, align 8
  %call3 = invoke noundef zeroext i1 @_ZN7SQTable3GetERK11SQObjectPtrRS0_(ptr noundef nonnull align 8 dereferenceable(88) %6, ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull align 8 dereferenceable(16) %val)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.end
  br i1 %call3, label %if.then4, label %if.end9

if.then4:                                         ; preds = %invoke.cont
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %val, i32 0, i32 1
  %8 = load i64, ptr %_unVal5, align 8
  %and = and i64 %8, 33554432
  %tobool = icmp ne i64 %and, 0
  %9 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i32 0, i32 1
  %conv = sext i32 %cond to i64
  %10 = load ptr, ptr %handle.addr, align 8
  %_static = getelementptr inbounds %struct.tagSQMemberHandle, ptr %10, i32 0, i32 0
  store i64 %conv, ptr %_static, align 8
  %_unVal6 = getelementptr inbounds %struct.tagSQObject, ptr %val, i32 0, i32 1
  %11 = load i64, ptr %_unVal6, align 8
  %and7 = and i64 %11, 16777215
  %12 = load ptr, ptr %handle.addr, align 8
  %_index = getelementptr inbounds %struct.tagSQMemberHandle, ptr %12, i32 0, i32 1
  store i64 %and7, ptr %_index, align 8
  %13 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %13)
          to label %invoke.cont8 unwind label %lpad

invoke.cont8:                                     ; preds = %if.then4
  store i64 0, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %if.end9, %if.then4, %if.end
  %14 = landingpad { ptr, i32 }
          cleanup
  %15 = extractvalue { ptr, i32 } %14, 0
  store ptr %15, ptr %exn.slot, align 8
  %16 = extractvalue { ptr, i32 } %14, 1
  store i32 %16, ptr %ehselector.slot, align 4
  %call13 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %val) #10
  br label %eh.resume

if.end9:                                          ; preds = %invoke.cont
  %17 = load ptr, ptr %v.addr, align 8
  %call11 = invoke i64 @sq_throwerror(ptr noundef %17, ptr noundef @.str.45)
          to label %invoke.cont10 unwind label %lpad

invoke.cont10:                                    ; preds = %if.end9
  store i64 %call11, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %invoke.cont10, %invoke.cont8
  %call12 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %val) #10
  br label %return

return:                                           ; preds = %cleanup, %if.then
  %18 = load i64, ptr %retval, align 8
  ret i64 %18

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val14 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val14
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define noundef i64 @_Z18_getmemberbyhandleP4SQVMR11SQObjectPtrPK17tagSQMemberHandleRPS1_(ptr noundef %v, ptr noundef nonnull align 8 dereferenceable(16) %self, ptr noundef %handle, ptr noundef nonnull align 8 dereferenceable(8) %val) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %self.addr = alloca ptr, align 8
  %handle.addr = alloca ptr, align 8
  %val.addr = alloca ptr, align 8
  %i = alloca ptr, align 8
  %c = alloca ptr, align 8
  %c4 = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store ptr %self, ptr %self.addr, align 8
  store ptr %handle, ptr %handle.addr, align 8
  store ptr %val, ptr %val.addr, align 8
  %0 = load ptr, ptr %self.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  switch i32 %1, label %sw.default [
    i32 167804928, label %sw.bb
    i32 134234112, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  %2 = load ptr, ptr %self.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  store ptr %3, ptr %i, align 8
  %4 = load ptr, ptr %handle.addr, align 8
  %_static = getelementptr inbounds %struct.tagSQMemberHandle, ptr %4, i32 0, i32 0
  %5 = load i64, ptr %_static, align 8
  %tobool = icmp ne i64 %5, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %sw.bb
  %6 = load ptr, ptr %i, align 8
  %_class = getelementptr inbounds %struct.SQInstance, ptr %6, i32 0, i32 1
  %7 = load ptr, ptr %_class, align 8
  store ptr %7, ptr %c, align 8
  %8 = load ptr, ptr %c, align 8
  %_methods = getelementptr inbounds %struct.SQClass, ptr %8, i32 0, i32 4
  %9 = load ptr, ptr %handle.addr, align 8
  %_index = getelementptr inbounds %struct.tagSQMemberHandle, ptr %9, i32 0, i32 1
  %10 = load i64, ptr %_index, align 8
  %call = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNK8sqvectorI13SQClassMemberEixEy(ptr noundef nonnull align 8 dereferenceable(24) %_methods, i64 noundef %10)
  %val1 = getelementptr inbounds %struct.SQClassMember, ptr %call, i32 0, i32 0
  %11 = load ptr, ptr %val.addr, align 8
  store ptr %val1, ptr %11, align 8
  br label %if.end

if.else:                                          ; preds = %sw.bb
  %12 = load ptr, ptr %i, align 8
  %_values = getelementptr inbounds %struct.SQInstance, ptr %12, i32 0, i32 5
  %13 = load ptr, ptr %handle.addr, align 8
  %_index2 = getelementptr inbounds %struct.tagSQMemberHandle, ptr %13, i32 0, i32 1
  %14 = load i64, ptr %_index2, align 8
  %arrayidx = getelementptr inbounds [1 x %struct.SQObjectPtr], ptr %_values, i64 0, i64 %14
  %15 = load ptr, ptr %val.addr, align 8
  store ptr %arrayidx, ptr %15, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %16 = load ptr, ptr %self.addr, align 8
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %16, i32 0, i32 1
  %17 = load ptr, ptr %_unVal5, align 8
  store ptr %17, ptr %c4, align 8
  %18 = load ptr, ptr %handle.addr, align 8
  %_static6 = getelementptr inbounds %struct.tagSQMemberHandle, ptr %18, i32 0, i32 0
  %19 = load i64, ptr %_static6, align 8
  %tobool7 = icmp ne i64 %19, 0
  br i1 %tobool7, label %if.then8, label %if.else13

if.then8:                                         ; preds = %sw.bb3
  %20 = load ptr, ptr %c4, align 8
  %_methods9 = getelementptr inbounds %struct.SQClass, ptr %20, i32 0, i32 4
  %21 = load ptr, ptr %handle.addr, align 8
  %_index10 = getelementptr inbounds %struct.tagSQMemberHandle, ptr %21, i32 0, i32 1
  %22 = load i64, ptr %_index10, align 8
  %call11 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNK8sqvectorI13SQClassMemberEixEy(ptr noundef nonnull align 8 dereferenceable(24) %_methods9, i64 noundef %22)
  %val12 = getelementptr inbounds %struct.SQClassMember, ptr %call11, i32 0, i32 0
  %23 = load ptr, ptr %val.addr, align 8
  store ptr %val12, ptr %23, align 8
  br label %if.end17

if.else13:                                        ; preds = %sw.bb3
  %24 = load ptr, ptr %c4, align 8
  %_defaultvalues = getelementptr inbounds %struct.SQClass, ptr %24, i32 0, i32 3
  %25 = load ptr, ptr %handle.addr, align 8
  %_index14 = getelementptr inbounds %struct.tagSQMemberHandle, ptr %25, i32 0, i32 1
  %26 = load i64, ptr %_index14, align 8
  %call15 = call noundef nonnull align 8 dereferenceable(32) ptr @_ZNK8sqvectorI13SQClassMemberEixEy(ptr noundef nonnull align 8 dereferenceable(24) %_defaultvalues, i64 noundef %26)
  %val16 = getelementptr inbounds %struct.SQClassMember, ptr %call15, i32 0, i32 0
  %27 = load ptr, ptr %val.addr, align 8
  store ptr %val16, ptr %27, align 8
  br label %if.end17

if.end17:                                         ; preds = %if.else13, %if.then8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %28 = load ptr, ptr %v.addr, align 8
  %call18 = call i64 @sq_throwerror(ptr noundef %28, ptr noundef @.str.46)
  store i64 %call18, ptr %retval, align 8
  br label %return

sw.epilog:                                        ; preds = %if.end17, %if.end
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.epilog, %sw.default
  %29 = load i64, ptr %retval, align 8
  ret i64 %29
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(32) ptr @_ZNK8sqvectorI13SQClassMemberEixEy(ptr noundef nonnull align 8 dereferenceable(24) %this, i64 noundef %pos) #4 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %pos.addr = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  store i64 %pos, ptr %pos.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_vals = getelementptr inbounds %class.sqvector.3, ptr %this1, i32 0, i32 0
  %0 = load ptr, ptr %_vals, align 8
  %1 = load i64, ptr %pos.addr, align 8
  %arrayidx = getelementptr inbounds %struct.SQClassMember, ptr %0, i64 %1
  ret ptr %arrayidx
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getbyhandle(ptr noundef %v, i64 noundef %idx, ptr noundef %handle) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %handle.addr = alloca ptr, align 8
  %self = alloca ptr, align 8
  %val = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %ref.tmp2 = alloca %struct.tagSQObject, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %handle, ptr %handle.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %self, align 8
  store ptr null, ptr %val, align 8
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load ptr, ptr %self, align 8
  %4 = load ptr, ptr %handle.addr, align 8
  %call1 = call noundef i64 @_Z18_getmemberbyhandleP4SQVMR11SQObjectPtrPK17tagSQMemberHandleRPS1_(ptr noundef %2, ptr noundef nonnull align 8 dereferenceable(16) %3, ptr noundef %4, ptr noundef nonnull align 8 dereferenceable(8) %val)
  %cmp = icmp slt i64 %call1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %v.addr, align 8
  %6 = load ptr, ptr %val, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 0
  %7 = load i32, ptr %_type, align 8
  %cmp3 = icmp ne i32 %7, 134283264
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %8 = load ptr, ptr %val, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %ref.tmp2, ptr align 8 %8, i64 16, i1 false)
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %9 = load ptr, ptr %val, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %9, i32 0, i32 1
  %10 = load ptr, ptr %_unVal, align 8
  %_obj = getelementptr inbounds %struct.SQWeakRef, ptr %10, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %ref.tmp2, ptr align 8 %_obj, i64 16, i1 false)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %call4 = call noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp2)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %5, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %cond.end
  %call5 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  store i64 0, ptr %retval, align 8
  br label %return

lpad:                                             ; preds = %cond.end
  %11 = landingpad { ptr, i32 }
          cleanup
  %12 = extractvalue { ptr, i32 } %11, 0
  store ptr %12, ptr %exn.slot, align 8
  %13 = extractvalue { ptr, i32 } %11, 1
  store i32 %13, ptr %ehselector.slot, align 4
  %call6 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

return:                                           ; preds = %invoke.cont, %if.then
  %14 = load i64, ptr %retval, align 8
  ret i64 %14

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val7 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_setbyhandle(ptr noundef %v, i64 noundef %idx, ptr noundef %handle) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %handle.addr = alloca ptr, align 8
  %self = alloca ptr, align 8
  %newval = alloca ptr, align 8
  %val = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %handle, ptr %handle.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %self, align 8
  %2 = load ptr, ptr %v.addr, align 8
  %call1 = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %2, i64 noundef -1)
  store ptr %call1, ptr %newval, align 8
  store ptr null, ptr %val, align 8
  %3 = load ptr, ptr %v.addr, align 8
  %4 = load ptr, ptr %self, align 8
  %5 = load ptr, ptr %handle.addr, align 8
  %call2 = call noundef i64 @_Z18_getmemberbyhandleP4SQVMR11SQObjectPtrPK17tagSQMemberHandleRPS1_(ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(16) %4, ptr noundef %5, ptr noundef nonnull align 8 dereferenceable(8) %val)
  %cmp = icmp slt i64 %call2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %6 = load ptr, ptr %newval, align 8
  %7 = load ptr, ptr %val, align 8
  %call3 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull align 8 dereferenceable(16) %6)
  %8 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM3PopEv(ptr noundef nonnull align 8 dereferenceable(344) %8)
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %9 = load i64, ptr %retval, align 8
  ret i64 %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getbase(ptr noundef %v, i64 noundef %idx) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr null, ptr %o, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %0, i64 noundef %1, i32 noundef 134234112, ptr noundef %o)
  br i1 %call, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %3 = load ptr, ptr %_unVal, align 8
  %_base = getelementptr inbounds %struct.SQClass, ptr %3, i32 0, i32 2
  %4 = load ptr, ptr %_base, align 8
  %tobool = icmp ne ptr %4, null
  br i1 %tobool, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.end
  %5 = load ptr, ptr %v.addr, align 8
  %6 = load ptr, ptr %o, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %7 = load ptr, ptr %_unVal2, align 8
  %_base3 = getelementptr inbounds %struct.SQClass, ptr %7, i32 0, i32 2
  %8 = load ptr, ptr %_base3, align 8
  %call4 = call noundef ptr @_ZN11SQObjectPtrC1EP7SQClass(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %8)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %5, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then1
  %call5 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %if.end7

lpad:                                             ; preds = %if.then1
  %9 = landingpad { ptr, i32 }
          cleanup
  %10 = extractvalue { ptr, i32 } %9, 0
  store ptr %10, ptr %exn.slot, align 8
  %11 = extractvalue { ptr, i32 } %9, 1
  store i32 %11, ptr %ehselector.slot, align 4
  %call6 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

if.else:                                          ; preds = %if.end
  %12 = load ptr, ptr %v.addr, align 8
  call void @_ZN4SQVM8PushNullEv(ptr noundef nonnull align 8 dereferenceable(344) %12)
  br label %if.end7

if.end7:                                          ; preds = %if.else, %invoke.cont
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end7, %if.then
  %13 = load i64, ptr %retval, align 8
  ret i64 %13

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val8 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val8
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getclass(ptr noundef %v, i64 noundef %idx) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr null, ptr %o, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %0, i64 noundef %1, i32 noundef 167804928, ptr noundef %o)
  br i1 %call, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 1
  %4 = load ptr, ptr %_unVal, align 8
  %_class = getelementptr inbounds %struct.SQInstance, ptr %4, i32 0, i32 1
  %5 = load ptr, ptr %_class, align 8
  %call1 = call noundef ptr @_ZN11SQObjectPtrC1EP7SQClass(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %5)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %2, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.end
  %call2 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  store i64 0, ptr %retval, align 8
  br label %return

lpad:                                             ; preds = %if.end
  %6 = landingpad { ptr, i32 }
          cleanup
  %7 = extractvalue { ptr, i32 } %6, 0
  store ptr %7, ptr %exn.slot, align 8
  %8 = extractvalue { ptr, i32 } %6, 1
  store i32 %8, ptr %ehselector.slot, align 4
  %call3 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

return:                                           ; preds = %invoke.cont, %if.then
  %9 = load i64, ptr %retval, align 8
  ret i64 %9

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val4 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_createinstance(ptr noundef %v, i64 noundef %idx) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr null, ptr %o, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef zeroext i1 @_ZL18sq_aux_gettypedargP4SQVMx15tagSQObjectTypePP11SQObjectPtr(ptr noundef %0, i64 noundef %1, i32 noundef 134234112, ptr noundef %o)
  br i1 %call, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i64 -1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %3, i32 0, i32 1
  %4 = load ptr, ptr %_unVal, align 8
  %call1 = call noundef ptr @_ZN7SQClass14CreateInstanceEv(ptr noundef nonnull align 8 dereferenceable(456) %4)
  %call2 = call noundef ptr @_ZN11SQObjectPtrC1EP10SQInstance(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %call1)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %2, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.end
  %call3 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  store i64 0, ptr %retval, align 8
  br label %return

lpad:                                             ; preds = %if.end
  %5 = landingpad { ptr, i32 }
          cleanup
  %6 = extractvalue { ptr, i32 } %5, 0
  store ptr %6, ptr %exn.slot, align 8
  %7 = extractvalue { ptr, i32 } %5, 1
  store i32 %7, ptr %ehselector.slot, align 4
  %call4 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

return:                                           ; preds = %invoke.cont, %if.then
  %8 = load i64, ptr %retval, align 8
  ret i64 %8

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val5 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val5
}

declare noundef ptr @_ZN7SQClass14CreateInstanceEv(ptr noundef nonnull align 8 dereferenceable(456)) #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP10SQInstance(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2EP10SQInstance(ptr noundef nonnull align 8 dereferenceable(16) %this1, ptr noundef %0)
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_weakref(ptr noundef %v, i64 noundef %idx) #0 personality ptr @__gxx_personality_v0 {
entry:
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %ref.tmp6 = alloca %struct.SQObjectPtr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %and = and i32 %3, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %v.addr, align 8
  %5 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %5, i32 0, i32 1
  %6 = load ptr, ptr %_unVal, align 8
  %7 = load ptr, ptr %o, align 8
  %_type1 = getelementptr inbounds %struct.tagSQObject, ptr %7, i32 0, i32 0
  %8 = load i32, ptr %_type1, align 8
  %call2 = call noundef ptr @_ZN12SQRefCounted10GetWeakRefE15tagSQObjectType(ptr noundef nonnull align 8 dereferenceable(24) %6, i32 noundef %8)
  %call3 = call noundef ptr @_ZN11SQObjectPtrC1EP9SQWeakRef(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef %call2)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %4, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.then
  %call4 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %return

lpad:                                             ; preds = %if.then
  %9 = landingpad { ptr, i32 }
          cleanup
  %10 = extractvalue { ptr, i32 } %9, 0
  store ptr %10, ptr %exn.slot, align 8
  %11 = extractvalue { ptr, i32 } %9, 1
  store i32 %11, ptr %ehselector.slot, align 4
  %call5 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

if.end:                                           ; preds = %entry
  %12 = load ptr, ptr %v.addr, align 8
  %13 = load ptr, ptr %o, align 8
  %call7 = call noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp6, ptr noundef nonnull align 8 dereferenceable(16) %13)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %12, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp6)
          to label %invoke.cont9 unwind label %lpad8

invoke.cont9:                                     ; preds = %if.end
  %call10 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp6) #10
  br label %return

return:                                           ; preds = %invoke.cont9, %invoke.cont
  ret void

lpad8:                                            ; preds = %if.end
  %14 = landingpad { ptr, i32 }
          cleanup
  %15 = extractvalue { ptr, i32 } %14, 0
  store ptr %15, ptr %exn.slot, align 8
  %16 = extractvalue { ptr, i32 } %14, 1
  store i32 %16, ptr %ehselector.slot, align 4
  %call11 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp6) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad8, %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val12 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val12
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1EP9SQWeakRef(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2EP9SQWeakRef(ptr noundef nonnull align 8 dereferenceable(16) %this1, ptr noundef %0)
  ret ptr %this1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getweakrefval(ptr noundef %v, i64 noundef %idx) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  store ptr %call, ptr %o, align 8
  %2 = load ptr, ptr %o, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %cmp = icmp ne i32 %3, 134283264
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %v.addr, align 8
  %call1 = call i64 @sq_throwerror(ptr noundef %4, ptr noundef @.str.47)
  store i64 %call1, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %v.addr, align 8
  %6 = load ptr, ptr %o, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %6, i32 0, i32 1
  %7 = load ptr, ptr %_unVal, align 8
  %_obj = getelementptr inbounds %struct.SQWeakRef, ptr %7, i32 0, i32 1
  %call2 = call noundef ptr @_ZN11SQObjectPtrC1ERK11tagSQObject(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp, ptr noundef nonnull align 8 dereferenceable(16) %_obj)
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %5, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %if.end
  %call3 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  store i64 0, ptr %retval, align 8
  br label %return

lpad:                                             ; preds = %if.end
  %8 = landingpad { ptr, i32 }
          cleanup
  %9 = extractvalue { ptr, i32 } %8, 0
  store ptr %9, ptr %exn.slot, align 8
  %10 = extractvalue { ptr, i32 } %8, 1
  store i32 %10, ptr %ehselector.slot, align 4
  %call4 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

return:                                           ; preds = %invoke.cont, %if.then
  %11 = load i64, ptr %retval, align 8
  ret i64 %11

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val5 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_getdefaultdelegate(ptr noundef %v, i32 noundef %t) #0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %t.addr = alloca i32, align 4
  %ss = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store i32 %t, ptr %t.addr, align 4
  %0 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 19
  %1 = load ptr, ptr %_sharedstate, align 8
  store ptr %1, ptr %ss, align 8
  %2 = load i32, ptr %t.addr, align 4
  switch i32 %2, label %sw.default [
    i32 167772192, label %sw.bb
    i32 134217792, label %sw.bb1
    i32 134217744, label %sw.bb2
    i32 83886082, label %sw.bb3
    i32 83886084, label %sw.bb3
    i32 134218752, label %sw.bb4
    i32 134217984, label %sw.bb5
    i32 134218240, label %sw.bb5
    i32 134221824, label %sw.bb6
    i32 134234112, label %sw.bb7
    i32 167804928, label %sw.bb8
    i32 134283264, label %sw.bb9
  ]

sw.bb:                                            ; preds = %entry
  %3 = load ptr, ptr %v.addr, align 8
  %4 = load ptr, ptr %ss, align 8
  %_table_default_delegate = getelementptr inbounds %struct.SQSharedState, ptr %4, i32 0, i32 11
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %3, ptr noundef nonnull align 8 dereferenceable(16) %_table_default_delegate)
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %5 = load ptr, ptr %v.addr, align 8
  %6 = load ptr, ptr %ss, align 8
  %_array_default_delegate = getelementptr inbounds %struct.SQSharedState, ptr %6, i32 0, i32 12
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %5, ptr noundef nonnull align 8 dereferenceable(16) %_array_default_delegate)
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %7 = load ptr, ptr %v.addr, align 8
  %8 = load ptr, ptr %ss, align 8
  %_string_default_delegate = getelementptr inbounds %struct.SQSharedState, ptr %8, i32 0, i32 13
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %7, ptr noundef nonnull align 8 dereferenceable(16) %_string_default_delegate)
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry, %entry
  %9 = load ptr, ptr %v.addr, align 8
  %10 = load ptr, ptr %ss, align 8
  %_number_default_delegate = getelementptr inbounds %struct.SQSharedState, ptr %10, i32 0, i32 14
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %9, ptr noundef nonnull align 8 dereferenceable(16) %_number_default_delegate)
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  %11 = load ptr, ptr %v.addr, align 8
  %12 = load ptr, ptr %ss, align 8
  %_generator_default_delegate = getelementptr inbounds %struct.SQSharedState, ptr %12, i32 0, i32 15
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %11, ptr noundef nonnull align 8 dereferenceable(16) %_generator_default_delegate)
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry, %entry
  %13 = load ptr, ptr %v.addr, align 8
  %14 = load ptr, ptr %ss, align 8
  %_closure_default_delegate = getelementptr inbounds %struct.SQSharedState, ptr %14, i32 0, i32 16
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %13, ptr noundef nonnull align 8 dereferenceable(16) %_closure_default_delegate)
  br label %sw.epilog

sw.bb6:                                           ; preds = %entry
  %15 = load ptr, ptr %v.addr, align 8
  %16 = load ptr, ptr %ss, align 8
  %_thread_default_delegate = getelementptr inbounds %struct.SQSharedState, ptr %16, i32 0, i32 17
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %15, ptr noundef nonnull align 8 dereferenceable(16) %_thread_default_delegate)
  br label %sw.epilog

sw.bb7:                                           ; preds = %entry
  %17 = load ptr, ptr %v.addr, align 8
  %18 = load ptr, ptr %ss, align 8
  %_class_default_delegate = getelementptr inbounds %struct.SQSharedState, ptr %18, i32 0, i32 18
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %17, ptr noundef nonnull align 8 dereferenceable(16) %_class_default_delegate)
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %19 = load ptr, ptr %v.addr, align 8
  %20 = load ptr, ptr %ss, align 8
  %_instance_default_delegate = getelementptr inbounds %struct.SQSharedState, ptr %20, i32 0, i32 19
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %19, ptr noundef nonnull align 8 dereferenceable(16) %_instance_default_delegate)
  br label %sw.epilog

sw.bb9:                                           ; preds = %entry
  %21 = load ptr, ptr %v.addr, align 8
  %22 = load ptr, ptr %ss, align 8
  %_weakref_default_delegate = getelementptr inbounds %struct.SQSharedState, ptr %22, i32 0, i32 20
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %21, ptr noundef nonnull align 8 dereferenceable(16) %_weakref_default_delegate)
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %23 = load ptr, ptr %v.addr, align 8
  %call = call i64 @sq_throwerror(ptr noundef %23, ptr noundef @.str.48)
  store i64 %call, ptr %retval, align 8
  br label %return

sw.epilog:                                        ; preds = %sw.bb9, %sw.bb8, %sw.bb7, %sw.bb6, %sw.bb5, %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  store i64 0, ptr %retval, align 8
  br label %return

return:                                           ; preds = %sw.epilog, %sw.default
  %24 = load i64, ptr %retval, align 8
  ret i64 %24
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_next(ptr noundef %v, i64 noundef %idx) #0 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca i64, align 8
  %v.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %o = alloca %struct.SQObjectPtr, align 8
  %refpos = alloca ptr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %realkey = alloca %struct.SQObjectPtr, align 8
  %val = alloca %struct.SQObjectPtr, align 8
  %cleanup.dest.slot = alloca i32, align 4
  %faketojump = alloca i32, align 4
  store ptr %v, ptr %v.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %0, i64 noundef %1)
  %call1 = call noundef ptr @_ZN11SQObjectPtrC1ERKS_(ptr noundef nonnull align 8 dereferenceable(16) %o, ptr noundef nonnull align 8 dereferenceable(16) %call)
  %2 = load ptr, ptr %v.addr, align 8
  %call2 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %2, i64 noundef -1)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  store ptr %call2, ptr %refpos, align 8
  %call4 = invoke noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %realkey)
          to label %invoke.cont3 unwind label %lpad

invoke.cont3:                                     ; preds = %invoke.cont
  %call7 = invoke noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %val)
          to label %invoke.cont6 unwind label %lpad5

invoke.cont6:                                     ; preds = %invoke.cont3
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %o, i32 0, i32 0
  %3 = load i32, ptr %_type, align 8
  %cmp = icmp eq i32 %3, 134218752
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %invoke.cont6
  %4 = load ptr, ptr %v.addr, align 8
  %call10 = invoke i64 @sq_throwerror(ptr noundef %4, ptr noundef @.str.49)
          to label %invoke.cont9 unwind label %lpad8

invoke.cont9:                                     ; preds = %if.then
  store i64 %call10, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

lpad:                                             ; preds = %invoke.cont, %entry
  %5 = landingpad { ptr, i32 }
          cleanup
  %6 = extractvalue { ptr, i32 } %5, 0
  store ptr %6, ptr %exn.slot, align 8
  %7 = extractvalue { ptr, i32 } %5, 1
  store i32 %7, ptr %ehselector.slot, align 4
  br label %ehcleanup27

lpad5:                                            ; preds = %invoke.cont3
  %8 = landingpad { ptr, i32 }
          cleanup
  %9 = extractvalue { ptr, i32 } %8, 0
  store ptr %9, ptr %exn.slot, align 8
  %10 = extractvalue { ptr, i32 } %8, 1
  store i32 %10, ptr %ehselector.slot, align 4
  br label %ehcleanup

lpad8:                                            ; preds = %invoke.cont17, %if.then16, %if.end, %if.then
  %11 = landingpad { ptr, i32 }
          cleanup
  %12 = extractvalue { ptr, i32 } %11, 0
  store ptr %12, ptr %exn.slot, align 8
  %13 = extractvalue { ptr, i32 } %11, 1
  store i32 %13, ptr %ehselector.slot, align 4
  %call21 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %val) #10
  br label %ehcleanup

if.end:                                           ; preds = %invoke.cont6
  %14 = load ptr, ptr %v.addr, align 8
  %15 = load ptr, ptr %refpos, align 8
  %call12 = invoke noundef zeroext i1 @_ZN4SQVM10FOREACH_OPER11SQObjectPtrS1_S1_S1_xiRi(ptr noundef nonnull align 8 dereferenceable(344) %14, ptr noundef nonnull align 8 dereferenceable(16) %o, ptr noundef nonnull align 8 dereferenceable(16) %realkey, ptr noundef nonnull align 8 dereferenceable(16) %val, ptr noundef nonnull align 8 dereferenceable(16) %15, i64 noundef 0, i32 noundef 666, ptr noundef nonnull align 4 dereferenceable(4) %faketojump)
          to label %invoke.cont11 unwind label %lpad8

invoke.cont11:                                    ; preds = %if.end
  br i1 %call12, label %if.end14, label %if.then13

if.then13:                                        ; preds = %invoke.cont11
  store i64 -1, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

if.end14:                                         ; preds = %invoke.cont11
  %16 = load i32, ptr %faketojump, align 4
  %cmp15 = icmp ne i32 %16, 666
  br i1 %cmp15, label %if.then16, label %if.end19

if.then16:                                        ; preds = %if.end14
  %17 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %17, ptr noundef nonnull align 8 dereferenceable(16) %realkey)
          to label %invoke.cont17 unwind label %lpad8

invoke.cont17:                                    ; preds = %if.then16
  %18 = load ptr, ptr %v.addr, align 8
  invoke void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %18, ptr noundef nonnull align 8 dereferenceable(16) %val)
          to label %invoke.cont18 unwind label %lpad8

invoke.cont18:                                    ; preds = %invoke.cont17
  store i64 0, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

if.end19:                                         ; preds = %if.end14
  store i64 -1, ptr %retval, align 8
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

cleanup:                                          ; preds = %if.end19, %invoke.cont18, %if.then13, %invoke.cont9
  %call20 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %val) #10
  %call23 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %realkey) #10
  %call26 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %o) #10
  %19 = load i64, ptr %retval, align 8
  ret i64 %19

ehcleanup:                                        ; preds = %lpad8, %lpad5
  %call24 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %realkey) #10
  br label %ehcleanup27

ehcleanup27:                                      ; preds = %ehcleanup, %lpad
  %call28 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %o) #10
  br label %eh.resume

eh.resume:                                        ; preds = %ehcleanup27
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val29 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val29
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC1ERKS_(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef nonnull align 8 dereferenceable(16) %o) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %o.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %o, ptr %o.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %o.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC2ERKS_(ptr noundef nonnull align 8 dereferenceable(16) %this1, ptr noundef nonnull align 8 dereferenceable(16) %0)
  ret ptr %this1
}

declare noundef zeroext i1 @_ZN4SQVM10FOREACH_OPER11SQObjectPtrS1_S1_S1_xiRi(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(16), i64 noundef, i32 noundef, ptr noundef nonnull align 4 dereferenceable(4)) #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define noundef i64 @_Z11buf_lexfeedPv(ptr noundef %file) #4 {
entry:
  %retval = alloca i64, align 8
  %file.addr = alloca ptr, align 8
  %buf = alloca ptr, align 8
  store ptr %file, ptr %file.addr, align 8
  %0 = load ptr, ptr %file.addr, align 8
  store ptr %0, ptr %buf, align 8
  %1 = load ptr, ptr %buf, align 8
  %size = getelementptr inbounds %struct.BufState, ptr %1, i32 0, i32 2
  %2 = load i64, ptr %size, align 8
  %3 = load ptr, ptr %buf, align 8
  %ptr = getelementptr inbounds %struct.BufState, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %ptr, align 8
  %add = add nsw i64 %4, 1
  %cmp = icmp slt i64 %2, %add
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, ptr %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %5 = load ptr, ptr %buf, align 8
  %buf1 = getelementptr inbounds %struct.BufState, ptr %5, i32 0, i32 0
  %6 = load ptr, ptr %buf1, align 8
  %7 = load ptr, ptr %buf, align 8
  %ptr2 = getelementptr inbounds %struct.BufState, ptr %7, i32 0, i32 1
  %8 = load i64, ptr %ptr2, align 8
  %inc = add nsw i64 %8, 1
  store i64 %inc, ptr %ptr2, align 8
  %arrayidx = getelementptr inbounds i8, ptr %6, i64 %8
  %9 = load i8, ptr %arrayidx, align 1
  %conv = sext i8 %9 to i64
  store i64 %conv, ptr %retval, align 8
  br label %return

return:                                           ; preds = %if.end, %if.then
  %10 = load i64, ptr %retval, align 8
  ret i64 %10
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i64 @sq_compilebuffer(ptr noundef %v, ptr noundef %s, i64 noundef %size, ptr noundef %sourcename, i64 noundef %raiseerror) #0 {
entry:
  %v.addr = alloca ptr, align 8
  %s.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %sourcename.addr = alloca ptr, align 8
  %raiseerror.addr = alloca i64, align 8
  %buf = alloca %struct.BufState, align 8
  store ptr %v, ptr %v.addr, align 8
  store ptr %s, ptr %s.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  store ptr %sourcename, ptr %sourcename.addr, align 8
  store i64 %raiseerror, ptr %raiseerror.addr, align 8
  %0 = load ptr, ptr %s.addr, align 8
  %buf1 = getelementptr inbounds %struct.BufState, ptr %buf, i32 0, i32 0
  store ptr %0, ptr %buf1, align 8
  %1 = load i64, ptr %size.addr, align 8
  %size2 = getelementptr inbounds %struct.BufState, ptr %buf, i32 0, i32 2
  store i64 %1, ptr %size2, align 8
  %ptr = getelementptr inbounds %struct.BufState, ptr %buf, i32 0, i32 1
  store i64 0, ptr %ptr, align 8
  %2 = load ptr, ptr %v.addr, align 8
  %3 = load ptr, ptr %sourcename.addr, align 8
  %4 = load i64, ptr %raiseerror.addr, align 8
  %call = call i64 @sq_compile(ptr noundef %2, ptr noundef @_Z11buf_lexfeedPv, ptr noundef %buf, ptr noundef %3, i64 noundef %4)
  ret i64 %call
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_move(ptr noundef %dest, ptr noundef %src, i64 noundef %idx) #0 {
entry:
  %dest.addr = alloca ptr, align 8
  %src.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  store ptr %dest, ptr %dest.addr, align 8
  store ptr %src, ptr %src.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %0 = load ptr, ptr %dest.addr, align 8
  %1 = load ptr, ptr %src.addr, align 8
  %2 = load i64, ptr %idx.addr, align 8
  %call = call noundef nonnull align 8 dereferenceable(16) ptr @_Z9stack_getP4SQVMx(ptr noundef %1, i64 noundef %2)
  call void @_ZN4SQVM4PushERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344) %0, ptr noundef nonnull align 8 dereferenceable(16) %call)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define void @sq_setprintfunc(ptr noundef %v, ptr noundef %printfunc, ptr noundef %errfunc) #4 {
entry:
  %v.addr = alloca ptr, align 8
  %printfunc.addr = alloca ptr, align 8
  %errfunc.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  store ptr %printfunc, ptr %printfunc.addr, align 8
  store ptr %errfunc, ptr %errfunc.addr, align 8
  %0 = load ptr, ptr %printfunc.addr, align 8
  %1 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %1, i32 0, i32 19
  %2 = load ptr, ptr %_sharedstate, align 8
  %_printfunc = getelementptr inbounds %struct.SQSharedState, ptr %2, i32 0, i32 22
  store ptr %0, ptr %_printfunc, align 8
  %3 = load ptr, ptr %errfunc.addr, align 8
  %4 = load ptr, ptr %v.addr, align 8
  %_sharedstate1 = getelementptr inbounds %struct.SQVM, ptr %4, i32 0, i32 19
  %5 = load ptr, ptr %_sharedstate1, align 8
  %_errorfunc = getelementptr inbounds %struct.SQSharedState, ptr %5, i32 0, i32 23
  store ptr %3, ptr %_errorfunc, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_getprintfunc(ptr noundef %v) #4 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 19
  %1 = load ptr, ptr %_sharedstate, align 8
  %_printfunc = getelementptr inbounds %struct.SQSharedState, ptr %1, i32 0, i32 22
  %2 = load ptr, ptr %_printfunc, align 8
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define ptr @sq_geterrorfunc(ptr noundef %v) #4 {
entry:
  %v.addr = alloca ptr, align 8
  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQVM, ptr %0, i32 0, i32 19
  %1 = load ptr, ptr %_sharedstate, align 8
  %_errorfunc = getelementptr inbounds %struct.SQSharedState, ptr %1, i32 0, i32 23
  %2 = load ptr, ptr %_errorfunc, align 8
  ret ptr %2
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_malloc(i64 noundef %size) #0 {
entry:
  %size.addr = alloca i64, align 8
  store i64 %size, ptr %size.addr, align 8
  %0 = load i64, ptr %size.addr, align 8
  %call = call noundef ptr @_Z12sq_vm_mallocy(i64 noundef %0)
  ret ptr %call
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define ptr @sq_realloc(ptr noundef %p, i64 noundef %oldsize, i64 noundef %newsize) #0 {
entry:
  %p.addr = alloca ptr, align 8
  %oldsize.addr = alloca i64, align 8
  %newsize.addr = alloca i64, align 8
  store ptr %p, ptr %p.addr, align 8
  store i64 %oldsize, ptr %oldsize.addr, align 8
  store i64 %newsize, ptr %newsize.addr, align 8
  %0 = load ptr, ptr %p.addr, align 8
  %1 = load i64, ptr %oldsize.addr, align 8
  %2 = load i64, ptr %newsize.addr, align 8
  %call = call noundef ptr @_Z13sq_vm_reallocPvyy(ptr noundef %0, i64 noundef %1, i64 noundef %2)
  ret ptr %call
}

declare noundef ptr @_Z13sq_vm_reallocPvyy(ptr noundef, i64 noundef, i64 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define void @sq_free(ptr noundef %p, i64 noundef %size) #0 {
entry:
  %p.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  store ptr %p, ptr %p.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  %0 = load ptr, ptr %p.addr, align 8
  %1 = load i64, ptr %size.addr, align 8
  call void @_Z10sq_vm_freePvy(ptr noundef %0, i64 noundef %1)
  ret void
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP4SQVM(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 134221824, ptr %_type, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %0, ptr %_unVal2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %1 = load ptr, ptr %_unVal3, align 8
  %tobool = icmp ne ptr %1, null
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 236, ptr noundef @.str.51) #11
  unreachable

2:                                                ; No predecessors!
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %2
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %3 = load ptr, ptr %_unVal4, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %4, 1
  store i64 %inc, ptr %_uiRef, align 8
  %5 = load ptr, ptr %retval, align 8
  ret ptr %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrD2Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %this) unnamed_addr #3 align 2 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  %0 = load i32, ptr %_type, align 8
  %and = and i32 %0, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %1 = load ptr, ptr %_unVal, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %1, i32 0, i32 1
  %2 = load i64, ptr %_uiRef, align 8
  %dec = add i64 %2, -1
  store i64 %dec, ptr %_uiRef, align 8
  %cmp = icmp eq i64 %dec, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %3 = load ptr, ptr %_unVal2, align 8
  %vtable = load ptr, ptr %3, align 8
  %vfn = getelementptr inbounds ptr, ptr %vtable, i64 2
  %4 = load ptr, ptr %vfn, align 8
  invoke void %4(ptr noundef nonnull align 8 dereferenceable(24) %3)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %if.then
  br label %if.end

if.end:                                           ; preds = %invoke.cont, %land.lhs.true, %entry
  %5 = load ptr, ptr %retval, align 8
  ret ptr %5

terminate.lpad:                                   ; preds = %if.then
  %6 = landingpad { ptr, i32 }
          catch ptr null
  %7 = extractvalue { ptr, i32 } %6, 0
  call void @__clang_call_terminate(ptr %7) #12
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
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %this) unnamed_addr #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 16777217, ptr %_type, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr null, ptr %_unVal2, align 8
  ret ptr %this1
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN9SQClosureC1EP13SQSharedStateP15SQFunctionProto(ptr noundef nonnull returned align 8 dereferenceable(96) %this, ptr noundef %ss, ptr noundef %func) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %ss.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %ss, ptr %ss.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %ss.addr, align 8
  %1 = load ptr, ptr %func.addr, align 8
  %call = call noundef ptr @_ZN9SQClosureC2EP13SQSharedStateP15SQFunctionProto(ptr noundef nonnull align 8 dereferenceable(96) %this1, ptr noundef %0, ptr noundef %1)
  ret ptr %this1
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN9SQClosureC2EP13SQSharedStateP15SQFunctionProto(ptr noundef nonnull returned align 8 dereferenceable(96) %this, ptr noundef %ss, ptr noundef %func) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
entry:
  %this.addr = alloca ptr, align 8
  %ss.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %this, ptr %this.addr, align 8
  store ptr %ss, ptr %ss.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN13SQCollectableC2Ev(ptr noundef nonnull align 8 dereferenceable(48) %this1)
  store ptr getelementptr inbounds ({ [8 x ptr] }, ptr @_ZTV9SQClosure, i32 0, inrange i32 0, i32 2), ptr %this1, align 8
  %0 = load ptr, ptr %func.addr, align 8
  %_function = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 4
  store ptr %0, ptr %_function, align 8
  %_function2 = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 4
  %1 = load ptr, ptr %_function2, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %1, i32 0, i32 1
  %2 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %2, 1
  store i64 %inc, ptr %_uiRef, align 8
  %_base = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 3
  store ptr null, ptr %_base, align 8
  %_next = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 1
  store ptr null, ptr %_next, align 8
  %_prev = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 2
  store ptr null, ptr %_prev, align 8
  %3 = load ptr, ptr %ss.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 3
  store ptr %3, ptr %_sharedstate, align 8
  %_sharedstate3 = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 3
  %4 = load ptr, ptr %_sharedstate3, align 8
  %_gc_chain = getelementptr inbounds %struct.SQSharedState, ptr %4, i32 0, i32 9
  invoke void @_ZN13SQCollectable10AddToChainEPPS_S0_(ptr noundef %_gc_chain, ptr noundef %this1)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %_env = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 1
  store ptr null, ptr %_env, align 8
  %_root = getelementptr inbounds %struct.SQClosure, ptr %this1, i32 0, i32 2
  store ptr null, ptr %_root, align 8
  ret ptr %this1

lpad:                                             ; preds = %entry
  %5 = landingpad { ptr, i32 }
          cleanup
  %6 = extractvalue { ptr, i32 } %5, 0
  store ptr %6, ptr %exn.slot, align 8
  %7 = extractvalue { ptr, i32 } %5, 1
  store i32 %7, ptr %ehselector.slot, align 4
  %call4 = call noundef ptr @_ZN13SQCollectableD2Ev(ptr noundef nonnull align 8 dereferenceable(48) %this1) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val5 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val5
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN13SQCollectableC2Ev(ptr noundef nonnull returned align 8 dereferenceable(48) %this) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN12SQRefCountedC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %this1)
  store ptr getelementptr inbounds ({ [8 x ptr] }, ptr @_ZTV13SQCollectable, i32 0, inrange i32 0, i32 2), ptr %this1, align 8
  ret ptr %this1
}

declare void @_ZN13SQCollectable10AddToChainEPPS_S0_(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN13SQCollectableD2Ev(ptr noundef nonnull returned align 8 dereferenceable(48) %this) unnamed_addr #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN12SQRefCountedD2Ev(ptr noundef nonnull align 8 dereferenceable(24) %this1) #10
  ret ptr %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN12SQRefCountedC2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTV12SQRefCounted, i32 0, inrange i32 0, i32 2), ptr %this1, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_uiRef, align 8
  %_weakref = getelementptr inbounds %struct.SQRefCounted, ptr %this1, i32 0, i32 2
  store ptr null, ptr %_weakref, align 8
  ret ptr %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN13SQCollectableD1Ev(ptr noundef nonnull returned align 8 dereferenceable(48) %this) unnamed_addr #3 align 2 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  call void @llvm.trap() #12
  unreachable
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN13SQCollectableD0Ev(ptr noundef nonnull align 8 dereferenceable(48) %this) unnamed_addr #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  call void @llvm.trap() #12
  unreachable
}

declare void @__cxa_pure_virtual() unnamed_addr

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #9

; Function Attrs: nounwind
declare noundef ptr @_ZN12SQRefCountedD2Ev(ptr noundef nonnull returned align 8 dereferenceable(24)) unnamed_addr #6

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP9SQClosure(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 134217984, ptr %_type, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %0, ptr %_unVal2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %1 = load ptr, ptr %_unVal3, align 8
  %tobool = icmp ne ptr %1, null
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 229, ptr noundef @.str.51) #11
  unreachable

2:                                                ; No predecessors!
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %2
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %3 = load ptr, ptr %_unVal4, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %4, 1
  store i64 %inc, ptr %_uiRef, align 8
  %5 = load ptr, ptr %retval, align 8
  ret ptr %5
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP8SQString(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 134217744, ptr %_type, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %0, ptr %_unVal2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %1 = load ptr, ptr %_unVal3, align 8
  %tobool = icmp ne ptr %1, null
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 233, ptr noundef @.str.51) #11
  unreachable

2:                                                ; No predecessors!
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %2
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %3 = load ptr, ptr %_unVal4, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %4, 1
  store i64 %inc, ptr %_uiRef, align 8
  %5 = load ptr, ptr %retval, align 8
  ret ptr %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2Ex(ptr noundef nonnull returned align 8 dereferenceable(16) %this, i64 noundef %x) unnamed_addr #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  store i64 %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 83886082, ptr %_type, align 8
  %0 = load i64, ptr %x.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 %0, ptr %_unVal2, align 8
  ret ptr %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2Eb(ptr noundef nonnull returned align 8 dereferenceable(16) %this, i1 noundef zeroext %bBool) unnamed_addr #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %bBool.addr = alloca i8, align 1
  store ptr %this, ptr %this.addr, align 8
  %frombool = zext i1 %bBool to i8
  store i8 %frombool, ptr %bBool.addr, align 1
  %this1 = load ptr, ptr %this.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 16777224, ptr %_type, align 8
  %0 = load i8, ptr %bBool.addr, align 1
  %tobool = trunc i8 %0 to i1
  %1 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i32 1, i32 0
  %conv = sext i32 %cond to i64
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 %conv, ptr %_unVal2, align 8
  ret ptr %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2Ef(ptr noundef nonnull returned align 8 dereferenceable(16) %this, float noundef %x) unnamed_addr #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca float, align 4
  store ptr %this, ptr %this.addr, align 8
  store float %x, ptr %x.addr, align 4
  %this1 = load ptr, ptr %this.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 83886084, ptr %_type, align 8
  %0 = load float, ptr %x.addr, align 4
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store float %0, ptr %_unVal2, align 8
  ret ptr %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EPv(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 2048, ptr %_type, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %0, ptr %_unVal2, align 8
  ret ptr %this1
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN10SQUserDataC1EP13SQSharedState(ptr noundef nonnull returned align 8 dereferenceable(80) %this, ptr noundef %ss) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %ss.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %ss, ptr %ss.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %ss.addr, align 8
  %call = call noundef ptr @_ZN10SQUserDataC2EP13SQSharedState(ptr noundef nonnull align 8 dereferenceable(80) %this1, ptr noundef %0)
  ret ptr %this1
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN10SQUserDataC2EP13SQSharedState(ptr noundef nonnull returned align 8 dereferenceable(80) %this, ptr noundef %ss) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
entry:
  %this.addr = alloca ptr, align 8
  %ss.addr = alloca ptr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %this, ptr %this.addr, align 8
  store ptr %ss, ptr %ss.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN11SQDelegableC2Ev(ptr noundef nonnull align 8 dereferenceable(56) %this1)
  store ptr getelementptr inbounds ({ [9 x ptr] }, ptr @_ZTV10SQUserData, i32 0, inrange i32 0, i32 2), ptr %this1, align 8
  %_delegate = getelementptr inbounds %struct.SQDelegable, ptr %this1, i32 0, i32 1
  store ptr null, ptr %_delegate, align 8
  %_hook = getelementptr inbounds %struct.SQUserData, ptr %this1, i32 0, i32 2
  store ptr null, ptr %_hook, align 8
  %_next = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 1
  store ptr null, ptr %_next, align 8
  %_prev = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 2
  store ptr null, ptr %_prev, align 8
  %0 = load ptr, ptr %ss.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 3
  store ptr %0, ptr %_sharedstate, align 8
  %_sharedstate2 = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 3
  %1 = load ptr, ptr %_sharedstate2, align 8
  %_gc_chain = getelementptr inbounds %struct.SQSharedState, ptr %1, i32 0, i32 9
  invoke void @_ZN13SQCollectable10AddToChainEPPS_S0_(ptr noundef %_gc_chain, ptr noundef %this1)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  ret ptr %this1

lpad:                                             ; preds = %entry
  %2 = landingpad { ptr, i32 }
          cleanup
  %3 = extractvalue { ptr, i32 } %2, 0
  store ptr %3, ptr %exn.slot, align 8
  %4 = extractvalue { ptr, i32 } %2, 1
  store i32 %4, ptr %ehselector.slot, align 4
  %call3 = call noundef ptr @_ZN11SQDelegableD2Ev(ptr noundef nonnull align 8 dereferenceable(56) %this1) #10
  br label %eh.resume

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val4 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val4
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQDelegableC2Ev(ptr noundef nonnull returned align 8 dereferenceable(56) %this) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN13SQCollectableC2Ev(ptr noundef nonnull align 8 dereferenceable(48) %this1)
  store ptr getelementptr inbounds ({ [9 x ptr] }, ptr @_ZTV11SQDelegable, i32 0, inrange i32 0, i32 2), ptr %this1, align 8
  ret ptr %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQDelegableD2Ev(ptr noundef nonnull returned align 8 dereferenceable(56) %this) unnamed_addr #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN13SQCollectableD2Ev(ptr noundef nonnull align 8 dereferenceable(48) %this1) #10
  ret ptr %this1
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP10SQUserData(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 167772288, ptr %_type, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %0, ptr %_unVal2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %1 = load ptr, ptr %_unVal3, align 8
  %tobool = icmp ne ptr %1, null
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 234, ptr noundef @.str.51) #11
  unreachable

2:                                                ; No predecessors!
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %2
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %3 = load ptr, ptr %_unVal4, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %4, 1
  store i64 %inc, ptr %_uiRef, align 8
  %5 = load ptr, ptr %retval, align 8
  ret ptr %5
}

declare noundef ptr @_ZN7SQTableC1EP13SQSharedStatex(ptr noundef nonnull returned align 8 dereferenceable(88), ptr noundef, i64 noundef) unnamed_addr #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP7SQTable(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 167772192, ptr %_type, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %0, ptr %_unVal2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %1 = load ptr, ptr %_unVal3, align 8
  %tobool = icmp ne ptr %1, null
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 225, ptr noundef @.str.51) #11
  unreachable

2:                                                ; No predecessors!
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %2
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %3 = load ptr, ptr %_unVal4, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %4, 1
  store i64 %inc, ptr %_uiRef, align 8
  %5 = load ptr, ptr %retval, align 8
  ret ptr %5
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7SQArrayC1EP13SQSharedStatex(ptr noundef nonnull returned align 8 dereferenceable(72) %this, ptr noundef %ss, i64 noundef %nsize) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %ss.addr = alloca ptr, align 8
  %nsize.addr = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %ss, ptr %ss.addr, align 8
  store i64 %nsize, ptr %nsize.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %ss.addr, align 8
  %1 = load i64, ptr %nsize.addr, align 8
  %call = call noundef ptr @_ZN7SQArrayC2EP13SQSharedStatex(ptr noundef nonnull align 8 dereferenceable(72) %this1, ptr noundef %0, i64 noundef %1)
  ret ptr %this1
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7SQArrayC2EP13SQSharedStatex(ptr noundef nonnull returned align 8 dereferenceable(72) %this, ptr noundef %ss, i64 noundef %nsize) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
entry:
  %this.addr = alloca ptr, align 8
  %ss.addr = alloca ptr, align 8
  %nsize.addr = alloca i64, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %ss, ptr %ss.addr, align 8
  store i64 %nsize, ptr %nsize.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN13SQCollectableC2Ev(ptr noundef nonnull align 8 dereferenceable(48) %this1)
  store ptr getelementptr inbounds ({ [8 x ptr] }, ptr @_ZTV7SQArray, i32 0, inrange i32 0, i32 2), ptr %this1, align 8
  %_values = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  %call2 = invoke noundef ptr @_ZN8sqvectorI11SQObjectPtrEC1Ev(ptr noundef nonnull align 8 dereferenceable(24) %_values)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %_values3 = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  %0 = load i64, ptr %nsize.addr, align 8
  %call6 = invoke noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont5 unwind label %lpad4

invoke.cont5:                                     ; preds = %invoke.cont
  invoke void @_ZN8sqvectorI11SQObjectPtrE6resizeEyRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %_values3, i64 noundef %0, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont8 unwind label %lpad7

invoke.cont8:                                     ; preds = %invoke.cont5
  %call9 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  %_next = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 1
  store ptr null, ptr %_next, align 8
  %_prev = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 2
  store ptr null, ptr %_prev, align 8
  %1 = load ptr, ptr %ss.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 3
  store ptr %1, ptr %_sharedstate, align 8
  %_sharedstate11 = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 3
  %2 = load ptr, ptr %_sharedstate11, align 8
  %_gc_chain = getelementptr inbounds %struct.SQSharedState, ptr %2, i32 0, i32 9
  invoke void @_ZN13SQCollectable10AddToChainEPPS_S0_(ptr noundef %_gc_chain, ptr noundef %this1)
          to label %invoke.cont12 unwind label %lpad4

invoke.cont12:                                    ; preds = %invoke.cont8
  ret ptr %this1

lpad:                                             ; preds = %entry
  %3 = landingpad { ptr, i32 }
          cleanup
  %4 = extractvalue { ptr, i32 } %3, 0
  store ptr %4, ptr %exn.slot, align 8
  %5 = extractvalue { ptr, i32 } %3, 1
  store i32 %5, ptr %ehselector.slot, align 4
  br label %ehcleanup14

lpad4:                                            ; preds = %invoke.cont8, %invoke.cont
  %6 = landingpad { ptr, i32 }
          cleanup
  %7 = extractvalue { ptr, i32 } %6, 0
  store ptr %7, ptr %exn.slot, align 8
  %8 = extractvalue { ptr, i32 } %6, 1
  store i32 %8, ptr %ehselector.slot, align 4
  br label %ehcleanup

lpad7:                                            ; preds = %invoke.cont5
  %9 = landingpad { ptr, i32 }
          cleanup
  %10 = extractvalue { ptr, i32 } %9, 0
  store ptr %10, ptr %exn.slot, align 8
  %11 = extractvalue { ptr, i32 } %9, 1
  store i32 %11, ptr %ehselector.slot, align 4
  %call10 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %ehcleanup

ehcleanup:                                        ; preds = %lpad7, %lpad4
  %call13 = call noundef ptr @_ZN8sqvectorI11SQObjectPtrED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %_values) #10
  br label %ehcleanup14

ehcleanup14:                                      ; preds = %ehcleanup, %lpad
  %call15 = call noundef ptr @_ZN13SQCollectableD2Ev(ptr noundef nonnull align 8 dereferenceable(48) %this1) #10
  br label %eh.resume

eh.resume:                                        ; preds = %ehcleanup14
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val16 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val16
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorI11SQObjectPtrEC1Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN8sqvectorI11SQObjectPtrEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %this1)
  ret ptr %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorI11SQObjectPtrED1Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN8sqvectorI11SQObjectPtrED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %this1) #10
  ret ptr %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorI11SQObjectPtrEC2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_vals = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  store ptr null, ptr %_vals, align 8
  %_size = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_size, align 8
  %_allocated = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 2
  store i64 0, ptr %_allocated, align 8
  ret ptr %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorI11SQObjectPtrED2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #3 align 2 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  %i = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %_allocated = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 2
  %0 = load i64, ptr %_allocated, align 8
  %tobool = icmp ne i64 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, ptr %i, align 8
  %_size = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %2 = load i64, ptr %_size, align 8
  %cmp = icmp ult i64 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %_vals = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %3 = load ptr, ptr %_vals, align 8
  %4 = load i64, ptr %i, align 8
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %3, i64 %4
  %call = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx) #10
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i64, ptr %i, align 8
  %inc = add i64 %5, 1
  store i64 %inc, ptr %i, align 8
  br label %for.cond, !llvm.loop !23

for.end:                                          ; preds = %for.cond
  %_vals2 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %6 = load ptr, ptr %_vals2, align 8
  %_allocated3 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 2
  %7 = load i64, ptr %_allocated3, align 8
  %mul = mul i64 %7, 16
  invoke void @_Z10sq_vm_freePvy(ptr noundef %6, i64 noundef %mul)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %for.end
  br label %if.end

if.end:                                           ; preds = %invoke.cont, %entry
  %8 = load ptr, ptr %retval, align 8
  ret ptr %8

terminate.lpad:                                   ; preds = %for.end
  %9 = landingpad { ptr, i32 }
          catch ptr null
  %10 = extractvalue { ptr, i32 } %9, 0
  call void @__clang_call_terminate(ptr %10) #12
  unreachable
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP7SQArray(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 134217792, ptr %_type, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %0, ptr %_unVal2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %1 = load ptr, ptr %_unVal3, align 8
  %tobool = icmp ne ptr %1, null
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 228, ptr noundef @.str.51) #11
  unreachable

2:                                                ; No predecessors!
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %2
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %3 = load ptr, ptr %_unVal4, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %4, 1
  store i64 %inc, ptr %_uiRef, align 8
  %5 = load ptr, ptr %retval, align 8
  ret ptr %5
}

declare noundef ptr @_ZN7SQClassC1EP13SQSharedStatePS_(ptr noundef nonnull returned align 8 dereferenceable(456), ptr noundef, ptr noundef) unnamed_addr #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP7SQClass(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 134234112, ptr %_type, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %0, ptr %_unVal2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %1 = load ptr, ptr %_unVal3, align 8
  %tobool = icmp ne ptr %1, null
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 226, ptr noundef @.str.51) #11
  unreachable

2:                                                ; No predecessors!
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %2
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %3 = load ptr, ptr %_unVal4, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %4, 1
  store i64 %inc, ptr %_uiRef, align 8
  %5 = load ptr, ptr %retval, align 8
  ret ptr %5
}

declare noundef ptr @_ZN4SQVM11PrintObjValERK11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(344), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN8sqvectorI11SQObjectPtrE9push_backERKS0_(ptr noundef nonnull align 8 dereferenceable(24) %this, ptr noundef nonnull align 8 dereferenceable(16) %val) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %val.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %val, ptr %val.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_allocated = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 2
  %0 = load i64, ptr %_allocated, align 8
  %_size = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %1 = load i64, ptr %_size, align 8
  %cmp = icmp ule i64 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %_size2 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %2 = load i64, ptr %_size2, align 8
  %mul = mul i64 %2, 2
  call void @_ZN8sqvectorI11SQObjectPtrE8_reallocEy(ptr noundef nonnull align 8 dereferenceable(24) %this1, i64 noundef %mul)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %_vals = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %3 = load ptr, ptr %_vals, align 8
  %_size3 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %4 = load i64, ptr %_size3, align 8
  %inc = add i64 %4, 1
  store i64 %inc, ptr %_size3, align 8
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %3, i64 %4
  %5 = load ptr, ptr %val.addr, align 8
  %call = call noundef ptr @_ZN11SQObjectPtrC1ERKS_(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx, ptr noundef nonnull align 8 dereferenceable(16) %5)
  ret ptr %arrayidx
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorI11SQObjectPtrE8_reallocEy(ptr noundef nonnull align 8 dereferenceable(24) %this, i64 noundef %newsize) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %newsize.addr = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  store i64 %newsize, ptr %newsize.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load i64, ptr %newsize.addr, align 8
  %cmp = icmp ugt i64 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i64, ptr %newsize.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %1, %cond.true ], [ 4, %cond.false ]
  store i64 %cond, ptr %newsize.addr, align 8
  %_vals = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %2 = load ptr, ptr %_vals, align 8
  %_allocated = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 2
  %3 = load i64, ptr %_allocated, align 8
  %mul = mul i64 %3, 16
  %4 = load i64, ptr %newsize.addr, align 8
  %mul2 = mul i64 %4, 16
  %call = call noundef ptr @_Z13sq_vm_reallocPvyy(ptr noundef %2, i64 noundef %mul, i64 noundef %mul2)
  %_vals3 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  store ptr %call, ptr %_vals3, align 8
  %5 = load i64, ptr %newsize.addr, align 8
  %_allocated4 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 2
  store i64 %5, ptr %_allocated4, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZNK8sqvectorI11SQObjectPtrE3topEv(ptr noundef nonnull align 8 dereferenceable(24) %this) #4 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_vals = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %0 = load ptr, ptr %_vals, align 8
  %_size = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %1 = load i64, ptr %_size, align 8
  %sub = sub i64 %1, 1
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %0, i64 %sub
  ret ptr %arrayidx
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorI11SQObjectPtrE8pop_backEv(ptr noundef nonnull align 8 dereferenceable(24) %this) #4 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_size = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %0 = load i64, ptr %_size, align 8
  %dec = add i64 %0, -1
  store i64 %dec, ptr %_size, align 8
  %_vals = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %1 = load ptr, ptr %_vals, align 8
  %_size2 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %2 = load i64, ptr %_size2, align 8
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %1, i64 %2
  %call = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx) #10
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7SQArray14ShrinkIfNeededEv(ptr noundef nonnull align 8 dereferenceable(72) %this) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_values = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  %call = call noundef i64 @_ZNK8sqvectorI11SQObjectPtrE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %_values)
  %_values2 = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  %call3 = call noundef i64 @_ZN8sqvectorI11SQObjectPtrE8capacityEv(ptr noundef nonnull align 8 dereferenceable(24) %_values2)
  %shr = lshr i64 %call3, 2
  %cmp = icmp ule i64 %call, %shr
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %_values4 = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  call void @_ZN8sqvectorI11SQObjectPtrE11shrinktofitEv(ptr noundef nonnull align 8 dereferenceable(24) %_values4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZN8sqvectorI11SQObjectPtrE8capacityEv(ptr noundef nonnull align 8 dereferenceable(24) %this) #4 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_allocated = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 2
  %0 = load i64, ptr %_allocated, align 8
  ret i64 %0
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorI11SQObjectPtrE11shrinktofitEv(ptr noundef nonnull align 8 dereferenceable(24) %this) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_size = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %0 = load i64, ptr %_size, align 8
  %cmp = icmp ugt i64 %0, 4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %_size2 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %1 = load i64, ptr %_size2, align 8
  call void @_ZN8sqvectorI11SQObjectPtrE8_reallocEy(ptr noundef nonnull align 8 dereferenceable(24) %this1, i64 noundef %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7SQArray6ResizeExR11SQObjectPtr(ptr noundef nonnull align 8 dereferenceable(72) %this, i64 noundef %size, ptr noundef nonnull align 8 dereferenceable(16) %fill) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %size.addr = alloca i64, align 8
  %fill.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store i64 %size, ptr %size.addr, align 8
  store ptr %fill, ptr %fill.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_values = getelementptr inbounds %struct.SQArray, ptr %this1, i32 0, i32 1
  %0 = load i64, ptr %size.addr, align 8
  %1 = load ptr, ptr %fill.addr, align 8
  call void @_ZN8sqvectorI11SQObjectPtrE6resizeEyRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %_values, i64 noundef %0, ptr noundef nonnull align 8 dereferenceable(16) %1)
  call void @_ZN7SQArray14ShrinkIfNeededEv(ptr noundef nonnull align 8 dereferenceable(72) %this1)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorI11SQObjectPtrE6removeEy(ptr noundef nonnull align 8 dereferenceable(24) %this, i64 noundef %idx) #4 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_vals = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %0 = load ptr, ptr %_vals, align 8
  %1 = load i64, ptr %idx.addr, align 8
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %0, i64 %1
  %call = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx) #10
  %2 = load i64, ptr %idx.addr, align 8
  %_size = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %3 = load i64, ptr %_size, align 8
  %sub = sub i64 %3, 1
  %cmp = icmp ult i64 %2, %sub
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %_vals2 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %4 = load ptr, ptr %_vals2, align 8
  %5 = load i64, ptr %idx.addr, align 8
  %arrayidx3 = getelementptr inbounds %struct.SQObjectPtr, ptr %4, i64 %5
  %_vals4 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %6 = load ptr, ptr %_vals4, align 8
  %7 = load i64, ptr %idx.addr, align 8
  %add = add i64 %7, 1
  %arrayidx5 = getelementptr inbounds %struct.SQObjectPtr, ptr %6, i64 %add
  %_size6 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %8 = load i64, ptr %_size6, align 8
  %9 = load i64, ptr %idx.addr, align 8
  %sub7 = sub i64 %8, %9
  %sub8 = sub i64 %sub7, 1
  %mul = mul i64 16, %sub8
  call void @llvm.memmove.p0.p0.i64(ptr align 8 %arrayidx3, ptr align 8 %arrayidx5, i64 %mul, i1 false)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %_size9 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %10 = load i64, ptr %_size9, align 8
  %dec = add i64 %10, -1
  store i64 %dec, ptr %_size9, align 8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #5

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorI11SQObjectPtrE6insertEyRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %this, i64 noundef %idx, ptr noundef nonnull align 8 dereferenceable(16) %val) #0 align 2 personality ptr @__gxx_personality_v0 {
entry:
  %this.addr = alloca ptr, align 8
  %idx.addr = alloca i64, align 8
  %val.addr = alloca ptr, align 8
  %ref.tmp = alloca %struct.SQObjectPtr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  %i = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  store i64 %idx, ptr %idx.addr, align 8
  store ptr %val, ptr %val.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_size = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %0 = load i64, ptr %_size, align 8
  %add = add i64 %0, 1
  %call = call noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
  invoke void @_ZN8sqvectorI11SQObjectPtrE6resizeEyRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %this1, i64 noundef %add, ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %call2 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  %_size4 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 1
  %1 = load i64, ptr %_size4, align 8
  %sub = sub i64 %1, 1
  store i64 %sub, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %invoke.cont
  %2 = load i64, ptr %i, align 8
  %3 = load i64, ptr %idx.addr, align 8
  %cmp = icmp ugt i64 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %_vals = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %4 = load ptr, ptr %_vals, align 8
  %5 = load i64, ptr %i, align 8
  %sub5 = sub i64 %5, 1
  %arrayidx = getelementptr inbounds %struct.SQObjectPtr, ptr %4, i64 %sub5
  %_vals6 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %6 = load ptr, ptr %_vals6, align 8
  %7 = load i64, ptr %i, align 8
  %arrayidx7 = getelementptr inbounds %struct.SQObjectPtr, ptr %6, i64 %7
  %call8 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx7, ptr noundef nonnull align 8 dereferenceable(16) %arrayidx)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i64, ptr %i, align 8
  %dec = add i64 %8, -1
  store i64 %dec, ptr %i, align 8
  br label %for.cond, !llvm.loop !24

lpad:                                             ; preds = %entry
  %9 = landingpad { ptr, i32 }
          cleanup
  %10 = extractvalue { ptr, i32 } %9, 0
  store ptr %10, ptr %exn.slot, align 8
  %11 = extractvalue { ptr, i32 } %9, 1
  store i32 %11, ptr %ehselector.slot, align 4
  %call3 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %ref.tmp) #10
  br label %eh.resume

for.end:                                          ; preds = %for.cond
  %12 = load ptr, ptr %val.addr, align 8
  %_vals9 = getelementptr inbounds %class.sqvector, ptr %this1, i32 0, i32 0
  %13 = load ptr, ptr %_vals9, align 8
  %14 = load i64, ptr %idx.addr, align 8
  %arrayidx10 = getelementptr inbounds %struct.SQObjectPtr, ptr %13, i64 %14
  %call11 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN11SQObjectPtraSERKS_(ptr noundef nonnull align 8 dereferenceable(16) %arrayidx10, ptr noundef nonnull align 8 dereferenceable(16) %12)
  ret void

eh.resume:                                        ; preds = %lpad
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val12 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val12
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN15SQNativeClosureC1EP13SQSharedStatePFxP4SQVME(ptr noundef nonnull returned align 8 dereferenceable(128) %this, ptr noundef %ss, ptr noundef %func) unnamed_addr #2 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %ss.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %ss, ptr %ss.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load ptr, ptr %ss.addr, align 8
  %1 = load ptr, ptr %func.addr, align 8
  %call = call noundef ptr @_ZN15SQNativeClosureC2EP13SQSharedStatePFxP4SQVME(ptr noundef nonnull align 8 dereferenceable(128) %this1, ptr noundef %0, ptr noundef %1)
  ret ptr %this1
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN15SQNativeClosureC2EP13SQSharedStatePFxP4SQVME(ptr noundef nonnull returned align 8 dereferenceable(128) %this, ptr noundef %ss, ptr noundef %func) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
entry:
  %this.addr = alloca ptr, align 8
  %ss.addr = alloca ptr, align 8
  %func.addr = alloca ptr, align 8
  %exn.slot = alloca ptr, align 8
  %ehselector.slot = alloca i32, align 4
  store ptr %this, ptr %this.addr, align 8
  store ptr %ss, ptr %ss.addr, align 8
  store ptr %func, ptr %func.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %call = call noundef ptr @_ZN13SQCollectableC2Ev(ptr noundef nonnull align 8 dereferenceable(48) %this1)
  store ptr getelementptr inbounds ({ [8 x ptr] }, ptr @_ZTV15SQNativeClosure, i32 0, inrange i32 0, i32 2), ptr %this1, align 8
  %_typecheck = getelementptr inbounds %struct.SQNativeClosure, ptr %this1, i32 0, i32 2
  %call2 = invoke noundef ptr @_ZN8sqvectorIxEC1Ev(ptr noundef nonnull align 8 dereferenceable(24) %_typecheck)
          to label %invoke.cont unwind label %lpad

invoke.cont:                                      ; preds = %entry
  %_name = getelementptr inbounds %struct.SQNativeClosure, ptr %this1, i32 0, i32 7
  %call5 = invoke noundef ptr @_ZN11SQObjectPtrC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %_name)
          to label %invoke.cont4 unwind label %lpad3

invoke.cont4:                                     ; preds = %invoke.cont
  %0 = load ptr, ptr %func.addr, align 8
  %_function = getelementptr inbounds %struct.SQNativeClosure, ptr %this1, i32 0, i32 6
  store ptr %0, ptr %_function, align 8
  %_next = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 1
  store ptr null, ptr %_next, align 8
  %_prev = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 2
  store ptr null, ptr %_prev, align 8
  %1 = load ptr, ptr %ss.addr, align 8
  %_sharedstate = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 3
  store ptr %1, ptr %_sharedstate, align 8
  %_sharedstate6 = getelementptr inbounds %struct.SQCollectable, ptr %this1, i32 0, i32 3
  %2 = load ptr, ptr %_sharedstate6, align 8
  %_gc_chain = getelementptr inbounds %struct.SQSharedState, ptr %2, i32 0, i32 9
  invoke void @_ZN13SQCollectable10AddToChainEPPS_S0_(ptr noundef %_gc_chain, ptr noundef %this1)
          to label %invoke.cont8 unwind label %lpad7

invoke.cont8:                                     ; preds = %invoke.cont4
  %_env = getelementptr inbounds %struct.SQNativeClosure, ptr %this1, i32 0, i32 5
  store ptr null, ptr %_env, align 8
  ret ptr %this1

lpad:                                             ; preds = %entry
  %3 = landingpad { ptr, i32 }
          cleanup
  %4 = extractvalue { ptr, i32 } %3, 0
  store ptr %4, ptr %exn.slot, align 8
  %5 = extractvalue { ptr, i32 } %3, 1
  store i32 %5, ptr %ehselector.slot, align 4
  br label %ehcleanup11

lpad3:                                            ; preds = %invoke.cont
  %6 = landingpad { ptr, i32 }
          cleanup
  %7 = extractvalue { ptr, i32 } %6, 0
  store ptr %7, ptr %exn.slot, align 8
  %8 = extractvalue { ptr, i32 } %6, 1
  store i32 %8, ptr %ehselector.slot, align 4
  br label %ehcleanup

lpad7:                                            ; preds = %invoke.cont4
  %9 = landingpad { ptr, i32 }
          cleanup
  %10 = extractvalue { ptr, i32 } %9, 0
  store ptr %10, ptr %exn.slot, align 8
  %11 = extractvalue { ptr, i32 } %9, 1
  store i32 %11, ptr %ehselector.slot, align 4
  %call9 = call noundef ptr @_ZN11SQObjectPtrD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %_name) #10
  br label %ehcleanup

ehcleanup:                                        ; preds = %lpad7, %lpad3
  %call10 = call noundef ptr @_ZN8sqvectorIxED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %_typecheck) #10
  br label %ehcleanup11

ehcleanup11:                                      ; preds = %ehcleanup, %lpad
  %call12 = call noundef ptr @_ZN13SQCollectableD2Ev(ptr noundef nonnull align 8 dereferenceable(48) %this1) #10
  br label %eh.resume

eh.resume:                                        ; preds = %ehcleanup11
  %exn = load ptr, ptr %exn.slot, align 8
  %sel = load i32, ptr %ehselector.slot, align 4
  %lpad.val = insertvalue { ptr, i32 } poison, ptr %exn, 0
  %lpad.val13 = insertvalue { ptr, i32 } %lpad.val, i32 %sel, 1
  resume { ptr, i32 } %lpad.val13
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP15SQNativeClosure(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 134218240, ptr %_type, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %0, ptr %_unVal2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %1 = load ptr, ptr %_unVal3, align 8
  %tobool = icmp ne ptr %1, null
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 230, ptr noundef @.str.51) #11
  unreachable

2:                                                ; No predecessors!
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %2
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %3 = load ptr, ptr %_unVal4, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %4, 1
  store i64 %inc, ptr %_uiRef, align 8
  %5 = load ptr, ptr %retval, align 8
  ret ptr %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2ERK11tagSQObject(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef nonnull align 8 dereferenceable(16) %o) unnamed_addr #3 align 2 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  %o.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %o, ptr %o.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %0 = load ptr, ptr %o.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %_type2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 %1, ptr %_type2, align 8
  %2 = load ptr, ptr %o.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_unVal3, ptr align 8 %_unVal, i64 8, i1 false)
  %_type4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  %3 = load i32, ptr %_type4, align 8
  %and = and i32 %3, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %4 = load ptr, ptr %_unVal5, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %4, i32 0, i32 1
  %5 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %5, 1
  store i64 %inc, ptr %_uiRef, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load ptr, ptr %retval, align 8
  ret ptr %6
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP10SQInstance(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 167804928, ptr %_type, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %0, ptr %_unVal2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %1 = load ptr, ptr %_unVal3, align 8
  %tobool = icmp ne ptr %1, null
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 227, ptr noundef @.str.51) #11
  unreachable

2:                                                ; No predecessors!
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %2
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %3 = load ptr, ptr %_unVal4, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %4, 1
  store i64 %inc, ptr %_uiRef, align 8
  %5 = load ptr, ptr %retval, align 8
  ret ptr %5
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2EP9SQWeakRef(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef %x) unnamed_addr #2 align 2 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  %x.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %x, ptr %x.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_unVal, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 134283264, ptr %_type, align 8
  %0 = load ptr, ptr %x.addr, align 8
  %_unVal2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  store ptr %0, ptr %_unVal2, align 8
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %1 = load ptr, ptr %_unVal3, align 8
  %tobool = icmp ne ptr %1, null
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  call void @__assert_rtn(ptr noundef @__func__._ZN11SQObjectPtrC2EP4SQVM, ptr noundef @.str.50, i32 noundef 235, ptr noundef @.str.51) #11
  unreachable

2:                                                ; No predecessors!
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %2
  %_unVal4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %3 = load ptr, ptr %_unVal4, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %3, i32 0, i32 1
  %4 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %4, 1
  store i64 %inc, ptr %_uiRef, align 8
  %5 = load ptr, ptr %retval, align 8
  ret ptr %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN11SQObjectPtrC2ERKS_(ptr noundef nonnull returned align 8 dereferenceable(16) %this, ptr noundef nonnull align 8 dereferenceable(16) %o) unnamed_addr #3 align 2 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  %o.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  store ptr %o, ptr %o.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %0 = load ptr, ptr %o.addr, align 8
  %_type = getelementptr inbounds %struct.tagSQObject, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %_type, align 8
  %_type2 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  store i32 %1, ptr %_type2, align 8
  %2 = load ptr, ptr %o.addr, align 8
  %_unVal = getelementptr inbounds %struct.tagSQObject, ptr %2, i32 0, i32 1
  %_unVal3 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_unVal3, ptr align 8 %_unVal, i64 8, i1 false)
  %_type4 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 0
  %3 = load i32, ptr %_type4, align 8
  %and = and i32 %3, 134217728
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %_unVal5 = getelementptr inbounds %struct.tagSQObject, ptr %this1, i32 0, i32 1
  %4 = load ptr, ptr %_unVal5, align 8
  %_uiRef = getelementptr inbounds %struct.SQRefCounted, ptr %4, i32 0, i32 1
  %5 = load i64, ptr %_uiRef, align 8
  %inc = add i64 %5, 1
  store i64 %inc, ptr %_uiRef, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load ptr, ptr %retval, align 8
  ret ptr %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorIxEC2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #3 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %_vals = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 0
  store ptr null, ptr %_vals, align 8
  %_size = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 1
  store i64 0, ptr %_size, align 8
  %_allocated = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 2
  store i64 0, ptr %_allocated, align 8
  ret ptr %this1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN8sqvectorIxED2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %this) unnamed_addr #3 align 2 personality ptr @__gxx_personality_v0 {
entry:
  %retval = alloca ptr, align 8
  %this.addr = alloca ptr, align 8
  %i = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  store ptr %this1, ptr %retval, align 8
  %_allocated = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 2
  %0 = load i64, ptr %_allocated, align 8
  %tobool = icmp ne i64 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, ptr %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i64, ptr %i, align 8
  %_size = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 1
  %2 = load i64, ptr %_size, align 8
  %cmp = icmp ult i64 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %_vals = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 0
  %3 = load ptr, ptr %_vals, align 8
  %4 = load i64, ptr %i, align 8
  %arrayidx = getelementptr inbounds i64, ptr %3, i64 %4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i64, ptr %i, align 8
  %inc = add i64 %5, 1
  store i64 %inc, ptr %i, align 8
  br label %for.cond, !llvm.loop !25

for.end:                                          ; preds = %for.cond
  %_vals2 = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 0
  %6 = load ptr, ptr %_vals2, align 8
  %_allocated3 = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 2
  %7 = load i64, ptr %_allocated3, align 8
  %mul = mul i64 %7, 8
  invoke void @_Z10sq_vm_freePvy(ptr noundef %6, i64 noundef %mul)
          to label %invoke.cont unwind label %terminate.lpad

invoke.cont:                                      ; preds = %for.end
  br label %if.end

if.end:                                           ; preds = %invoke.cont, %entry
  %8 = load ptr, ptr %retval, align 8
  ret ptr %8

terminate.lpad:                                   ; preds = %for.end
  %9 = landingpad { ptr, i32 }
          catch ptr null
  %10 = extractvalue { ptr, i32 } %9, 0
  call void @__clang_call_terminate(ptr %10) #12
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN8sqvectorIxE8_reallocEy(ptr noundef nonnull align 8 dereferenceable(24) %this, i64 noundef %newsize) #0 align 2 {
entry:
  %this.addr = alloca ptr, align 8
  %newsize.addr = alloca i64, align 8
  store ptr %this, ptr %this.addr, align 8
  store i64 %newsize, ptr %newsize.addr, align 8
  %this1 = load ptr, ptr %this.addr, align 8
  %0 = load i64, ptr %newsize.addr, align 8
  %cmp = icmp ugt i64 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i64, ptr %newsize.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %1, %cond.true ], [ 4, %cond.false ]
  store i64 %cond, ptr %newsize.addr, align 8
  %_vals = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 0
  %2 = load ptr, ptr %_vals, align 8
  %_allocated = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 2
  %3 = load i64, ptr %_allocated, align 8
  %mul = mul i64 %3, 8
  %4 = load i64, ptr %newsize.addr, align 8
  %mul2 = mul i64 %4, 8
  %call = call noundef ptr @_Z13sq_vm_reallocPvyy(ptr noundef %2, i64 noundef %mul, i64 noundef %mul2)
  %_vals3 = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 0
  store ptr %call, ptr %_vals3, align 8
  %5 = load i64, ptr %newsize.addr, align 8
  %_allocated4 = getelementptr inbounds %class.sqvector.2, ptr %this1, i32 0, i32 2
  store i64 %5, ptr %_allocated4, align 8
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
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
