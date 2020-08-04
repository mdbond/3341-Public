Q main(int arg) {
    return fib(arg, 0);
}

int fib(int n, int depth) {
    if (n <= 1) { return n; }
    if (depth > 3) {
        return fib(n - 1, depth + 1) + fib(n - 2, depth + 1);
    }
    return [ fib(n - 1, depth + 1) + fib(n - 2, depth + 1) ];
}