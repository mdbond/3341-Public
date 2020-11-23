Q main(mutable int x) {
    {
        x = x + 3;
        int y = 23;
    }
    Ref y = 3 . 6;
    return (int)left(y) + x;
}
