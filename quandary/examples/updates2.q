mutable Q main(int arg) {
  Q blah = 5 . nil;
  return helper(blah);
}

mutable Q helper(Ref x) {
  mutable Q old1 = setLeft(x, 8);
  int old2 = setRight(x, nil . 9);
  old1 = nil;
  return old1 . old2;
}
