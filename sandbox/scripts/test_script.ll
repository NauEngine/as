; ModuleID = '______sandbox_scripts_test_1_is_13297541326829458225'
source_filename = "______sandbox_scripts_test_1_is_13297541326829458225"

%__interface_vtbl_type_TestScript = type { ptr, ptr, ptr, ptr }

@______sandbox_scripts_test_1_is_13297541326829458225 = constant %__interface_vtbl_type_TestScript { ptr @foo, ptr @bar, ptr null, ptr null }
@______sandbox_scripts_test_1_is_13297541326829458225_str = private unnamed_addr constant [53 x i8] c"______sandbox_scripts_test_1_is_13297541326829458225\00", align 1
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL_CTOR_______sandbox_scripts_test_1_is_13297541326829458225, ptr null }]

define internal i32 @foo(ptr %__this, i32 %a, i32 %b) {
entry:
  %addtmp = add i32 %a, %b
  ret i32 %addtmp
}

define internal i32 @bar(ptr %__this, i32 %a) {
entry:
  %multmp = mul i32 %a, 10
  ret i32 %multmp
}

declare void @registerInterface(ptr, ptr)

define internal void @_GLOBAL_CTOR_______sandbox_scripts_test_1_is_13297541326829458225() {
entry:
  call void @registerInterface(ptr @______sandbox_scripts_test_1_is_13297541326829458225_str, ptr @______sandbox_scripts_test_1_is_13297541326829458225)
  ret void
}
