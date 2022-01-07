
mutable int doLeftInc(Ref counters, int myThread, int count, int threads, Ref other) {
    mutable int i = 0;
    while (i < count) {
        mutable int done = 0;
        while (done == 0) {
          acq(other);
          int whoseTurn = (int)right(counters);
          rel(other);
          if (whoseTurn == myThread) {
              acq(counters);
              int value = (int)left(counters);
              setLeft(counters, value + 1);
              rel(counters);
              acq(other);
              setRight(counters, randomInt(threads));
              rel(other);
              done = 1;
          }
        }
        i = i + 1;
    }
    while (1 == 1) {
        acq(counters);
        int value = (int)left(counters);
        rel(counters);
        if (value == count * threads)
            return 0;
        acq(other);
        setRight(counters, randomInt(threads));
        rel(other);
    }

    return 0;
}

mutable Q main(int arg) {
    Ref counters = 0 . 0;
    Ref other = nil . nil;
    int threads = 4;
    int dummy = [ [ doLeftInc(counters, 0, arg, threads, other) + doLeftInc(counters, 1, arg, threads, other) ] + [ doLeftInc(counters, 2, arg, threads, other) + doLeftInc(counters, 3, arg, threads, other) ] ];
    int value = (int)left(counters);
    return value;
}
