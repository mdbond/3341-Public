Q main(int arg) {
    mutable int x = arg;
    if (arg != arg) {
        x = arg;
        x = x + 3;
        int y = 23;
    }
    Ref c = y(6);
    return (int)left(y) + x;
}

Ref y(int b) {
    return b.b;
}