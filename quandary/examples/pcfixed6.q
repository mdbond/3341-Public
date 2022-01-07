mutable Q main(int arg) {
    Ref data = 0 . 0;
    return [ consume(data) . produce(data) ];
}

mutable Q produce(Ref data){
    acq(data);
    setLeft(data, 42);
    setRight(data, 1);
    rel(data);
    return nil;
}

mutable Q consume(Ref data){
    while (getFlagSync(data) == 0) { /* empty */ }
    int d = (int)left(data);
    return d;
}

mutable int getFlagSync(Ref data) {
    acq(data);
    int f = (int)right(data);
    rel(data);
    return f;
}
