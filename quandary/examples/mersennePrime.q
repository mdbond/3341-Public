int main(int arg) {
    return maxMersennePrime(arg);
}

int maxMersennePrime(int n) {

   if (n <2) {
       return 0;
   } 
   else if (n == 3) {
       return 3;
   }
   else if (isPrimeandPower2(n) == 1) {
           return n;
   }
   return maxMersennePrime(n-1);

}

int isPower2(int n) {
    if (n == 0) { return 0;}
    else 
        if (n == 1) {
            return 1;
        } else if (mod(n, 2) != 0) {
            return 0;
        }
        return isPower2(divide(n,2));
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

int isPrimeandPower2(int n) {
    if ((isPrime(n) == 1) && isPower2(n+1) == 1)
        return 1;
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