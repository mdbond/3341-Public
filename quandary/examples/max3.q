Q main(int arg) {
    return max(sortedList(1, arg));
}

int max(Ref list) { /* list is a non-empty list of integers */
    if (isNil(right(list)) != 0) return (int)left(list);
    int max = max((Ref)right(list));
    if ((int)left(list) > max) {
        return (int)left(list);
    }
    return max;
}

Ref sortedList(int n, int max) {
    if (n > max)
        return nil;
    return n . sortedList(n + 1, max);
}

int length(Ref list) {
    if (isNil(list) != 0)
        return 0;
    return 1 + length((Ref)right(list));
}
