mutable Q main(int arg) {
  Ref data = ((2 . nil) . ((8 . nil) . 7));
  setRight((Ref)left(data), right(data));
  return sum(data);
}

int sum(Q data) {
  if (isNil(data) != 0) {
    return 0;
  }
  if (isAtom(data) != 0) {
    return (int)data;
  }
  return sum(left((Ref)data)) + sum(right((Ref)data));
}
