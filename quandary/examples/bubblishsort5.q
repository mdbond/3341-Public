mutable Q main(int arg) {
    Ref list = (7957 . (47990 . (9143 . (22394 . (30505 . (492 . (89621 . (59143 . (33008 . (95546 . (26645 . (20561 . (78417 . (70684 . (62893 . (42262 . (15775 . (23513 . (41631 . (59089 . (44663 . (82043 . (89724 . (28320 . (11518 . (3098 . (51439 . (83582 . (92359 . (8385 . (39789 . (47829 . (98643 . (63074 . (94619 . (54580 . (92266 . (56027 . (69917 . (85582 . (33943 . (62159 . (67994 . (84698 . (42873 . (45897 . (20756 . (12817 . (37048 . (1953 . (16055 . (52867 . (93667 . (70455 . (80640 . (36533 . (36804 . (47731 . (13208 . (77105 . (23755 . (85251 . (483 . (79262 . (58933 . (20863 . (68650 . (95012 . (86195 . (49877 . (31604 . (72797 . (92893 . (61419 . (69275 . (96939 . (3690 . (64252 . (94779 . (54177 . (55104 . (74683 . (71055 . (84593 . (76547 . (90009 . (79614 . (25861 . (18385 . (23970 . (39136 . (19402 . (83351 . (2113 . (94385 . (28954 . (37355 . (58627 . (53297 . (20085 . nil))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
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
