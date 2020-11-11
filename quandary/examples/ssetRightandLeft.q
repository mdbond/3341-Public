mutable Q main(int arg) {
  mutable Q a = 15 . (45. (37 . nil) . 26);
  setRight((Ref)a, nil . arg);
  setLeft((Ref)a, 18);
  setRight((Ref)a, ((arg . arg) . nil));
  return a;
}
