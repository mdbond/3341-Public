mutable int doLeftInc(Ref counters, int n) {
    mutable int i = 0;
    while (i < n) {
        acq(counters);
        int value = (int)left(counters);
        setLeft(counters, value + 1);
        rel(counters);
        i = i + 1;
    }
    return 0;
}

mutable Q main(int arg) {
    mutable Ref counters = 0 . 0;
    int dummy = [ [ doLeftInc(counters, arg) + doLeftInc(counters, arg) ] + [ doLeftInc(counters, arg) + doLeftInc(counters, arg) ] ];
    return left(counters);
}
