mutable Q main(int arg) {
    mutable int n = 0;
    Ref list = nil . (-2 . (-1 . nil));
    mutable Ref removed = nil;
    while (n < arg) {
        add(n, list);
        removed = remove(list) . removed;
        n = n + 1;
    }
    return removed;
}

mutable Q add(Q elem, Ref list) {
    if (isNil(right(list)) != 0) {
        setRight(list, elem . nil);
    } else {
        add(elem, (Ref)right(list));
    }
    return nil;
}

mutable Q remove(Ref list) {
    Q elem = left((Ref)right(list));
    setRight(list, right((Ref)right(list)));
    return elem;
}
