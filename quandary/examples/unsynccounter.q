mutable Q main(int arg) {
    Ref counter = 0 . nil;
    Q dummy = [ increment(counter) . increment(counter) ];
    return counter;
}

mutable Q increment(Ref counter) {
    mutable int i = 0;
    while (i < 1000) {
        int val = (int)left(counter);
        setLeft(counter, val + 1);
        i = i + 1;
    }
    return nil;
}