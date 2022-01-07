int main(int arg) {
    return f(arg);
}

int f(int n) {
    if (n > 0) {
        print f(n - 1);
    }
    return n;
}
