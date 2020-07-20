
mutable int doLeftInc(Ref counters, int myThread, int count) {
    mutable int i = 0;
    while (i < count) {
        mutable int done = 0;
        while (done == 0) {
          acq(counters);
          int value = (int)left(counters);
          int whoseTurn = (int)right(counters);
          if (whoseTurn == myThread) {
              setLeft(counters, value + 1);
              setRight(counters, 1 - whoseTurn);
              done = 1;
          }
          rel(counters);
        }
        i = i + 1;
    }
    return 0;
}

mutable Q main(int arg) {
    mutable Ref counters = 0 . 0;
    int dummy = [ doLeftInc(counters, 0, arg) + doLeftInc(counters, 1, arg) ];
    int value = (int)left(counters);
    return value;
}
