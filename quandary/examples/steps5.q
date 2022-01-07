
mutable int doLeftInc(Ref counters, int myThread, int count, Ref other) {
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
              setRight(counters, randomInt(2));
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
        if (value == count * 2)
            return 0;
        acq(other);
        setRight(counters, 1 - myThread);
        rel(other);
    }

    return 0;
}

mutable Q main(int arg) {
    Ref counters = 0 . 0;
    Ref other = nil . nil;
    int dummy = [ doLeftInc(counters, 0, arg, other) + doLeftInc(counters, 1, arg, other) ];
    int value = (int)left(counters);
    return value;
}
