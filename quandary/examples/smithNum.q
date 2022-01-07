int main(int arg){
    return smithNum(arg);
}

int smithNum(int n) {
    
    int sumdigit = sumOfDigit(n);
    /* print sumdigit ; */
    int sumprime = sumPrimeDivisor(n, 2);
    /* print sumprime; */
    if (sumprime == sumdigit) {
        return 1;
    }
    return 0;
}

int sumOfDigit(int n) {
    int hundreddigit = divide(n, 100);
    int tendigit = divide(n-(hundreddigit*100), 10);
    int digit = mod(n, 10);
    return hundreddigit + tendigit + digit;
}

int sumPrimeDivisor(int n, int i) {
    if (i <= n) {
        if (mod(n, i) == 0 && isPrime(i) == 1){
            return sumOfDigit(i) + sumPrimeDivisor(divide(n,i), i);
        }
        else{
        return sumPrimeDivisor(n, i+1);
        }
    }
    return 0;
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

int gcd(int m, int n) {
    if(m == n)
      return m;
   else if (m > n)
      return gcd(m-n, n);
   return gcd(m, n-m);
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