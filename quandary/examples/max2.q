Q main(int arg) {
    mutable Q list = (5 . (7 . (2 . (45 . (52 . (4 . nil))))));
    list = 42;
    list = nil;
    return max((Ref)list);
    return max(sortedList(1, arg));
}

int max(Ref list) { /* list is a non-empty list of integers */
    if (isNil(right(list)) != 0) return (int)left(list);
    if ((int)left(list) > max((Ref)right(list))) {
        return (int)left(list);
    }
    return max((Ref)right(list));
}

Ref sortedList(int n, int max) {
    if (n > max)
        return nil;
    return n . sortedList(n + 1, max);
}

Q first(Ref list) {
    return left(list);
}

Q second(Ref list) { /* list should be a list with at least 2 elements */
    return first((Ref)right(list));
}

Ref randomList(int length) {
    if (length == 0)
        return nil;
    return randomInt(1000) . randomList(length - 1);
}

int length(Ref list) {
    if (isNil(list) != 0)
        return 0;
    return 1 + length((Ref)right(list));
}