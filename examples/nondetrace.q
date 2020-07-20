mutable Q main(int arg) {
    Ref data = 0 . nil;
    return [produce(data, arg) . consume(data, arg)];
}

mutable Q produce(Ref data, mutable int n) {
    setLeft(data, 42);
    while (n > 0) {
        acq(data);
        rel(data);
        n = n - 1;
    }
    return n;
}

mutable Q consume(Ref data, mutable int n) {
    while (n > 0) {
        acq(data);
        rel(data);
        n = n - 1;
    }
    return left(data);
}
