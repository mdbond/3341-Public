/* Program with multiple function definitions */
int main (int arg){

    int y = abs(arg * -1 - 10); /* one param as expr */
    print y;

    print min(randomInt(100), -1, abs(-3));
    
    return min(--5 + 3, arg, 10 * 5); /* multiple exprs as param */
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
