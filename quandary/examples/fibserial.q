
int fibRecursive(int n) {
  if (n < 2)
    return n;
  return fibRecursive(n - 1) + fibRecursive(n - 2);
}

int fibImperative(int n) {
  if (n == 0) return 0;
  mutable int a = 0;
  mutable int b = 1;
  mutable int i = 0;  
  while (i + 1 < n) {
    int sum = a + b;
    a = b;
    b = sum;
    i = i + 1;
  }
  return b;
}

int isOdd(int x) {
  if (x == 0) {
    return 0;
  } else if (x == 1) {
    return 1;
  }
  return isOdd(x - 2);
}

Q main(int arg) {
  return (fibRecursive(arg) . fibImperative(arg)) . fibMemHog(arg);
}

int fibMemHog(int n) {
  if (n < 2) return n;
  Ref result = fibMemHog(n - 1) . fibMemHog(n - 2);
  int sum = (int)left(result) + (int)right(result);
  return sum;
}
