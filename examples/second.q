Q main(int arg) {
    Ref list = (5 . (7 . (2 . (45 . (52 . (4 . nil))))));
    return second(list) . second(sortedList(1, arg)) . length(list);
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

int length(Ref list) {
    if (isNil(list) != 0)
        return 0;
    return 1 + length((Ref)right(list));
}