mutable Q main(mutable int arg) {
    mutable Ref x = nil;
    mutable Ref y = nil;
    while (arg > 0) {
        x = nil . nil;
        y = nil . x;
        setRight(x, y);
        free x;
        free y;
        arg = arg - 1;
    }
    return 0;
}
