mutable Q main (mutable int arg) {
	Ref counter = 0 . nil;
    return launchThreads(counter, arg);
}

mutable int launchThreads(Ref counter, int n) {
    if (n == 0) return 0;
    return [ launchThreads(counter, n - 1) + inc(counter) ];
}

mutable int inc(Ref counter) {
    acq(counter);
    int newValue = (int)left(counter) + 1;
    setLeft(counter, newValue);
    rel(counter);
    return newValue;
}
