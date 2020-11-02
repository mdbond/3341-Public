int main (int arg) {
    return isPerfect(arg);
    return sumOfDivisors(1, arg);
}

int isPerfect(int n) {
    if (sumOfDivisors(1, n) == n) {
        return 1;
    }
    return 0;
}

int sumOfDivisors(int min, int n) {
    if (min == n) {
        return 0;
    }
    int divisor = divisor(min, n);
    return divisor + sumOfDivisors(min + 1, n);
}

int divisor(int possibleDivisor, int n) {
    int gcd = gcd(possibleDivisor, n);
    if (gcd == possibleDivisor) {
        return possibleDivisor;
    }
    return 0;
}

int gcd(int m, int n) { /* from https://www.cse.wustl.edu/~ychen/131/Notes/Recursion/recursion.html */
   if(m == n)
      return m;
   else if (m > n)
      return gcd(m-n, n);
   return gcd(m, n-m);
}
