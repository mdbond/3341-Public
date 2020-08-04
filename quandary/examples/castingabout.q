Q foo(int i, Q q1, Q q2) {
  if (i < (int)q1) {
    return 0;
  }
  return (Ref)q2;
}

Q main(int arg) {
  mutable Q dynamic = arg . arg;
  if (arg * arg < 64) {
    dynamic = 64;
  }
  return foo (arg, -arg, dynamic);
}
