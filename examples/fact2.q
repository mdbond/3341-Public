
int factR(int n) {
  if (n <= 1)
    return 1;
  return factR(n - 1) * n;
}

int factI(int n) {
  {
    int result = n;
  }
  {
    int i = n;
  }
  mutable int result = 1;
  mutable int i = 2;
  while (i <= n) {
    result = result * i;
    i = i + 1;
  }
  return result;
}

Q main(int arg) {
  return factR(arg) . factI(arg);
}
