Q main(int arg) {
    return isListOfLists(nil . nil) .
           isListOfLists(5 . nil) .
           isListOfLists((5 . nil) . ((3 . nil) . nil)) .
           isListOfLists((5 . nil) . ((3 . 5) . nil));
}

int isListOfLists(Q q) {
    if (isList(q) != 0) {
        if (isNil(q) != 0)
            return 1;
        if (isList(left((Ref)q)) != 0 && isListOfLists(right((Ref)q)) != 0)
            return 1;
    }
    return 0;
}

int isList(Q q) {
    if (isNil(q) != 0) {
        return 1;
    }
    if (isAtom(q) != 0) {
        return 0;
    }
    return isList(right((Ref)q));
}
