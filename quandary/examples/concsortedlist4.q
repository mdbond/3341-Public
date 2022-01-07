mutable Q main (mutable int arg) {
    Ref list = nil . nil; /* The first nil is the "head" of the list */
    Q dummy = [ [ addSeveral(list, arg) . addSeveral(list, arg) ] . [ addSeveral(list, arg) . addSeveral(list, arg) ] ];
    return length(list);
}

mutable Q addSeveral(Ref list, mutable int n) {
    while (n > 0) {
        Q dummy = [ addFirst(list, randomInt(1000)) . addLast(list, randomInt(1000)) ];
        n = n - 1;
    }
    return nil;
}

mutable Ref addFirst(Ref list, int value) {
    mutable Ref tmp = list;
    acq(list);
    if (isNil(right(tmp)) == 0) {
        acq((Ref)right(tmp));
        if (isNil(right(tmp)) == 0)
            rel((Ref)right(tmp));
    }
    setRight(tmp, value . right(tmp));
    rel(tmp);
    return nil;
}

mutable Ref addLast(Ref list, int value) {
    mutable Ref tmp = list;
    acq(list);
    if (isNil(right(tmp)) == 0) {
        acq((Ref)right(tmp));
        while (isNil(right(tmp)) == 0) {
            Ref tmp2 = (Ref)right(tmp);
            rel(tmp);
            tmp = tmp2;
            if (isNil(right(tmp)) == 0)
                acq((Ref)right(tmp));
        }
        if (isNil(right(tmp)) == 0)
            rel((Ref)right(tmp));
    }
    setRight(tmp, value . right(tmp));
    rel(tmp);
    return nil;
}

int isSorted(mutable Ref list) {
    list = (Ref)right(list);
    while (isNil(list) == 0 && isNil(right(list)) == 0) {
        if ((int)left(list) > (int)left((Ref)right(list))) {
            return 0;
        }
        list = (Ref)right(list);
    }
    return 1;
}

int length(mutable Ref list) {
    list = (Ref)right(list);
    mutable int length = 0;
    while (isNil(list) == 0) {
        length = length + 1;
        list = (Ref)right(list);
    }
    return length;
}