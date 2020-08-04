mutable Q main(int arg) {
    Ref list = (0 . (1 . (1 . (4 . (8 . (9 . (10 . (10 . (11 . (15 . (15 . (22 . (28 . (35 . (35 . (39 . (41 . (41 . (43 . (46 . (46 . (51 . (55 . (55 . (57 . (62 . (62 . (64 . (65 . (66 . (69 . (72 . (72 . (73 . (74 . (78 . (81 . (86 . (86 . (88 . (88 . (90 . (91 . (92 . (93 . (94 . (95 . (95 . (96 . (98 . (99 . (106 . (107 . (108 . (112 . (116 . (119 . (122 . (122 . (126 . (127 . (127 . (127 . (128 . (129 . (134 . (140 . (140 . (141 . (142 . (142 . (143 . (148 . (152 . (153 . (159 . (159 . (160 . (161 . (163 . (163 . (166 . (170 . (171 . (174 . (179 . (185 . (190 . nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
    Q dummy = [ sort(list) . sort(list) ];
    return isSorted(list) . list;
}

mutable Q sort(Ref list) {
    mutable Ref tmp1 = list;
    int len = length(list);
    mutable int pos1 = 0;
    while (isNil(tmp1) == 0) {
        mutable Ref tmp2 = list;
        mutable int pos2 = 0;
        while (pos2 < pos1) {
            acq(tmp1);
            acq(tmp2);
            if ((int)left(tmp2) > (int)left(tmp1)) {
                int value = (int)left(tmp1);
                setLeft(tmp1, left(tmp2));
                setLeft(tmp2, value);
            }
            rel(tmp2);
            rel(tmp1);
            tmp2 = (Ref)right(tmp2);
            pos2 = pos2 + 1;
        }
        tmp1 = (Ref)right(tmp1);
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
