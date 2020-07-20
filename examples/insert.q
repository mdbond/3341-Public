Q main(int arg) {
    mutable Ref list = 42 . nil;
    list = insert(5, list);
    list = insert(99, list);
    list = insert(70, list);
    return list;
}

Ref insert(int elem, Ref list) { /* list is already sorted */
    if (isNil(list) != 0) return elem . nil;
    if (elem < (int)left(list)) {
        return elem . list;
    }
    return left(list) . insert(elem, (Ref)right(list));
}
