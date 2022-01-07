int main(int arg) {
    int p = 3;
    return legendre(arg, p);
}

int legendre(int n, int p) {
    if (n > 0) {
        int newn = divide(n,p);
        return (newn + legendre(newn, p));
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

