mutable Q main(int arg) {
    mutable Q q = foo(arg);
    q = 5;
    return 7 . 8;
}

mutable Q foo(int n) {
    Ref r = 3 . nil;
    Ref q = 5 . r;
    setRight(r, q);
    return r;
}
