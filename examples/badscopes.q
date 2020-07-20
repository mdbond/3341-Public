Q main(int arg) {
    return makeStuff(arg);
}

Q makeStuff(int n) {
    /* int t = ...; */
    if (n > 0) {
        Q t = n;
        int u = (int)t;
        return n . makeStuff(n - 1);
    }
    /* int t = ...; */
    int x = t;
    return 0;
}