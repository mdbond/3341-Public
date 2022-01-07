Q main(int n) {
    mutable Q x = 3 . 5;
    Ref r = (Ref)x;
    x = n;
    int i = (int)x;
    x = nil;
    Ref l = (Ref)x;
    return x . r . i . l;
}