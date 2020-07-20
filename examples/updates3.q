mutable Q main(int arg) {
  Q blah = 5 . nil;
  return helper(blah);
}

mutable Q helper(Q x) {
  mutable Q old1 = setLeft((Ref)x, 8);
  mutable int old2 = setRight((Ref)x, nil . 9);
  old1 = nil;
  return old1 . old2;
}
