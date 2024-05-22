define double @foo(i32 %a, double %b) {
entry:
  %fptositmp = fptosi double %b to i32
  %addtmp = add i32 %a, %fptositmp
  %sitofptmp = sitofp i32 %addtmp to double
  ret double %sitofptmp
}
