mutable int doLeftInc(Ref counters, mutable int n) {
    while (n > 0) {
        int value = (int)left(counters);
        setLeft(counters, value + 1);
        n = n - 1;
    }
    return 0;
}

mutable int doRightInc(Ref counters, mutable int n, int thread) {
    while (n > 0) {
        /* Slow down a thread */
        if (thread == 0) {
            doLeftInc(counters, 300);
        }
        acq(counters);
        int value = (int)right(counters);
        rel(counters);
        acq(counters);
        setRight(counters, value + 1);
        rel(counters);
        n = n - 1;
    }
    return 0;
}

mutable Q main(int arg) {
    mutable Ref counters = 0 . 0;
    int dummy = [ doRightInc(counters, arg, 0) + doRightInc(counters, arg, 1) ];
    return counters;
}
