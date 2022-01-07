Q main(int arg) {
    mutable Ref list = (1 . (1741 . (2470 . (2566 . (2928 . (3605 . (6176 . (6396 . (6640 . (7337 . (7478 . (8112 . (8529 . (8624 . (9564 . (9850 . (10853 . (11135 . (14776 . (16026 . (17760 . (20599 . (20736 . (20881 . (25159 . (26827 . (27267 . (28313 . (28896 . (29170 . (29184 . (29273 . (29278 . (30112 . (33003 . (33245 . (33731 . (34223 . (34387 . (35762 . (36114 . (36386 . (36549 . (36801 . (37775 . (37905 . (38854 . (39381 . (39962 . (40040 . (40454 . (41339 . (41773 . (44160 . (47718 . (47916 . (48863 . (52618 . (54512 . (55628 . (56266 . (56388 . (58330 . (59927 . (62641 . (63970 . (64529 . (64967 . (66430 . (67561 . (68596 . (72768 . (73260 . (73298 . (74819 . (75051 . (75659 . (76035 . (76454 . (76895 . (79110 . (79875 . (80760 . (81788 . (82040 . (83248 . (83657 . (85538 . (86249 . (88810 . (89784 . (89813 . (90515 . (90962 . (91423 . (93374 . (94069 . (95342 . (97192 . (98652 . (99637 . nil)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
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
