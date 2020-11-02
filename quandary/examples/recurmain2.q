int main (int arg) {
    int n = arg;
    if (n > 2) {
        return main(n - 1) * n;
    }
    return arg;
}
