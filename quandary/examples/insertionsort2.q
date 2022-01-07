
mutable Q main(int arg) {
    mutable Ref list = 399 . (6467 . (8345 . (2140 . (9313 . (7058 . (5844 . (7696 . (4035 . (2606 . (2597 . (7942 . (1138 . (8202 . (2141 . (997 . (5361 . (8032 . (5824 . (967 . (681 . (7868 . (8745 . (1466 . (515 . (9276 . (4515 . (4256 . (3728 . (1318 . (9025 . (8878 . (3858 . (2754 . (1879 . (784 . (560 . (3836 . (750 . (2900 . (2422 . (1092 . (5060 . (2266 . (178 . nil))))))))))))))))))))))))))))))))))))))))))));
    mutable Ref newList = nil;
    while (isNil(list) == 0) {
        
        Ref tmp = insert(newList, (int)left(list));
        newList = tmp;
        list = (Ref)right(list);
    }
    return newList;
}

/* Returns a new reference iff elem is added to front of list */
mutable Ref insert(Ref list, int elem) {
    if (isNil(list) != 0 || elem < (int)left(list))
        return elem . list;
    if (isNil(right(list)) != 0 || elem < (int)left((Ref)right(list)))
        return left(list) . (elem . right(list));
    return left(list) . insert((Ref)right(list), elem);
}
