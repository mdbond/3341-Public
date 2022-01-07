int main(int arg) {
    return abs(arg);
}

int abs(int n) {
    if (n < 0) {
        return abs(-n);
    } else {
        return n;
    }
    return abs(n);
}
