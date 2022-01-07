Q main(int arg) {
    Ref list = (399 . (6467 . (8345 . (2140 . (9313 . (7058 . (5844 . (7696 . (4035 . (2606 . (2597 . (7942 . (1138 . (8202 . (2141 . (997 . (5361 . (8032 . (5824 . (967 . (681 . (7868 . (8745 . (1466 . (515 . (9276 . (4515 . (4256 . (3728 . (1318 . (9025 . (8878 . (3858 . (2754 . (1879 . (784 . (560 . (3836 . (750 . (2900 . (2422 . (1092 . (5060 . (2266 . (178 . (5421 . (2698 . (7355 . (9592 . (305 . (4372 . (8623 . (8671 . (7627 . (1837 . (2261 . (7986 . (8443 . (4800 . (207 . (113 . (7686 . (2896 . (7651 . (9613 . (7540 . (6177 . (4155 . (7071 . (1888 . (8684 . (2630 . (9857 . (4972 . (1935 . (6341 . (947 . (7882 . (6331 . (2894 . (3944 . (6836 . (2164 . (701 . (7318 . (7716 . (6421 . (5390 . (3082 . (6205 . (5273 . (2724 . (578 . (9616 . (8995 . (1846 . (9665 . (9208 . (1511 . (284 . nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    return sort(list);
}

Ref sort(Ref list) {
    if (isNil(list) != 0 || isNil(right(list)) != 0) return list;
    int pivot = (int)left(list);
    return concat(sort(subList(list, pivot, -1)), concat(subList(list, pivot, 0), sort(subList(list, pivot, 1))));
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
    return randomInt(10000) . randomList(n - 1);
}
