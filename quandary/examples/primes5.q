
int isPrime(int x) {
  if (x != 2 && isOdd(x) == 0) return 0;
  mutable Q i = 3;
  while (i < x) {
    if (isNil(divides(x, i)) == 0)
      return 0;
    i = i + 1;
  }
  return 1;
}

int isOdd(int x) {
  if (x == 0) return 0;
  if (x == 1) return 1;
  return isOdd(x - 2);
}

Q main(int arg) {
  mutable int n = arg;
  mutable Ref list = nil;
  while (n > 1) {
    if (isPrime(n) != 0)
      list = n . list;
    n = n - 1;
  }
  return list . length(list);
}

int length(Ref c) {
  if (isAtom(c) != 0) return 0;
  return 1 + length((Ref)right(c));
}

Q divides(int x, int y) {
  mutable int t = 0;
  while (t < x) {
    t = t + y;
  }
  if (t == x) {
    return nil . nil;
  }
  return nil;
}
