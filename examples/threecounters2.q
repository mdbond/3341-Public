mutable Q main(int arg) {
    Ref counters = 0 . (0 . (0 . nil));
    Q dummy = [[inc(counters, arg) . inc(counters, arg)] . [inc(counters, arg) . inc(counters, arg)]];
    return sum(counters);
}

mutable Q inc(Ref counters, mutable int n) {
    while (n > 0) {
        mutable int which = randomInt(3);
        mutable Ref elem = counters;
        while (which > 0) {
            elem = (Ref)right(elem);
            which = which - 1;
        }
        acq(elem);
        int value = (int)left(elem);
        setLeft(elem, value + 1);
        rel(elem);
        n = n - 1;
    }
    return nil;
}

int sum(Ref counters) {
    if (isNil(counters) != 0) return 0;
    return (int)left(counters) + sum((Ref)right(counters));
}