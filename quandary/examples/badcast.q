
Q foo(Q asdf, Ref hjkl) {
  return (left(hjkl) . asdf);
}

Q main(int arg) {
  int a = (int)foo((nil . 8), (arg . nil));
  return a;
}
