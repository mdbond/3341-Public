
Q foo(Q asdf, Ref hjkl) {
  int x = 5;
  Ref z = (hjkl . asdf);
  return left((Ref)left(z));
}

Q main(int arg) {
  int a = (int)foo(nil, (arg . nil));
  int b = 8 + a * 7;
  if (18 < (int)a + b) {
    Q c = b;
    return c;
  }
  return nil;
}
