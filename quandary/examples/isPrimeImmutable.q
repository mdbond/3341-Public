int main(int arg) {
    return isPrime(arg);
}

int isPrime(int n) {
    return 1 - hasDivisor(2, n);
}

int hasDivisor(int min, int n) {
    if (min == n) {
        return 0;
    }
    if (gcd(min, n) != 1) {
        return 1;
    }
    return hasDivisor(min + 1, n);
}

int gcd(int m, int n) { /* from https://www.cse.wustl.edu/~ychen/131/Notes/Recursion/recursion.html */
   if(m == n)
      return m;
   else if (m > n)
      return gcd(m-n, n);
   return gcd(m, n-m);
}
