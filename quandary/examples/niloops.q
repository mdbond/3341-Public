Q main(mutable int x) {
    {
        x = x + 3;
        int y = 23;
    }
    Ref y = nil;
    return (int)left(y) + x;
}
