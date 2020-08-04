
Q main(int arg) {
    Ref list = randomList(arg);
    Ref sortedList = sort(list);
    return sortedList;
}

Ref randomList(int length) {
    if (length == 0) {
        return nil;
    }
    return randomInt(100000) . randomList(length - 1);
}

Ref sort(Ref list) {
    if (isNil(list) != 0) return nil;
    return insert((int)left(list), sort((Ref)right(list)));
}

Ref insert(int elem, Ref list) {
    if (isNil(list) != 0) {
        return elem . nil;
    }
    if ((int)elem <= (int)left(list)) {
        return elem . list;
    }
    return left(list) . insert(elem, (Ref)right(list));
}
