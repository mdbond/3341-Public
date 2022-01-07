int main (int arg) {
    int x = arg;
    int y = f(x);
    int z = g(y) + x;
    return z;
}

int f(int n) {
    int x = n * n;
    return x + x;
}

int g(int x) {
    int y = x * x;
    int z = y + y;
    return x + y + z;
}
