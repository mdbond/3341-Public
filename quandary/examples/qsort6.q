mutable Q main(int arg) {
    Ref comparisons = 0 . nil;
    Ref list = (78512 . (67378 . (25518 . (89135 . (82951 . (50816 . (34956 . (99656 . (39898 . (7410 . (57458 . (48112 . (60206 . (71643 . (92220 . (26121 . (42540 . (91082 . (78563 . (25750 . (72367 . (78822 . (4289 . (70271 . (40980 . (40261 . (88594 . (75683 . (84707 . (120 . (10717 . (27677 . (10938 . (5167 . (91144 . nil)))))))))))))))))))))))))))))))))));
    Ref dummy = sort(list, comparisons);
    return comparisons;
}

mutable Ref sort(Ref list, Ref comparisons) {
    if (isNil(list) != 0 || isNil(right(list)) != 0) return list;
    int pivot = (int)left(list);
    Ref rightSubList = subList(list, pivot, 1, comparisons);
    mutable int anotherPivot = -1;
    if (isNil(rightSubList) == 0)
        anotherPivot = (int)left(rightSubList);
    Ref lists = [ [ sort(subList(list, pivot, -1, comparisons), comparisons) . sort(subList(rightSubList, anotherPivot, -1, comparisons), comparisons) ] .
                  sort(subList(rightSubList, anotherPivot, 1, comparisons), comparisons) ];
    return concat((Ref)left((Ref)left(lists)),
                  concat(subList(list, pivot, 0, comparisons),
                         concat((Ref)right((Ref)left(lists)),
                                concat(subList(rightSubList, anotherPivot, 0, comparisons),
                                       (Ref)right(lists)))));
}

mutable Ref subList(Ref list, int pivot, int comparator, Ref comparisons) {
    if (isNil(list) != 0)
        return nil;
    int first = (int)left(list);
    Ref rest = (Ref)right(list);
    acq(comparisons);
    setLeft(comparisons, (int)left(comparisons) + 1);
    rel(comparisons);
    if ((comparator <  0 && first <  pivot) ||
        (comparator == 0 && first == pivot) ||
        (comparator >  0 && first >  pivot))
        return first . subList(rest, pivot, comparator, comparisons);
    return subList(rest, pivot, comparator, comparisons);
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
