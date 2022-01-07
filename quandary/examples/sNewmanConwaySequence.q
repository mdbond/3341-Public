Q main(int arg) {
    mutable int n = 1;
    mutable Ref list = nil;
    while (n <= arg) {
        int a = NCS(n);
        list = a . list;
        n = n + 1;
    }
    return list;
}
int NCS(int n) {
    if (n == 1 || n == 2) {
        return 1;
    }
    return NCS(NCS(n-1)) + NCS(n - NCS(n-1));
}
