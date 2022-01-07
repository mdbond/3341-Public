int main(int n) {
    return sub(n, 42);
}

int sub(int a, int b) {
    if (b == 0) return a;
    return sub(a - 1, b - 1);
}
