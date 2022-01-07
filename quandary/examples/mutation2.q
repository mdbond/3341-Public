mutable Q main(int arg) {
    Ref x = 3 . (5 . nil);
    Ref y = 8 . x;
    Ref z = 10 . x;
    Ref a = 3 . z;
    arg = arg + 1;
    setRight(x, nil);
    setLeft(z, 6);
    setRight(y, 3 . (5 . nil));
    return x . y . z . a;
}