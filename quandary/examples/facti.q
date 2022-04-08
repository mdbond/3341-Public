int factI(int n) {
  mutable int result = 1;
  mutable int i = 2;
  while (i <= n) {
    result = result * i;
    i = i + 1;
  }
  return result;
}

Q main(int arg) {
  return factI(arg);
}
