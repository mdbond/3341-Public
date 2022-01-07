mutable int doLeftInc(Ref counters, mutable int iter) {
    while (iter > 0) {
        acq(counters);
        int value = (int)left(counters);
        setLeft(counters, value + 1);
        rel(counters);
        iter = iter - 1;
    }
    return 0;
}

mutable int doRightInc(Ref counters, mutable int iter) {
    while (iter > 0) {
        int value = (int)right(counters);
        setRight(counters, value + 1);
        iter = iter - 1;
    }
    return 0;
}

mutable Q main(int arg) {
    mutable Ref counters = 0 . 0;
    int dummy = [ doLeftInc(counters, arg) + doLeftInc(counters, arg) ];
    return counters;
}
