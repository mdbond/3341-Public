mutable Q main(mutable int arg) {
  Ref data = ((2 . nil) . ((8 . nil) . 7));
  setRight((Ref)left(data), right(data));
  mutable int visitWay = 1;
  mutable int sum = 0;
  while (arg > 0) {
    sum = sum + [ uniqueSum(data, visitWay) + uniqueSum(data, visitWay) ];
    visitWay = -visitWay;
    arg = arg - 1;
  }
  return sum;
}

mutable int uniqueSum(Q data, int visitWay) {
  if (isNil(data) != 0) {
    return 0;
  }
  if (isAtom(data) != 0) {
    return (int)data;
  }
  Ref c = (Ref)data;
  acq(c);
  mutable int sum = 0;
  if (isAtom(left(c)) != 0 && isNil(left(c)) == 0) {
    int l = (int)left(c);
    if ((l < 0 && visitWay < 0) ||
        (l > 0 && visitWay > 0)) {
      sum = sum + l * visitWay;
      setLeft(c, -l);
    }
  } else {
    sum = sum + uniqueSum(left(c), visitWay);
  }
  if (isAtom(right(c)) != 0 && isNil(right(c)) == 0) {
    int r = (int)right(c);
    if ((r < 0 && visitWay < 0) ||
        (r > 0 && visitWay > 0)) {
      sum = sum + r * visitWay;
      setRight(c, -r);
    }
  } else {
    sum = sum + uniqueSum(right(c), visitWay);
  }
  rel(c);
  return sum;
}
