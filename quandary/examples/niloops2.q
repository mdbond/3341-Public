Q main(mutable int x) {
    {
        x = x + 3;
        int y = 23;
    }
    Ref y = nil . 3;
    return (int)left(y) + x;
}
