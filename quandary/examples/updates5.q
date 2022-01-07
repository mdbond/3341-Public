mutable Q main(int arg) {
    mutable Q blah = 5 . nil;
    mutable int numLoop = arg;
    mutable Q result = nil;
    while (numLoop >= 1) {
        mutable Q tmp = helper(blah, numLoop);
        numLoop = numLoop - 1;
        result = result . tmp;
}
    return result;
}

mutable Q helper(Q x, int numLoop) {
    mutable Q old1 = setLeft((Ref)x, numLoop);
    mutable int old2 = setRight((Ref)x, nil . (numLoop * 2));
    return (numLoop * 2 . nil) .( x . (numLoop . nil));
}