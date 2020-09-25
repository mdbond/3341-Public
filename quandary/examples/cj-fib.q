int main(int arg) {
    return fibR(arg);
}

int fibR(int n) {
    if (n < 2) return n;
    return fibR(n - 1) + fibR(n - 2);
}
