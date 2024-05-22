; ModuleID = '______sandbox_scripts_test_1_is_13297541326829458225'
source_filename = "______sandbox_scripts_test_1_is_13297541326829458225"

%__interface_vtbl_type_TestScript = type { ptr, ptr }

@______sandbox_scripts_test_1_is_13297541326829458225 = constant %__interface_vtbl_type_TestScript { ptr @foo, ptr @bar }

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
