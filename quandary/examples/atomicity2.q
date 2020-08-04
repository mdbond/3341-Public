mutable Q main(int arg) {
    Ref data = zeroedList(arg);
    Q dummy = [inc(data, arg) . inc(data, arg)];
    return sum(data);
}

Ref zeroedList(int n) {
    if (n == 0) return nil;
    return 0 . zeroedList(n - 1);
}

int sum(Ref data) {
    if (isNil(data) != 0) return 0;
    return (int)left(data) + sum((Ref)right(data));
}

mutable Q inc(Ref data, int n) {
    mutable int i = 0;
    while(i < n) {
        int pos = randomInt(n);
        Ref cell = getCell(data, pos);
        acq(cell);
        int value = (int)left(cell);
        rel(cell);
        acq(cell);
        setLeft(cell, value + 1);
        rel(cell);
        i = i + 1;
    }
    return nil;
}

Ref getCell(Ref data, int pos) {
    if (pos == 0) return data;
    return getCell((Ref)right(data), pos - 1);
}