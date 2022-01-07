
mutable Q main(int arg) {
    return mut(arg) + immut(arg);
}

mutable int mut(int n) {
    return immut(n) * immut(n);
}

int immut(int n) {
    return mut(n) * mut(n);
}
