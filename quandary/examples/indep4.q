mutable Q main(int arg) {
    Ref counter1 = 0 . 0;
    Ref counter2 = 0 . 0;
    Q dummy = [ [ incLeft(counter1, arg) . incRight(counter1, arg) ] . [ incLeft(counter2, arg) . incRight(counter2, arg) ] ];
    return counter1 . counter2;
}
mutable Q incLeft(Ref counters, mutable int n) {
    while (n > 0) {
        int value = (int)left(counters);
        setLeft(counters, value + 1);
        n = n - 1;
    }
    return nil;
}
mutable Q incRight(Ref counters, mutable int n) {
    while (n > 0) {
        int value = (int)right(counters);
        setRight(counters, value + 1);
        n = n - 1;
    }
    return nil;
}
