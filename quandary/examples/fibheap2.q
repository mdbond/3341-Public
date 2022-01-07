mutable Q main(mutable int arg) {
  mutable Ref data = 1 . (0 . nil);
  while (arg > 0) {
      data = ((int)left(data) + (int)left((Ref)right(data))) . data;
      setRight((Ref)right(data), nil);
      arg = arg - 1;
  }
  return left((Ref)right(data));
}
