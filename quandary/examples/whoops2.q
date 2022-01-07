mutable Q main(mutable int arg) {
    mutable Ref x = nil;
    while (arg > 0) {
        x = x . x;
        if (divides(arg, 10) != 0) {
            freeAll(x);
            x = nil;
        }
        arg = arg - 1;
    }
    return x;
}

mutable Q freeAll(Ref node) {
    if (isNil(node) == 0) {
        freeAll((Ref)left(node));
        /* would be a doube-free: freeAll((Ref)right(node));*/
        free node;
    }
    return nil;
}

int divides(mutable int x, int y) {
  while (x > 0) {
    x = x - y;
  }
  if (x == 0) return 1;
  return 0;
}
