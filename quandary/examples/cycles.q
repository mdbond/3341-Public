mutable Q main(mutable int arg) {
    while (arg > 0) {
        Ref last = 7 . nil;
        Ref x = 2 . (3 . (5 . last));
        setRight(last, x);
        arg = arg - 1;
    }
    return 0;
}
