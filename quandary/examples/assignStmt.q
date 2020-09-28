int main (int arg){
    int x = 12;   /* INTCONST */
    int y = x;  /* IDENT */
    int z = -arg;   /* Unary Neg */
    int a1 = get10(); /* function call with no params */
    int a2 = abs(-12); /* function call with param */
    int a3 = min(-5, 0, 12); /* function call with multiple params */
    int i = randomInt(10); /* built in func */
    int a4 = i - i;
    int b1 = 5 + 5 + 10; /* binary expr: plus */
    int b2 = 5 - 10 - 19; /* binary expr: minus */
    int b3 = 5 * 10 * 7; /* binary expr: mult */
    int p = 12 * -(((((5 * ((((3 + 8) - 93))))) * 3)));
    return x + y + z + a1 + a2 + a3 + a4 + b1 + b2 + b3 + p;
}

int get10(){
    return 10;
}

int abs(int x){ 
    if (x < 0) return x * -1;
    return x;
}

int min(int x, int y, int z){ 
    if (x < y) {
        if (x < z){
            return x;
        } else {
            return z;
        }
    }
    
    if(y < z){
        return y;
    }
    return z;
}
