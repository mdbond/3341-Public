
mutable int doLeftInc(Ref counters, int myThread) {
    mutable int i = 0;
    while (i < 10000) {
        mutable int done = 0;
        while (done == 0) {
          acq(counters);
          int value = (int)left(counters);
          int whoseTurn = (int)right(counters);
          if (whoseTurn == myThread) {
              setLeft(counters, value + 1);
              if (whoseTurn == 2) {
                  setRight(counters, 0);
              } else {
                  setRight(counters, whoseTurn + 1);
              }
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
    int dummy = [ doLeftInc(counters, 0) + [ doLeftInc(counters, 1) + doLeftInc(counters, 2)] ];
    int value = (int)left(counters);
    return value;
}
