
Q foo(Q asdf, Q hjkl) {
  return left((Ref) hjkl) . (asdf);
}

Q main(int arg) {
  Q q = foo((nil . 8), arg);
  if (arg == 1) {
    return (int)q;
  }
  return q;
}
