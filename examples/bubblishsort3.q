mutable Q main(int arg) {
    Ref list = (5599 . (2072 . (4043 . (4611 . (1558 . (6933 . (687 . (2744 . (2473 . (2124 . (5168 . (607 . (4300 . (3211 . (2665 . (1951 . (1910 . (8176 . (3597 . (2402 . (7828 . (3810 . (6466 . (9911 . (6132 . (5945 . (6305 . (3344 . (5115 . (8481 . (568 . (3669 . (6176 . (5996 . (4487 . (4560 . (4718 . (3389 . (6470 . (5823 . (7238 . (2317 . (46 . (4022 . (3083 . (2153 . (2683 . (1738 . (2276 . (6066 . nil))))))))))))))))))))))))))))))))))))))))))))))))));
    Q dummy = [ [ sort(list) . sort(list) ] . [ sort(list) . sort(list) ] ];
    return isSorted(list) . list;
}

mutable Q sort(Ref list) {
    mutable Ref tmp1 = list;
    int len = length(list);
    mutable int pos1 = 0;
    while (isNil(tmp1) == 0) {
        mutable Ref tmp2 = list;
        mutable int pos2 = 0;
        acq(tmp1);
        while (pos2 < pos1) {
            acq(tmp2);
            if ((int)left(tmp2) > (int)left(tmp1)) {
                int value = (int)left(tmp1);
                setLeft(tmp1, left(tmp2));
                setLeft(tmp2, value);
            }
            Ref newTmp2 = (Ref)right(tmp2);
            rel(tmp2);
            tmp2 = newTmp2;
            pos2 = pos2 + 1;
        }
        Ref newTmp1 = (Ref)right(tmp1);
        rel(tmp1);
        tmp1 = newTmp1;
        pos1 = pos1 + 1;
    }
    return pos1;
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
