Q foo(Q asdf, Ref hjkl) {
  return (left(hjkl) . asdf);
}

Q main(int arg) {
  Ref a = (Ref) foo((nil . 8), (arg . nil));
  return (int) right(a);
}
