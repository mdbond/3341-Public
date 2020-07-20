mutable Q main(mutable int arg) {
  Ref data = 2 . (3 . (5 . (8 . nil)));
  setRight((Ref)right((Ref)right((Ref)right(data))), data);
  mutable int visitWay = 1;
  mutable int sum = 0;
  while (arg > 0) {
    sum = sum + [ uniqueSum(data, visitWay) + uniqueSum(data, visitWay) ];
    visitWay = -visitWay;
    arg = arg - 1;
  }
  return sum;
}

mutable int uniqueSum(mutable Ref c, int visitWay) {
  mutable int sum = 0;
  while (1 == 1) {
    acq(c);
    int val = (int)left(c);
    if ((val < 0 && visitWay < 0) ||
        (val > 0 && visitWay > 0)) {
      sum = sum + val * visitWay;
      setLeft(c, -val);
      rel(c);
    } else {
      rel(c);
      return sum;
    }
    c = (Ref)right(c);
  }
  return -1;
}
