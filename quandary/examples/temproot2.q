Q main(int arg) {
  return combine(((5 . 8). foo(arg)), foo(arg));
}

Q foo(mutable int arg) {
  mutable Q x = nil;
  while (arg > 0) {
    x = x . x;
    arg = arg - 1;
  }
  return x;
}

Q combine(Q a, Q b) {
  return a . b;
}
