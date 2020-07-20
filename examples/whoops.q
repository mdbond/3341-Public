mutable Q main(mutable int arg) {
    mutable Ref x = nil;
    while (arg > 0) {
        x = x . x;
    }
    return x;
}
