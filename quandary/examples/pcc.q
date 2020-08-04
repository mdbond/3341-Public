mutable Q main(int arg) {
    Ref flagAndData = 0 . 0;
    return [ produce(flagAndData) . consume(flagAndData) ];
}

mutable Q produce(Ref flagAndData) {
    setRight(flagAndData, 42);
    acq(flagAndData);
    setLeft(flagAndData, 1);
    rel(flagAndData);
    mutable int done = 1;
    while (done == 1) {
        acq(flagAndData);
        done = (int)left(flagAndData);
        rel(flagAndData);
    }
    return nil;
}

mutable Q consume(Ref flagAndData) {
    mutable int done = 0;
    mutable int retVal = 0;
    acq(flagAndData);
    if ((int)left(flagAndData) != 0) {
        retVal = (int)right(flagAndData);
    }
    rel(flagAndData);
    acq(flagAndData);
    setLeft(flagAndData, 2);
    rel(flagAndData);
    return retVal;
}
