Q main(int arg) {
    mutable Ref list = (126 . (72 . (55 . (159 . (127 . (129 . (140 . (128 . (15 . (28 . (78 . (43 . (10 . (88 . (41 . (159 . (4 . (88 . (140 . (51 . (1 . (108 . (92 . (127 . (62 . (86 . (0 . (9 . (93 . (190 . (142 . (74 . (46 . (127 . (69 . (46 . (72 . (119 . (41 . (112 . (148 . (35 . (35 . (163 . (171 . (160 . (62 . (106 . (11 . (107 . (179 . (81 . (174 . (99 . (134 . (1 . (10 . (73 . (86 . (96 . (90 . (143 . (161 . (95 . (91 . (94 . (142 . (170 . (152 . (22 . (57 . (116 . (39 . (98 . (66 . (64 . (122 . (185 . (166 . (65 . (55 . (95 . (141 . (163 . (8 . (153 . (122 . (15 . nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    list = concat(list, list);
    return sort(list);
}

Ref sort(Ref list) {
    if (isNil(list) != 0 || isNil(right(list)) != 0) return list;
    int pivot = (int)left(list);
    Ref lists = [ sort(subList(list, pivot, -1)) . sort(subList(list, pivot, 1)) ];
    return concat((Ref)left(lists), concat(subList(list, pivot, 0), (Ref)right(lists)));
}

Ref subList(Ref list, int pivot, int comparator) {
    if (isNil(list) != 0)
        return nil;
    int first = (int)left(list);
    Ref rest = (Ref)right(list);
    if ((comparator <  0 && first <  pivot) ||
        (comparator == 0 && first == pivot) ||
        (comparator >  0 && first >  pivot))
        return first . subList(rest, pivot, comparator);
    return subList(rest, pivot, comparator);
}

Ref concat(Ref first, Ref second) {
    if (isNil(first) != 0)
        return second;
    if (isNil(right(first)) != 0)
        return left(first) . second;
    return left(first) . concat((Ref)right(first), second);
}

int isSorted(Ref list) {
    if (isNil(list) != 0 || isNil(right(list)) != 0)
        return 1;
    if ((int)left(list) > (int)left((Ref)right(list)))
        return 0;
    return isSorted((Ref)right(list));
}

int length(Ref list) {
    if (isNil(list) != 0) return 0;
    return 1 + length((Ref)right(list));
}

Ref randomList(int n) {
    if (n == 0) return nil;
    return randomInt(200) . randomList(n - 1);
}
