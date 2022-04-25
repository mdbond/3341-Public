mutable Q main(int arg) {
    mutable Ref lock = nil . nil;
    acq(lock);
    rel(lock);
    acq(lock);
    rel(lock);
    return arg;
}
