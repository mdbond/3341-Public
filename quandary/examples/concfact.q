int main(int arg) {
    return fact(arg);
}

int fact(int n) {
    if (n <= 1) return 1;
    return [ n * fact(n - 1) ]; /* this is silly */
}
