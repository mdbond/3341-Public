Q main(int arg) {
    Ref list = (5 . (7 . (2 . (45 . (52 . (4 . nil))))));
    return third(list) . third(sortedList(1, arg));
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

Q third(Ref list) { /* list should be a list with at least 3 elements */
    return second((Ref)right(list));
}
