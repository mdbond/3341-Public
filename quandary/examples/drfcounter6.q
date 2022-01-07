mutable int doLeftInc(Ref counters, int n) {
    mutable int i = 0;
    while (i < n) {
        acq(counters);
        int value = (int)left(counters);
        rel(counters);
        acq(counters);
        setLeft(counters, value + 1);
        rel(counters);
        i = i + 1;
    }
    return 0;
}

mutable int doRightInc(Ref counters, int n) {
    mutable int i = 0;
    while (i < n) {
        acq(counters);
        int value = (int)right(counters);
        rel(counters);
        acq(counters);
        setRight(counters, value + 1);
        rel(counters);
        i = i + 1;
    }
    return 0;
}

mutable Q main(int arg) {
    mutable Ref counters = 0 . 0;
    int dummy = [ [ doLeftInc(counters, arg) + doRightInc(counters, arg) ] + [ doLeftInc(counters, arg) + doRightInc(counters, arg) ] ];
    int l = (int)left(counters);
    int r = (int)right(counters);
    if (l >= arg * 2 || r >= arg * 2) return (l . r);
    return nil;
}
