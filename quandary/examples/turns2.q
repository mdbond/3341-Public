mutable Q main(int arg) {
    Ref list = makeList(arg);
    return launchThreads(list, arg);
}

Ref makeList(int n) {
    if (n == 0) {
        return nil;
    }
    return n . makeList(n - 1);
}

mutable int launchThreads(Ref list, int n) {
    if (n == 0) return 0;
    return [ launchThreads(list, n - 1) + remove(list, n) ];
}

mutable int remove(Ref list, int n) {
    while (1 == 1) {
        acq(list);
        int first = (int)left(list);
        if (first == n) {
            Ref next = (Ref)right(list);
            if (isNil(next) != 0) {
                rel(list);
                return n;
            }
            setLeft(list, left(next)); /* Causes nil dereference when next is nil */
            setRight(list, right(next));
            rel(list);
            return n;
        }
        rel(list);
    }
    return 0;
}