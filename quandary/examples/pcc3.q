mutable Q main(int arg) {
    Ref flag = 0 . nil;
    Ref data = 0 . nil;
    return [ produce(flag, data) . consume(flag, data) ];
}

mutable Q produce(Ref flag, Ref data) {
    setLeft(data, 42);
    acq(flag);
    setLeft(flag, 1);
    rel(flag);
    mutable int done = 1;
    while (done == 1) {
        acq(flag);
        done = (int)left(flag);
        rel(flag);
    }
    return nil;
}

mutable Q consume(Ref flag, Ref data) {
    mutable int done = 0;
    while (done == 0) {
      acq(flag);
      done = (int)left(flag);
      rel(flag);
    }
    acq(flag);
    int retVal = (int)left(data);
    setLeft(flag, 2);
    rel(flag);
    return retVal;
}
