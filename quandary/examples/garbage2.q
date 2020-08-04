mutable Q main(mutable int arg) {
    Ref x = nil . nil;
    while (arg > 0) {
        setLeft(x, arg . arg);
        setRight(x, arg . arg);
        arg = arg - 1;
    }
    return 0;
}
