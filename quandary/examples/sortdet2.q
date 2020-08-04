
Q main(int arg) {
    Ref list = (6 . (2 . (23 . (4 . (45 . (22 . (4 . (5 . (42 . (33 . (22 . (24 . (54 . (33 . (25 .
             (18 . (36 . (54 . (43 . (43 . (54 . (24 . (22 . (24 . (43 . (3 . (72 . (2 . nil))))))))))))))))))))))))))));
    Ref sortedList = sort(list);
    return sortedList;
}

Ref sort(Ref list) {
    if (isNil(list) != 0) return nil;
    return insert((int)left(list), sort((Ref)right(list)));
}

Ref insert(int elem, Ref list) {
    if (isNil(list) != 0) {
        return elem . nil;
    }
    if ((int)elem <= (int)left(list)) {
        return elem . list;
    }
    return left(list) . insert(elem, (Ref)right(list));
}
