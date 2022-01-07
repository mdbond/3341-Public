mutable Q main(int arg) {
    Ref x = (1 . 2) . (3 . nil);
    Ref y = (1 . (2 . (3 . nil)));
    mutable int i = arg;
    i = i + 4;
    setLeft(y, i);
    setRight(x, 2 . 3 . nil);
    return x . y;
}
