
Q main(int arg) {
    Ref list = (7613 . (39448 . (42692 . (51957 . (86319 . (49112 . (91414 . (19956 . (71958 . (55625 . (47189 . (14446 . (28521 . (52049 . (52665 . (55068 . (9988 . (51065 . (10817 . (12152 . (2375 . (29646 . (82671 . (11200 . (11639 . (51521 . (84873 . (26169 . (38620 . (2376 . (90650 . (57610 . (76930 . (443 . (12686 . (48764 . (9752 . (80951 . (92217 . (66209 . (76883 . (35647 . nil))))))))))))))))))))))))))))))))))))))))));
    Ref sortedList = sort(list);
    return sortedList;
}

Ref sort(Ref list) {
    if ((int)isNil(list) != 0) return nil;
    return insert((int)left(list), sort((Ref)right(list)));
}

Ref insert(int elem, Ref list) {
    if (isNil(list) != 0) {
        return elem . nil;
    }
    if ((int)elem <= (int)left(list)) {
        return elem . list;
    }
    return (int)left(list) . (Ref)insert(elem, (Ref)right(list));
}
