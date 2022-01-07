Q foo(int i, Q q1, Q q2) {
  if (i < (int)q1) {
    return 0;
  }
  return (Ref)q2;
}

mutable Q helper(int arg) {
  mutable Q dynamic = arg . arg;
  if (arg * arg < 64) {
    dynamic = 64;
  }
  return foo (arg, -arg, dynamic);
}

Q main(int arg) {
    return helper(10) . helper(-4);
}