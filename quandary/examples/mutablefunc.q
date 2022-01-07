
mutable Q main(int arg) {
    return mut(arg) + immut(arg);
}

mutable int mut(int n) {
    if (n == 0)
        return (int)main(n);
    return immut(n) * immut(n);
}

int immut(int n) {
    return n + n;
}