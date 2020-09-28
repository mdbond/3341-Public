/* Program with multiple function definitions */
int main (int arg){
    int x = randomNegInt(); /* empty exprList */
    print x;

    int y = abs(x); /* one element exprList */
    print y;

    return min(5, arg, 10); /* exprList */
}

/* Function with no params */
int randomNegInt(){ 
    return randomInt(100) * -1;
}

/* Function with one param */
int abs(int x){ 
    if (x < 0) return x * -1;
    return x;
}

/* Function with multiple params */
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
