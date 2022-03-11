
int pow(int b, int e) {
    if (e == 0) return 1;
    if (e == 1) return b;
    return pow(b, divide(e + 1, 2)) * pow(b, divide(e, 2));
}

int main(int arg) {
    int x = arg;
    int y = pow(7, x);
    return y;
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
