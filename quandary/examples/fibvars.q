
int fib(int n) {
  if (n < 2) {
    int result = n;
    return n;
  }
  int result = fib(n - 1) + fib(n - 2);
  return result;
}

Q main(int arg) {
  return fib(arg);
}
