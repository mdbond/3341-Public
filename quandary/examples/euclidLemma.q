int main(int arg) {
    int x = 162;
    int y = 36;
    return euclidLemma(arg, x, y);
}

int euclidLemma(int q, int x, int y) {
    int product = x * y;
    if (mod(product, q) == 0) {
        if (isPrime(q) == 1) {
            return 1;
        }
        else{
            if (gcd(q, x) != 1) {
                return x;
            }
            return y;
        }
    }
    return 0;
}

int divide(int a, int b){
    if( b == 0 ){
        return 0;
    }
    else if(a-b == 0){
       return 1;
    }
    else if( a < b){
       return 0;
    }
    return ( 1 + divide(a-b, b) );
}

int mod(int a, int b){
    int c = divide(a,b);
    return a - (c * b);
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