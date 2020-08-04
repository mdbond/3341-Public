/* exit(6) */
mutable int doRightInc(Ref counters, mutable int n, int thread) {
    while (n > 0) {
        if (thread == 1) {
            acq(counters);
        } else {
            acq((Ref)left(counters));
        }
        int value = (int)right(counters);
        setRight(counters, value + 1);
        if (thread == 1) {
            rel(counters);
        } else {
            rel((Ref)left(counters));
        }
        n = n - 1;
    }
    return 0;
}

mutable Q main(int arg) {
    mutable Ref counters = (nil . nil) . 0;
    int dummy = [ doRightInc(counters, arg, 0) + doRightInc(counters, arg, 1) ];
    return counters;
}
