
int isPrime(int x) {
  mutable int i = 2;
  while (i < x) {
    if (divides(x, i) != 0)
      return 0;
    i = i + 1;
  }
  return 1;
}

Q main(int arg) {
  mutable int n = arg;
  mutable Ref list = nil;
  while (n > 1) {
    if (isPrime(n) != 0)
      list = n . list;
    n = n - 1;
  }
  return list;
}

int divides(mutable int x, int y) {
  while (x > 0) {
    x = x - y;
  }
  if (x == 0) return 1;
  return 0;
}
