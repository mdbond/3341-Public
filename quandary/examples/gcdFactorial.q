int main(int arg) {
    int p = 9;
    return gcdFactorial(arg, p);
}

int gcdFactorial(int arg, int p) {
    int a = factR(arg);
    int b = factR(p);
    return gcd(a,b);
}

int factR(int n) {
  if (n <= 1)
    return 1;
  return factR(n - 1) * n;
}

int gcd(int m, int n) {
   if(m == n)
      return m;
   else if (m > n)
      return gcd(m-n, n);
   return gcd(m, n-m);
}
