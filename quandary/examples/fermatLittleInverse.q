int main(int arg) {
    return modInverse(arg);
}

int modInverse(int n) {
    int m = 11;
    if (gcd(n,m) != 1) 
        return 0;
    return power(n, m-2, m);
}

int gcd(int a, int b){
    if (b == 0) {
        return a;
    }
    return gcd(b, mod(a,b));
}

int power(int x, int y, int m) {
    if (y == 0) {
        return 1;
    } 
    int p = mod(power(x, divide(y,2), m), m);
    int newp = mod((p * p), m);

    if (mod(y,2) == 0) {
        return newp;
    }
    return mod((x * newp), m); 
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

    