
mutable Q main(int arg){
    mutable Ref r = 1 . 2;
    change(r);
    Ref t = r + 1;
    r = 4 . 5;
    return t;
}
mutable int change(mutable Ref s){
    setLeft(s, 3);
    s = 8 . 9;
    return 1;
}
