
Q foo(Q asdf, Ref hjkl) {
  return (left(hjkl) . asdf);
}

Q main(int arg) {
  Q q = foo((nil . 8), (arg . nil));
  if (arg == 1) {
    return (int)q;
  }
  return q;
}
