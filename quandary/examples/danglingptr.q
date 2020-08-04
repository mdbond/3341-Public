Q main(int arg) {
    Ref r = 2 . 3;
    Ref s = r . nil;
    free s;
    free r;
    /* Ref t = 7 . 8; */
    return r;
}