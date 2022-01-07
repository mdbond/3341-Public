Q main(int arg) {
    if (arg == 1) {
        return (int)foo(5 . 8);
    } else if (arg == 2) {
        return (int)foo(nil . nil);
    }
    return (Ref)foo(nil . (nil . nil));
}

Q foo(Q c) {
    return left(c);
}
