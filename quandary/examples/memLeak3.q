Q main(mutable int arg) {
    mutable Ref list = nil . (nil . nil);
    while (arg > 0) {
        list = nil . list;
        free((Ref)right((Ref)right(list)));
        arg = arg - 1;
    }
    return nil;
}