mutable Q main(int arg) {
  Ref c = 0 . nil;
  if (4 == 4 || sideEffect(c) == 0) {
      return c;
  }
  return c;
}

mutable int sideEffect(Ref c) {
  return setLeft(c, (int)left(c) + 1);
}
