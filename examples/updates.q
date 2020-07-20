mutable Q main(int arg) {
  mutable Q blah = 5 . nil;
  setLeft((Ref)blah, 8);
  setRight((Ref)blah, nil . 9);
  return blah;
}
