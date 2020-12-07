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

mutable Q main(int arg) {
    mutable Ref counters = 0 . 0;
    int dummy = [ [ doLeftInc(counters, arg) + doLeftInc(counters, arg) ] + [ doLeftInc(counters, arg) + doLeftInc(counters, arg) ] ];
    int value = (int)left(counters);
    if (value >= arg * 4) return value;
    return nil;
}
