; ModuleID = '______sandbox_scripts_test_script_is_10401886979661316381'
source_filename = "______sandbox_scripts_test_script_is_10401886979661316381"

%__interface_vtbl_type_TestScript = type { ptr, ptr, ptr, ptr }

@______sandbox_scripts_test_script_is_10401886979661316381 = constant %__interface_vtbl_type_TestScript { ptr @foo, ptr @bar, ptr null, ptr null }
@______sandbox_scripts_test_script_is_10401886979661316381_str = private unnamed_addr constant [58 x i8] c"______sandbox_scripts_test_script_is_10401886979661316381\00", align 1
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 0, ptr @_GLOBAL_CTOR_______sandbox_scripts_test_script_is_10401886979661316381, ptr null }]

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

define internal void @_GLOBAL_CTOR_______sandbox_scripts_test_script_is_10401886979661316381() {
entry:
  call void @registerInterface(ptr @______sandbox_scripts_test_script_is_10401886979661316381_str, ptr @______sandbox_scripts_test_script_is_10401886979661316381)
  ret void
}
