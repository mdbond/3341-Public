mutable Q main(int arg) {
    Ref x = 3 . (5 . nil);
    setRight((Ref)right(x), x);
    return left(rest(rest(rest(rest(rest(x))))));
}

Ref rest(Ref list) {
    return (Ref)right(list);
}