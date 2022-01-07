Q main(int n) {
    Q v1 = 4 . (5 . nil);
    Q v2 = 4 . (5 . nil);
    Q v3 = (4 . 5) . nil;
    Q v4 = nil . v1;
    Q v5 = nil . v2;
    return equiv(2, 2) . equiv(nil, 2) . equiv(nil, nil) . equiv(v3, v3) . equiv(v1 . v2, v2 . v1) .
           equiv(v1, v2) . equiv(v1, v3) . equiv(v1, v4) . equiv(v2, v4) . equiv(v3, v4) . equiv(v4, v5);
}

int equiv(Q val1, Q val2) {
    if (isNil(val1) != 0)
        return isNil(val2);
    if (isNil(val2) != 0)
        return isNil(val1);
    if (isAtom(val1) != 0 || isAtom(val2) != 0) {
        if (isAtom(val1) != 0 && isAtom(val2) != 0 && (int)val1 == (int)val2)
            return 1;
        else
            return 0;
    }
    if (isNonNilRef(val1) != 0 && isNonNilRef(val2) != 0) {
        if (equiv(left((Ref)val1), left((Ref)val2)) != 0 && equiv(right((Ref)val1), right((Ref)val2)) != 0) {
            return 1;
        }
    }
    return 0;
}

int isNonNilRef(Q val) {
    if (isNil(val) == 0 && isAtom(val) == 0) {
        return 1;
    }
    return 0;
}